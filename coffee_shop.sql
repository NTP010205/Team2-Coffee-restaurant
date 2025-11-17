-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2025 at 03:03 PM
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
  `Cauhoi` text DEFAULT NULL,
  `Traloi` text DEFAULT NULL,
  `Thoigian` datetime DEFAULT current_timestamp(),
  `MaKH` int(11) DEFAULT NULL
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
-- Table structure for table `danhgia_sp`
--

CREATE TABLE `danhgia_sp` (
  `MaDG` int(11) NOT NULL,
  `DiemDG` int(11) DEFAULT NULL,
  `NgayDG` datetime DEFAULT current_timestamp(),
  `Binhluan` text DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL
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
(1, 'Cà Phê', 'Các loại cà phê pha máy và pha phin'),
(2, 'Trà Trái Cây', 'Các loại trà ủ và trà hoa quả'),
(3, 'Trà Sữa', 'Các loại trà sữa trân châu'),
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
(1, 'Chủ Quán (Admin)', NULL, NULL, 'admin@gmail.com', NULL, 'Quản lý', NULL, NULL);

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

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTK` int(11) NOT NULL,
  `Ten_DN` varchar(100) NOT NULL,
  `MK` varchar(255) NOT NULL,
  `Trangthai` varchar(50) DEFAULT 'Hoạt động',
  `Phanloai` varchar(50) NOT NULL,
  `MaNV` int(11) DEFAULT NULL,
  `MaKH` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTK`, `Ten_DN`, `MK`, `Trangthai`, `Phanloai`, `MaNV`, `MaKH`) VALUES
(1, 'admin', '$2y$10$0.xL6p0yR.81bS.lX.oFmOFW4uA4iG.V3X/w9U/sC.zUeE1b.w.hS', 'Hoạt động', 'Admin', 1, NULL);

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
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbox`
--
ALTER TABLE `chatbox`
  ADD PRIMARY KEY (`MaChat`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`MaDH`,`MaSP`),
  ADD KEY `MaSP` (`MaSP`);

--
-- Indexes for table `danhgia_sp`
--
ALTER TABLE `danhgia_sp`
  ADD PRIMARY KEY (`MaDG`),
  ADD KEY `MaKH` (`MaKH`);

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
  ADD PRIMARY KEY (`MaTK`),
  ADD UNIQUE KEY `Ten_DN` (`Ten_DN`),
  ADD UNIQUE KEY `MaNV` (`MaNV`),
  ADD UNIQUE KEY `MaKH` (`MaKH`);

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
-- AUTO_INCREMENT for table `danhgia_sp`
--
ALTER TABLE `danhgia_sp`
  MODIFY `MaDG` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `MaTT` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbox`
--
ALTER TABLE `chatbox`
  ADD CONSTRAINT `chatbox_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL;

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`) ON DELETE CASCADE,
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `danhgia_sp`
--
ALTER TABLE `danhgia_sp`
  ADD CONSTRAINT `danhgia_sp_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL;

--
-- Constraints for table `doannhe`
--
ALTER TABLE `doannhe`
  ADD CONSTRAINT `doannhe_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE SET NULL,
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL,
  ADD CONSTRAINT `donhang_ibfk_3` FOREIGN KEY (`MaKM`) REFERENCES `phieukhuyenmai` (`MaKM`) ON DELETE SET NULL;

--
-- Constraints for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  ADD CONSTRAINT `phieukhuyenmai_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc_sp` (`MaDM`) ON DELETE SET NULL;

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE SET NULL,
  ADD CONSTRAINT `taikhoan_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`) ON DELETE SET NULL;

--
-- Constraints for table `thucuong`
--
ALTER TABLE `thucuong`
  ADD CONSTRAINT `thucuong_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`) ON DELETE CASCADE;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
