<?php
session_start(); // Cần có session_start() ở mọi trang dùng session
if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] === true) {
    echo "Xin chào, " . $_SESSION['username'] . "! ";
    echo "<a href='logout.php'>Đăng xuất</a>"; // Đây là liên kết logout
} else {
    echo "<a href='login.html'>Đăng nhập</a> | <a href='register.html'>Đăng ký</a>";
}
?>