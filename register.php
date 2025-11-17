<?php
// Database connection (change the information accordingly)
// sửa lại hết
$servername = "localhost";
$username_db = "root";
$password_db = "";
$dbname = "coffee_shop_db";

$conn = new mysqli($servername, $username_db, $password_db, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
// Get data from the POST form
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

// Encrypt the password
$hashed_password = password_hash($password, PASSWORD_DEFAULT);

// Insert data into the 'users' table (this table needs to be created in the DB)
$sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$hashed_password')";

if ($conn->query($sql) === TRUE) {
    echo "Đăng ký thành công! <a href='login.html'>Login now</a>";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>