<!--sửa lại-->
<?php
session_start(); // Bắt đầu session

// 1. KẾT NỐI DATABASE

$servername = "sql100.infinityfree.com"; // MySQL Hostname
$username_db = "if0_40463440";          // MySQL Username
$password_db = "Phat12085";             // MySQL Password
$dbname = "if0_40463440_mysql5";           // MySQL Database Name (thay XXX bằng tên DB thực tế)

$conn = new mysqli($servername, $username_db, $password_db, $dbname);
mysqli_set_charset($conn, 'UTF8');

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}


// 2. CHỈ XỬ LÝ KHI NHẤN NÚT "POST"
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // 3. LẤY TẤT CẢ DỮ LIỆU TỪ FORM
    // Dùng '?? null' để tránh lỗi nếu gửi thiếu
    $fullname = $_POST['fullname'] ?? null;
    $username = $_POST['username'] ?? null;
    $email    = $_POST['email'] ?? null;
    $pass     = $_POST['password'] ?? null;
    $phone    = $_POST['phone'] ?? null;
    $address  = $_POST['address'] ?? null;
    $gender   = $_POST['gender'] ?? null;

    // 4. KIỂM TRA DỮ LIỆU TRỐNG
    if (empty($fullname) || empty($username) || empty($email) || empty($pass) || empty($phone) || empty($address) || empty($gender)) {
        echo "<script>
                alert('Vui lòng điền đầy đủ tất cả thông tin!');
                window.history.back();
              </script>";
        die(); // Dừng lại
    }

    // 5. MÃ HÓA MẬT KHẨU (Rất quan trọng)
    // Phải dùng hàm này để hàm password_verify() ở trang login hoạt động
    $hashed_password = password_hash($pass, PASSWORD_DEFAULT);

    // 6. KIỂM TRA TRÙNG LẶP (Username hoặc Email)
    $sql_check = "SELECT Ten_DN FROM taikhoan WHERE Ten_DN = ? OR EMAIL = ?";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bind_param("ss", $username, $email);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();

    if ($result_check->num_rows > 0) {
        // Nếu đã có, báo lỗi
        echo "<script>
                alert('Tên đăng nhập hoặc Email này đã tồn tại. Vui lòng chọn tên khác!');
                window.history.back();
              </script>";
    } else {
        // 7. THÊM TÀI KHOẢN MỚI VÀO DATABASE
        // (Nếu không trùng, tiến hành INSERT)
        
        // Chú ý: Tên cột trong SQL phải khớp với tên cột trong database
        $sql_insert = "INSERT INTO taikhoan (HoTen, Ten_DN, EMAIL, MK, SDT, DiaChi, GioiTinh) 
                       VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        $stmt_insert = $conn->prepare($sql_insert);
        
        // 'sssssss' nghĩa là 7 biến đều là dạng chuỗi (string)
        $stmt_insert->bind_param("sssssss", 
            $fullname, 
            $username, 
            $email, 
            $hashed_password, // Dùng mật khẩu đã mã hóa
            $phone, 
            $address, 
            $gender
        );

        // 8. THỰC THI VÀ BÁO KẾT QUẢ
        if ($stmt_insert->execute()) {
            echo "<script>
                    alert('Đăng ký tài khoản thành công! Mời bạn đăng nhập.');
                    window.location.href = 'login.html'; // Chuyển đến trang đăng nhập
                  </script>";
        } else {
            echo "<script>
                    alert('Có lỗi xảy ra. Vui lòng thử lại!');
                    window.history.back();
                  </script>";
        }
        $stmt_insert->close();
    }
    
    $stmt_check->close();
    $conn->close();

} else {
    // Nếu ai đó gõ thẳng URL register_process.php thì đuổi về trang chủ
    header("Location: index.php");
    exit();
}
?>