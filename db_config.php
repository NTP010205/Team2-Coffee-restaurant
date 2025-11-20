<?php
$conn = mysqli_connect(
    "sql100.infinityfree.com", // MySQL Hostname
    "if0_40463440",           // MySQL Username
    "Phat12085",              // MySQL Password
    "if0_40463440_mysql5"        // MySQL Database Name
);

if (!$conn) {
    die("Kết nối thất bại: " . mysqli_connect_error());
}
?>
