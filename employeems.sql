-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2025 lúc 08:22 AM
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
  `phone` varchar(20) DEFAULT NULL,
  `image` varchar(60) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `password`, `salary`, `address`, `phone`, `image`, `category_id`) VALUES
(1, 'Nguyễn Thị Xuân Hồng', 'hongxuan@gmail.com', '$2b$10$LxdYB/IV.DQRdLU23lBF8OpqEothqUWkzN.G1iYSVFR2qKUDRYekm', 1000, '2 lâm văn bền, hồ chí minh', 'Not provided', 'image_1748316859074.jpg', 2),
(14, 'Lê Gia Bảo', 'baogia54321@gmail.com', '$2b$10$Wk8JTVlRcwu5z1NigT39COEkYlrL4OqdC/19StphQ2.j.pL/slGXq', 1230, 'Số 1, hẻm 27, đường Đặng Văn S', 'Not provided', 'image_1748329867839.jpeg', 3),
(15, 'Trần Thị Hồng', 'hongtran420@gmail.com', '$2b$10$/eSDac/EqiD2HhMKVeBFfO8yu02NUfAr1qyyHyszx1PPQfDggBtiW', 990, 'Binh Thạnh', 'Not provided', 'image_1748329926180.jpg', 4),
(16, 'Phan Thị Bích Trâm', 'tram.phanthibich@gmail.com', '$2b$10$jO2NaJhfghZ0ifWS1N6OAO6OL/pNTVXinA7/8R52znke5xO10Iy.m', 4123, 'Ho Chi Minh', 'Not provided', 'image_1748350855557.png', 3),
(45, 'Hoàng Thị Thuỳ Linh', 'linh.hoangthuy@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhGf.e5d4c3b2a1Z9Y8X7W6V5U4T3S2R1', 1020, 'Số 18, ngõ 218 Lĩnh Nam, Phườn', 'Not provided', 'default.jpg', 4),
(46, 'Vũ Quang Hải', 'hai.vuquang@gmail.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.x9c8v7b6n5m4l3k2j1h0g9f8e7d6', 2012, '350 Nguyễn Tri Phương, Phường ', 'Not provided', 'default.jpg', 3),
(47, 'Đặng Ngọc Mai', 'mai.dangngoc@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.t1u2y3i4o5p6q7w8e9r0t1y2u3i4', 521, '198 Đường 3/2, Phường Xuân Khá', 'Not provided', 'default.jpg', 5),
(48, 'Nguyễn Thành Long', 'long.nguyenthanh@yahoo.com', '$2b$10$pOiUyTrEwQaSdFgHjKlZ.x1c2v3b4n5m6l7k8j9h0g1f2e3d4', 2131, 'Tầng 10, Tòa nhà Bitexco, 2 Hả', 'Not provided', 'default.jpg', 1),
(49, 'Trần Diễm Quỳnh', 'quynh.trandiem@gmail.com', '$2b$10$gHjKlZxCvBnMqWeRtYuIo.p9o8i7u6y5t4r3e2w1q0a9s8d7f', 412, '101A Nguyễn Khuyến, Phường Văn', 'Not provided', 'default.jpg', 2),
(50, 'Lê Anh Dũng', 'dung.leanh@outlook.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.o1i2u3y4t5r6e7w8q9a0s1d2f3g4', 415, '58 Lý Thường Kiệt, Phường Thạc', 'Not provided', 'default.jpg', 3),
(51, 'Lê Thị Ánh Tuyết', 'tuyet.leanh@gmail.com', '$2b$10$kLpQwErTyUiOpAsDfGhjK.e1s2d3f4g5h6j7k8l9m0n1o2p3q4', 621, '112 Võ Văn Ngân, Phường Bình T', 'Not provided', 'default.jpg', 2),
(52, 'Phạm Minh Đức', 'duc.phamminh.dev@outlook.com', '$2b$10$aBcDeFgHiJkLmNoPqRsTu.v1w2x3y4z5A6B7C8D9E0F1G2H3I4', 741, '25/3 Bùi Viện, Phường Phạm Ngũ', 'Not provided', 'default.jpg', 1),
(53, 'Hoàng Thị Thuỳ Linh', 'linh.hoangthuy@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhGf.e5d4c3b2a1Z9Y8X7W6V5U4T3S2R1', 412, 'Số 18, ngõ 218 Lĩnh Nam, Phườn', 'Not provided', 'default.jpg', 4),
(54, 'Vũ Quang Hải', 'hai.vuquang@gmail.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.x9c8v7b6n5m4l3k2j1h0g9f8e7d6', 312, '350 Nguyễn Tri Phương, Phường ', 'Not provided', 'default.jpg', 3),
(55, 'Đặng Ngọc Mai', 'mai.dangngoc@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.t1u2y3i4o5p6q7w8e9r0t1y2u3i4', 1003, '198 Đường 3/2, Phường Xuân Khá', 'Not provided', 'default.jpg', 5),
(56, 'Nguyễn Thành Long', 'long.nguyenthanh@yahoo.com', '$2b$10$pOiUyTrEwQaSdFgHjKlZ.x1c2v3b4n5m6l7k8j9h0g1f2e3d4', 613, 'Tầng 10, Tòa nhà Bitexco, 2 Hả', 'Not provided', 'default.jpg', 1),
(57, 'Trần Diễm Quỳnh', 'quynh.trandiem@gmail.com', '$2b$10$gHjKlZxCvBnMqWeRtYuIo.p9o8i7u6y5t4r3e2w1q0a9s8d7f', 412, '101A Nguyễn Khuyến, Phường Văn', 'Not provided', 'default.jpg', 2),
(58, 'Lê Anh Dũng', 'dung.leanh@outlook.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.o1i2u3y4t5r6e7w8q9a0s1d2f3g4', 412, '58 Lý Thường Kiệt, Phường Thạc', 'Not provided', 'default.jpg', 3),
(59, 'Hoàng Minh Tuấn', 'tuan.hoangminh@yahoo.com', '$2b$10$hGfEdCbAsRtYuIoPaSdF.j1k2l3m4n5b6v7c8x9z0a1s2d3f4', 412, '212B/D28 Nguyễn Trãi, Phường N', 'Not provided', 'default.jpg', 1),
(60, 'Phan Thị Thanh Hằng', 'hang.phanthanh@gmail.com', '$2b$10$gHjKlZxCvBnMaSdFgHjKl.z9y8x7w6v5u4t3r2e1q0w9s8d7', 752, '45 Lê Hồng Phong, Phường 4, Th', 'Not provided', 'default.jpg', 4),
(61, 'Võ Đức Trí', 'tri.voduc@gmail.com', '$2b$10$pOiUyTrEwQaSdFqWeRtY.u1i2o3p4a5s6d7f8g9h0j1k2l3m4', 523, '72 Trần Văn Khéo, Phường Cái K', 'Not provided', 'default.jpg', 3),
(62, 'Đặng Quỳnh Anh', 'anh.dangquynh@yahoo.com', '$2b$10$zXyWvUtSrQpOnMlKjIhG.f1e2d3c4b5a6Z7Y8X9W0V1U2T3S4', 321, '66 Lương Khánh Thiện, Phường C', 'Not provided', 'default.jpg', 2),
(63, 'Nguyễn Hữu Phước', 'phuoc.nguyenhuu@outlook.com', '$2b$10$kLpQwErTyUiOpAsDfGhjK.l1m2n3b4v5c6x7z8q9w0e1r2t3y', 624, 'Số 33, ngõ 158 Phố Nguyễn Khán', 'Not provided', 'default.jpg', 5),
(64, 'Trần Ngọc Thảo', 'thao.tranngoc@gmail.com', '$2b$10$aBcDeFgHiJkLmNoPqRsTu.g1h2i3j4k5l6m7n8b9v0c1x2z3a', 721, '18 Pasteur, Phường Hải Châu 1,', 'Not provided', 'default.jpg', 4),
(65, 'Lê Đình Toàn', 'toan.ledinh.it@yahoo.com', '$2b$10$qWeRtYuIoPaSdFgHjKlZ.b1n2m3l4k5j6h7g8f9e0d1c2v3b4', 581, 'Tòa nhà Landmark 81, 720A Điện', 'Not provided', 'default.jpg', 1),
(66, 'Phạm Thuỳ Dương', 'duong.phamthuy@outlook.com', '$2b$10$mNbVcXzLkJhGfEdCbAsR.d1f2g3h4j5k6l7m8n9b0v1c2x3z4', 319, '98 Hàng Gai, Phường Hàng Gai, ', 'Not provided', 'default.jpg', 2),
(67, 'Hoàng Công Danh', 'danh.hoangcong@gmail.com', '$2b$10$fDsAlKpOwIeRzYxWvBuT.c1v2b3n4m5l6k7j8h9g0f1d2s3a4', 523, '235 Nguyễn Văn Cừ, Phường An H', 'Not provided', 'default.jpg', 3),
(68, 'Vũ Thanh Tâm', 'tam.vuthanh@yahoo.com', '$2b$10$hGfEdCbAsRtYuIoPaSdF.s1d2f3g4h5j6k7l8m9n0b1v2c3x4', 125, '88 Quang Trung, Phường Trần Hư', 'Not provided', 'default.jpg', 5),
(69, 'Đặng Bảo Châu', 'chau.dangbao@gmail.com', '$2b$10$gHjKlZxCvBnMaSdFgHjKl.x1z2c3v4b5n6m7l8k9j0h1g2f3e4', 852, '47/2B đường Bùi Đình Tuý, Phườ', 'Not provided', 'default.jpg', 4),
(70, 'Nguyễn Phúc Thịnh', 'thinh.nguyenphuc@outlook.com', '$2b$10$pOiUyTrEwQaSdFqWeRtY.a1s2d3f4g5h6j7k8l9m0n1b2v3c4', 983, '15A, ngõ 61, phố Lạc Trung, Ph', 'Not provided', 'default.jpg', 1),
(77, 'teo', 'teo@gmail.com', '$2b$10$WbS3tFDIv8RTuZ/9RzDlNeu7Xwdi//cEQ6wDIUl9OOkyJoKiLx.E2', 12345, '1234', 'Not provided', 'image_1748592061533.jpg', 1),
(78, 'beo', 'beo@gmail.com', '$2b$10$7XE8baWXnRBH6Kw0zLP0Xu5xEBpDOMo61.BysTs059f5ypKh/kMoC', 999, '1291', '0359383995', 'image_1748662031768.jpg', 1),
(79, 'beo2', 'beo2@gmail.com', '$2b$10$2EhZIHOOPQRT5MnWtZRNa.6pLGKGF6/RYdfWggsRsnRIBPfMXPOb6', 1239, '1245', 'Not provided', 'image_1748662065838.jpg', 2),
(80, 'beo3', 'beo3@gmail.com', '$2b$10$PzR3FI761gKB8untywWNQeXkuqF6Z2wjqp0uhW0/1Mkbt0yPWs1si', 1251, '1512', 'Not provided', 'image_1748662089899.jpg', 3),
(81, 'bao4', 'beo4@gmail.com', '$2b$10$bVzsEIICXupX0Yr88Tlp6O7iugcav4.dz0CohK40Pb/WG228SwuiW', 1241, '1251', 'Not provided', 'image_1748662132342.jpg', 4),
(82, 'beo5', 'beo5@gmail.com', '$2b$10$ngnux0GzZjinjCh11qgvfONyUxncNhJePWP.qOeWSxWT1YR78Wj7K', 2411, '1241', 'Not provided', 'image_1748662164700.jpg', 5),
(83, 'beo6', 'beo6@gmail.com', '$2b$10$gdUSD9YRBaaMmc6KyAQlkOAjLOlHjzSp5ZBrwk2Sr/6C9avS9HDiy', 1234, '123', 'Not provided', 'image_1748703944146.jpg', 5);

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
  `bonus_salary` int(11) DEFAULT 0,
  `suggestion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employee_evaluations`
--

