<?php
include 'connect.php';

$sql = "SELECT dh.MaDH, dh.TenKH, dh.NgayDat, dh.TongTien, sp.TenSP, ct.SoLuong, ct.GiaBan
        FROM donhang dh
        JOIN chitietdonhang ct ON dh.MaDH = ct.MaDH
        JOIN sanpham sp ON ct.MaSP = sp.MaSP
        ORDER BY dh.NgayDat DESC";

$result = $conn->query($sql);

$currentDH = 0;
echo "<h2>Danh sách đơn hàng</h2>";
echo "<table border='1' cellpadding='5'>
        <tr>
            <th>ID Đơn</th>
            <th>Khách hàng</th>
            <th>Sản phẩm</th>
            <th>SL</th>
            <th>Giá</th>
            <th>Thành tiền</th>
        </tr>";

while($row = $result->fetch_assoc()){
    echo "<tr>
            <td>{$row['MaDH']}</td>
            <td>{$row['TenKH']}</td>
            <td>{$row['TenSP']}</td>
            <td>{$row['SoLuong']}</td>
            <td>{$row['GiaBan']}</td>
            <td>{$row['ThanhTien']}</td>
          </tr>";
}
echo "</table>";