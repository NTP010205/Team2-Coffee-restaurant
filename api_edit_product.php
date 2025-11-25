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
$id = $data['id'] ?? 0;
$name = $data['name'] ?? '';
$price = $data['price'] ?? 0;

if ($id <= 0 || empty($name) || $price <= 0) {
    http_response_code(400);
    echo json_encode(['success' => false, 'error' => 'Dữ liệu không hợp lệ']);
    exit();
}

$stmt = $conn->prepare("UPDATE sanpham SET TenSP = ?, Giaban = ? WHERE MaSP = ?");
$stmt->bind_param("ddi", $name, $price, $id);

if ($stmt->execute()) {
    echo json_encode(['success' => true]);
} else {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $stmt->error]);
}

$stmt->close();
?>
