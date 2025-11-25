-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2025 at 04:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coffee_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbox`
--

CREATE TABLE `chatbox` (
  `MaChat` int(11) NOT NULL,
  `Cauhoi` text NOT NULL,
  `Traloi` text DEFAULT NULL,
  `Thoigian` datetime DEFAULT current_timestamp(),
  `MaKH` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `MaDH` int(11) NOT NULL,
  `MaSP` int(11) NOT NULL,
  `Soluong` int(11) NOT NULL,
  `Giaban` decimal(10,2) NOT NULL,
  `Thanhtien` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc_sp`
--

CREATE TABLE `danhmuc_sp` (
  `MaDM` int(11) NOT NULL,
  `TenDM` varchar(255) NOT NULL,
  `Mota` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `danhmuc_sp`
--

INSERT INTO `danhmuc_sp` (`MaDM`, `TenDM`, `Mota`) VALUES
(1, 'Trà Sữa', 'Các loại cà phê pha máy và pha phin'),
(2, 'Cà Phê', 'Các loại trà ủ và trà hoa quả'),
(3, 'Trà Trái Cây', 'Các loại trà sữa trân châu'),
(4, 'Đồ Ăn Nhẹ', 'Các loại bánh ngọt và bánh mặn');

-- --------------------------------------------------------

--
-- Table structure for table `doannhe`
--

CREATE TABLE `doannhe` (
  `MaSP` int(11) NOT NULL,
  `GYPH` varchar(255) DEFAULT NULL,
  `HSD` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doannhe`
--

INSERT INTO `doannhe` (`MaSP`, `GYPH`, `HSD`) VALUES
(25, NULL, NULL),
(26, NULL, NULL),
(27, NULL, NULL),
(28, NULL, NULL),
(29, NULL, NULL),
(30, NULL, NULL),
(31, NULL, NULL),
(32, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDH` int(11) NOT NULL,
  `Ngaylap` datetime DEFAULT current_timestamp(),
  `Tongtien` decimal(10,2) NOT NULL,
  `Trangthai` varchar(100) DEFAULT 'Đang xử lý',
  `HT_Thanhtoan` varchar(100) DEFAULT NULL,
  `HT_Nhanhang` varchar(100) DEFAULT NULL,
  `Ghichu` text DEFAULT NULL,
  `MaNV` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL,
  `MaKM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL,
  `Hoten` varchar(255) NOT NULL,
  `Gioitinh` varchar(10) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `Diachi` text DEFAULT NULL,
  `LoaiKH` varchar(50) DEFAULT 'Thường'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKH`, `Hoten`, `Gioitinh`, `EMAIL`, `SDT`, `Diachi`, `LoaiKH`) VALUES
(4, 'huy1234', 'Nam', 'huy1234@gmail.com', '0796251953', '76/16 Van Than, phuong Binh Tien, TP Ho Chi Minh', 'Thường');

-- --------------------------------------------------------

--
-- Table structure for table `lienhe`
--

CREATE TABLE `lienhe` (
  `ID` int(11) NOT NULL,
  `Hoten` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Noidung` text DEFAULT NULL,
  `NgayTao` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lienhe`
--

INSERT INTO `lienhe` (`ID`, `Hoten`, `Email`, `Noidung`, `NgayTao`) VALUES
(1, 'huy', 'huy@gmail.com', '123', '2025-11-22 14:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL,
  `Hoten` varchar(255) NOT NULL,
  `Gioitinh` varchar(10) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `Diachi` text DEFAULT NULL,
  `Chucvu` varchar(100) DEFAULT NULL,
  `Mucluong` decimal(10,2) DEFAULT NULL,
  `Ngayvaolam` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `Hoten`, `Gioitinh`, `SDT`, `EMAIL`, `Diachi`, `Chucvu`, `Mucluong`, `Ngayvaolam`) VALUES
(1, 'Chủ Quán (Admin)', NULL, NULL, 'admin@gmail.com', NULL, 'Quản lý', NULL, NULL),
(3, 'huy123', 'Nam', '0796251953', 'huy123@gmail.com', '76/16 Van Than, phuong Binh Tien, TP Ho Chi Minh', '0', 1000000.00, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phieukhuyenmai`
--

CREATE TABLE `phieukhuyenmai` (
  `MaKM` int(11) NOT NULL,
  `TenKM` varchar(255) NOT NULL,
  `Giatrigiam` decimal(10,2) DEFAULT NULL,
  `Ngaybatdau` date DEFAULT NULL,
  `Ngayketthuc` date DEFAULT NULL,
  `Trangthai` varchar(100) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL,
  `TenSP` varchar(255) NOT NULL,
  `Giaban` decimal(10,2) NOT NULL,
  `Thanhphan` text DEFAULT NULL,
  `Kichco` varchar(50) DEFAULT NULL,
  `TG_chuanbi` varchar(50) DEFAULT NULL,
  `Trangthai` varchar(100) DEFAULT 'Đang bán',
  `HinhAnh` varchar(255) DEFAULT 'images/placeholder.jpg',
  `MaDM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSP`, `TenSP`, `Giaban`, `Thanhphan`, `Kichco`, `TG_chuanbi`, `Trangthai`, `HinhAnh`, `MaDM`) VALUES
(1, 'Traditional Bubble Milk Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/TS truyền thống.png', 1),
(2, 'Grill Milk Tea', 45.00, NULL, 'M', NULL, 'Đang bán', 'images/TS nướng.png', 1),
(3, 'Thai Green/Red Milk Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Trà sữa thái xanhdo.png', 1),
(4, 'Taro Milk Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/TS khoai môn.png', 1),
(5, 'Taro Jasmine Milk Tea', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/Song hỷ.jpg', 1),
(6, 'Jasmine Milk Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Tuyet lài.jpg', 1),
(7, 'Matcha Milk Tea', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/MAtcha.jpg', 1),
(8, 'Oreo Milk Tea', 45.00, NULL, 'M', NULL, 'Đang bán', 'images/Oreo.jpg', 1),
(9, 'Caramel Macchiato', 32.00, NULL, 'M', NULL, 'Đang bán', 'images/caramel.jpg', 2),
(10, 'Cappuccino', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Capuchino.jpg', 2),
(11, 'Salt Coffee', 35.00, NULL, 'M', NULL, 'Đang bán', 'images/Muoi.jpg', 2),
(12, 'Egg Coffee', 37.00, NULL, 'M', NULL, 'Đang bán', 'images/CF trứng.jpg', 2),
(13, 'Americano', 32.00, NULL, 'M', NULL, 'Đang bán', 'images/Cf đen.jpg', 2),
(14, 'Charcoal Coffee', 32.00, NULL, NULL, NULL, 'Đang bán', 'images/Cf than.jpg', 2),
(15, 'Coffee Mocha', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/mocha.jpg', 2),
(16, 'Honey Vanlila Machiato', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/Gemini_Generated_Image_taz1tutaz1tutaz1.jpg', 2),
(17, 'Lychee Jelly tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Trà thạch vải.jpg', 3),
(18, 'Matcha Red Bean Tea', 45.00, NULL, 'M', NULL, 'Đang bán', 'images/Matcha Red Bean Teaa.jpg', 3),
(19, 'Green Tea With Honey', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/mật ong.jpg', 3),
(20, 'Lyche Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Long nhãn.jpg', 3),
(21, 'Peach Tea', 40.00, NULL, 'M', NULL, 'Đang bán', 'images/Trà đào.png', 3),
(22, 'Black Grape Tea', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/trà nho đen.png', 3),
(23, 'Strawberry Tea', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/trà dâu.png', 3),
(24, 'Melon Tea', 42.00, NULL, 'M', NULL, 'Đang bán', 'images/trà dưa lưới.png', 3),
(25, 'Mango Tiramisu', 45.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh xoài.png', 4),
(26, 'Socola Tiramisu', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh Socola.png', 4),
(27, 'Strawberry Mouse Cake', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh dâu.png', 4),
(28, 'Caramel Swis Roll', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh cuộn.png', 4),
(29, 'Cream Croissant Matcha', 55.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh sừng bò.png', 4),
(30, 'Cream Puffs', 25.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh su kem.png', 4),
(31, 'Baked Cheeseak', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh phô mai nướng.png', 4),
(32, 'Egg Tarts', 15.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh trứng.png', 4),
(33, 'Socola Tiramisu', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh Socola.png', NULL),
(34, 'Strawberry Mouse Cake', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh dâu.png', NULL),
(35, 'Caramel Swiss Roll', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh cuộn.png', NULL),
(36, 'Cream Croissant Matcha', 55.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh sừng bò.png', NULL),
(37, 'Cream Puffs', 25.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh su kem.png', NULL),
(38, 'Baked Cheesecake', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh phô mai nướng.png', NULL),
(39, 'Egg Tarts', 15.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh trứng.png', NULL),
(40, 'Socola Tiramisu', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh Socola.png', NULL),
(41, 'Strawberry Mouse Cake', 40.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh dâu.png', NULL),
(42, 'Caramel Swiss Roll', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh cuộn.png', NULL),
(43, 'Cream Croissant Matcha', 55.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh sừng bò.png', NULL),
(44, 'Cream Puffs', 25.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh su kem.png', NULL),
(45, 'Baked Cheesecake', 30.00, NULL, NULL, NULL, 'Đang bán', 'images/Bánh phô mai nướng.png', NULL),
(46, 'Egg Tarts', 15.00, NULL, NULL, NULL, 'Đang bán', 'images/bánh trứng.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTK` int(11) NOT NULL,
  `Ten_DN` varchar(50) NOT NULL,
  `MK` varchar(255) NOT NULL,
  `Trangthai` varchar(50) DEFAULT 'Hoạt động',
  `Phanloai` varchar(50) DEFAULT 'Customer',
  `MaNV` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTK`, `Ten_DN`, `MK`, `Trangthai`, `Phanloai`, `MaNV`, `MaKH`) VALUES
(1, 'admin', '$2y$10$0.xL6p0yR.81bS.lX.oFmOFW4uA4iG.V3X/w9U/sC.z...', 'Hoạt động', 'Admin', NULL, NULL),
(2, 'huy', '$2y$10$RWbk1mvW/kWHMN989WJ6QOT1uOUR8vVxZal08mjuWJGr80F8uzRNG', 'Hoạt động', 'Customer', NULL, NULL),
(3, 'huy123', '$2y$10$wdC5b2NbwS5bYToPFXSyou8CJ61.IrDdSbSWrCZGOjjgQ9RVh0dcq', 'Hoạt động', 'Nhanvien', NULL, NULL),
(4, 'huy1234', '$2y$10$.gsYTLNipFNBRlEc8xd4euxE3Hnr0K05zvNOpTOC7.bASGSAYsNQi', 'Hoạt động', 'Khachhang', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `thucuong`
--

CREATE TABLE `thucuong` (
  `MaSP` int(11) NOT NULL,
  `Dongot` varchar(100) DEFAULT NULL,
  `Nhietdo` varchar(100) DEFAULT NULL,
  `Topping` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `thucuong`
--

INSERT INTO `thucuong` (`MaSP`, `Dongot`, `Nhietdo`, `Topping`) VALUES
(1, NULL, NULL, NULL),
(2, NULL, NULL, NULL),
(3, NULL, NULL, NULL),
(4, NULL, NULL, NULL),
(5, NULL, NULL, NULL),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL),
(13, NULL, NULL, NULL),
(14, NULL, NULL, NULL),
(15, NULL, NULL, NULL),
(16, NULL, NULL, NULL),
(17, NULL, NULL, NULL),
(18, NULL, NULL, NULL),
(19, NULL, NULL, NULL),
(20, NULL, NULL, NULL),
(21, NULL, NULL, NULL),
(22, NULL, NULL, NULL),
(23, NULL, NULL, NULL),
(24, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `MaTT` int(11) NOT NULL,
  `Tieude` varchar(255) NOT NULL,
  `Noidung` text DEFAULT NULL,
  `Hinhanh` varchar(255) DEFAULT NULL,
  `Ngaydang` datetime DEFAULT current_timestamp(),
  `MaNV` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`MaTT`, `Tieude`, `Noidung`, `Hinhanh`, `Ngaydang`, `MaNV`) VALUES
(1, 'Giảm 20% tuần này!', 'Áp dụng cho tất cả đồ uống mang đi từ 10/11 đến 17/11. Nhanh tay lên!', 'giam20.jpg', '2025-11-22 22:21:08', NULL),
(2, 'Matcha đậu đỏ', 'Thưởng thức hương vị mới, hòa quyện giữa Matcha và những hạt đậu đỏ, chỉ có tại 12% Coffee', 'Matcha Red Been Tea.png', '2025-11-22 22:21:08', NULL),
(3, 'Khai trương chi nhánh đầu tiên của 12% coffee', 'Chi nhánh đầu tiên quận 5 chính thức bắt đầu', 'news3.png', '2025-11-22 22:21:31', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbox`
--
ALTER TABLE `chatbox`
  ADD PRIMARY KEY (`MaChat`);

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD KEY `FK_CTDH_DH` (`MaDH`),
  ADD KEY `FK_CTDH_SP` (`MaSP`);

--
-- Indexes for table `danhmuc_sp`
--
ALTER TABLE `danhmuc_sp`
  ADD PRIMARY KEY (`MaDM`);

--
-- Indexes for table `doannhe`
--
ALTER TABLE `doannhe`
  ADD PRIMARY KEY (`MaSP`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`MaDH`),
  ADD KEY `MaNV` (`MaNV`),
  ADD KEY `MaKH` (`MaKH`),
  ADD KEY `MaKM` (`MaKM`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`MaKH`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD UNIQUE KEY `SDT` (`SDT`);

--
-- Indexes for table `lienhe`
--
ALTER TABLE `lienhe`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`),
  ADD UNIQUE KEY `SDT` (`SDT`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  ADD PRIMARY KEY (`MaKM`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSP`),
  ADD KEY `MaDM` (`MaDM`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTK`);

--
-- Indexes for table `thucuong`
--
ALTER TABLE `thucuong`
  ADD PRIMARY KEY (`MaSP`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`MaTT`),
  ADD KEY `MaNV` (`MaNV`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbox`
--
ALTER TABLE `chatbox`
  MODIFY `MaChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `danhmuc_sp`
--
ALTER TABLE `danhmuc_sp`
  MODIFY `MaDM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lienhe`
--
ALTER TABLE `lienhe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `MaTT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `FK_CTDH_DH` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CTDH_SP` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `doannhe`
--
ALTER TABLE `doannhe`
  ADD CONSTRAINT `FK_DAN_SP` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `FK_DH_KH` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_DH_KM` FOREIGN KEY (`MaKM`) REFERENCES `phieukhuyenmai` (`MaKM`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_DH_NV` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE SET NULL;

--
-- Constraints for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  ADD CONSTRAINT `FK_KM_KH` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SP_DM` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc_sp` (`MaDM`) ON DELETE SET NULL;

--
-- Constraints for table `thucuong`
--
ALTER TABLE `thucuong`
  ADD CONSTRAINT `FK_TC_SP` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `FK_TT_NV` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
