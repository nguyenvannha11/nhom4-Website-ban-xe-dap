-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 04, 2020 lúc 04:22 PM
-- Phiên bản máy phục vụ: 10.4.8-MariaDB
-- Phiên bản PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `xedap`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dotuoi`
--

CREATE TABLE `dotuoi` (
  `dotuoi_id` int(11) NOT NULL,
  `dotuoi_ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `dotuoi`
--

INSERT INTO `dotuoi` (`dotuoi_id`, `dotuoi_ten`) VALUES
(1, 'Trẻ em'),
(2, 'Thiếu niên'),
(3, 'Thanh niên'),
(4, 'Trung niên'),
(5, 'Người cao tuổi');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisp`
--

CREATE TABLE `loaisp` (
  `loaisp_id` int(11) NOT NULL,
  `loaisp_ten` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisp`
--

INSERT INTO `loaisp` (`loaisp_id`, `loaisp_ten`) VALUES
(1, 'Xe địa hình'),
(2, 'Xe thể thao'),
(3, 'Xe đua chuyên nghiệp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `sanpham_id` int(11) NOT NULL,
  `loaisp_id` int(11) NOT NULL,
  `dotuoi_id` int(11) NOT NULL,
  `sanpham_ten` varchar(255) NOT NULL,
  `sanpham_gia` int(11) NOT NULL,
  `sanpham_soluong` int(11) NOT NULL,
  `sanpham_gioithieu` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sanpham_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`sanpham_id`, `loaisp_id`, `dotuoi_id`, `sanpham_ten`, `sanpham_gia`, `sanpham_soluong`, `sanpham_gioithieu`, `sanpham_img`) VALUES
(1, 2, 2, 'GTX70', 50000000, 3, 'Kiểu dáng thể thao được yêu thích nhất', 'xe1.jpg'),
(2, 3, 2, 'Kona TX80', 25000000, 3, 'Dòng xe cao cấp được ưa truộng nhất trên thế giới', 'xe1.jpg'),
(3, 3, 2, 'Messedeer', 30000000, 3, 'Nổi tiếng là dòng xe vì môi trường', 'xe1.jpg'),
(4, 1, 1, 'Messedeer', 15000000, 3, '', 'xe1.jpg'),
(5, 1, 1, 'Honda', 5000000, 3, '', 'xe1.jpg'),
(6, 1, 1, 'mazda', 5000000, 3, '', 'xe1.jpg'),
(7, 1, 1, 'Audi', 5000000, 3, '', 'xe1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `iduser` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`iduser`, `user`, `password`) VALUES
(1, 'tien', 'tien');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `dotuoi`
--
ALTER TABLE `dotuoi`
  ADD PRIMARY KEY (`dotuoi_id`);

--
-- Chỉ mục cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  ADD PRIMARY KEY (`loaisp_id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`sanpham_id`),
  ADD KEY `loaisp_id` (`loaisp_id`),
  ADD KEY `dotuoi_id` (`dotuoi_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `dotuoi`
--
ALTER TABLE `dotuoi`
  MODIFY `dotuoi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `loaisp`
--
ALTER TABLE `loaisp`
  MODIFY `loaisp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `sanpham_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `iduser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_dotuoi` FOREIGN KEY (`dotuoi_id`) REFERENCES `dotuoi` (`dotuoi_id`),
  ADD CONSTRAINT `fk_loaisp` FOREIGN KEY (`loaisp_id`) REFERENCES `loaisp` (`loaisp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
