<?php
include 'db_connect.php'; // Gọi file kết nối

$sql = "SELECT * FROM SANPHAM";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
</head>
<body>
    <h2>Danh sách sản phẩm</h2>
    <table border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th>Mã SP</th>
            <th>Tên SP</th>
            <th>Giá bán</th>
            <th>Trạng thái</th>
        </tr>

        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row['MaSP'] . "</td>";
                echo "<td>" . $row['TenSP'] . "</td>";
                echo "<td>" . $row['Giaban'] . "</td>";
                echo "<td>" . $row['Trangthai'] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='4'>Không có sản phẩm nào.</td></tr>";
        }
        ?>
    </table>
</body>
</html>
