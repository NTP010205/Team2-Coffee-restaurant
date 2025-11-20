<!DOCTYPE html>
<html lang="en"></html>
<head>
    <head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Quản Lý Quán Cà Phê</title>

</head>
<body>
<?php
session_start(); // Bắt buộc có dòng này ở đầu


$conn = new mysqli("sql100.infinityfree.com", "if0_40463440", "Phat12085", "if0_40463440_mysql5");
mysqli_set_charset($conn, 'UTF8');

if ($conn->connect_error) {
    die("Kết nối thất bại: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $input = $_POST['username']; // Lấy tên hoặc email
    $pass  = $_POST['password'];

    // Tìm trong database xem có ai tên đó hoặc email đó không
    $sql = "SELECT * FROM users WHERE username='$input' OR email='$input'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // Kiểm tra mật khẩu
        if (password_verify($pass, $row['password'])) {
            // ĐÚNG MẬT KHẨU -> Lưu session
            $_SESSION['logged_in'] = true;
            $_SESSION['username'] = $row['username']; // Lưu tên để hiện ở trang chủ

            // Hiện thông báo -> Chuyển về index.php
            echo "<script>
                    alert('Đăng nhập thành công!');
                    window.location.href = 'index.php';
                  </script>";
        } else {
            echo "<script>alert('Sai mật khẩu!'); window.history.back();</script>";
        }
    } else {
        echo "<script>alert('Tài khoản không tồn tại!'); window.history.back();</script>";
    }
}
$conn->close();
?>
</body>
</html>