<?php
$servername = "localhost";
$username = "root"; // mặc định của XAMPP
$password = ""; // để trống
$database = "mysql5"; // tên database của Phát

$conn = new mysqli($servername, $username, $password, $database);

// Kiểm tra kết nối
if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
} else {
    echo "Kết nối thành công!";
}
?>
