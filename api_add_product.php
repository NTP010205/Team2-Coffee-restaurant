<?php
include 'connect.php';
session_start();

// Kiểm tra quyền admin
if (empty($_SESSION['username']) || $_SESSION['role'] !== 'admin') {
    http_response_code(403);
    echo json_encode(['success' => false, 'error' => 'Không có quyền']);
    exit();
}

$data = json_decode(file_get_contents('php://input'), true);
$name = $data['name'] ?? '';
$price = $data['price'] ?? 0;
$image = $data['image'] ?? 'images/placeholder.jpg';

if (empty($name) || $price <= 0) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Dữ liệu không hợp lệ']);
    exit();
}

$stmt = $conn->prepare("INSERT INTO sanpham (TenSP, Giaban, HinhAnh) VALUES (?, ?, ?)");
$stmt->bind_param("dds", $name, $price, $image);

if ($stmt->execute()) {
    echo json_encode(['success' => true, 'id' => $conn->insert_id]);
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
?>
