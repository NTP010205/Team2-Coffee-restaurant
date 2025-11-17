<?php
session_start(); // 1. Bắt đầu session hiện tại

// 2. Xóa tất cả các biến session
$_SESSION = array();

// 3. Hủy bỏ session
session_destroy();

// 4. Chuyển hướng người dùng về trang đăng nhập hoặc trang chủ
header("Location: login.html"); // Chuyển về trang đăng nhập
header("Location: index.php"); // Chuyển về trang chủ

exit(); // Dừng kịch bản
?>