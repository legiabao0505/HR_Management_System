-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 29, 2025 lúc 10:48 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `employeems`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(140) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'IT'),
(2, 'Marketing'),
(3, 'Development'),
(4, 'Design'),
(5, 'Sale');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL,
  `salary` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `image` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `password`, `salary`, `address`, `image`, `category_id`) VALUES
(1, 'Nguyễn Thị Xuân Hồng', 'hongxuan@gmail.com', '$2b$10$LxdYB/IV.DQRdLU23lBF8OpqEothqUWkzN.G1iYSVFR2qKUDRYekm', 1000, '2 lâm văn bền, hồ chí minh', 'image_1748316859074.jpg', 2),
(14, 'Lê Gia Bảo', 'baogia54321@gmail.com', '$2b$10$Wk8JTVlRcwu5z1NigT39COEkYlrL4OqdC/19StphQ2.j.pL/slGXq', 1230, 'Số 1, hẻm 27, đường Đặng Văn S', 'image_1748329867839.jpeg', 3),
(15, 'Trần Thị Hồng', 'hongtran420@gmail.com', '$2b$10$/eSDac/EqiD2HhMKVeBFfO8yu02NUfAr1qyyHyszx1PPQfDggBtiW', 990, 'Binh Thạnh', 'image_1748329926180.jpg', 4),
(16, 'Phan Thị Bích Trâm', 'tram.phanthibich@gmail.com', '$2b$10$jO2NaJhfghZ0ifWS1N6OAO6OL/pNTVXinA7/8R52znke5xO10Iy.m', 4123, 'Ho Chi Minh', 'image_1748350855557.png', 3),
(45, 'Hoàng Thị Thuỳ Linh', 'linh.hoangthuy@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhGf.e5d4c3b2a1Z9Y8X7W6V5U4T3S2R1', 14000000, 'Số 18, ngõ 218 Lĩnh Nam, Phườn', 'default.jpg', 4),
(46, 'Vũ Quang Hải', 'hai.vuquang@gmail.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.x9c8v7b6n5m4l3k2j1h0g9f8e7d6', 31500000, '350 Nguyễn Tri Phương, Phường ', 'default.jpg', 3),
(47, 'Đặng Ngọc Mai', 'mai.dangngoc@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.t1u2y3i4o5p6q7w8e9r0t1y2u3i4', 19800000, '198 Đường 3/2, Phường Xuân Khá', 'default.jpg', 5),
(48, 'Nguyễn Thành Long', 'long.nguyenthanh@yahoo.com', '$2b$10$pOiUyTrEwQaSdFgHjKlZ.x1c2v3b4n5m6l7k8j9h0g1f2e3d4', 41000000, 'Tầng 10, Tòa nhà Bitexco, 2 Hả', 'default.jpg', 1),
(49, 'Trần Diễm Quỳnh', 'quynh.trandiem@gmail.com', '$2b$10$gHjKlZxCvBnMqWeRtYuIo.p9o8i7u6y5t4r3e2w1q0a9s8d7f', 16700000, '101A Nguyễn Khuyến, Phường Văn', 'default.jpg', 2),
(50, 'Lê Anh Dũng', 'dung.leanh@outlook.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.o1i2u3y4t5r6e7w8q9a0s1d2f3g4', 33000000, '58 Lý Thường Kiệt, Phường Thạc', 'default.jpg', 3),
(51, 'Lê Thị Ánh Tuyết', 'tuyet.leanh@gmail.com', '$2b$10$kLpQwErTyUiOpAsDfGhjK.e1s2d3f4g5h6j7k8l9m0n1o2p3q4', 22500000, '112 Võ Văn Ngân, Phường Bình T', 'default.jpg', 2),
(52, 'Phạm Minh Đức', 'duc.phamminh.dev@outlook.com', '$2b$10$aBcDeFgHiJkLmNoPqRsTu.v1w2x3y4z5A6B7C8D9E0F1G2H3I4', 48000000, '25/3 Bùi Viện, Phường Phạm Ngũ', 'default.jpg', 1),
(53, 'Hoàng Thị Thuỳ Linh', 'linh.hoangthuy@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhGf.e5d4c3b2a1Z9Y8X7W6V5U4T3S2R1', 14000000, 'Số 18, ngõ 218 Lĩnh Nam, Phườn', 'default.jpg', 4),
(54, 'Vũ Quang Hải', 'hai.vuquang@gmail.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.x9c8v7b6n5m4l3k2j1h0g9f8e7d6', 31500000, '350 Nguyễn Tri Phương, Phường ', 'default.jpg', 3),
(55, 'Đặng Ngọc Mai', 'mai.dangngoc@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.t1u2y3i4o5p6q7w8e9r0t1y2u3i4', 19800000, '198 Đường 3/2, Phường Xuân Khá', 'default.jpg', 5),
(56, 'Nguyễn Thành Long', 'long.nguyenthanh@yahoo.com', '$2b$10$pOiUyTrEwQaSdFgHjKlZ.x1c2v3b4n5m6l7k8j9h0g1f2e3d4', 41000000, 'Tầng 10, Tòa nhà Bitexco, 2 Hả', 'default.jpg', 1),
(57, 'Trần Diễm Quỳnh', 'quynh.trandiem@gmail.com', '$2b$10$gHjKlZxCvBnMqWeRtYuIo.p9o8i7u6y5t4r3e2w1q0a9s8d7f', 16700000, '101A Nguyễn Khuyến, Phường Văn', 'default.jpg', 2),
(58, 'Lê Anh Dũng', 'dung.leanh@outlook.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.o1i2u3y4t5r6e7w8q9a0s1d2f3g4', 33000000, '58 Lý Thường Kiệt, Phường Thạc', 'default.jpg', 3),
(59, 'Hoàng Minh Tuấn', 'tuan.hoangminh@yahoo.com', '$2b$10$hGfEdCbAsRtYuIoPaSdF.j1k2l3m4n5b6v7c8x9z0a1s2d3f4', 49500000, '212B/D28 Nguyễn Trãi, Phường N', 'default.jpg', 1),
(60, 'Phan Thị Thanh Hằng', 'hang.phanthanh@gmail.com', '$2b$10$gHjKlZxCvBnMaSdFgHjKl.z9y8x7w6v5u4t3r2e1q0w9s8d7', 24000000, '45 Lê Hồng Phong, Phường 4, Th', 'default.jpg', 4),
(61, 'Võ Đức Trí', 'tri.voduc@gmail.com', '$2b$10$pOiUyTrEwQaSdFqWeRtY.u1i2o3p4a5s6d7f8g9h0j1k2l3m4', 35500000, '72 Trần Văn Khéo, Phường Cái K', 'default.jpg', 3),
(62, 'Đặng Quỳnh Anh', 'anh.dangquynh@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhG.f1e2d3c4b5a6Z7Y8X9W0V1U2T3S4', 13500000, '66 Lương Khánh Thiện, Phường C', 'default.jpg', 2),
(63, 'Nguyễn Hữu Phước', 'phuoc.nguyenhuu@outlook.com', '$2b$10$kLpQwErTyUiOpAsDfGhjK.l1m2n3b4v5c6x7z8q9w0e1r2t3y', 28900000, 'Số 33, ngõ 158 Phố Nguyễn Khán', 'default.jpg', 5),
(64, 'Trần Ngọc Thảo', 'thao.tranngoc@gmail.com', '$2b$10$aBcDeFgHiJkLmNoPqRsTu.g1h2i3j4k5l6m7n8b9v0c1x2z3a', 18200000, '18 Pasteur, Phường Hải Châu 1,', 'default.jpg', 4),
(65, 'Lê Đình Toàn', 'toan.ledinh.it@yahoo.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.b1n2m3l4k5j6h7g8f9e0d1c2v3b4', 46500000, 'Tòa nhà Landmark 81, 720A Điện', 'default.jpg', 1),
(66, 'Phạm Thuỳ Dương', 'duong.phamthuy@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.d1f2g3h4j5k6l7m8n9b0v1c2x3z4', 21300000, '98 Hàng Gai, Phường Hàng Gai, ', 'default.jpg', 2),
(67, 'Hoàng Công Danh', 'danh.hoangcong@gmail.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.c1v2b3n4m5l6k7j8h9g0f1d2s3a4', 38800000, '235 Nguyễn Văn Cừ, Phường An H', 'default.jpg', 3),
(68, 'Vũ Thanh Tâm', 'tam.vuthanh@yahoo.com', '$2b$10$hGfEdCbAsRtYuIoPaSdF.s1d2f3g4h5j6k7l8m9n0b1v2c3x4', 26700000, '88 Quang Trung, Phường Trần Hư', 'default.jpg', 5),
(69, 'Đặng Bảo Châu', 'chau.dangbao@gmail.com', '$2b$10$gHjKlZxCvBnMaSdFgHjKl.x1z2c3v4b5n6m7l8k9j0h1g2f3e4', 15900000, '47/2B đường Bùi Đình Tuý, Phườ', 'default.jpg', 4),
(70, 'Nguyễn Phúc Thịnh', 'thinh.nguyenphuc@outlook.com', '$2b$10$pOiUyTrEwQaSdFqWeRtY.a1s2d3f4g5h6j7k8l9m0n1b2v3c4', 44200000, '15A, ngõ 61, phố Lạc Trung, Ph', 'default.jpg', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee_evaluations`
--

CREATE TABLE `employee_evaluations` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `comment` longtext DEFAULT NULL,
  `type` varchar(1) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `performance_percent` int(11) DEFAULT 0,
  `bonus_salary` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `report` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `reports`
--

INSERT INTO `reports` (`id`, `employee_id`, `report`, `date`) VALUES
(18, 14, 'Báo cáo Công việc Hàng ngày - Nhân viên IT\nNgày: 29 tháng 5 năm 2025\nHọ và Tên: [Tên của bạn]\nBộ phận: Công nghệ Thông tin (IT)\n\n1. Hỗ trợ Người dùng & Xử lý Sự cố (Tickets/Requests):\n\nĐã đóng (Resolved):\n[TICKET-ID 123] - Hỗ trợ User [Tên User A], [Phòng Ban A]: Khắc phục sự cố không thể kết nối máy in mạng.\n[TICKET-ID 124] - Hỗ trợ User [Tên User B], [Phòng Ban B]: Cài đặt phần mềm [Tên phần mềm] và cấu hình cơ bản.\n[TICKET-ID 125] - Hỗ trợ User [Tên User C], [Phòng Ban C]: Reset mật khẩu tài khoản Windows.\nHỗ trợ trực tiếp 3 trường hợp: Lỗi kết nối Wifi, máy tính chạy chậm, hướng dẫn sử dụng Outlook.\nĐang xử lý (In Progress):\n[TICKET-ID 126] - User [Tên User D]: Điều tra nguyên nhân lỗi màn hình xanh (BSOD) - Đang chờ phản hồi từ người dùng sau khi áp dụng bản vá.\nYêu cầu nâng cấp RAM cho máy tính [Phòng Ban E] - Đã gửi yêu cầu báo giá.\n2. Công việc Dự án:\n\nDự án [Tên Dự án 1 - Ví dụ: Nâng cấp Hệ thống Mạng Wifi]:\nHoàn thành khảo sát thực địa tại khu vực [Tên khu vực].\nLên sơ đồ vị trí lắp đặt Access Point mới.\nPhối hợp với nhà cung cấp về thông số kỹ thuật thiết bị.\nDự án [Tên Dự án 2 - Ví dụ: Triển khai Phần mềm Quản lý Tài sản]:\nTham gia họp với bộ phận Kế toán để thu thập yêu cầu chi tiết.\nKiểm tra khả năng tương thích của phần mềm với hạ tầng hiện tại.\n3. Bảo trì & Giám sát Hệ thống:\n\nKiểm tra tình trạng hoạt động của máy chủ [Tên Máy chủ]: CPU, RAM, Dung lượng đĩa - Mọi chỉ số đều trong ngưỡng bình thường.\nGiám sát hệ thống sao lưu (Backup): Xác nhận các tác vụ sao lưu đêm qua đã hoàn thành thành công.\nKiểm tra logs hệ thống Firewall: Không phát hiện hoạt động bất thường.\n4. Cuộc họp & Đào tạo:\n\nTham gia cuộc họp nhanh với Team IT (10:00 - 10:30): Cập nhật tiến độ công việc và phân chia nhiệm vụ.\n5. Kế hoạch cho ngày mai (30/05/2025):\n\nTiếp tục xử lý các ticket còn tồn đọng.\nTriển khai lắp đặt Access Point tại [Tên khu vực] (Nếu thiết bị về kịp).\nViết tài liệu hướng dẫn sử dụng cơ bản cho [Phần mềm Quản lý Tài sản].\nThực hiện bảo trì định kỳ máy chủ [Tên Máy chủ khác].\nRà soát lại chính sách bảo mật cho người dùng cuối.\n6. Vấn đề & Trở ngại (Nếu có):\n\nMột số người dùng báo cáo kết nối VPN chập chờn vào buổi sáng. Đã kiểm tra server VPN nhưng chưa phát hiện nguyên nhân rõ ràng, cần tiếp tục theo dõi.\nThiết bị Access Point cho dự án Nâng cấp Wifi có thể về trễ hơn dự kiến.', '2025-05-29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_schedules`
--

CREATE TABLE `work_schedules` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `shift` enum('morning','night') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `work_schedules`
--

INSERT INTO `work_schedules` (`id`, `employee_id`, `date`, `shift`) VALUES
(3061, 49, '2025-05-26', 'morning'),
(3062, 58, '2025-05-26', 'night'),
(3063, 57, '2025-05-26', 'morning'),
(3064, 48, '2025-05-26', 'night'),
(3065, 61, '2025-05-26', 'morning'),
(3066, 55, '2025-05-26', 'night'),
(3067, 53, '2025-05-26', 'morning'),
(3068, 66, '2025-05-26', 'night'),
(3069, 14, '2025-05-26', 'morning'),
(3070, 1, '2025-05-26', 'night'),
(3071, 68, '2025-05-26', 'morning'),
(3072, 64, '2025-05-26', 'night'),
(3073, 67, '2025-05-26', 'morning'),
(3074, 52, '2025-05-26', 'night'),
(3075, 56, '2025-05-26', 'morning'),
(3076, 54, '2025-05-26', 'night'),
(3077, 63, '2025-05-26', 'morning'),
(3078, 16, '2025-05-26', 'night'),
(3079, 15, '2025-05-26', 'morning'),
(3080, 69, '2025-05-26', 'night'),
(3081, 45, '2025-05-26', 'morning'),
(3082, 65, '2025-05-26', 'night'),
(3083, 51, '2025-05-26', 'morning'),
(3084, 60, '2025-05-26', 'night'),
(3085, 50, '2025-05-26', 'morning'),
(3086, 70, '2025-05-26', 'night'),
(3087, 46, '2025-05-26', 'morning'),
(3088, 47, '2025-05-26', 'night'),
(3089, 59, '2025-05-26', 'morning'),
(3090, 62, '2025-05-26', 'night'),
(3091, 67, '2025-05-27', 'night'),
(3092, 15, '2025-05-27', 'night'),
(3093, 51, '2025-05-27', 'night'),
(3094, 60, '2025-05-27', 'morning'),
(3095, 58, '2025-05-27', 'morning'),
(3096, 14, '2025-05-27', 'night'),
(3097, 54, '2025-05-27', 'morning'),
(3098, 47, '2025-05-27', 'morning'),
(3099, 49, '2025-05-27', 'night'),
(3100, 68, '2025-05-27', 'night'),
(3101, 63, '2025-05-27', 'night'),
(3102, 56, '2025-05-27', 'night'),
(3103, 46, '2025-05-27', 'night'),
(3104, 64, '2025-05-27', 'morning'),
(3105, 16, '2025-05-27', 'morning'),
(3106, 61, '2025-05-27', 'night'),
(3107, 57, '2025-05-27', 'night'),
(3108, 59, '2025-05-27', 'night'),
(3109, 65, '2025-05-27', 'morning'),
(3110, 52, '2025-05-27', 'morning'),
(3111, 69, '2025-05-27', 'morning'),
(3112, 62, '2025-05-27', 'morning'),
(3113, 50, '2025-05-27', 'night'),
(3114, 45, '2025-05-27', 'night'),
(3115, 48, '2025-05-27', 'morning'),
(3116, 53, '2025-05-27', 'night'),
(3117, 55, '2025-05-27', 'morning'),
(3118, 1, '2025-05-27', 'morning'),
(3119, 70, '2025-05-27', 'morning'),
(3120, 66, '2025-05-27', 'morning'),
(3121, 14, '2025-05-28', 'morning'),
(3122, 52, '2025-05-28', 'night'),
(3123, 16, '2025-05-28', 'night'),
(3124, 53, '2025-05-28', 'morning'),
(3125, 58, '2025-05-28', 'night'),
(3126, 46, '2025-05-28', 'morning'),
(3127, 55, '2025-05-28', 'night'),
(3128, 48, '2025-05-28', 'night'),
(3129, 45, '2025-05-28', 'morning'),
(3130, 15, '2025-05-28', 'morning'),
(3131, 57, '2025-05-28', 'morning'),
(3132, 60, '2025-05-28', 'night'),
(3133, 50, '2025-05-28', 'morning'),
(3134, 70, '2025-05-28', 'night'),
(3135, 59, '2025-05-28', 'morning'),
(3136, 65, '2025-05-28', 'night'),
(3137, 51, '2025-05-28', 'morning'),
(3138, 63, '2025-05-28', 'morning'),
(3139, 69, '2025-05-28', 'night'),
(3140, 62, '2025-05-28', 'night'),
(3141, 49, '2025-05-28', 'morning'),
(3142, 1, '2025-05-28', 'night'),
(3143, 68, '2025-05-28', 'morning'),
(3144, 61, '2025-05-28', 'morning'),
(3145, 47, '2025-05-28', 'night'),
(3146, 56, '2025-05-28', 'morning'),
(3147, 54, '2025-05-28', 'night'),
(3148, 64, '2025-05-28', 'night'),
(3149, 66, '2025-05-28', 'night'),
(3150, 67, '2025-05-28', 'morning'),
(3151, 16, '2025-05-29', 'morning'),
(3152, 51, '2025-05-29', 'night'),
(3153, 60, '2025-05-29', 'morning'),
(3154, 47, '2025-05-29', 'morning'),
(3155, 62, '2025-05-29', 'morning'),
(3156, 45, '2025-05-29', 'night'),
(3157, 48, '2025-05-29', 'morning'),
(3158, 65, '2025-05-29', 'morning'),
(3159, 63, '2025-05-29', 'night'),
(3160, 67, '2025-05-29', 'night'),
(3161, 64, '2025-05-29', 'morning'),
(3162, 15, '2025-05-29', 'night'),
(3163, 59, '2025-05-29', 'night'),
(3164, 54, '2025-05-29', 'morning'),
(3165, 53, '2025-05-29', 'night'),
(3166, 61, '2025-05-29', 'night'),
(3167, 49, '2025-05-29', 'night'),
(3168, 57, '2025-05-29', 'night'),
(3169, 55, '2025-05-29', 'morning'),
(3170, 50, '2025-05-29', 'night'),
(3171, 66, '2025-05-29', 'morning'),
(3172, 68, '2025-05-29', 'night'),
(3173, 58, '2025-05-29', 'morning'),
(3174, 14, '2025-05-29', 'night'),
(3175, 1, '2025-05-29', 'morning'),
(3176, 70, '2025-05-29', 'morning'),
(3177, 69, '2025-05-29', 'morning'),
(3178, 56, '2025-05-29', 'night'),
(3179, 46, '2025-05-29', 'night'),
(3180, 52, '2025-05-29', 'morning'),
(3181, 61, '2025-05-30', 'morning'),
(3182, 51, '2025-05-30', 'morning'),
(3183, 67, '2025-05-30', 'morning'),
(3184, 1, '2025-05-30', 'night'),
(3185, 58, '2025-05-30', 'night'),
(3186, 16, '2025-05-30', 'night'),
(3187, 62, '2025-05-30', 'night'),
(3188, 52, '2025-05-30', 'night'),
(3189, 64, '2025-05-30', 'night'),
(3190, 14, '2025-05-30', 'morning'),
(3191, 70, '2025-05-30', 'night'),
(3192, 50, '2025-05-30', 'morning'),
(3193, 56, '2025-05-30', 'morning'),
(3194, 54, '2025-05-30', 'night'),
(3195, 66, '2025-05-30', 'night'),
(3196, 49, '2025-05-30', 'morning'),
(3197, 69, '2025-05-30', 'night'),
(3198, 53, '2025-05-30', 'morning'),
(3199, 65, '2025-05-30', 'night'),
(3200, 68, '2025-05-30', 'morning'),
(3201, 59, '2025-05-30', 'morning'),
(3202, 63, '2025-05-30', 'morning'),
(3203, 46, '2025-05-30', 'morning'),
(3204, 45, '2025-05-30', 'morning'),
(3205, 15, '2025-05-30', 'morning'),
(3206, 48, '2025-05-30', 'night'),
(3207, 47, '2025-05-30', 'night'),
(3208, 55, '2025-05-30', 'night'),
(3209, 57, '2025-05-30', 'morning'),
(3210, 60, '2025-05-30', 'night'),
(3211, 49, '2025-05-31', 'night'),
(3212, 48, '2025-05-31', 'morning'),
(3213, 68, '2025-05-31', 'night'),
(3214, 52, '2025-05-31', 'morning'),
(3215, 58, '2025-05-31', 'morning'),
(3216, 16, '2025-05-31', 'morning'),
(3217, 15, '2025-05-31', 'night'),
(3218, 62, '2025-05-31', 'morning'),
(3219, 60, '2025-05-31', 'morning'),
(3220, 45, '2025-05-31', 'night'),
(3221, 67, '2025-05-31', 'night'),
(3222, 14, '2025-05-31', 'night'),
(3223, 54, '2025-05-31', 'morning'),
(3224, 50, '2025-05-31', 'night'),
(3225, 53, '2025-05-31', 'night'),
(3226, 56, '2025-05-31', 'night'),
(3227, 69, '2025-05-31', 'morning'),
(3228, 61, '2025-05-31', 'night'),
(3229, 55, '2025-05-31', 'morning'),
(3230, 70, '2025-05-31', 'morning'),
(3231, 51, '2025-05-31', 'night'),
(3232, 64, '2025-05-31', 'morning'),
(3233, 63, '2025-05-31', 'night'),
(3234, 66, '2025-05-31', 'morning'),
(3235, 46, '2025-05-31', 'night'),
(3236, 65, '2025-05-31', 'morning'),
(3237, 59, '2025-05-31', 'night'),
(3238, 1, '2025-05-31', 'morning'),
(3239, 57, '2025-05-31', 'night'),
(3240, 47, '2025-05-31', 'morning');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Chỉ mục cho bảng `work_schedules`
--
ALTER TABLE `work_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `work_schedules`
--
ALTER TABLE `work_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3241;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);

--
-- Các ràng buộc cho bảng `work_schedules`
--
ALTER TABLE `work_schedules`
  ADD CONSTRAINT `work_schedules_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
