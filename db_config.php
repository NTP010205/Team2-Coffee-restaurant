<?php
$conn = mysqli_connect("localhost", "root", "", "coffee_shop");
if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}
?>
