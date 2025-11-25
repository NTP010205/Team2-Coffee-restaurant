<?php
include 'connect.php';
session_start();

// Tắt hiển thị lỗi thô tới client để tránh làm hỏng JSON
ini_set('display_errors', 0);
error_reporting(E_ALL);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

header('Content-Type: application/json');

try {
    // Nhận dữ liệu JSON từ JS
    $data = json_decode(file_get_contents('php://input'), true);
    if(!$data){
        throw new Exception('Dữ liệu không hợp lệ');
    }

    $tenKH = $data['tenKH'] ?? '';
    $sdt = $data['sdt'] ?? '';
    $diachi = $data['diachi'] ?? '';
    $giohang = $data['giohang'] ?? [];
    $paymentMethod = $data['paymentMethod'] ?? '';

    // Nếu người dùng đã đăng nhập trên server, lấy MaTK (ứng với MaKH trong khachhang)
    $maKH = null;
    if (!empty($_SESSION['MaTK'])){
        $maKH = (int)$_SESSION['MaTK'];
    }

    // Nếu người dùng chưa đăng nhập (không có MaKH), yêu cầu thông tin liên hệ từ client
    if(empty($maKH)){
        if(empty($tenKH) || empty($sdt) || empty($diachi)){
            throw new Exception('Vui lòng điền tên, SĐT và địa chỉ hoặc đăng nhập');
        }
    }
    if(empty($giohang) || !is_array($giohang)){
        throw new Exception('Giỏ hàng trống hoặc dữ liệu không hợp lệ');
    }

    // Tính tổng tiền và validate từng item
    $tongTien = 0;
    foreach($giohang as $idx => $item){
        if(!isset($item['maSP']) || !isset($item['soLuong']) || !isset($item['giaBan'])){
            throw new Exception("Sản phẩm #{$idx} thiếu thông tin (maSP/soLuong/giaBan)");
        }
        $maSP = (int)$item['maSP'];
        $soLuong = (int)$item['soLuong'];
        $giaBan = (float)$item['giaBan'];
        if($soLuong <= 0) throw new Exception("Số lượng phải lớn hơn 0 cho sản phẩm #{$idx}");
        $tongTien += $giaBan * $soLuong;
        // Chuẩn hóa lại
        $giohang[$idx]['maSP'] = $maSP;
        $giohang[$idx]['soLuong'] = $soLuong;
        $giohang[$idx]['giaBan'] = $giaBan;
    }

    // Lưu đơn hàng vào bảng donhang
    $hasMaKH = false;
    $colCheck = $conn->query("SHOW COLUMNS FROM donhang LIKE 'MaKH'");
    if($colCheck && $colCheck->num_rows > 0) $hasMaKH = true;

    if($hasMaKH && $maKH){
        // Chèn đơn với liên kết MaKH
        $stmt = $conn->prepare("INSERT INTO donhang (MaKH, Tongtien, HT_Thanhtoan, Ghichu) VALUES (?, ?, ?, ?)");
        if(!$stmt) throw new Exception('Lỗi prepare donhang: ' . $conn->error);
        $ghichu = json_encode(['note' => 'Đơn hàng từ tài khoản']);
        $stmt->bind_param("idss", $maKH, $tongTien, $paymentMethod, $ghichu);
    } else {
        // Khách vãng lai: lưu thông tin liên hệ vào Ghichu
        $stmt = $conn->prepare("INSERT INTO donhang (Tongtien, HT_Thanhtoan, Ghichu) VALUES (?, ?, ?)");
        if(!$stmt) throw new Exception('Lỗi prepare donhang: ' . $conn->error);
        $ghichu = json_encode(['ten' => $tenKH, 'sdt' => $sdt, 'diachi' => $diachi]);
        $stmt->bind_param("dss", $tongTien, $paymentMethod, $ghichu);
    }
    if(!$stmt->execute()){
        throw new Exception('Lỗi khi chèn donhang: ' . $stmt->error);
    }
    $maDH = $stmt->insert_id;
    $stmt->close();

    // Lưu chi tiết đơn hàng
    $stmt2 = $conn->prepare("INSERT INTO chitietdonhang (MaDH, MaSP, Soluong, Giaban, Thanhtien) VALUES (?, ?, ?, ?, ?)");
    foreach($giohang as $item){
        $thanhTien = $item['giaBan'] * $item['soLuong'];
        $maSP = (int)$item['maSP'];
        $soLuong = (int)$item['soLuong'];
        $giaBan = (float)$item['giaBan'];
        if(!$stmt2) throw new Exception('Lỗi prepare chitietdonhang: ' . $conn->error);
        if(!$stmt2->bind_param("iiidd", $maDH, $maSP, $soLuong, $giaBan, $thanhTien)){
            throw new Exception('Lỗi bind_param chitiet: ' . $stmt2->error);
        }
        if(!$stmt2->execute()){
            throw new Exception('Lỗi khi chèn chitietdonhang: ' . $stmt2->error);
        }
    }
    $stmt2->close();

    // Trả về phản hồi hợp lệ cùng mã đơn hàng để client có thể hiển thị/ưu tiên
    echo json_encode(['success' => true, 'message' => 'Đặt hàng thành công!', 'MaDH' => $maDH]);

} catch (Exception $e) {
    http_response_code(500);
    $msg = $e->getMessage();
    echo json_encode(['success' => false, 'message' => 'Lỗi máy chủ: ' . $msg]);
}
?>