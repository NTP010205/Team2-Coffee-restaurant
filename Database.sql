-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2025 at 06:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mysql5`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbox`
--

CREATE TABLE `chatbox` (
  `MaChat` int(11) NOT NULL COMMENT 'Ma chat',
  `Traloi` text DEFAULT NULL COMMENT 'Noi dung tra loi',
  `Cauhoi` text DEFAULT NULL COMMENT 'Cau hoi khach gui',
  `Thoigian` datetime DEFAULT NULL COMMENT 'Thoi gian nhan',
  `MaKH` int(11) DEFAULT NULL COMMENT 'Ma khach hang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `Thanhtien` float DEFAULT NULL COMMENT 'Thanh tien',
  `Soluong` int(11) DEFAULT NULL COMMENT 'So luong',
  `Giaban` float DEFAULT NULL COMMENT 'Gia ban',
  `MaSP` int(11) DEFAULT NULL COMMENT 'Ma san pham',
  `MaDH` int(11) DEFAULT NULL COMMENT 'Ma don hang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhgia_sp`
--

CREATE TABLE `danhgia_sp` (
  `MaDG` int(11) NOT NULL COMMENT 'Ma danh gia',
  `DiemDG` int(11) DEFAULT NULL COMMENT 'Diem',
  `NgayDG` date DEFAULT NULL COMMENT 'Ngay danh gia',
  `Binhluan` text DEFAULT NULL COMMENT 'Binh luan',
  `MaKH` int(11) DEFAULT NULL COMMENT 'Ma khach hang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `danhmuc_sp`
--

CREATE TABLE `danhmuc_sp` (
  `MaDM` int(11) NOT NULL COMMENT 'Mã danh mục',
  `Mota` text DEFAULT NULL COMMENT 'Mô tả',
  `TenDM` varchar(100) NOT NULL COMMENT 'Tên danh mục'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doannhe`
--

CREATE TABLE `doannhe` (
  `MaSP` int(11) NOT NULL COMMENT 'Lien ket san pham',
  `GYPH` varchar(50) DEFAULT NULL COMMENT 'Ghi chu (thong tin phu)',
  `HSD` date DEFAULT NULL COMMENT 'Han su dung'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `MaDH` int(11) NOT NULL COMMENT 'Ma don hang',
  `Trangthai` varchar(50) DEFAULT NULL COMMENT 'Trang thai don hang',
  `HT_Thanhtoan` varchar(50) DEFAULT NULL COMMENT 'Hinh thuc thanh toan',
  `HT_Nhanhang` varchar(50) DEFAULT NULL COMMENT 'Hinh thuc nhan hang',
  `Ghichu` text DEFAULT NULL COMMENT 'Ghi chu',
  `Tongtien` float DEFAULT NULL COMMENT 'Tong tien',
  `Ngaylap` date DEFAULT NULL COMMENT 'Ngay lap don',
  `MaNV` int(11) DEFAULT NULL COMMENT 'Ma nhan vien',
  `MaKH` int(11) DEFAULT NULL COMMENT 'Ma khach hang',
  `MaKM` int(11) DEFAULT NULL COMMENT 'Ma khuyen mai'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `MaKH` int(11) NOT NULL COMMENT 'Ma khach hang',
  `Gioitinh` varchar(10) DEFAULT NULL COMMENT 'Gioi tinh',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'Email',
  `SDT` varchar(20) DEFAULT NULL COMMENT 'So dien thoai',
  `Diachi` varchar(255) DEFAULT NULL COMMENT 'Dia chi',
  `LoaiKH` varchar(50) DEFAULT NULL COMMENT 'Loai khach hang',
  `Hoten` varchar(100) DEFAULT NULL COMMENT 'ho ten'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` int(11) NOT NULL COMMENT 'Ma nhan vien',
  `Gioitinh` varchar(10) DEFAULT NULL COMMENT 'Gioi tinh',
  `SDT` varchar(20) DEFAULT NULL COMMENT 'So dien thoai',
  `Mucluong` float DEFAULT NULL COMMENT 'Muc luong',
  `Diachi` varchar(255) DEFAULT NULL COMMENT 'Dia chi',
  `Ngayvaolam` date DEFAULT NULL COMMENT 'Ngay vao lam',
  `Chuvu` varchar(50) DEFAULT NULL COMMENT 'Chuc vu',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT 'Email',
  `Hoten` varchar(100) DEFAULT NULL COMMENT 'Ho ten'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phieukhuyenmai`
--

CREATE TABLE `phieukhuyenmai` (
  `MaKM` int(11) NOT NULL COMMENT 'Ma khuyen mai',
  `Giatrigiam` float DEFAULT NULL COMMENT 'Gia tri giam',
  `Ngaybatdau` date DEFAULT NULL COMMENT 'Ngay bat dau',
  `Trangthai` varchar(50) DEFAULT NULL COMMENT 'Trang thai',
  `Ngayketthuc` date DEFAULT NULL COMMENT 'Ngay ket thuc',
  `TenKM` varchar(100) DEFAULT NULL COMMENT 'Ten khuyen mai',
  `MaKH` int(11) DEFAULT NULL COMMENT 'Ma khach hang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSP` int(11) NOT NULL COMMENT 'Ma san pham',
  `TenSP` varchar(100) NOT NULL COMMENT 'Ten san pham',
  `Giaban` float NOT NULL COMMENT 'Gia ban',
  `Thanhphan` text DEFAULT NULL COMMENT 'Thanh phan',
  `Kichco` varchar(50) DEFAULT NULL COMMENT 'Kich co',
  `TG_chuanbi` varchar(50) DEFAULT NULL COMMENT 'Thoi gian chuan bi',
  `Trangthai` varchar(50) DEFAULT NULL COMMENT 'Trang thai',
  `MaDM` int(11) DEFAULT NULL COMMENT 'Ma danh muc(foreign key)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTK` int(11) NOT NULL COMMENT 'Ma tai khoan',
  `MK` varchar(100) NOT NULL COMMENT 'Mat khau',
  `Trangthai` varchar(50) DEFAULT NULL COMMENT 'Trang thai tai khoan',
  `Phanloai` varchar(50) DEFAULT NULL COMMENT 'Phan loai(admin/khach hang)',
  `Ten_DN` varchar(100) NOT NULL COMMENT 'Ten dang nhap',
  `MaNV` int(11) DEFAULT NULL COMMENT 'Ma nhan vien',
  `MaKH` int(11) DEFAULT NULL COMMENT 'Ma khach hang'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `thucuong`
--

CREATE TABLE `thucuong` (
  `MaSP` int(11) NOT NULL COMMENT 'Ma san pham',
  `Dongot` varchar(50) DEFAULT NULL COMMENT 'Do ngot',
  `Nhietdo` varchar(50) DEFAULT NULL COMMENT 'Nhiet do',
  `Topping` varchar(100) DEFAULT NULL COMMENT 'Topping'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `MaTT` int(11) NOT NULL COMMENT 'Ma tin tuc',
  `Noidung` text DEFAULT NULL COMMENT 'Noi dung tin',
  `Hinhanh` varchar(255) DEFAULT NULL COMMENT 'Hinh anh',
  `Ngaydang` date DEFAULT NULL COMMENT 'Ngay dang',
  `Tieude` varchar(255) NOT NULL COMMENT 'Tieu de',
  `MaNV` int(11) DEFAULT NULL COMMENT 'Ma nhan vien(nguoi dang tin)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  ADD KEY `MaSP` (`MaSP`),
  ADD KEY `MaDH` (`MaDH`);

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
  ADD KEY `MaSP` (`MaSP`);

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
  ADD PRIMARY KEY (`MaKH`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

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
  ADD KEY `MaNV` (`MaNV`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Indexes for table `thucuong`
--
ALTER TABLE `thucuong`
  ADD KEY `MaSP` (`MaSP`);

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
  MODIFY `MaChat` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma chat';

--
-- AUTO_INCREMENT for table `danhgia_sp`
--
ALTER TABLE `danhgia_sp`
  MODIFY `MaDG` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma danh gia';

--
-- AUTO_INCREMENT for table `danhmuc_sp`
--
ALTER TABLE `danhmuc_sp`
  MODIFY `MaDM` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Mã danh mục';

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `MaDH` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma don hang';

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `MaKH` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma khach hang';

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `MaNV` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma nhan vien';

--
-- AUTO_INCREMENT for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  MODIFY `MaKM` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma khuyen mai';

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSP` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma san pham';

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTK` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma tai khoan';

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `MaTT` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Ma tin tuc';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbox`
--
ALTER TABLE `chatbox`
  ADD CONSTRAINT `chatbox_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`),
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`MaDH`) REFERENCES `donhang` (`MaDH`);

--
-- Constraints for table `danhgia_sp`
--
ALTER TABLE `danhgia_sp`
  ADD CONSTRAINT `danhgia_sp_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `doannhe`
--
ALTER TABLE `doannhe`
  ADD CONSTRAINT `doannhe_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `donhang_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`),
  ADD CONSTRAINT `donhang_ibfk_3` FOREIGN KEY (`MaKM`) REFERENCES `phieukhuyenmai` (`MaKM`);

--
-- Constraints for table `phieukhuyenmai`
--
ALTER TABLE `phieukhuyenmai`
  ADD CONSTRAINT `phieukhuyenmai_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_ibfk_1` FOREIGN KEY (`MaDM`) REFERENCES `danhmuc_sp` (`MaDM`);

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `taikhoan_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`),
  ADD CONSTRAINT `taikhoan_ibfk_2` FOREIGN KEY (`MaKH`) REFERENCES `khachhang` (`MaKH`);

--
-- Constraints for table `thucuong`
--
ALTER TABLE `thucuong`
  ADD CONSTRAINT `thucuong_ibfk_1` FOREIGN KEY (`MaSP`) REFERENCES `sanpham` (`MaSP`);

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tintuc_ibfk_1` FOREIGN KEY (`MaNV`) REFERENCES `nhanvien` (`MaNV`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