INSERT INTO `employee_evaluations` (`id`, `employee_id`, `comment`, `type`, `created_at`, `performance_percent`, `bonus_salary`, `suggestion`) VALUES
(9, 1, 'The report provided, \'Test report,\' lacks sufficient detail or context to evaluate the employee\'s performance fully. Additional information or metrics about the employee\'s contributions, achievements, and work quality is required for a more accurate assessment.', 'C', '2025-05-29 17:01:59', 50, 20, NULL),
(10, 14, 'The employee has demonstrated strong performance by resolving multiple tickets, actively participating in ongoing projects, maintaining system operations, and planning for upcoming tasks. They also identified and addressed potential obstacles, showcasing their problem-solving skills. However, there is room for improvement in resolving pending issues, such as the VPN connection problem and monitoring delays in equipment delivery.', 'A', '2025-05-29 20:42:38', 92, 123, NULL),
(11, 77, 'Nguyễn Văn A đã hoàn thành khối lượng công việc đáng kể trong ngày, bao gồm việc thiết kế và chỉnh sửa các sản phẩm quan trọng như banner, giao diện trang chủ, và xuất file prototype. Các công việc này đều cho thấy tính chuyên nghiệp và sự phối hợp tốt với các bộ phận liên quan. Tuy nhiên, một số nhiệm vụ có thể bị chậm do thiếu thông tin từ khách hàng và Content team, điều này không thuộc trách nhiệm trực tiếp của nhân viên. Hiệu suất tổng thể rất tốt.', 'A', '2025-05-30 15:12:54', 92, 1235, NULL),
(12, 78, 'Nguyễn Văn Nam đã thực hiện công việc một cách đáng tin cậy và hiệu quả. Hệ thống và hạ tầng công nghệ thông tin được duy trì ổn định, các công việc hỗ trợ người dùng được giải quyết kịp thời, và backup dữ liệu được thực hiện đúng kế hoạch. Trong khi đó, việc xử lý vấn đề phần mềm MISA và hoàn thành vá lỗi bảo mật đang được tiến hành. Để đạt hiệu suất cao hơn, cần nhanh chóng xử lý các vấn đề còn tồn đọng như cải thiện tốc độ phần mềm MISA và hoàn thành vá lỗi bảo mật.', 'A', '2025-05-31 10:30:55', 92, 100, NULL),
(13, 79, 'Trần Lan Anh đã thực hiện xuất sắc vai trò trưởng nhóm Marketing, đạt hiệu quả cao trong các chiến dịch quảng cáo và email marketing. Các số liệu CTR, CPC, tỷ lệ chuyển đổi, và lượng tương tác đều ở mức tốt, phản ánh sự quản lý và triển khai hiệu quả. Ngoài ra, việc quản lý nội dung, kế hoạch sáng tạo và phối hợp liên phòng ban cũng được thực hiện đầy đủ và có tổ chức. Một điểm cần cải thiện nhỏ là tỷ lệ tương tác thấp của bài viết về \'Lợi ích [Tính năng Z]\', nhưng Lan Anh đã chủ động đề xuất giải pháp phù hợp. Đây là một báo cáo rất tích cực.', 'A', '2025-05-31 10:31:24', 92, 124, NULL),
(14, 80, 'Lê Quang Huy đã thể hiện hiệu suất làm việc rất tốt với tiến độ đáng kể trên nhiều đầu công việc. Anh đã hoàn thành 100% giao diện người dùng cho tính năng \'Thanh toán QR Code\', đóng góp vào việc fix bug và cập nhật thư viện thanh toán, đồng thời hỗ trợ đồng đội thông qua review code. Dù một số hạng mục như \'Module Báo cáo Doanh thu\' và backend API chưa hoàn thành 100%, việc chủ động xử lý lỗi API từ đối tác và lập kế hoạch rõ ràng cho ngày mai cho thấy khả năng tổ chức và giải quyết vấn đề tốt. Hiệu suất tổng thể rất cao, tuy nhiên có thể đạt mức hoàn hảo nếu các hạng mục còn lại được đẩy nhanh tiến độ.', 'A', '2025-05-31 10:31:58', 92, 125, NULL),
(15, 81, 'Phạm Minh Thư đã thể hiện hiệu suất làm việc rất tốt với tiến độ rõ ràng và chất lượng đầu ra cao trên nhiều dự án quan trọng. Các nhiệm vụ được quản lý hợp lý và báo cáo đầy đủ, bao gồm việc hoàn thành công việc đúng hạn và đưa ra các đề xuất cải tiến phù hợp. Tuy nhiên, một số hạng mục vẫn đang chờ phản hồi và duyệt, nên cần theo sát để đảm bảo tiến độ cuối cùng. Điểm đáng khen là sự chủ động đề xuất ý tưởng nâng cao chất lượng công việc.', 'A', '2025-05-31 10:32:14', 92, 124, NULL),
(16, 82, 'Hoàng Việt Trung đã thực hiện tốt các hoạt động kinh doanh với một số điểm nổi bật như tìm kiếm được 7 leads mới từ nhiều nguồn khác nhau, tổ chức 2 buổi demo sản phẩm và chốt 1 hợp đồng trị giá 80.000.000 VNĐ. Anh đã chủ động trong việc lập kế hoạch tiếp cận khách hàng và phản hồi lại các thách thức từ thị trường. Tuy nhiên, tỷ lệ chuyển đổi từ báo giá thành hợp đồng còn thấp (1/5), và cần phối hợp tích cực hơn với các phòng ban để cải thiện hiệu quả công việc.', 'B', '2025-05-31 10:33:05', 85, 121, NULL),
(17, 77, 'Nguyễn Thị Bích đã thể hiện một ngày làm việc rất năng suất và hiệu quả. Các nhiệm vụ được hoàn thành đúng tiến độ, chất lượng cao và có sự chú ý đến chi tiết. Cô ấy cũng chủ động hỗ trợ các thành viên khác trong team và đề xuất cải tiến hợp lý. Điểm trừ nhỏ là một số công việc cần tiếp tục vào ngày mai, nhưng điều này không ảnh hưởng lớn đến hiệu suất tổng thể.', 'A', '2025-05-31 22:07:19', 95, 1235, 'Khóa học về \'Kỹ năng thiết kế UI/UX nâng cao\' để cải thiện khả năng tối ưu hóa giao diện và trải nghiệm người dùng, đặc biệt là cho các dự án website.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `employee_id`, `from_date`, `to_date`, `reason`, `status`, `created_at`) VALUES
(1, 78, '2025-06-23', '2025-06-27', 'ốm', 'approved', '2025-06-23 03:36:57'),
(2, 78, '2025-06-27', '2025-06-30', 'hehe', 'pending', '2025-06-23 09:49:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(18, 14, 'Báo cáo Công việc Hàng ngày - Nhân viên IT\nNgày: 29 tháng 5 năm 2025\nHọ và Tên: [Tên của bạn]\nBộ phận: Công nghệ Thông tin (IT)\n\n1. Hỗ trợ Người dùng & Xử lý Sự cố (Tickets/Requests):\n\nĐã đóng (Resolved):\n[TICKET-ID 123] - Hỗ trợ User [Tên User A], [Phòng Ban A]: Khắc phục sự cố không thể kết nối máy in mạng.\n[TICKET-ID 124] - Hỗ trợ User [Tên User B], [Phòng Ban B]: Cài đặt phần mềm [Tên phần mềm] và cấu hình cơ bản.\n[TICKET-ID 125] - Hỗ trợ User [Tên User C], [Phòng Ban C]: Reset mật khẩu tài khoản Windows.\nHỗ trợ trực tiếp 3 trường hợp: Lỗi kết nối Wifi, máy tính chạy chậm, hướng dẫn sử dụng Outlook.\nĐang xử lý (In Progress):\n[TICKET-ID 126] - User [Tên User D]: Điều tra nguyên nhân lỗi màn hình xanh (BSOD) - Đang chờ phản hồi từ người dùng sau khi áp dụng bản vá.\nYêu cầu nâng cấp RAM cho máy tính [Phòng Ban E] - Đã gửi yêu cầu báo giá.\n2. Công việc Dự án:\n\nDự án [Tên Dự án 1 - Ví dụ: Nâng cấp Hệ thống Mạng Wifi]:\nHoàn thành khảo sát thực địa tại khu vực [Tên khu vực].\nLên sơ đồ vị trí lắp đặt Access Point mới.\nPhối hợp với nhà cung cấp về thông số kỹ thuật thiết bị.\nDự án [Tên Dự án 2 - Ví dụ: Triển khai Phần mềm Quản lý Tài sản]:\nTham gia họp với bộ phận Kế toán để thu thập yêu cầu chi tiết.\nKiểm tra khả năng tương thích của phần mềm với hạ tầng hiện tại.\n3. Bảo trì & Giám sát Hệ thống:\n\nKiểm tra tình trạng hoạt động của máy chủ [Tên Máy chủ]: CPU, RAM, Dung lượng đĩa - Mọi chỉ số đều trong ngưỡng bình thường.\nGiám sát hệ thống sao lưu (Backup): Xác nhận các tác vụ sao lưu đêm qua đã hoàn thành thành công.\nKiểm tra logs hệ thống Firewall: Không phát hiện hoạt động bất thường.\n4. Cuộc họp & Đào tạo:\n\nTham gia cuộc họp nhanh với Team IT (10:00 - 10:30): Cập nhật tiến độ công việc và phân chia nhiệm vụ.\n5. Kế hoạch cho ngày mai (30/05/2025):\n\nTiếp tục xử lý các ticket còn tồn đọng.\nTriển khai lắp đặt Access Point tại [Tên khu vực] (Nếu thiết bị về kịp).\nViết tài liệu hướng dẫn sử dụng cơ bản cho [Phần mềm Quản lý Tài sản].\nThực hiện bảo trì định kỳ máy chủ [Tên Máy chủ khác].\nRà soát lại chính sách bảo mật cho người dùng cuối.\n6. Vấn đề & Trở ngại (Nếu có):\n\nMột số người dùng báo cáo kết nối VPN chập chờn vào buổi sáng. Đã kiểm tra server VPN nhưng chưa phát hiện nguyên nhân rõ ràng, cần tiếp tục theo dõi.\nThiết bị Access Point cho dự án Nâng cấp Wifi có thể về trễ hơn dự kiến.', '2025-05-29'),
(19, 14, 'Báo cáo Công việc Hàng ngày - Nhân viên IT\nNgày: 29 tháng 5 năm 2025\nHọ và Tên: [Tên của bạn]\nBộ phận: Công nghệ Thông tin (IT)\n\n1. Hỗ trợ Người dùng & Xử lý Sự cố (Tickets/Requests):\n\nĐã đóng (Resolved):\n[TICKET-ID 123] - Hỗ trợ User [Tên User A], [Phòng Ban A]: Khắc phục sự cố không thể kết nối máy in mạng.\n[TICKET-ID 124] - Hỗ trợ User [Tên User B], [Phòng Ban B]: Cài đặt phần mềm [Tên phần mềm] và cấu hình cơ bản.\n[TICKET-ID 125] - Hỗ trợ User [Tên User C], [Phòng Ban C]: Reset mật khẩu tài khoản Windows.\nHỗ trợ trực tiếp 3 trường hợp: Lỗi kết nối Wifi, máy tính chạy chậm, hướng dẫn sử dụng Outlook.\nĐang xử lý (In Progress):\n[TICKET-ID 126] - User [Tên User D]: Điều tra nguyên nhân lỗi màn hình xanh (BSOD) - Đang chờ phản hồi từ người dùng sau khi áp dụng bản vá.\nYêu cầu nâng cấp RAM cho máy tính [Phòng Ban E] - Đã gửi yêu cầu báo giá.\n2. Công việc Dự án:\n\nDự án [Tên Dự án 1 - Ví dụ: Nâng cấp Hệ thống Mạng Wifi]:\nHoàn thành khảo sát thực địa tại khu vực [Tên khu vực].\nLên sơ đồ vị trí lắp đặt Access Point mới.\nPhối hợp với nhà cung cấp về thông số kỹ thuật thiết bị.\nDự án [Tên Dự án 2 - Ví dụ: Triển khai Phần mềm Quản lý Tài sản]:\nTham gia họp với bộ phận Kế toán để thu thập yêu cầu chi tiết.\nKiểm tra khả năng tương thích của phần mềm với hạ tầng hiện tại.\n3. Bảo trì & Giám sát Hệ thống:\n\nKiểm tra tình trạng hoạt động của máy chủ [Tên Máy chủ]: CPU, RAM, Dung lượng đĩa - Mọi chỉ số đều trong ngưỡng bình thường.\nGiám sát hệ thống sao lưu (Backup): Xác nhận các tác vụ sao lưu đêm qua đã hoàn thành thành công.\nKiểm tra logs hệ thống Firewall: Không phát hiện hoạt động bất thường.\n4. Cuộc họp & Đào tạo:\n\nTham gia cuộc họp nhanh với Team IT (10:00 - 10:30): Cập nhật tiến độ công việc và phân chia nhiệm vụ.\n5. Kế hoạch cho ngày mai (30/05/2025):\n\nTiếp tục xử lý các ticket còn tồn đọng.\nTriển khai lắp đặt Access Point tại [Tên khu vực] (Nếu thiết bị về kịp).\nViết tài liệu hướng dẫn sử dụng cơ bản cho [Phần mềm Quản lý Tài sản].\nThực hiện bảo trì định kỳ máy chủ [Tên Máy chủ khác].\nRà soát lại chính sách bảo mật cho người dùng cuối.\n6. Vấn đề & Trở ngại (Nếu có):\n\nMột số người dùng báo cáo kết nối VPN chập chờn vào buổi sáng. Đã kiểm tra server VPN nhưng chưa phát hiện nguyên nhân rõ ràng, cần tiếp tục theo dõi.\nThiết bị Access Point cho dự án Nâng cấp Wifi có thể về trễ hơn dự kiến.', '2025-05-29'),
(20, 1, 'Test report', '2025-05-29'),
(21, 14, 'Báo cáo Công việc Hàng ngày - Nhân viên IT\nNgày: 29 tháng 5 năm 2025\nHọ và Tên: [Tên của bạn]\nBộ phận: Công nghệ Thông tin (IT)\n\n1. Hỗ trợ Người dùng & Xử lý Sự cố (Tickets/Requests):\n\nĐã đóng (Resolved):\n[TICKET-ID 123] - Hỗ trợ User [Tên User A], [Phòng Ban A]: Khắc phục sự cố không thể kết nối máy in mạng.\n[TICKET-ID 124] - Hỗ trợ User [Tên User B], [Phòng Ban B]: Cài đặt phần mềm [Tên phần mềm] và cấu hình cơ bản.\n[TICKET-ID 125] - Hỗ trợ User [Tên User C], [Phòng Ban C]: Reset mật khẩu tài khoản Windows.\nHỗ trợ trực tiếp 3 trường hợp: Lỗi kết nối Wifi, máy tính chạy chậm, hướng dẫn sử dụng Outlook.\nĐang xử lý (In Progress):\n[TICKET-ID 126] - User [Tên User D]: Điều tra nguyên nhân lỗi màn hình xanh (BSOD) - Đang chờ phản hồi từ người dùng sau khi áp dụng bản vá.\nYêu cầu nâng cấp RAM cho máy tính [Phòng Ban E] - Đã gửi yêu cầu báo giá.\n2. Công việc Dự án:\n\nDự án [Tên Dự án 1 - Ví dụ: Nâng cấp Hệ thống Mạng Wifi]:\nHoàn thành khảo sát thực địa tại khu vực [Tên khu vực].\nLên sơ đồ vị trí lắp đặt Access Point mới.\nPhối hợp với nhà cung cấp về thông số kỹ thuật thiết bị.\nDự án [Tên Dự án 2 - Ví dụ: Triển khai Phần mềm Quản lý Tài sản]:\nTham gia họp với bộ phận Kế toán để thu thập yêu cầu chi tiết.\nKiểm tra khả năng tương thích của phần mềm với hạ tầng hiện tại.\n3. Bảo trì & Giám sát Hệ thống:\n\nKiểm tra tình trạng hoạt động của máy chủ [Tên Máy chủ]: CPU, RAM, Dung lượng đĩa - Mọi chỉ số đều trong ngưỡng bình thường.\nGiám sát hệ thống sao lưu (Backup): Xác nhận các tác vụ sao lưu đêm qua đã hoàn thành thành công.\nKiểm tra logs hệ thống Firewall: Không phát hiện hoạt động bất thường.\n4. Cuộc họp & Đào tạo:\n\nTham gia cuộc họp nhanh với Team IT (10:00 - 10:30): Cập nhật tiến độ công việc và phân chia nhiệm vụ.\n5. Kế hoạch cho ngày mai (30/05/2025):\n\nTiếp tục xử lý các ticket còn tồn đọng.\nTriển khai lắp đặt Access Point tại [Tên khu vực] (Nếu thiết bị về kịp).\nViết tài liệu hướng dẫn sử dụng cơ bản cho [Phần mềm Quản lý Tài sản].\nThực hiện bảo trì định kỳ máy chủ [Tên Máy chủ khác].\nRà soát lại chính sách bảo mật cho người dùng cuối.\n6. Vấn đề & Trở ngại (Nếu có):\n\nMột số người dùng báo cáo kết nối VPN chập chờn vào buổi sáng. Đã kiểm tra server VPN nhưng chưa phát hiện nguyên nhân rõ ràng, cần tiếp tục theo dõi.\nThiết bị Access Point cho dự án Nâng cấp Wifi có thể về trễ hơn dự kiến.', '2025-05-29'),
(22, 1, 'BÁO CÁO CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Nguyễn Văn A\nChức vụ: Nhân viên Thiết kế (Designer)\nNgày gửi: 29/05/2025\n\nKính gửi: [Tên Trưởng phòng/Quản lý],\n\nEm xin gửi đến Anh/Chị bản báo cáo tổng kết các hoạt động và kết quả công việc của em trong tháng 5/2025 vừa qua.\n\n1. Tóm tắt công việc:\n\nTrong tháng 5, em đã tập trung hoàn thành các ấn phẩm cho chiến dịch [Tên chiến dịch chính, ví dụ: \"Chào hè 2025\"] và hỗ trợ các yêu cầu thiết kế phát sinh từ phòng Marketing và phòng Kinh doanh. Nhìn chung, các công việc đều được hoàn thành đúng tiến độ và nhận được phản hồi tích cực.\n\n2. Các dự án/công việc đã hoàn thành:\n\nChiến dịch [Tên chiến dịch 1]:\nHoàn thành bộ ấn phẩm quảng cáo online bao gồm: 10 banners cho Facebook Ads, 5 ảnh bìa cho các nền tảng mạng xã hội.\nThiết kế 01 standee và 02 poster quảng cáo cho sự kiện [Tên sự kiện].\nHỗ trợ phòng Marketing:\nThiết kế 03 infographic cho các bài blog trên website.\nChỉnh sửa layout cho 02 email marketing.\nHỗ trợ phòng Kinh doanh:\nCập nhật và thiết kế lại 01 catalogue sản phẩm.\nThiết kế 01 file presentation (bản trình bày) cho buổi gặp gỡ khách hàng quan trọng.\n3. Các công việc đang thực hiện:\n\nNghiên cứu và lên ý tưởng cho bộ nhận diện thương hiệu của dự án [Tên dự án mới].\nThiết kế giao diện (UI) cho ứng dụng di động [Tên ứng dụng] - đang ở giai đoạn wireframe.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện và bàn giao bộ nhận diện thương hiệu cho dự án [Tên dự án mới].\nTập trung thiết kế giao diện chi tiết (UI) và trải nghiệm người dùng (UX) cho ứng dụng [Tên ứng dụng].\nHỗ trợ thiết kế các ấn phẩm cho chiến dịch [Tên chiến dịch tháng 6].\nNâng cao kỹ năng: Tham gia khóa học ngắn hạn về [Tên kỹ năng, ví dụ: \"Motion Graphics\"].\n5. Khó khăn và đề xuất:\n\nKhó khăn: Đôi khi gặp tình trạng quá tải do có nhiều yêu cầu thiết kế đột xuất từ các phòng ban khác nhau, ảnh hưởng đến tiến độ của các dự án chính.\nĐề xuất: Mong muốn phòng ban có thể tổng hợp các yêu cầu thiết kế và gửi theo đợt (ví dụ: 2 lần/tuần) để em có thể sắp xếp và ưu tiên công việc hiệu quả hơn.\nEm xin chân thành cảm ơn sự hỗ trợ của Anh/Chị và các đồng nghiệp trong suốt tháng vừa qua.\n\nTrân trọng,\n\nNguyễn Văn A', '2025-05-29'),
(23, 1, 'BÁO CÁO CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Nguyễn Văn A\nChức vụ: Nhân viên Thiết kế (Designer)\nNgày gửi: 29/05/2025\n\nKính gửi: [Tên Trưởng phòng/Quản lý],\n\nEm xin gửi đến Anh/Chị bản báo cáo tổng kết các hoạt động và kết quả công việc của em trong tháng 5/2025 vừa qua.\n\n1. Tóm tắt công việc:\n\nTrong tháng 5, em đã tập trung hoàn thành các ấn phẩm cho chiến dịch [Tên chiến dịch chính, ví dụ: \"Chào hè 2025\"] và hỗ trợ các yêu cầu thiết kế phát sinh từ phòng Marketing và phòng Kinh doanh. Nhìn chung, các công việc đều được hoàn thành đúng tiến độ và nhận được phản hồi tích cực.\n\n2. Các dự án/công việc đã hoàn thành:\n\nChiến dịch [Tên chiến dịch 1]:\nHoàn thành bộ ấn phẩm quảng cáo online bao gồm: 10 banners cho Facebook Ads, 5 ảnh bìa cho các nền tảng mạng xã hội.\nThiết kế 01 standee và 02 poster quảng cáo cho sự kiện [Tên sự kiện].\nHỗ trợ phòng Marketing:\nThiết kế 03 infographic cho các bài blog trên website.\nChỉnh sửa layout cho 02 email marketing.\nHỗ trợ phòng Kinh doanh:\nCập nhật và thiết kế lại 01 catalogue sản phẩm.\nThiết kế 01 file presentation (bản trình bày) cho buổi gặp gỡ khách hàng quan trọng.\n3. Các công việc đang thực hiện:\n\nNghiên cứu và lên ý tưởng cho bộ nhận diện thương hiệu của dự án [Tên dự án mới].\nThiết kế giao diện (UI) cho ứng dụng di động [Tên ứng dụng] - đang ở giai đoạn wireframe.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện và bàn giao bộ nhận diện thương hiệu cho dự án [Tên dự án mới].\nTập trung thiết kế giao diện chi tiết (UI) và trải nghiệm người dùng (UX) cho ứng dụng [Tên ứng dụng].\nHỗ trợ thiết kế các ấn phẩm cho chiến dịch [Tên chiến dịch tháng 6].\nNâng cao kỹ năng: Tham gia khóa học ngắn hạn về [Tên kỹ năng, ví dụ: \"Motion Graphics\"].\n5. Khó khăn và đề xuất:\n\nKhó khăn: Đôi khi gặp tình trạng quá tải do có nhiều yêu cầu thiết kế đột xuất từ các phòng ban khác nhau, ảnh hưởng đến tiến độ của các dự án chính.\nĐề xuất: Mong muốn phòng ban có thể tổng hợp các yêu cầu thiết kế và gửi theo đợt (ví dụ: 2 lần/tuần) để em có thể sắp xếp và ưu tiên công việc hiệu quả hơn.\nEm xin chân thành cảm ơn sự hỗ trợ của Anh/Chị và các đồng nghiệp trong suốt tháng vừa qua.\n\nTrân trọng,\n\nNguyễn Văn A', '2025-05-29'),
(24, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(25, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(26, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B\n', '2025-05-29'),
(27, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(28, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(29, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(30, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(31, 1, 'BÁO CÁO HIỆU SUẤT CÔNG VIỆC THÁNG 5/2025\nNgười gửi: Trần Thị B\nChức vụ: UI/UX Designer\nNgày gửi: 29/05/2025\n\nKính gửi: Anh [Tên Quản lý sản phẩm/Trưởng nhóm],\n\nEm xin gửi bản báo cáo tổng kết công việc em đã thực hiện trong tháng 5/2025.\n\n1. Tóm tắt nổi bật:\n\nTháng này, em đã hoàn thành giai đoạn nghiên cứu và wireframe cho dự án làm mới website công ty, đồng thời xây dựng các tài nguyên giúp chuẩn hóa hình ảnh thương hiệu trong nội bộ. Các mục tiêu đề ra cho tháng 5 về cơ bản đã được hoàn thành.\n\n2. Các công việc đã hoàn thành:\n\nDự án Redesign Website:\n\nHoàn thành phỏng vấn 5 người dùng để thu thập insight và xác định các \"điểm đau\" (pain points).\nXây dựng 2 hồ sơ người dùng (user personas) và bản đồ hành trình khách hàng (customer journey map).\nHoàn thiện và trình bày wireframe chi tiết cho 5 trang chính (Trang chủ, Giới thiệu, Sản phẩm, Liên hệ, Blog). Đã nhận được góp ý và sẵn sàng cho giai đoạn thiết kế giao diện (UI).\nXây dựng thương hiệu nội bộ:\n\nThiết kế bộ 3 mẫu (template) trình bày Powerpoint/Google Slides theo nhận diện thương hiệu mới của công ty.\nTạo và hướng dẫn cài đặt mẫu chữ ký email mới cho toàn thể nhân viên.\nHỗ trợ khác:\n\nThiết kế bộ icon mới cho tính năng [Tên tính năng] trên ứng dụng di động.\n3. Các công việc đang tiến hành:\n\nThiết kế Giao diện (UI) cho Website: Đang bắt đầu quá trình thiết kế giao diện chi tiết (high-fidelity mockup) dựa trên wireframe đã được duyệt.\nXây dựng Design System (Hệ thống thiết kế): Bắt đầu xây dựng các thành phần cơ bản (nút bấm, màu sắc, font chữ) để đảm bảo tính nhất quán.\n4. Kế hoạch công việc tháng 6/2025:\n\nHoàn thiện toàn bộ bản thiết kế UI (mockup) cho dự án website.\nChuẩn bị tài liệu và làm việc chặt chẽ với đội ngũ lập trình (development team) để bàn giao thiết kế.\nTiếp tục phát triển và hoàn thiện các thành phần trong Design System.\nDành thời gian nghiên cứu và phân tích đối thủ cho dự án [Tên dự án tiếp theo].\n5. Thách thức và Đề xuất:\n\nThách thức: Quá trình nhận phản hồi cho wireframe bị phân mảnh qua nhiều kênh (email, chat, trao đổi miệng), gây khó khăn trong việc tổng hợp và theo dõi các thay đổi.\nĐề xuất: Em đề nghị trong các vòng duyệt thiết kế tiếp theo, chúng ta có thể tập trung sử dụng công cụ chuyên dụng như Figma (phần comment) hoặc một nền tảng chung để mọi góp ý được ghi nhận một cách có hệ thống, minh bạch và dễ theo dõi.\nEm rất mong nhận được sự chỉ đạo từ Anh cho các kế hoạch sắp tới.\n\nXin chân thành cảm ơn,\n\nTrần Thị B', '2025-05-29'),
(32, 1, 'Chắc chắn rồi! Dưới đây là một mẫu báo cáo tháng thứ ba, lần này sẽ tập trung vào một nhân viên thiết kế đồ họa chủ yếu làm việc với các ấn phẩm cho mạng xã hội và một số công việc in ấn, đồng thời đối mặt với các yêu cầu nhanh.\n\nBÁO CÁO TIẾN ĐỘ CÔNG VIỆC – THÁNG 5/2025\nNgười gửi: Lê Minh Khoa\nChức vụ: Chuyên viên Thiết kế Đồ họa\nNgày gửi: 29/05/2025\n\nKính gửi: Chị [Tên Trưởng nhóm Marketing/Quản lý trực tiếp],\n\nEm xin phép gửi đến Chị bản cập nhật về các công việc thiết kế em đã đảm nhận và hoàn thành trong tháng 5/2025.\n\n1. Tổng quan công việc:\n\nTrong tháng 5, các hoạt động thiết kế chính của em tập trung vào việc sản xuất nội dung hình ảnh cho các kênh mạng xã hội nhằm tăng tương tác và hỗ trợ chiến dịch [Tên chiến dịch nổi bật, ví dụ: \"Tri ân Khách hàng\"], song song đó là hoàn thiện các tài liệu in ấn cần thiết. Em đã cố gắng đáp ứng các yêu cầu và duy trì chất lượng thiết kế.\n\n2. Các hạng mục công việc đã hoàn thành:\n\nThiết kế cho Mạng xã hội:\n\nThực hiện trọn bộ hình ảnh (20+ visuals) cho chiến dịch [Tên chiến dịch, ví dụ: \"Chào Hè Rực Rỡ\"] trên Facebook và Instagram, bao gồm ảnh tĩnh, ảnh bìa sự kiện, và 3 ảnh GIF ngắn.\nThiết kế 5 mẫu story (câu chuyện) tương tác cho Instagram (poll, Q&A) nhằm tăng lượt tham gia của người dùng.\nHỗ trợ thiết kế nhanh các hình ảnh quảng cáo theo yêu cầu phát sinh cho các bài đăng hàng ngày.\nThiết kế In ấn:\n\nHoàn thành thiết kế 2 mẫu flyer quảng cáo cho sự kiện [Tên sự kiện/Hội thảo] sắp tới.\nĐiều chỉnh và gửi in 100 namecard cho nhân viên mới.\nThiết kế 01 standee cho chương trình khuyến mãi tại cửa hàng.\nHỗ trợ nội bộ:\n\nThiết kế 01 banner cho thông báo nội bộ trên nền tảng Workplace.\n3. Các công việc đang triển khai:\n\nLên ý tưởng và phác thảo ban đầu cho bộ nhận diện hình ảnh của chiến dịch [Tên chiến dịch tháng 6].\nNghiên cứu các xu hướng thiết kế mới trên TikTok để áp dụng cho các video ngắn sắp tới.\n4. Kế hoạch dự kiến cho tháng 6/2025:\n\nHoàn thiện và triển khai toàn bộ các ấn phẩm visual cho chiến dịch [Tên chiến dịch tháng 6] trên các kênh social.\nThiết kế và bàn giao các ấn phẩm cho sự kiện [Tên sự kiện tháng 6 nếu có].\nDành thời gian thử nghiệm và tạo các video/animation ngắn cho kênh TikTok và Instagram Reels.\nTham gia buổi training nội bộ về [Tên công cụ/Kỹ năng mới].\n5. Khó khăn và kiến nghị:\n\nKhó khăn:\nViệc nhận nhiều yêu cầu thiết kế nhỏ lẻ, gấp gáp cho social media đôi khi làm gián đoạn luồng công việc chính và khó đảm bảo thời gian trau chuốt cho từng sản phẩm.\nMột số yêu cầu chỉnh sửa có nhiều vòng lặp nhỏ, tốn thời gian.\nKiến nghị:\nMong bộ phận có thể cân nhắc việc gom các yêu cầu nhỏ và gửi theo một khung giờ cố định trong ngày/tuần để em có thể tối ưu hóa quy trình làm việc.\nĐề xuất có một buổi họp ngắn hàng tuần để thống nhất về brief và định hướng cho các thiết kế quan trọng, giúp giảm thiểu số lần chỉnh sửa.\nEm luôn sẵn sàng tiếp thu ý kiến và nỗ lực để cải thiện hiệu suất công việc. Xin cảm ơn sự hỗ trợ từ Chị và đội nhóm.\n\nTrân trọng,\n\nLê Minh Khoa', '2025-05-29'),
(33, 14, 'Chắc chắn rồi! Dưới đây là một mẫu báo cáo tháng thứ ba, lần này sẽ tập trung vào một nhân viên thiết kế đồ họa chủ yếu làm việc với các ấn phẩm cho mạng xã hội và một số công việc in ấn, đồng thời đối mặt với các yêu cầu nhanh.\n\nBÁO CÁO TIẾN ĐỘ CÔNG VIỆC – THÁNG 5/2025\nNgười gửi: Lê Minh Khoa\nChức vụ: Chuyên viên Thiết kế Đồ họa\nNgày gửi: 29/05/2025\n\nKính gửi: Chị [Tên Trưởng nhóm Marketing/Quản lý trực tiếp],\n\nEm xin phép gửi đến Chị bản cập nhật về các công việc thiết kế em đã đảm nhận và hoàn thành trong tháng 5/2025.\n\n1. Tổng quan công việc:\n\nTrong tháng 5, các hoạt động thiết kế chính của em tập trung vào việc sản xuất nội dung hình ảnh cho các kênh mạng xã hội nhằm tăng tương tác và hỗ trợ chiến dịch [Tên chiến dịch nổi bật, ví dụ: \"Tri ân Khách hàng\"], song song đó là hoàn thiện các tài liệu in ấn cần thiết. Em đã cố gắng đáp ứng các yêu cầu và duy trì chất lượng thiết kế.\n\n2. Các hạng mục công việc đã hoàn thành:\n\nThiết kế cho Mạng xã hội:\n\nThực hiện trọn bộ hình ảnh (20+ visuals) cho chiến dịch [Tên chiến dịch, ví dụ: \"Chào Hè Rực Rỡ\"] trên Facebook và Instagram, bao gồm ảnh tĩnh, ảnh bìa sự kiện, và 3 ảnh GIF ngắn.\nThiết kế 5 mẫu story (câu chuyện) tương tác cho Instagram (poll, Q&A) nhằm tăng lượt tham gia của người dùng.\nHỗ trợ thiết kế nhanh các hình ảnh quảng cáo theo yêu cầu phát sinh cho các bài đăng hàng ngày.\nThiết kế In ấn:\n\nHoàn thành thiết kế 2 mẫu flyer quảng cáo cho sự kiện [Tên sự kiện/Hội thảo] sắp tới.\nĐiều chỉnh và gửi in 100 namecard cho nhân viên mới.\nThiết kế 01 standee cho chương trình khuyến mãi tại cửa hàng.\nHỗ trợ nội bộ:\n\nThiết kế 01 banner cho thông báo nội bộ trên nền tảng Workplace.\n3. Các công việc đang triển khai:\n\nLên ý tưởng và phác thảo ban đầu cho bộ nhận diện hình ảnh của chiến dịch [Tên chiến dịch tháng 6].\nNghiên cứu các xu hướng thiết kế mới trên TikTok để áp dụng cho các video ngắn sắp tới.\n4. Kế hoạch dự kiến cho tháng 6/2025:\n\nHoàn thiện và triển khai toàn bộ các ấn phẩm visual cho chiến dịch [Tên chiến dịch tháng 6] trên các kênh social.\nThiết kế và bàn giao các ấn phẩm cho sự kiện [Tên sự kiện tháng 6 nếu có].\nDành thời gian thử nghiệm và tạo các video/animation ngắn cho kênh TikTok và Instagram Reels.\nTham gia buổi training nội bộ về [Tên công cụ/Kỹ năng mới].\n5. Khó khăn và kiến nghị:\n\nKhó khăn:\nViệc nhận nhiều yêu cầu thiết kế nhỏ lẻ, gấp gáp cho social media đôi khi làm gián đoạn luồng công việc chính và khó đảm bảo thời gian trau chuốt cho từng sản phẩm.\nMột số yêu cầu chỉnh sửa có nhiều vòng lặp nhỏ, tốn thời gian.\nKiến nghị:\nMong bộ phận có thể cân nhắc việc gom các yêu cầu nhỏ và gửi theo một khung giờ cố định trong ngày/tuần để em có thể tối ưu hóa quy trình làm việc.\nĐề xuất có một buổi họp ngắn hàng tuần để thống nhất về brief và định hướng cho các thiết kế quan trọng, giúp giảm thiểu số lần chỉnh sửa.\nEm luôn sẵn sàng tiếp thu ý kiến và nỗ lực để cải thiện hiệu suất công việc. Xin cảm ơn sự hỗ trợ từ Chị và đội nhóm.\n\nTrân trọng,\n\nLê Minh Khoa', '2025-05-29'),
(34, 14, 'Chắc chắn rồi! Đây là một mẫu báo cáo tháng nữa, lần này tập trung vào một nhân viên thiết kế có vai trò quan trọng trong việc phát triển bộ nhận diện thương hiệu cho sản phẩm mới và tạo ra các tài sản hình ảnh phức tạp cho các chiến dịch lớn.\n\nBÁO CÁO HOẠT ĐỘNG THIẾT KẾ – THÁNG 5/2025\nNgười gửi: Hoàng Yến Nhi\nChức vụ: Chuyên viên Thiết kế Thương hiệu & Hình ảnh\nNgày gửi: 29/05/2025\n\nKính gửi: Anh/Chị [Tên Quản lý Thương hiệu/Trưởng phòng Sáng tạo],\n\nEm xin gửi đến Anh/Chị bản báo cáo chi tiết về các dự án thiết kế và kết quả công việc em đã thực hiện trong tháng 5/2025.\n\n1. Điểm chính của tháng:\n\nTháng 5 là giai đoạn then chốt trong việc xây dựng nền tảng nhận diện thương hiệu cho sản phẩm [Tên Sản Phẩm Mới], đồng thời em cũng đã hoàn thành các hạng mục hình ảnh quan trọng cho chiến dịch [Tên Chiến Dịch Lớn sắp tới]. Nhìn chung, các mục tiêu đề ra đã được đáp ứng với chất lượng tốt.\n\n2. Các công việc/dự án đã hoàn thành:\n\nPhát triển Thương hiệu cho [Tên Sản Phẩm Mới]:\n\nHoàn thiện và chốt 03 phương án logo cuối cùng cùng bảng màu chủ đạo sau các vòng phản hồi.\nXây dựng tài liệu định hướng thương hiệu cơ bản (mood board, quy tắc sử dụng typography, các ứng dụng logo cơ bản).\nTạo các bản mô phỏng (mockup) ứng dụng branding trên các điểm chạm số chính (ví dụ: banner website, ảnh đại diện mạng xã hội).\nChiến dịch [Tên Chiến Dịch Lớn]:\n\nThiết kế hình ảnh chủ đạo (key visual) mang tính biểu tượng cho toàn bộ chiến dịch.\nPhát triển bộ 05 banner động (animated banners) cho quảng cáo trực tuyến.\nHoàn thành 01 infographic chi tiết, trực quan hóa lợi ích sản phẩm.\nPhối hợp với Nhà cung cấp:\n\nLàm việc trực tiếp với nhà in để lựa chọn chất liệu giấy, kiểm tra bản in thử (proof) và đảm bảo chất lượng cho lô brochure giới thiệu [Tên Sản Phẩm Mới].\n3. Các công việc đang trong quá trình thực hiện:\n\nPhát triển Thương hiệu cho [Tên Sản Phẩm Mới]:\nĐang thiết kế các tài sản thương hiệu mở rộng (bộ mẫu slide thuyết trình, mẫu bài đăng mạng xã hội, mẫu chữ ký email) dựa trên nhận diện đã duyệt.\nChiến dịch [Tên Chiến Dịch Lớn]:\nThiết kế các tài liệu hỗ trợ như story cho mạng xã hội và một số vật phẩm POSM (Point of Sale Materials) cơ bản.\n4. Kế hoạch công việc dự kiến cho tháng 6/2025:\n\nHoàn thiện và ra mắt bộ tài nguyên thương hiệu đầy đủ cho [Tên Sản Phẩm Mới] trong nội bộ.\nBàn giao toàn bộ các sản phẩm thiết kế cuối cùng cho chiến dịch [Tên Chiến Dịch Lớn].\nBắt đầu lên ý tưởng và phác thảo hình ảnh cho các sáng kiến marketing Quý 3.\nTham gia hội thảo trực tuyến về [Chủ đề liên quan, ví dụ: \"Xu hướng Thiết kế Bao bì Bền vững\" hoặc \"Kỹ thuật Minh họa Nâng cao\"].\n5. Thách thức và Đề xuất:\n\nThách thức:\nViệc cân đối giữa thời gian cần thiết cho công việc đòi hỏi sự tỉ mỉ, lặp lại nhiều lần của phát triển thương hiệu mới với các yêu cầu có tiến độ nhanh hơn của các chiến dịch hiện tại.\nThu thập phản hồi thống nhất từ nhiều bên liên quan cho các yếu tố branding đôi khi còn phân tán.\nĐề xuất:\nEm đề xuất có thể phân bổ những \"khối thời gian tập trung sâu\" (deep work blocks) cố định trong lịch làm việc cho các dự án branding.\nMong muốn xây dựng một quy trình duyệt các yếu tố branding có cấu trúc rõ ràng hơn, ví dụ như chỉ định người duyệt chính cho từng giai đoạn cụ thể để tối ưu hóa luồng phản hồi.\nEm rất mong nhận được những định hướng và hỗ trợ từ Anh/Chị để tiếp tục hoàn thành tốt công việc.\n\nTrân trọng cảm ơn,\n\nHoàng Yến Nhi', '2025-05-29'),
(35, 77, 'BÁO CÁO CÔNG VIỆC NGÀY\nHọ tên: Nguyễn Văn A\nBộ phận: Thiết kế (Design)\nNgày: 30/05/2025\n\n1. Công việc đã thực hiện:\n\nHoàn thiện 3 banner quảng cáo cho chiến dịch \"Mùa Hè Sôi Động\" (kích thước 1080x1920, 1200x628, 1080x1080).\n\nChỉnh sửa giao diện trang chủ theo góp ý từ team marketing (màu sắc và bố cục phần hero).\n\nXuất file thiết kế landing page sang định dạng Figma prototype để gửi cho dev.\n\n2. Kế hoạch ngày mai:\n\nTiếp tục thiết kế giao diện mobile cho landing page.\n\nLàm mockup sản phẩm cho bài đăng fanpage ngày 02/06.\n\nDự họp review UI với team phát triển lúc 15h00.\n\n3. Khó khăn/Ghi chú:\n\nFeedback từ khách hàng chưa rõ ràng, cần làm việc thêm với bên Account để thống nhất yêu cầu.\n\nChờ cung cấp nội dung chính thức từ Content team để hoàn thiện banner Facebook.', '2025-05-30'),
(36, 77, 'BÁO CÁO CÔNG VIỆC NGÀY\nHọ tên: Nguyễn Văn A\nBộ phận: Thiết kế (Design)\nNgày: 30/05/2025\n\n1. Công việc đã thực hiện:\n\nHoàn thiện 3 banner quảng cáo cho chiến dịch \"Mùa Hè Sôi Động\" (kích thước 1080x1920, 1200x628, 1080x1080).\n\nChỉnh sửa giao diện trang chủ theo góp ý từ team marketing (màu sắc và bố cục phần hero).\n\nXuất file thiết kế landing page sang định dạng Figma prototype để gửi cho dev.\n\n2. Kế hoạch ngày mai:\n\nTiếp tục thiết kế giao diện mobile cho landing page.\n\nLàm mockup sản phẩm cho bài đăng fanpage ngày 02/06.\n\nDự họp review UI với team phát triển lúc 15h00.\n\n3. Khó khăn/Ghi chú:\n\nFeedback từ khách hàng chưa rõ ràng, cần làm việc thêm với bên Account để thống nhất yêu cầu.\n\nChờ cung cấp nội dung chính thức từ Content team để hoàn thiện banner Facebook.', '2025-05-30'),
(37, 78, '1. Phòng IT (Công nghệ Thông tin)\n\nBáo cáo ngày: 30/05/2025\nNgười báo cáo: Nguyễn Văn Nam (Chuyên viên IT)\n\nHệ thống & Hạ tầng:\nTình trạng máy chủ:\nServer ứng dụng nội bộ (SRV-APP01): Hoạt động ổn định, 100% uptime.\nServer cơ sở dữ liệu (SRV-DB01): Hoạt động ổn định, tài nguyên CPU sử dụng 65%.\nServer Mail Exchange: Hoạt động bình thường.\nMạng nội bộ & Internet: Kết nối ổn định toàn công ty. Băng thông quốc tế có dấu hiệu chậm vào lúc 10:00 - 10:30 AM, đã tự phục hồi.\nBackup dữ liệu: Hoàn thành backup toàn bộ hệ thống lúc 02:00 AM. Dữ liệu an toàn.\nHỗ trợ người dùng:\nSố lượng yêu cầu hỗ trợ đã giải quyết: 8 ticket (3 liên quan đến MS Outlook, 2 lỗi máy in, 1 quên mật khẩu, 2 cài đặt phần mềm).\nVấn đề nổi bật cần lưu ý: Một số người dùng phòng Kế toán phản ánh phần mềm MISA chạy chậm hơn bình thường. Đang kiểm tra, nghi ngờ do update Windows gần đây.\nCông việc khác:\nTiếp tục triển khai vá lỗi bảo mật cho các máy trạm theo kế hoạch. Đã hoàn thành 75%.\nNghiên cứu giải pháp VPN mới cho nhân viên làm việc từ xa, dự kiến trình bày vào tuần sau.\nVấn đề phát sinh/Cần hỗ trợ:\nCần phòng Mua hàng cung cấp báo giá cho 02 Switch mạng mới để thay thế thiết bị cũ tại chi nhánh Quận 7.', '2025-05-31'),
(38, 79, 'Báo cáo ngày: 30/05/2025\nNgười báo cáo: Trần Lan Anh (Trưởng nhóm Marketing)\n\nChiến dịch đang chạy:\nChiến dịch \"Chào Hè Rực Rỡ\" (Sản phẩm X):\nFacebook Ads: CTR đạt 2.5%, CPC $0.15. Tương tác tốt trên các mẫu quảng cáo video.\nGoogle Ads: Tỷ lệ chuyển đổi landing page đạt 3%. Từ khóa \"mua [Sản phẩm X] hè\" có hiệu suất cao.\nChiến dịch \"Tri Ân Khách Hàng Thân Thiết\" (Email Marketing):\nTỷ lệ mở email: 28%. Tỷ lệ click (CTR): 6%. Đã có 15 khách hàng đăng ký nhận ưu đãi qua link.\nNội dung & Sáng tạo:\nBài viết blog \"5 Mẹo Sử Dụng [Sản phẩm X] Hiệu Quả Hè Này\": Đã đăng tải, lượt xem ban đầu 350.\nVideo ngắn review [Sản phẩm Y] trên TikTok: Đã hoàn thiện kịch bản, dự kiến quay vào Thứ Ba tuần sau.\nThiết kế banner cho chương trình khuyến mãi cuối tuần: Đã gửi yêu cầu cho phòng Design.\nHiệu suất (Số liệu nổi bật):\nLượng tiếp cận Fanpage mới: +850 người.\nTổng tương tác các bài đăng social: 1.200 likes, 150 comments, 80 shares.\nKhách hàng tiềm năng mới (Leads) từ website: 25 leads (10 từ form đăng ký tư vấn, 15 từ chatbox).\nCông việc khác:\nHọp với phòng Sales để thống nhất về chương trình khuyến mãi tháng 6.\nLên kế hoạch nội dung cho tuần 02/06 - 08/06.\nKhó khăn/Đề xuất:\nBài viết về \"Lợi ích [Tính năng Z] của [Sản phẩm X]\" có tỷ lệ tương tác thấp hơn dự kiến. Đề xuất chạy A/B testing tiêu đề và hình ảnh cho bài này.\nCần phòng IT hỗ trợ tích hợp mã tracking mới của Zalo Ads vào website trước Thứ Hai.', '2025-05-31'),
(39, 80, 'Báo cáo ngày: 30/05/2025\nNgười báo cáo: Lê Quang Huy (Tech Lead)\n\nDự án/Tính năng đang phát triển:\nDự án \"Phoenix\" (Nâng cấp hệ thống CRM):\nModule Quản lý Khách hàng: Hoàn thành 90%. Đang thực hiện Unit Test cho các hàm xử lý logic mới.\nModule Báo cáo Doanh thu: Hoàn thành 60%. Đang tích hợp API lấy dữ liệu từ hệ thống kế toán.\nTính năng \"Thanh toán QR Code\" cho Ứng dụng Mobile (App Version 2.5):\nFrontend (UI/UX): Hoàn thành 100%, đã merge vào nhánh develop.\nBackend (API): Hoàn thành 80%, đang tối ưu tốc độ phản hồi.\nCông việc đã hoàn thành hôm nay:\nHoàn thành fix bug #DEV-1275 (Lỗi hiển thị sai thông tin đơn hàng trên trang admin).\nMerge pull request #456 (Cập nhật thư viện thanh toán Stripe).\nReview code cho Junior Developer (Tính năng tìm kiếm sản phẩm).\nKế hoạch cho ngày mai (Thứ Hai):\nTiếp tục Unit Test cho Module Quản lý Khách hàng (Dự án Phoenix).\nBắt đầu Integration Test cho Tính năng \"Thanh toán QR Code\".\nHọp sprint planning cho tuần mới.\nVấn đề kỹ thuật/Trở ngại:\nAPI từ đối tác ABC (cung cấp dữ liệu tỷ giá) đang trả về lỗi 503 không thường xuyên. Đã liên hệ với họ để kiểm tra. Tạm thời sử dụng dữ liệu cache.\nYêu cầu hỗ trợ (nếu có):\nCần phòng Design cung cấp icon mới cho tính năng \"Thông báo\" trên app mobile trước', '2025-05-31'),
(40, 81, 'Báo cáo ngày: 30/05/2025\nNgười báo cáo: Phạm Minh Thư (Senior Designer)\n\nDự án/Yêu cầu thiết kế đang thực hiện:\nBộ nhận diện thương hiệu cho dự án \"Alpha\" (Logo, Brand Guidelines):\nTiến độ: Đã hoàn thành 3 concept logo. Đang chờ feedback từ Ban Giám Đốc.\nGiao diện người dùng (UI) cho website mới của công ty:\nTiến độ: Hoàn thành wireframe trang chủ và trang sản phẩm. Đang lên moodboard màu sắc và typography.\nBanner quảng cáo cho chiến dịch \"Chào Hè Rực Rỡ\" (Yêu cầu từ Marketing):\nTiến độ: Đã có 2 option thiết kế, đang chờ duyệt từ Marketing.\nSản phẩm đã hoàn thành/Gửi duyệt:\nInfographic \"Quy trình làm việc hiệu quả\": Đã gửi cho phòng Nhân sự.\nMockup áo thun đồng phục (3 mẫu): Đã gửi cho Ban Giám Đốc và Trưởng phòng Nhân sự.\nCông việc ưu tiên cho ngày mai (Thứ Hai):\nChỉnh sửa concept logo dự án \"Alpha\" theo feedback (nếu có).\nBắt đầu thiết kế chi tiết UI trang chủ website mới.\nHỗ trợ team Marketing chỉnh sửa banner nếu cần.\nPhản hồi/Yêu cầu chỉnh sửa (nếu có):\nMarketing yêu cầu làm rõ hơn CTA (Call to Action) trên banner \"Chào Hè Rực Rỡ\".\nÝ tưởng/Khó khăn:\nĐề xuất sử dụng hình ảnh stock chất lượng cao hơn cho các ấn phẩm truyền thông sắp tới để tăng tính chuyên nghiệp. Cần xem xét ngân sách.\nFont chữ hiện tại cho các bài đăng social media hơi khó đọc trên mobile. Đề xuất thử nghiệm font mới.', '2025-05-31'),
(41, 82, 'Báo cáo ngày: 30/05/2025\nNgười báo cáo: Hoàng Việt Trung (Nhân viên Kinh doanh)\n\nKhách hàng tiềm năng (Leads):\nSố lượng leads mới: 7 (3 từ website, 2 từ referral, 2 từ cold call).\nNguồn leads nổi bật: Referral từ khách hàng cũ A (Công ty XYZ).\nHoạt động bán hàng:\nSố cuộc gọi/gặp gỡ khách hàng: 15 cuộc gọi, 3 buổi gặp trực tiếp.\nSố báo giá đã gửi: 5 (Tổng giá trị: 350.000.000 VNĐ).\nDemo sản phẩm: 2 buổi demo cho Công ty B và Công ty C.\nHợp đồng/Đơn hàng đã chốt: 1 hợp đồng với Công ty D (Giá trị: 80.000.000 VNĐ).\nPhản hồi từ khách hàng/Thị trường:\nKhách hàng (Công ty B) đánh giá cao tính năng X của sản phẩm nhưng còn băn khoăn về chi phí triển khai ban đầu.\nThị trường đang có xu hướng quan tâm nhiều hơn đến các giải pháp tích hợp AI.\nKế hoạch tiếp cận khách hàng ngày mai (Thứ Hai):\nFollow-up báo giá đã gửi cho Công ty E và F.\nGọi điện cho 5 leads mới nhận được.\nChuẩn bị tài liệu cho buổi gặp gỡ khách hàng tiềm năng G vào Thứ Ba.\nKhó khăn/Cần hỗ trợ từ các phòng ban khác:\nCần phòng Marketing cung cấp thêm case study về ngành F&B để gửi cho khách hàng tiềm năng H.\nCó một số câu hỏi kỹ thuật chuyên sâu từ Công ty C, cần sự hỗ trợ của một chuyên viên kỹ thuật từ phòng Development trong buổi demo tiếp theo (nếu có).', '2025-05-31');
INSERT INTO `reports` (`id`, `employee_id`, `report`, `date`) VALUES
(42, 77, 'Tuyệt vời! Dưới đây là một ví dụ chi tiết về báo cáo công việc hàng ngày của một nhân viên thiết kế, mô phỏng một ngày làm việc cụ thể.\n\nBÁO CÁO CÔNG VIỆC NGÀY 31/05/2025\n\nNgười gửi: Nguyễn Thị Bích (Designer)\nPhòng ban: Sáng tạo\nNgày gửi: 31/05/2025 (Cuối ngày làm việc)\nNgười nhận: Anh Trần Văn Hùng (Trưởng nhóm Thiết kế)\n\nKính gửi Anh Hùng,\n\nEm xin báo cáo chi tiết các công việc đã thực hiện trong ngày hôm nay, 31/05/2025, như sau:\n\nI. CÔNG VIỆC ĐÃ HOÀN THÀNH (TÍNH ĐẾN 17:30):\n\nDự án \"Summer Splash Campaign\" (Chiến dịch quảng bá hè):\n\nThời gian: 9:00 - 11:30\nNội dung:\nHoàn thiện 02 mẫu thiết kế banner quảng cáo Facebook (kích thước 1200x628 px và 1080x1080 px) cho sản phẩm kem chống nắng mới theo feedback từ buổi họp sáng qua với team Marketing.\nChi tiết: Điều chỉnh layout, font chữ, màu sắc chủ đạo sang tông cam vàng rực rỡ hơn. Thay thế hình ảnh người mẫu.\nXuất file PNG và JPG chất lượng cao.\nGửi file thiết kế cho chị Mai (Marketing Executive) qua email và cập nhật trạng thái \"Hoàn thành - Chờ duyệt cuối\" trên Trello.\nKết quả: 02 mẫu banner đã được gửi đi, đang chờ phản hồi cuối cùng.\nDự án \"Website Redesign - Trang Sản Phẩm\" (Thiết kế lại website):\n\nThời gian: 11:30 - 12:30 và 14:00 - 16:00\nNội dung:\nTiếp tục triển khai thiết kế chi tiết giao diện người dùng (UI) cho trang chi tiết sản phẩm trên desktop và mobile.\nChi tiết Desktop: Tập trung vào khu vực hiển thị hình ảnh sản phẩm (gallery, zoom), mô tả chi tiết, thông số kỹ thuật, và các nút kêu gọi hành động (CTA) \"Thêm vào giỏ hàng\", \"Mua ngay\".\nChi tiết Mobile: Tối ưu hóa hiển thị cho màn hình nhỏ, đảm bảo các yếu tố chính dễ nhìn, dễ tương tác.\nTham khảo các trang e-commerce đối thủ để có thêm ý tưởng về bố cục và trải nghiệm người dùng.\nKết quả: Hoàn thành bản phác thảo UI chi tiết cho 02 section chính của trang sản phẩm (Desktop). Bắt đầu dựng wireframe cho phiên bản Mobile.\nHỗ trợ Team Social Media:\n\nThời gian: 16:00 - 17:00\nNội dung:\nThiết kế nhanh 01 ảnh bìa (cover photo) cho sự kiện workshop sắp tới trên fanpage Facebook theo yêu cầu đột xuất từ bạn Minh (Social Media Executive).\nChi tiết: Sử dụng template có sẵn, thay đổi text, hình ảnh diễn giả và thông tin sự kiện.\nKết quả: Ảnh bìa đã được gửi cho bạn Minh và nhận được phản hồi tích cực.\nCông việc hành chính/Khác:\n\nThời gian: 17:00 - 17:30\nNội dung:\nKiểm tra email, trả lời các trao đổi liên quan đến dự án.\nSắp xếp lại file thiết kế trên Google Drive theo đúng folder dự án.\nCập nhật checklist công việc cá nhân.\nKết quả: Hòm thư được xử lý, file được tổ chức gọn gàng.\nII. CÔNG VIỆC CHƯA HOÀN THÀNH/SẼ TIẾP TỤC VÀO NGÀY MAI (01/06/2025):\n\nDự án \"Website Redesign - Trang Sản Phẩm\":\nHoàn thiện wireframe và bắt đầu thiết kế UI chi tiết cho phiên bản Mobile của trang chi tiết sản phẩm.\nNghiên cứu và đề xuất các hiệu ứng chuyển động (micro-interactions) phù hợp cho các nút CTA và gallery hình ảnh.\nDự án \"Brand Guideline Update\" (Cập nhật bộ nhận diện thương hiệu):\nBắt đầu rà soát lại bộ nhận diện thương hiệu hiện tại.\nLên kế hoạch các hạng mục cần cập nhật/bổ sung (ví dụ: quy chuẩn sử dụng logo trên các nền tảng digital mới, mở rộng bảng màu phụ).\nPhản hồi thiết kế (Nếu có):\nTiếp nhận và chỉnh sửa các thiết kế từ dự án \"Summer Splash Campaign\" nếu có phản hồi từ team Marketing.\nIII. KHÓ KHĂN/VƯỚNG MẮC GẶP PHẢI TRONG NGÀY:\n\nViệc tìm kiếm hình ảnh stock chất lượng cao và phù hợp với yêu cầu của banner \"Summer Splash Campaign\" tốn nhiều thời gian hơn dự kiến do ngân sách hình ảnh còn hạn chế. Em đã cố gắng tối ưu bằng cách sử dụng các nguồn miễn phí và chỉnh sửa kỹ lưỡng.\nIV. ĐỀ XUẤT (NẾU CÓ):\n\nEm đề xuất team có thể xem xét đăng ký một gói tài khoản hình ảnh stock trả phí (ví dụ: Shutterstock, Adobe Stock) ở mức cơ bản để tiết kiệm thời gian tìm kiếm và đảm bảo chất lượng hình ảnh đồng đều cho các chiến dịch quan trọng.\nEm đã cập nhật tiến độ chi tiết trên các công cụ quản lý dự án của team.\nRất mong nhận được sự góp ý của anh để công việc ngày mai được tốt hơn.\n\nTrân trọng,\n\nNguyễn Thị Bích\nNhân viên Thiết kế', '2025-05-31');

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
(10907, 48, '2025-06-02', 'night'),
(10908, 52, '2025-06-02', 'night'),
(10909, 56, '2025-06-02', 'night'),
(10910, 59, '2025-06-02', 'morning'),
(10911, 65, '2025-06-02', 'morning'),
(10912, 70, '2025-06-02', 'night'),
(10913, 77, '2025-06-02', 'morning'),
(10914, 78, '2025-06-02', 'night'),
(10915, 1, '2025-06-02', 'morning'),
(10916, 49, '2025-06-02', 'morning'),
(10917, 51, '2025-06-02', 'morning'),
(10918, 57, '2025-06-02', 'morning'),
(10919, 62, '2025-06-02', 'night'),
(10920, 66, '2025-06-02', 'night'),
(10921, 79, '2025-06-02', 'morning'),
(10922, 14, '2025-06-02', 'night'),
(10923, 16, '2025-06-02', 'night'),
(10924, 46, '2025-06-02', 'night'),
(10925, 50, '2025-06-02', 'night'),
(10926, 54, '2025-06-02', 'night'),
(10927, 58, '2025-06-02', 'night'),
(10928, 61, '2025-06-02', 'morning'),
(10929, 67, '2025-06-02', 'morning'),
(10930, 80, '2025-06-02', 'night'),
(10931, 15, '2025-06-02', 'morning'),
(10932, 45, '2025-06-02', 'morning'),
(10933, 53, '2025-06-02', 'morning'),
(10934, 60, '2025-06-02', 'night'),
(10935, 64, '2025-06-02', 'night'),
(10936, 69, '2025-06-02', 'morning'),
(10937, 81, '2025-06-02', 'morning'),
(10938, 47, '2025-06-02', 'morning'),
(10939, 55, '2025-06-02', 'morning'),
(10940, 63, '2025-06-02', 'morning'),
(10941, 68, '2025-06-02', 'night'),
(10942, 82, '2025-06-02', 'night'),
(10943, 83, '2025-06-02', 'morning'),
(10944, 48, '2025-06-03', 'night'),
(10945, 52, '2025-06-03', 'night'),
(10946, 56, '2025-06-03', 'night'),
(10947, 59, '2025-06-03', 'morning'),
(10948, 65, '2025-06-03', 'morning'),
(10949, 70, '2025-06-03', 'night'),
(10950, 77, '2025-06-03', 'morning'),
(10951, 78, '2025-06-03', 'night'),
(10952, 1, '2025-06-03', 'morning'),
(10953, 49, '2025-06-03', 'morning'),
(10954, 51, '2025-06-03', 'morning'),
(10955, 57, '2025-06-03', 'morning'),
(10956, 62, '2025-06-03', 'night'),
(10957, 66, '2025-06-03', 'night'),
(10958, 79, '2025-06-03', 'morning'),
(10959, 14, '2025-06-03', 'night'),
(10960, 16, '2025-06-03', 'night'),
(10961, 46, '2025-06-03', 'night'),
(10962, 50, '2025-06-03', 'night'),
(10963, 54, '2025-06-03', 'night'),
(10964, 58, '2025-06-03', 'night'),
(10965, 61, '2025-06-03', 'morning'),
(10966, 67, '2025-06-03', 'morning'),
(10967, 80, '2025-06-03', 'night'),
(10968, 15, '2025-06-03', 'morning'),
(10969, 45, '2025-06-03', 'morning'),
(10970, 53, '2025-06-03', 'morning'),
(10971, 60, '2025-06-03', 'night'),
(10972, 64, '2025-06-03', 'night'),
(10973, 69, '2025-06-03', 'morning'),
(10974, 81, '2025-06-03', 'morning'),
(10975, 47, '2025-06-03', 'morning'),
(10976, 55, '2025-06-03', 'morning'),
(10977, 63, '2025-06-03', 'morning'),
(10978, 68, '2025-06-03', 'night'),
(10979, 82, '2025-06-03', 'night'),
(10980, 83, '2025-06-03', 'morning'),
(10981, 48, '2025-06-04', 'night'),
(10982, 52, '2025-06-04', 'night'),
(10983, 56, '2025-06-04', 'night'),
(10984, 59, '2025-06-04', 'morning'),
(10985, 65, '2025-06-04', 'morning'),
(10986, 70, '2025-06-04', 'night'),
(10987, 77, '2025-06-04', 'morning'),
(10988, 78, '2025-06-04', 'night'),
(10989, 1, '2025-06-04', 'morning'),
(10990, 49, '2025-06-04', 'morning'),
(10991, 51, '2025-06-04', 'morning'),
(10992, 57, '2025-06-04', 'morning'),
(10993, 62, '2025-06-04', 'night'),
(10994, 66, '2025-06-04', 'night'),
(10995, 79, '2025-06-04', 'morning'),
(10996, 14, '2025-06-04', 'night'),
(10997, 16, '2025-06-04', 'night'),
(10998, 46, '2025-06-04', 'night'),
(10999, 50, '2025-06-04', 'night'),
(11000, 54, '2025-06-04', 'night'),
(11001, 58, '2025-06-04', 'night'),
(11002, 61, '2025-06-04', 'morning'),
(11003, 67, '2025-06-04', 'morning'),
(11004, 80, '2025-06-04', 'night'),
(11005, 15, '2025-06-04', 'morning'),
(11006, 45, '2025-06-04', 'morning'),
(11007, 53, '2025-06-04', 'morning'),
(11008, 60, '2025-06-04', 'night'),
(11009, 64, '2025-06-04', 'night'),
(11010, 69, '2025-06-04', 'morning'),
(11011, 81, '2025-06-04', 'morning'),
(11012, 47, '2025-06-04', 'morning'),
(11013, 55, '2025-06-04', 'morning'),
(11014, 63, '2025-06-04', 'morning'),
(11015, 68, '2025-06-04', 'night'),
(11016, 82, '2025-06-04', 'night'),
(11017, 83, '2025-06-04', 'morning'),
(11018, 48, '2025-06-05', 'night'),
(11019, 52, '2025-06-05', 'night'),
(11020, 56, '2025-06-05', 'night'),
(11021, 59, '2025-06-05', 'morning'),
(11022, 65, '2025-06-05', 'morning'),
(11023, 70, '2025-06-05', 'night'),
(11024, 77, '2025-06-05', 'morning'),
(11025, 78, '2025-06-05', 'night'),
(11026, 1, '2025-06-05', 'morning'),
(11027, 49, '2025-06-05', 'morning'),
(11028, 51, '2025-06-05', 'morning'),
(11029, 57, '2025-06-05', 'morning'),
(11030, 62, '2025-06-05', 'night'),
(11031, 66, '2025-06-05', 'night'),
(11032, 79, '2025-06-05', 'morning'),
(11033, 14, '2025-06-05', 'night'),
(11034, 16, '2025-06-05', 'night'),
(11035, 46, '2025-06-05', 'night'),
(11036, 50, '2025-06-05', 'night'),
(11037, 54, '2025-06-05', 'night'),
(11038, 58, '2025-06-05', 'night'),
(11039, 61, '2025-06-05', 'morning'),
(11040, 67, '2025-06-05', 'morning'),
(11041, 80, '2025-06-05', 'night'),
(11042, 15, '2025-06-05', 'morning'),
(11043, 45, '2025-06-05', 'morning'),
(11044, 53, '2025-06-05', 'morning'),
(11045, 60, '2025-06-05', 'night'),
(11046, 64, '2025-06-05', 'night'),
(11047, 69, '2025-06-05', 'morning'),
(11048, 81, '2025-06-05', 'morning'),
(11049, 47, '2025-06-05', 'morning'),
(11050, 55, '2025-06-05', 'morning'),
(11051, 63, '2025-06-05', 'morning'),
(11052, 68, '2025-06-05', 'night'),
(11053, 82, '2025-06-05', 'night'),
(11054, 83, '2025-06-05', 'morning'),
(11055, 48, '2025-06-06', 'night'),
(11056, 52, '2025-06-06', 'night'),
(11057, 56, '2025-06-06', 'night'),
(11058, 59, '2025-06-06', 'morning'),
(11059, 65, '2025-06-06', 'morning'),
(11060, 70, '2025-06-06', 'night'),
(11061, 77, '2025-06-06', 'morning'),
(11062, 78, '2025-06-06', 'night'),
(11063, 1, '2025-06-06', 'morning'),
(11064, 49, '2025-06-06', 'morning'),
(11065, 51, '2025-06-06', 'morning'),
(11066, 57, '2025-06-06', 'morning'),
(11067, 62, '2025-06-06', 'night'),
(11068, 66, '2025-06-06', 'night'),
(11069, 79, '2025-06-06', 'morning'),
(11070, 14, '2025-06-06', 'night'),
(11071, 16, '2025-06-06', 'night'),
(11072, 46, '2025-06-06', 'night'),
(11073, 50, '2025-06-06', 'night'),
(11074, 54, '2025-06-06', 'night'),
(11075, 58, '2025-06-06', 'night'),
(11076, 61, '2025-06-06', 'morning'),
(11077, 67, '2025-06-06', 'morning'),
(11078, 80, '2025-06-06', 'night'),
(11079, 15, '2025-06-06', 'morning'),
(11080, 45, '2025-06-06', 'morning'),
(11081, 53, '2025-06-06', 'morning'),
(11082, 60, '2025-06-06', 'night'),
(11083, 64, '2025-06-06', 'night'),
(11084, 69, '2025-06-06', 'morning'),
(11085, 81, '2025-06-06', 'morning'),
(11086, 47, '2025-06-06', 'morning'),
(11087, 55, '2025-06-06', 'morning'),
(11088, 63, '2025-06-06', 'morning'),
(11089, 68, '2025-06-06', 'night'),
(11090, 82, '2025-06-06', 'night'),
(11091, 83, '2025-06-06', 'morning'),
(11092, 48, '2025-06-07', 'night'),
(11093, 52, '2025-06-07', 'night'),
(11094, 56, '2025-06-07', 'night'),
(11095, 59, '2025-06-07', 'morning'),
(11096, 65, '2025-06-07', 'morning'),
(11097, 70, '2025-06-07', 'night'),
(11098, 77, '2025-06-07', 'morning'),
(11099, 78, '2025-06-07', 'night'),
(11100, 1, '2025-06-07', 'morning'),
(11101, 49, '2025-06-07', 'morning'),
(11102, 51, '2025-06-07', 'morning'),
(11103, 57, '2025-06-07', 'morning'),
(11104, 62, '2025-06-07', 'night'),
(11105, 66, '2025-06-07', 'night'),
(11106, 79, '2025-06-07', 'morning'),
(11107, 14, '2025-06-07', 'night'),
(11108, 16, '2025-06-07', 'night'),
(11109, 46, '2025-06-07', 'night'),
(11110, 50, '2025-06-07', 'night'),
(11111, 54, '2025-06-07', 'night'),
(11112, 58, '2025-06-07', 'night'),
(11113, 61, '2025-06-07', 'morning'),
(11114, 67, '2025-06-07', 'morning'),
(11115, 80, '2025-06-07', 'night'),
(11116, 15, '2025-06-07', 'morning'),
(11117, 45, '2025-06-07', 'morning'),
(11118, 53, '2025-06-07', 'morning'),
(11119, 60, '2025-06-07', 'night'),
(11120, 64, '2025-06-07', 'night'),
(11121, 69, '2025-06-07', 'morning'),
(11122, 81, '2025-06-07', 'morning'),
(11123, 47, '2025-06-07', 'morning'),
(11124, 55, '2025-06-07', 'morning'),
(11125, 63, '2025-06-07', 'morning'),
(11126, 68, '2025-06-07', 'night'),
(11127, 82, '2025-06-07', 'night'),
(11128, 83, '2025-06-07', 'morning'),
(11129, 48, '2025-06-09', 'morning'),
(11130, 52, '2025-06-09', 'morning'),
(11131, 56, '2025-06-09', 'morning'),
(11132, 59, '2025-06-09', 'night'),
(11133, 65, '2025-06-09', 'night'),
(11134, 70, '2025-06-09', 'morning'),
(11135, 77, '2025-06-09', 'night'),
(11136, 78, '2025-06-09', 'morning'),
(11137, 1, '2025-06-09', 'night'),
(11138, 49, '2025-06-09', 'night'),
(11139, 51, '2025-06-09', 'night'),
(11140, 57, '2025-06-09', 'night'),
(11141, 62, '2025-06-09', 'morning'),
(11142, 66, '2025-06-09', 'morning'),
(11143, 79, '2025-06-09', 'night'),
(11144, 14, '2025-06-09', 'morning'),
(11145, 16, '2025-06-09', 'morning'),
(11146, 46, '2025-06-09', 'morning'),
(11147, 50, '2025-06-09', 'morning'),
(11148, 54, '2025-06-09', 'morning'),
(11149, 58, '2025-06-09', 'morning'),
(11150, 61, '2025-06-09', 'night'),
(11151, 67, '2025-06-09', 'night'),
(11152, 80, '2025-06-09', 'morning'),
(11153, 15, '2025-06-09', 'night'),
(11154, 45, '2025-06-09', 'night'),
(11155, 53, '2025-06-09', 'night'),
(11156, 60, '2025-06-09', 'morning'),
(11157, 64, '2025-06-09', 'morning'),
(11158, 69, '2025-06-09', 'night'),
(11159, 81, '2025-06-09', 'night'),
(11160, 47, '2025-06-09', 'night'),
(11161, 55, '2025-06-09', 'night'),
(11162, 63, '2025-06-09', 'night'),
(11163, 68, '2025-06-09', 'morning'),
(11164, 82, '2025-06-09', 'morning'),
(11165, 83, '2025-06-09', 'night'),
(11166, 48, '2025-06-10', 'morning'),
(11167, 52, '2025-06-10', 'morning'),
(11168, 56, '2025-06-10', 'morning'),
(11169, 59, '2025-06-10', 'night'),
(11170, 65, '2025-06-10', 'night'),
(11171, 70, '2025-06-10', 'morning'),
(11172, 77, '2025-06-10', 'night'),
(11173, 78, '2025-06-10', 'morning'),
(11174, 1, '2025-06-10', 'night'),
(11175, 49, '2025-06-10', 'night'),
(11176, 51, '2025-06-10', 'night'),
(11177, 57, '2025-06-10', 'night'),
(11178, 62, '2025-06-10', 'morning'),
(11179, 66, '2025-06-10', 'morning'),
(11180, 79, '2025-06-10', 'night'),
(11181, 14, '2025-06-10', 'morning'),
(11182, 16, '2025-06-10', 'morning'),
(11183, 46, '2025-06-10', 'morning'),
(11184, 50, '2025-06-10', 'morning'),
(11185, 54, '2025-06-10', 'morning'),
(11186, 58, '2025-06-10', 'morning'),
(11187, 61, '2025-06-10', 'night'),
(11188, 67, '2025-06-10', 'night'),
(11189, 80, '2025-06-10', 'morning'),
(11190, 15, '2025-06-10', 'night'),
(11191, 45, '2025-06-10', 'night'),
(11192, 53, '2025-06-10', 'night'),
(11193, 60, '2025-06-10', 'morning'),
(11194, 64, '2025-06-10', 'morning'),
(11195, 69, '2025-06-10', 'night'),
(11196, 81, '2025-06-10', 'night'),
(11197, 47, '2025-06-10', 'night'),
(11198, 55, '2025-06-10', 'night'),
(11199, 63, '2025-06-10', 'night'),
(11200, 68, '2025-06-10', 'morning'),
(11201, 82, '2025-06-10', 'morning'),
(11202, 83, '2025-06-10', 'night'),
(11203, 48, '2025-06-11', 'morning'),
(11204, 52, '2025-06-11', 'morning'),
(11205, 56, '2025-06-11', 'morning'),
(11206, 59, '2025-06-11', 'night'),
(11207, 65, '2025-06-11', 'night'),
(11208, 70, '2025-06-11', 'morning'),
(11209, 77, '2025-06-11', 'night'),
(11210, 78, '2025-06-11', 'morning'),
(11211, 1, '2025-06-11', 'night'),
(11212, 49, '2025-06-11', 'night'),
(11213, 51, '2025-06-11', 'night'),
(11214, 57, '2025-06-11', 'night'),
(11215, 62, '2025-06-11', 'morning'),
(11216, 66, '2025-06-11', 'morning'),
(11217, 79, '2025-06-11', 'night'),
(11218, 14, '2025-06-11', 'morning'),
(11219, 16, '2025-06-11', 'morning'),
(11220, 46, '2025-06-11', 'morning'),
(11221, 50, '2025-06-11', 'morning'),
(11222, 54, '2025-06-11', 'morning'),
(11223, 58, '2025-06-11', 'morning'),
(11224, 61, '2025-06-11', 'night'),
(11225, 67, '2025-06-11', 'night'),
(11226, 80, '2025-06-11', 'morning'),
(11227, 15, '2025-06-11', 'night'),
(11228, 45, '2025-06-11', 'night'),
(11229, 53, '2025-06-11', 'night'),
(11230, 60, '2025-06-11', 'morning'),
(11231, 64, '2025-06-11', 'morning'),
(11232, 69, '2025-06-11', 'night'),
(11233, 81, '2025-06-11', 'night'),
(11234, 47, '2025-06-11', 'night'),
(11235, 55, '2025-06-11', 'night'),
(11236, 63, '2025-06-11', 'night'),
(11237, 68, '2025-06-11', 'morning'),
(11238, 82, '2025-06-11', 'morning'),
(11239, 83, '2025-06-11', 'night'),
(11240, 48, '2025-06-12', 'morning'),
(11241, 52, '2025-06-12', 'morning'),
(11242, 56, '2025-06-12', 'morning'),
(11243, 59, '2025-06-12', 'night'),
(11244, 65, '2025-06-12', 'night'),
(11245, 70, '2025-06-12', 'morning'),
(11246, 77, '2025-06-12', 'night'),
(11247, 78, '2025-06-12', 'morning'),
(11248, 1, '2025-06-12', 'night'),
(11249, 49, '2025-06-12', 'night'),
(11250, 51, '2025-06-12', 'night'),
(11251, 57, '2025-06-12', 'night'),
(11252, 62, '2025-06-12', 'morning'),
(11253, 66, '2025-06-12', 'morning'),
(11254, 79, '2025-06-12', 'night'),
(11255, 14, '2025-06-12', 'morning'),
(11256, 16, '2025-06-12', 'morning'),
(11257, 46, '2025-06-12', 'morning'),
(11258, 50, '2025-06-12', 'morning'),
(11259, 54, '2025-06-12', 'morning'),
(11260, 58, '2025-06-12', 'morning'),
(11261, 61, '2025-06-12', 'night'),
(11262, 67, '2025-06-12', 'night'),
(11263, 80, '2025-06-12', 'morning'),
(11264, 15, '2025-06-12', 'night'),
(11265, 45, '2025-06-12', 'night'),
(11266, 53, '2025-06-12', 'night'),
(11267, 60, '2025-06-12', 'morning'),
(11268, 64, '2025-06-12', 'morning'),
(11269, 69, '2025-06-12', 'night'),
(11270, 81, '2025-06-12', 'night'),
(11271, 47, '2025-06-12', 'night'),
(11272, 55, '2025-06-12', 'night'),
(11273, 63, '2025-06-12', 'night'),
(11274, 68, '2025-06-12', 'morning'),
(11275, 82, '2025-06-12', 'morning'),
(11276, 83, '2025-06-12', 'night'),
(11277, 48, '2025-06-13', 'morning'),
(11278, 52, '2025-06-13', 'morning'),
(11279, 56, '2025-06-13', 'morning'),
(11280, 59, '2025-06-13', 'night'),
(11281, 65, '2025-06-13', 'night'),
(11282, 70, '2025-06-13', 'morning'),
(11283, 77, '2025-06-13', 'night'),
(11284, 78, '2025-06-13', 'morning'),
(11285, 1, '2025-06-13', 'night'),
(11286, 49, '2025-06-13', 'night'),
(11287, 51, '2025-06-13', 'night'),
(11288, 57, '2025-06-13', 'night'),
(11289, 62, '2025-06-13', 'morning'),
(11290, 66, '2025-06-13', 'morning'),
(11291, 79, '2025-06-13', 'night'),
(11292, 14, '2025-06-13', 'morning'),
(11293, 16, '2025-06-13', 'morning'),
(11294, 46, '2025-06-13', 'morning'),
(11295, 50, '2025-06-13', 'morning'),
(11296, 54, '2025-06-13', 'morning'),
(11297, 58, '2025-06-13', 'morning'),
(11298, 61, '2025-06-13', 'night'),
(11299, 67, '2025-06-13', 'night'),
(11300, 80, '2025-06-13', 'morning'),
(11301, 15, '2025-06-13', 'night'),
(11302, 45, '2025-06-13', 'night'),
(11303, 53, '2025-06-13', 'night'),
(11304, 60, '2025-06-13', 'morning'),
(11305, 64, '2025-06-13', 'morning'),
(11306, 69, '2025-06-13', 'night'),
(11307, 81, '2025-06-13', 'night'),
(11308, 47, '2025-06-13', 'night'),
(11309, 55, '2025-06-13', 'night'),
(11310, 63, '2025-06-13', 'night'),
(11311, 68, '2025-06-13', 'morning'),
(11312, 82, '2025-06-13', 'morning'),
(11313, 83, '2025-06-13', 'night'),
(11314, 48, '2025-06-14', 'morning'),
(11315, 52, '2025-06-14', 'morning'),
(11316, 56, '2025-06-14', 'morning'),
(11317, 59, '2025-06-14', 'night'),
(11318, 65, '2025-06-14', 'night'),
(11319, 70, '2025-06-14', 'morning'),
(11320, 77, '2025-06-14', 'night'),
(11321, 78, '2025-06-14', 'morning'),
(11322, 1, '2025-06-14', 'night'),
(11323, 49, '2025-06-14', 'night'),
(11324, 51, '2025-06-14', 'night'),
(11325, 57, '2025-06-14', 'night'),
(11326, 62, '2025-06-14', 'morning'),
(11327, 66, '2025-06-14', 'morning'),
(11328, 79, '2025-06-14', 'night'),
(11329, 14, '2025-06-14', 'morning'),
(11330, 16, '2025-06-14', 'morning'),
(11331, 46, '2025-06-14', 'morning'),
(11332, 50, '2025-06-14', 'morning'),
(11333, 54, '2025-06-14', 'morning'),
(11334, 58, '2025-06-14', 'morning'),
(11335, 61, '2025-06-14', 'night'),
(11336, 67, '2025-06-14', 'night'),
(11337, 80, '2025-06-14', 'morning'),
(11338, 15, '2025-06-14', 'night'),
(11339, 45, '2025-06-14', 'night'),
(11340, 53, '2025-06-14', 'night'),
(11341, 60, '2025-06-14', 'morning'),
(11342, 64, '2025-06-14', 'morning'),
(11343, 69, '2025-06-14', 'night'),
(11344, 81, '2025-06-14', 'night'),
(11345, 47, '2025-06-14', 'night'),
(11346, 55, '2025-06-14', 'night'),
(11347, 63, '2025-06-14', 'night'),
(11348, 68, '2025-06-14', 'morning'),
(11349, 82, '2025-06-14', 'morning'),
(11350, 83, '2025-06-14', 'night'),
(11351, 48, '2025-06-16', 'night'),
(11352, 52, '2025-06-16', 'night'),
(11353, 56, '2025-06-16', 'night'),
(11354, 59, '2025-06-16', 'morning'),
(11355, 65, '2025-06-16', 'morning'),
(11356, 70, '2025-06-16', 'night'),
(11357, 77, '2025-06-16', 'morning'),
(11358, 78, '2025-06-16', 'night'),
(11359, 1, '2025-06-16', 'morning'),
(11360, 49, '2025-06-16', 'morning'),
(11361, 51, '2025-06-16', 'morning'),
(11362, 57, '2025-06-16', 'morning'),
(11363, 62, '2025-06-16', 'night'),
(11364, 66, '2025-06-16', 'night'),
(11365, 79, '2025-06-16', 'morning'),
(11366, 14, '2025-06-16', 'night'),
(11367, 16, '2025-06-16', 'night'),
(11368, 46, '2025-06-16', 'night'),
(11369, 50, '2025-06-16', 'night'),
(11370, 54, '2025-06-16', 'night'),
(11371, 58, '2025-06-16', 'night'),
(11372, 61, '2025-06-16', 'morning'),
(11373, 67, '2025-06-16', 'morning'),
(11374, 80, '2025-06-16', 'night'),
(11375, 15, '2025-06-16', 'morning'),
(11376, 45, '2025-06-16', 'morning'),
(11377, 53, '2025-06-16', 'morning'),
(11378, 60, '2025-06-16', 'night'),
(11379, 64, '2025-06-16', 'night'),
(11380, 69, '2025-06-16', 'morning'),
(11381, 81, '2025-06-16', 'morning'),
(11382, 47, '2025-06-16', 'morning'),
(11383, 55, '2025-06-16', 'morning'),
(11384, 63, '2025-06-16', 'morning'),
(11385, 68, '2025-06-16', 'night'),
(11386, 82, '2025-06-16', 'night'),
(11387, 83, '2025-06-16', 'morning'),
(11388, 48, '2025-06-17', 'night'),
(11389, 52, '2025-06-17', 'night'),
(11390, 56, '2025-06-17', 'night'),
(11391, 59, '2025-06-17', 'morning'),
(11392, 65, '2025-06-17', 'morning'),
(11393, 70, '2025-06-17', 'night'),
(11394, 77, '2025-06-17', 'morning'),
(11395, 78, '2025-06-17', 'night'),
(11396, 1, '2025-06-17', 'morning'),
(11397, 49, '2025-06-17', 'morning'),
(11398, 51, '2025-06-17', 'morning'),
(11399, 57, '2025-06-17', 'morning'),
(11400, 62, '2025-06-17', 'night'),
(11401, 66, '2025-06-17', 'night'),
(11402, 79, '2025-06-17', 'morning'),
(11403, 14, '2025-06-17', 'night'),
(11404, 16, '2025-06-17', 'night'),
(11405, 46, '2025-06-17', 'night'),
(11406, 50, '2025-06-17', 'night'),
(11407, 54, '2025-06-17', 'night'),
(11408, 58, '2025-06-17', 'night'),
(11409, 61, '2025-06-17', 'morning'),
(11410, 67, '2025-06-17', 'morning'),
(11411, 80, '2025-06-17', 'night'),
(11412, 15, '2025-06-17', 'morning'),
(11413, 45, '2025-06-17', 'morning'),
(11414, 53, '2025-06-17', 'morning'),
(11415, 60, '2025-06-17', 'night'),
(11416, 64, '2025-06-17', 'night'),
(11417, 69, '2025-06-17', 'morning'),
(11418, 81, '2025-06-17', 'morning'),
(11419, 47, '2025-06-17', 'morning'),
(11420, 55, '2025-06-17', 'morning'),
(11421, 63, '2025-06-17', 'morning'),
(11422, 68, '2025-06-17', 'night'),
(11423, 82, '2025-06-17', 'night'),
(11424, 83, '2025-06-17', 'morning'),
(11425, 48, '2025-06-18', 'night'),
(11426, 52, '2025-06-18', 'night'),
(11427, 56, '2025-06-18', 'night'),
(11428, 59, '2025-06-18', 'morning'),
(11429, 65, '2025-06-18', 'morning'),
(11430, 70, '2025-06-18', 'night'),
(11431, 77, '2025-06-18', 'morning'),
(11432, 78, '2025-06-18', 'night'),
(11433, 1, '2025-06-18', 'morning'),
(11434, 49, '2025-06-18', 'morning'),
(11435, 51, '2025-06-18', 'morning'),
(11436, 57, '2025-06-18', 'morning'),
(11437, 62, '2025-06-18', 'night'),
(11438, 66, '2025-06-18', 'night'),
(11439, 79, '2025-06-18', 'morning'),
(11440, 14, '2025-06-18', 'night'),
(11441, 16, '2025-06-18', 'night'),
(11442, 46, '2025-06-18', 'night'),
(11443, 50, '2025-06-18', 'night'),
(11444, 54, '2025-06-18', 'night'),
(11445, 58, '2025-06-18', 'night'),
(11446, 61, '2025-06-18', 'morning'),
(11447, 67, '2025-06-18', 'morning'),
(11448, 80, '2025-06-18', 'night'),
(11449, 15, '2025-06-18', 'morning'),
(11450, 45, '2025-06-18', 'morning'),
(11451, 53, '2025-06-18', 'morning'),
(11452, 60, '2025-06-18', 'night'),
(11453, 64, '2025-06-18', 'night'),
(11454, 69, '2025-06-18', 'morning'),
(11455, 81, '2025-06-18', 'morning'),
(11456, 47, '2025-06-18', 'morning'),
(11457, 55, '2025-06-18', 'morning'),
(11458, 63, '2025-06-18', 'morning'),
(11459, 68, '2025-06-18', 'night'),
(11460, 82, '2025-06-18', 'night'),
(11461, 83, '2025-06-18', 'morning'),
(11462, 48, '2025-06-19', 'night'),
(11463, 52, '2025-06-19', 'night'),
(11464, 56, '2025-06-19', 'night'),
(11465, 59, '2025-06-19', 'morning'),
(11466, 65, '2025-06-19', 'morning'),
(11467, 70, '2025-06-19', 'night'),
(11468, 77, '2025-06-19', 'morning'),
(11469, 78, '2025-06-19', 'night'),
(11470, 1, '2025-06-19', 'morning'),
(11471, 49, '2025-06-19', 'morning'),
(11472, 51, '2025-06-19', 'morning'),
(11473, 57, '2025-06-19', 'morning'),
(11474, 62, '2025-06-19', 'night'),
(11475, 66, '2025-06-19', 'night'),
(11476, 79, '2025-06-19', 'morning'),
(11477, 14, '2025-06-19', 'night'),
(11478, 16, '2025-06-19', 'night'),
(11479, 46, '2025-06-19', 'night'),
(11480, 50, '2025-06-19', 'night'),
(11481, 54, '2025-06-19', 'night'),
(11482, 58, '2025-06-19', 'night'),
(11483, 61, '2025-06-19', 'morning'),
(11484, 67, '2025-06-19', 'morning'),
(11485, 80, '2025-06-19', 'night'),
(11486, 15, '2025-06-19', 'morning'),
(11487, 45, '2025-06-19', 'morning'),
(11488, 53, '2025-06-19', 'morning'),
(11489, 60, '2025-06-19', 'night'),
(11490, 64, '2025-06-19', 'night'),
(11491, 69, '2025-06-19', 'morning'),
(11492, 81, '2025-06-19', 'morning'),
(11493, 47, '2025-06-19', 'morning'),
(11494, 55, '2025-06-19', 'morning'),
(11495, 63, '2025-06-19', 'morning'),
(11496, 68, '2025-06-19', 'night'),
(11497, 82, '2025-06-19', 'night'),
(11498, 83, '2025-06-19', 'morning'),
(11499, 48, '2025-06-20', 'night'),
(11500, 52, '2025-06-20', 'night'),
(11501, 56, '2025-06-20', 'night'),
(11502, 59, '2025-06-20', 'morning'),
(11503, 65, '2025-06-20', 'morning'),
(11504, 70, '2025-06-20', 'night'),
(11505, 77, '2025-06-20', 'morning'),
(11506, 78, '2025-06-20', 'night'),
(11507, 1, '2025-06-20', 'morning'),
(11508, 49, '2025-06-20', 'morning'),
(11509, 51, '2025-06-20', 'morning'),
(11510, 57, '2025-06-20', 'morning'),
(11511, 62, '2025-06-20', 'night'),
(11512, 66, '2025-06-20', 'night'),
(11513, 79, '2025-06-20', 'morning'),
(11514, 14, '2025-06-20', 'night'),
(11515, 16, '2025-06-20', 'night'),
(11516, 46, '2025-06-20', 'night'),
(11517, 50, '2025-06-20', 'night'),
(11518, 54, '2025-06-20', 'night'),
(11519, 58, '2025-06-20', 'night'),
(11520, 61, '2025-06-20', 'morning'),
(11521, 67, '2025-06-20', 'morning'),
(11522, 80, '2025-06-20', 'night'),
(11523, 15, '2025-06-20', 'morning'),
(11524, 45, '2025-06-20', 'morning'),
(11525, 53, '2025-06-20', 'morning'),
(11526, 60, '2025-06-20', 'night'),
(11527, 64, '2025-06-20', 'night'),
(11528, 69, '2025-06-20', 'morning'),
(11529, 81, '2025-06-20', 'morning'),
(11530, 47, '2025-06-20', 'morning'),
(11531, 55, '2025-06-20', 'morning'),
(11532, 63, '2025-06-20', 'morning'),
(11533, 68, '2025-06-20', 'night'),
(11534, 82, '2025-06-20', 'night'),
(11535, 83, '2025-06-20', 'morning'),
(11536, 48, '2025-06-21', 'night'),
(11537, 52, '2025-06-21', 'night'),
(11538, 56, '2025-06-21', 'night'),
(11539, 59, '2025-06-21', 'morning'),
(11540, 65, '2025-06-21', 'morning'),
(11541, 70, '2025-06-21', 'night'),
(11542, 77, '2025-06-21', 'morning'),
(11543, 78, '2025-06-21', 'night'),
(11544, 1, '2025-06-21', 'morning'),
(11545, 49, '2025-06-21', 'morning'),
(11546, 51, '2025-06-21', 'morning'),
(11547, 57, '2025-06-21', 'morning'),
(11548, 62, '2025-06-21', 'night'),
(11549, 66, '2025-06-21', 'night'),
(11550, 79, '2025-06-21', 'morning'),
(11551, 14, '2025-06-21', 'night'),
(11552, 16, '2025-06-21', 'night'),
(11553, 46, '2025-06-21', 'night'),
(11554, 50, '2025-06-21', 'night'),
(11555, 54, '2025-06-21', 'night'),
(11556, 58, '2025-06-21', 'night'),
(11557, 61, '2025-06-21', 'morning'),
(11558, 67, '2025-06-21', 'morning'),
(11559, 80, '2025-06-21', 'night'),
(11560, 15, '2025-06-21', 'morning'),
(11561, 45, '2025-06-21', 'morning'),
(11562, 53, '2025-06-21', 'morning'),
(11563, 60, '2025-06-21', 'night'),
(11564, 64, '2025-06-21', 'night'),
(11565, 69, '2025-06-21', 'morning'),
(11566, 81, '2025-06-21', 'morning'),
(11567, 47, '2025-06-21', 'morning'),
(11568, 55, '2025-06-21', 'morning'),
(11569, 63, '2025-06-21', 'morning'),
(11570, 68, '2025-06-21', 'night'),
(11571, 82, '2025-06-21', 'night'),
(11572, 83, '2025-06-21', 'morning'),
(11573, 48, '2025-06-23', 'morning'),
(11574, 52, '2025-06-23', 'morning'),
(11575, 56, '2025-06-23', 'morning'),
(11576, 59, '2025-06-23', 'night'),
(11577, 65, '2025-06-23', 'night'),
(11578, 70, '2025-06-23', 'morning'),
(11579, 77, '2025-06-23', 'night'),
(11580, 78, '2025-06-23', 'morning'),
(11581, 1, '2025-06-23', 'night'),
(11582, 49, '2025-06-23', 'night'),
(11583, 51, '2025-06-23', 'night'),
(11584, 57, '2025-06-23', 'night'),
(11585, 62, '2025-06-23', 'morning'),
(11586, 66, '2025-06-23', 'morning'),
(11587, 79, '2025-06-23', 'night'),
(11588, 14, '2025-06-23', 'morning'),
(11589, 16, '2025-06-23', 'morning'),
(11590, 46, '2025-06-23', 'morning'),
(11591, 50, '2025-06-23', 'morning'),
(11592, 54, '2025-06-23', 'morning'),
(11593, 58, '2025-06-23', 'morning'),
(11594, 61, '2025-06-23', 'night'),
(11595, 67, '2025-06-23', 'night'),
(11596, 80, '2025-06-23', 'morning'),
(11597, 15, '2025-06-23', 'night'),
(11598, 45, '2025-06-23', 'night'),
(11599, 53, '2025-06-23', 'night'),
(11600, 60, '2025-06-23', 'morning'),
(11601, 64, '2025-06-23', 'morning'),
(11602, 69, '2025-06-23', 'night'),
(11603, 81, '2025-06-23', 'night'),
(11604, 47, '2025-06-23', 'night'),
(11605, 55, '2025-06-23', 'night'),
(11606, 63, '2025-06-23', 'night'),
(11607, 68, '2025-06-23', 'morning'),
(11608, 82, '2025-06-23', 'morning'),
(11609, 83, '2025-06-23', 'night'),
(11610, 48, '2025-06-24', 'morning'),
(11611, 52, '2025-06-24', 'morning'),
(11612, 56, '2025-06-24', 'morning'),
(11613, 59, '2025-06-24', 'night'),
(11614, 65, '2025-06-24', 'night'),
(11615, 70, '2025-06-24', 'morning'),
(11616, 77, '2025-06-24', 'night'),
(11617, 78, '2025-06-24', 'morning'),
(11618, 1, '2025-06-24', 'night'),
(11619, 49, '2025-06-24', 'night'),
(11620, 51, '2025-06-24', 'night'),
(11621, 57, '2025-06-24', 'night'),
(11622, 62, '2025-06-24', 'morning'),
(11623, 66, '2025-06-24', 'morning'),
(11624, 79, '2025-06-24', 'night'),
(11625, 14, '2025-06-24', 'morning'),
(11626, 16, '2025-06-24', 'morning'),
(11627, 46, '2025-06-24', 'morning'),
(11628, 50, '2025-06-24', 'morning'),
(11629, 54, '2025-06-24', 'morning'),
(11630, 58, '2025-06-24', 'morning'),
(11631, 61, '2025-06-24', 'night'),
(11632, 67, '2025-06-24', 'night'),
(11633, 80, '2025-06-24', 'morning'),
(11634, 15, '2025-06-24', 'night'),
(11635, 45, '2025-06-24', 'night'),
(11636, 53, '2025-06-24', 'night'),
(11637, 60, '2025-06-24', 'morning'),
(11638, 64, '2025-06-24', 'morning'),
(11639, 69, '2025-06-24', 'night'),
(11640, 81, '2025-06-24', 'night'),
(11641, 47, '2025-06-24', 'night'),
(11642, 55, '2025-06-24', 'night'),
(11643, 63, '2025-06-24', 'night'),
(11644, 68, '2025-06-24', 'morning'),
(11645, 82, '2025-06-24', 'morning'),
(11646, 83, '2025-06-24', 'night'),
(11647, 48, '2025-06-25', 'morning'),
(11648, 52, '2025-06-25', 'morning'),
(11649, 56, '2025-06-25', 'morning'),
(11650, 59, '2025-06-25', 'night'),
(11651, 65, '2025-06-25', 'night'),
(11652, 70, '2025-06-25', 'morning'),
(11653, 77, '2025-06-25', 'night'),
(11654, 78, '2025-06-25', 'morning'),
(11655, 1, '2025-06-25', 'night'),
(11656, 49, '2025-06-25', 'night'),
(11657, 51, '2025-06-25', 'night'),
(11658, 57, '2025-06-25', 'night'),
(11659, 62, '2025-06-25', 'morning'),
(11660, 66, '2025-06-25', 'morning'),
(11661, 79, '2025-06-25', 'night'),
(11662, 14, '2025-06-25', 'morning'),
(11663, 16, '2025-06-25', 'morning'),
(11664, 46, '2025-06-25', 'morning'),
(11665, 50, '2025-06-25', 'morning'),
(11666, 54, '2025-06-25', 'morning'),
(11667, 58, '2025-06-25', 'morning'),
(11668, 61, '2025-06-25', 'night'),
(11669, 67, '2025-06-25', 'night'),
(11670, 80, '2025-06-25', 'morning'),
(11671, 15, '2025-06-25', 'night'),
(11672, 45, '2025-06-25', 'night'),
(11673, 53, '2025-06-25', 'night'),
(11674, 60, '2025-06-25', 'morning'),
(11675, 64, '2025-06-25', 'morning'),
(11676, 69, '2025-06-25', 'night'),
(11677, 81, '2025-06-25', 'night'),
(11678, 47, '2025-06-25', 'night'),
(11679, 55, '2025-06-25', 'night'),
(11680, 63, '2025-06-25', 'night'),
(11681, 68, '2025-06-25', 'morning'),
(11682, 82, '2025-06-25', 'morning'),
(11683, 83, '2025-06-25', 'night'),
(11684, 48, '2025-06-26', 'morning'),
(11685, 52, '2025-06-26', 'morning'),
(11686, 56, '2025-06-26', 'morning'),
(11687, 59, '2025-06-26', 'night'),
(11688, 65, '2025-06-26', 'night'),
(11689, 70, '2025-06-26', 'morning'),
(11690, 77, '2025-06-26', 'night'),
(11691, 78, '2025-06-26', 'morning'),
(11692, 1, '2025-06-26', 'night'),
(11693, 49, '2025-06-26', 'night'),
(11694, 51, '2025-06-26', 'night'),
(11695, 57, '2025-06-26', 'night'),
(11696, 62, '2025-06-26', 'morning'),
(11697, 66, '2025-06-26', 'morning'),
(11698, 79, '2025-06-26', 'night'),
(11699, 14, '2025-06-26', 'morning'),
(11700, 16, '2025-06-26', 'morning'),
(11701, 46, '2025-06-26', 'morning'),
(11702, 50, '2025-06-26', 'morning'),
(11703, 54, '2025-06-26', 'morning'),
(11704, 58, '2025-06-26', 'morning'),
(11705, 61, '2025-06-26', 'night'),
(11706, 67, '2025-06-26', 'night'),
(11707, 80, '2025-06-26', 'morning'),
(11708, 15, '2025-06-26', 'night'),
(11709, 45, '2025-06-26', 'night'),
(11710, 53, '2025-06-26', 'night'),
(11711, 60, '2025-06-26', 'morning'),
(11712, 64, '2025-06-26', 'morning'),
(11713, 69, '2025-06-26', 'night'),
(11714, 81, '2025-06-26', 'night'),
(11715, 47, '2025-06-26', 'night'),
(11716, 55, '2025-06-26', 'night'),
(11717, 63, '2025-06-26', 'night'),
(11718, 68, '2025-06-26', 'morning'),
(11719, 82, '2025-06-26', 'morning'),
(11720, 83, '2025-06-26', 'night'),
(11721, 48, '2025-06-27', 'morning'),
(11722, 52, '2025-06-27', 'morning'),
(11723, 56, '2025-06-27', 'morning'),
(11724, 59, '2025-06-27', 'night'),
(11725, 65, '2025-06-27', 'night'),
(11726, 70, '2025-06-27', 'morning'),
(11727, 77, '2025-06-27', 'night'),
(11728, 78, '2025-06-27', 'morning'),
(11729, 1, '2025-06-27', 'night'),
(11730, 49, '2025-06-27', 'night'),
(11731, 51, '2025-06-27', 'night'),
(11732, 57, '2025-06-27', 'night'),
(11733, 62, '2025-06-27', 'morning'),
(11734, 66, '2025-06-27', 'morning'),
(11735, 79, '2025-06-27', 'night'),
(11736, 14, '2025-06-27', 'morning'),
(11737, 16, '2025-06-27', 'morning'),
(11738, 46, '2025-06-27', 'morning'),
(11739, 50, '2025-06-27', 'morning'),
(11740, 54, '2025-06-27', 'morning'),
(11741, 58, '2025-06-27', 'morning'),
(11742, 61, '2025-06-27', 'night'),
(11743, 67, '2025-06-27', 'night'),
(11744, 80, '2025-06-27', 'morning'),
(11745, 15, '2025-06-27', 'night'),
(11746, 45, '2025-06-27', 'night'),
(11747, 53, '2025-06-27', 'night'),
(11748, 60, '2025-06-27', 'morning'),
(11749, 64, '2025-06-27', 'morning'),
(11750, 69, '2025-06-27', 'night'),
(11751, 81, '2025-06-27', 'night'),
(11752, 47, '2025-06-27', 'night'),
(11753, 55, '2025-06-27', 'night'),
(11754, 63, '2025-06-27', 'night'),
(11755, 68, '2025-06-27', 'morning'),
(11756, 82, '2025-06-27', 'morning'),
(11757, 83, '2025-06-27', 'night'),
(11758, 48, '2025-06-28', 'morning'),
(11759, 52, '2025-06-28', 'morning'),
(11760, 56, '2025-06-28', 'morning'),
(11761, 59, '2025-06-28', 'night'),
(11762, 65, '2025-06-28', 'night'),
(11763, 70, '2025-06-28', 'morning'),
(11764, 77, '2025-06-28', 'night'),
(11765, 78, '2025-06-28', 'morning'),
(11766, 1, '2025-06-28', 'night'),
(11767, 49, '2025-06-28', 'night'),
(11768, 51, '2025-06-28', 'night'),
(11769, 57, '2025-06-28', 'night'),
(11770, 62, '2025-06-28', 'morning'),
(11771, 66, '2025-06-28', 'morning'),
(11772, 79, '2025-06-28', 'night'),
(11773, 14, '2025-06-28', 'morning'),
(11774, 16, '2025-06-28', 'morning'),
(11775, 46, '2025-06-28', 'morning'),
(11776, 50, '2025-06-28', 'morning'),
(11777, 54, '2025-06-28', 'morning'),
(11778, 58, '2025-06-28', 'morning'),
(11779, 61, '2025-06-28', 'night'),
(11780, 67, '2025-06-28', 'night'),
(11781, 80, '2025-06-28', 'morning'),
(11782, 15, '2025-06-28', 'night'),
(11783, 45, '2025-06-28', 'night'),
(11784, 53, '2025-06-28', 'night'),
(11785, 60, '2025-06-28', 'morning'),
(11786, 64, '2025-06-28', 'morning'),
(11787, 69, '2025-06-28', 'night'),
(11788, 81, '2025-06-28', 'night'),
(11789, 47, '2025-06-28', 'night'),
(11790, 55, '2025-06-28', 'night'),
(11791, 63, '2025-06-28', 'night'),
(11792, 68, '2025-06-28', 'morning'),
(11793, 82, '2025-06-28', 'morning'),
(11794, 83, '2025-06-28', 'night'),
(11795, 48, '2025-06-30', 'night'),
(11796, 52, '2025-06-30', 'night'),
(11797, 56, '2025-06-30', 'night'),
(11798, 59, '2025-06-30', 'morning'),
(11799, 65, '2025-06-30', 'morning'),
(11800, 70, '2025-06-30', 'night'),
(11801, 77, '2025-06-30', 'morning'),
(11802, 78, '2025-06-30', 'night'),
(11803, 1, '2025-06-30', 'morning'),
(11804, 49, '2025-06-30', 'morning'),
(11805, 51, '2025-06-30', 'morning'),
(11806, 57, '2025-06-30', 'morning'),
(11807, 62, '2025-06-30', 'night'),
(11808, 66, '2025-06-30', 'night'),
(11809, 79, '2025-06-30', 'morning'),
(11810, 14, '2025-06-30', 'night'),
(11811, 16, '2025-06-30', 'night'),
(11812, 46, '2025-06-30', 'night'),
(11813, 50, '2025-06-30', 'night'),
(11814, 54, '2025-06-30', 'night'),
(11815, 58, '2025-06-30', 'night'),
(11816, 61, '2025-06-30', 'morning'),
(11817, 67, '2025-06-30', 'morning'),
(11818, 80, '2025-06-30', 'night'),
(11819, 15, '2025-06-30', 'morning'),
(11820, 45, '2025-06-30', 'morning'),
(11821, 53, '2025-06-30', 'morning'),
(11822, 60, '2025-06-30', 'night'),
(11823, 64, '2025-06-30', 'night'),
(11824, 69, '2025-06-30', 'morning'),
(11825, 81, '2025-06-30', 'morning'),
(11826, 47, '2025-06-30', 'morning'),
(11827, 55, '2025-06-30', 'morning'),
(11828, 63, '2025-06-30', 'morning'),
(11829, 68, '2025-06-30', 'night'),
(11830, 82, '2025-06-30', 'night'),
(11831, 83, '2025-06-30', 'morning');

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
-- Chỉ mục cho bảng `employee_evaluations`
--
ALTER TABLE `employee_evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT cho bảng `employee_evaluations`
--
ALTER TABLE `employee_evaluations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `work_schedules`
--
ALTER TABLE `work_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11832;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `leave_requests_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE;

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
