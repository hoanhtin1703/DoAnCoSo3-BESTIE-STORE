-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 28, 2022 lúc 01:37 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `sanpham`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `email` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `password` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `email`, `password`, `level`) VALUES
(2, 'hotin@gmail.com', '456', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `id_khachhang` int(11) NOT NULL,
  `noidung` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `id_sanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `id` int(11) NOT NULL,
  `iddonhang` int(11) NOT NULL,
  `madonhang` varchar(500) NOT NULL,
  `masanham` int(11) NOT NULL,
  `tensanpham` varchar(200) NOT NULL,
  `giasanpham` double NOT NULL,
  `soluongsanpham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`id`, `iddonhang`, `madonhang`, `masanham`, `tensanpham`, `giasanpham`, `soluongsanpham`) VALUES
(1, 1, '1348159041', 162, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - TỰ TIN LÊN NÀO CÔ GÁI', 67000, 3),
(2, 1, '1348159041', 166, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - BÍ QUYẾT GIAO TIẾP THÀNH CÔNG', 67000, 2),
(3, 2, '953068053', 147, 'Sách - Giáo Trình Quản Trị Kinh Doanh', 99000, 2),
(4, 2, '953068053', 130, 'Sách - Thư Ngỏ Gửi Tuổi Đôi Mươi', 58000, 3),
(5, 3, '124885305', 138, 'Sách - Ielts Writing Step By Step', 65000, 2),
(6, 3, '124885305', 161, 'TÉT ĐẠI CA - CẬU THẬT RẮC RỐI', 45000, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `tenkhachhang` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `sodienthoai` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `diachi` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL,
  `id_account` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `tenkhachhang`, `sodienthoai`, `diachi`, `id_account`) VALUES
(2, 'Hồ Anh Tín', '0397456811', 'tổ 35', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `doanhthu`
--

CREATE TABLE `doanhthu` (
  `id` int(11) NOT NULL,
  `tongtien` text COLLATE utf8mb4_unicode_nopad_ci DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Đang đổ dữ liệu cho bảng `doanhthu`
--

INSERT INTO `doanhthu` (`id`, `tongtien`) VALUES
(1, '372000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

CREATE TABLE `donhang` (
  `id` int(11) NOT NULL,
  `madonhang` varchar(200) NOT NULL,
  `trangthai` int(11) NOT NULL,
  `idkhachhang` int(50) NOT NULL,
  `date` text DEFAULT NULL,
  `hinhthucthanhtoan` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`id`, `madonhang`, `trangthai`, `idkhachhang`, `date`, `hinhthucthanhtoan`) VALUES
(1, '1348159041', 0, 2, '28/05/2022', 0),
(2, '953068053', 1, 3, '28/05/2022', 0),
(3, '124885305', 0, 2, '28/05/2022', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `id` int(11) NOT NULL,
  `tenloaisanpham` varchar(200) NOT NULL,
  `hinhanh` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `loaisanpham`
--

INSERT INTO `loaisanpham` (`id`, `tenloaisanpham`, `hinhanh`) VALUES
(2, 'Sách Hướng nghiệp & Phát triển bản thân', '/server/picture/5c119d2059.jpg'),
(3, 'Sách Học Ngoại Ngữ', '/server/picture/9a695bee52.jpg'),
(4, 'Sách Kinh Tế - Kinh Doanh', '/server/picture/e1b9d5bfcc.jpg'),
(5, 'Truyện Tranh', '/server/picture/ed29cba542.jpg'),
(6, 'Văn học Việt Nam', '/server/picture/d2d5060685.jpg'),
(7, 'Dành cho bạn gái', '/server/picture/86a06d6e54.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `tensanpham` varchar(200) NOT NULL,
  `giasanpham` int(15) NOT NULL,
  `hinhanhsanpham` varchar(200) NOT NULL,
  `soluong` varchar(500) DEFAULT NULL,
  `motasanpham` mediumtext NOT NULL,
  `idsanpham` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `tensanpham`, `giasanpham`, `hinhanhsanpham`, `soluong`, `motasanpham`, `idsanpham`) VALUES
(126, 'Sách - Rich habits poor habits ', 115000, '/server/picture/290c29e01f.jpg', '3280', 'Tác giả : Nhiều tác giả \r\nLoại phiên bản: Phiên bản thông thường\r\nLoại nắp: Bìa mềm\r\nKích thước : 13 x 20,5 cm\r\nNăm xuất bản : 2019 \r\nNhà xuất bản : Hồng Đức \r\nSố trang : 420 trang \r\nTác giả : Nhiều tác giả\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Rich habits poor habits Sự Khác Biệt Giữa Người Giàu Và Người Nghèo” là cẩm nang giúp bạn xây dựng thói quen tốt để đạt được thành công trong cuộc sống. \r\nRich habits không phải một cuốn sách về tiền bạc, đầu tư, bất động sản hay chứng khoán. Thay vào đó, đây là cuốn sách về bắt chước cách người giàu cảm nhận, suy nghĩ, hành động và hành xử. Đây là cuốn sách về phát triển các thói quen giàu có (các thói quen hầu hết những người giàu đều có) và loại bỏ thói quen nghèo khó. \r\nThật thú vị, hầu hết mọi người chọn thử sức và học tự làm mọi thứ, tuy nhiên bạn có thể đẩy nhanh đáng kể sự tiến bộ và trưởng thành của mình trong thành công tài chính bằng cách bắt chước có hệ thống những người giàu có, thành công đã đi trước bạn. \r\nCuốn sách không nói đến việc người giàu đầu tư thế nào hay điều hành doanh nghiệp gì, mặc dù đây là vấn đề quan trọng cần hiểu. Cuốn sách gợi ý bạn quan sát ở mức độ cao hơn để hiểu những thói quen hàng ngày của họ và những gì họ làm từ lúc thức dậy cho đến khi đi ngủ. Bạn nên đặt mình vào họ và khám phá họ cảm nhận thế nào, họ suy nghĩ ra sao vì điều này quyết định hành động, thói quen và kết quả của họ. \r\n ', 2),
(127, 'Sách - Nghệ Thuật Từ Chối ', 60000, '/server/picture/1aaf604c3f.jpg', '4392', '- Ngày xuất bản 09-2020 \r\n- Kích thước: 13 x 20.5 cm\r\n - Tác giả: Damon Zahariades\r\n - Dịch Giả: Ngô Tâm\r\n - Loại bìa: Bìa mềm \r\n- Số trang: 160 \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức\r\n\r\nMÔ TẢ SẢN PHẨM\r\nNghệ Thuật Từ Chối – Cách Nói Không Mà Vẫn Có Được Đồng Thuận là cuốn sách giúp bạn Học cách nói \"Không\" cũng là yêu chính mình. Sẽ có lúc bạn nhận ra: Làm vừa lòng thiên hạ là một chuyện vừa khó lại vừa ngu!! \r\nTừ chối một ai đó bằng việc nói “KHÔNG” ngay lập tức thì thật sỗ sàng. Chính vì vậy mà cách từ chối khéo không để lại “SẸO” luôn được nhiều người quan tâm. \r\nVậy làm sao để có kỹ năng từ chối mà không mất lòng người khác, không làm rạn nứt mối quan hệ và cả hai người đều không cảm thấy khó xử? Bestie Store xin trân trọng gửi đến quý độc giả cuốn sách: “Nghệ Thuật Từ Chối – Cách Nói Không Mà Vẫn Có Được Đồng Thuận” \r\nBí quyết đưa ra lời Từ chối mà không làm tổn hại các mối quan hệ nằm “Nghệ Thuật Từ Chối – Cách Nói Không Mà Vẫn Có Được Đồng Thuận” giúp bạn tìm hiểu nguyên nhân và đưa ra cách từ chối “nhẹ nhàng”. Cuốn sách chia quy trình Từ chối thành những bước như- Chuẩn bị từ chối, đưa ra từ chối và hoàn tất từ chối - cuốn sách hướng dẫn bạn phương pháp nói Không hiệu quả, mạnh mẽ nhất, bạn có thể thực hiện ngay trong đời sống, công việc và các mối quan hệ. \r\n\r\n', 2),
(128, 'Sách - Thôi Miên Bằng Ngôn Từ', 121000, '/server/picture/5f061e7dcb.jpg', '4792', '- Tác giả Joe Vitale \r\n- Ngày xuất bản: 01-2018 \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức \r\n- Dịch Giả: Phúc Lâm\r\n - Loại bìa: Bìa mềm \r\n- Số trang: 388\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Thôi miên bằng ngôn từ” là cuốn sách tiết lộ những bí quyết để thu hút và thuyết phục khách hàng chỉ bằng ngôn từ mà không phải ai cũng biết. \r\n - “Thôi miên Bằng Ngôn từ” không chỉ bàn về kỹ năng viết khiến người đọc bị mê hoặc mà chính cũng có thể mê hoặc bất kỳ độc giả nào. Cuốn sách chỉ cho bạn thấy cách trở nên thuần thục trong việc nắm bắt sự chú ý của khách hàng tiềm năng, giữ chân họ, khiến họ phải hành động! \r\n- “Thôi miên Bằng Ngôn từ” thực sự là cuốn sách đáng để chiêm nghiệm và học hỏi. Hãy trang bị ngay cho bạn cuốn sách hữu ích này nhé!\r\n', 2),
(129, 'Sách - Ngôn Ngữ Cơ Thể ', 82000, '/server/picture/a52d58f9d2.jpg', '7932', '- Tác giả: Greg Williams \r\n- Ngày xuất bản: 11-2018 \r\n- Kích thước: 13.5 x 20.5 cm \r\n- Nhà xuất bản: NXB Hồng Đức\r\n - Loại bìa: Bìa mềm \r\n- Số trang: 356\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Ngôn Ngữ Cơ Thể - Bí Quyết Chiến Thắng Trong Mọi Cuộc Đàm Phán” là cuốn sách tiết lộ những suy nghĩ bất ngờ được ẩn giấu bên trong ngôn ngữ cơ thể giúp bản thân có nhiều cơ hội thành công trong cả công việc và cuộc sống. Ngôn ngữ cơ thể – chìa khóa trong mọi cuộc giao tiếp \r\n- Trong đàm phán, một trong những yếu tố giúp bạn thành công đó là khả năng nắm bắt tâm lý đối phương thông qua ngôn ngữ cơ thể – những cử chỉ vốn bộc lộ vô thức và dễ bị bỏ qua nếu bạn không phải là người am hiểu về giao tiếp phi ngôn ngữ. Nhà đàm phán tài ba chắc chắn sẽ là người thông thạo ngôn ngữ cơ thể! Vì khi đó, họ có khả năng nhận biết được tâm lý của đối phương và biết mình cần làm gì để có lợi cho cuộc đàm phán.\r\n', 2),
(130, 'Sách - Thư Ngỏ Gửi Tuổi Đôi Mươi', 58000, '/server/picture/f30cb88787.jpg', '1032', '- Tác giả: Nguyễn Hiến Lê \r\n- Ngày xuất bản: 08-2018 \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức \r\n- Số trang: 195\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Thư Ngỏ Gửi Tuổi Đôi Mươi” là cuốn sách đưa ra cho các bạn trẻ những lời khuyên chân thành và bổ ích nhất ở tuổi đôi mươi.\r\nThư ngỏ tuổi đôi mươi gồm 17 chương sẽ là những câu trả lời cho những thắc mắc mà các bạn trẻ thường gặp phải trong độ tuổi này. Những điều tuổi đôi mươi cần biết và thực hiện Thư ngỏ gửi tuổi đôi mươi của André Maurois là một trong những cuốn sách bán chạy nhất ở Pháp trong những năm 1966.\r\n', 2),
(131, 'Sách - Sống 24 Giờ 1 Ngày', 46000, '/server/picture/2595804f14.jpg', '7432', '- Ngày xuất bản: 10-2018 \r\n- Loại bìa: Bìa mềm \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức \r\n- Tác giả: Nguyễn Hiến Lê\r\n\r\nMÔ TẢ SẢN PHẨM\r\n\" Sống 24 Giờ 1 Ngày\" là cuốn sách giúp bạn có cách sắp xếp thời gian để cân bằng mọi việc, luôn sống trọng vẹn có ý nghĩa từng ngày.\r\nCó thời gian bạn có thể làm ra tiền bạc nhưng khi có nhiều tiền bạc, giàu có tới mức nào bạn cũng không thể mua được dù chỉ 1 giây thời gian. Mỗi ngày đồng hồ quay tròn 24 tiếng, mỗi phút, mỗi giây, mỗi tích tắc chúng ta đều có thể làm được rất nhiều điều có ích cho bản thân và xã hội. Vì vậy đừng để phí hoài một phút giây nào khi cơ thể bạn còn có thể cống hiến. Hãy học cách quý trọng quỹ thời gian Sống 24 Giờ 1 Ngày của bạn.\r\n', 2),
(132, 'Sách - Sống thật bao nhiêu, hạnh phúc bấy nhiêu', 115000, '/server/picture/6c5e7af16c.jfif', '320', '- Tác giả: David R.Hamilton Phd \r\n- Nhà xuất bản: NXB Hồng Đức \r\n- Năm xuất bản: 2020 \r\n- Số trang: 352\r\n\r\nMÔ TẢ SẢN PHẨM\r\n\"Sống thật bao nhiêu, hạnh phúc bấy nhiêu\" của David R Hamilton sẽ giúp bạn biết được tầm quan trọng của sống thành thật, dũng cảm bộc lộ cảm xúc của mình mà không cảm thấy hổ thẹn, điều mà rất nhiều người chưa làm được. Bạn còn học được cách đối xử dịu dàng và vị tha với chính mình, trở thành phiên bản thật của mình.\r\nTagore từng nói: “Nếu bạn khóc vì đánh mất mặt trời, như vậy bạn sẽ bỏ lỡ cả những vì sao.“ Bạn biết mà, một giọt nước trong đại dương mênh mông, một hạt cát trên bãi biển rất bé nhỏ. Bạn cũng vậy nhỏ bé trong thế giới hàng tỷ người, vậy cớ sao bạn lại phải để ý tới cách nhìn của người khác, nhìn vào những người khác làm tiêu chuẩn cho bản thân mình. Hãy sống thật với chính mình, điều đó sẽ giúp bạn có được hạnh phúc.', 2),
(133, 'Sách - Đừng Làm Việc Chăm Chỉ Hãy Làm Việc Thông Minh', 118000, '/server/picture/884d6da0b1.jpg', '4802', '- Tác giả: Nhiều tác giả \r\n- Nhà xuất bản: Hồng Đức\r\n - Năm xuất bản: 2020 \r\n- Số trang: 175\r\n\r\nMÔ TẢ SẢN PHẨM\r\nMỗi người đều có 96 khối năng lượng mỗi ngày để làm những gì chúng ta muốn. Bạn luôn cần đảm bảo mình đang sử dụng mỗi khối năng lượng một cách khôn ngoan để đạt được tiến bộ nhanh nhất trên các mục tiêu quan trọng của bản thân. \" Đừng Làm Việc Chăm Chỉ Hãy Làm Việc Thông Minh\" để luôn duy trì nguồn năng lượng tích cực là cuốn sách Bestie xin trân trọng gửi đến quý độc giả.\r\nNhững kiến thức trong cuốn sách đưa ra những nghiên cứu về bộ não để giúp chúng ta quản trị trí não, cảm xúc và thói quen với những bước hành động hết sức giản đơn nhờ đó thiết lập những kế hoạch phù hợp với nhịp độ sinh học của bản thân.\r\nTài năng có quan trọng không? \r\nTrong khi chúng ta luôn nghĩ rằng những người thành công là bởi vì họ tài năng hơn chúng ta. Tuy nhiên, càng nhìn xung quanh, tôi càng thấy không phải vậy. Một trong những lý do chúng ta nghĩ rằng họ thành công nhờ tài năng là bởi nó giúp chúng ta bỏ qua lý do thực sự. Chúng tôi không tài năng như những người siêu thành công này nên tất nhiên chúng tôi không được như họ. Giải thích như vậy là sai. Tài năng rất quan trọng, điều đó là tất nhiên, nhưng nó không quan trọng nhiều như bạn nghĩ.\r\nNhững người thành công thường chỉ tập trung thời gian của họ vào một vài ưu tiên và luôn nghĩ làm thế nào để mọi việc diễn ra suôn sẻ. Điều này tưởng chừng như đơn giản nhưng không hề dễ dàng.\r\n', 2),
(134, 'Sách - Khiêu Vũ Với Nỗi Sợ Hãi', 123000, '/server/picture/66dd9eb914.jpg', '3280', '- Tác giả: Harriet Lerner \r\n- Ngày xuất bản: 2019 \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức \r\n- Loại bìa: Bìa mềm \r\n- Số trang: 446\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Khiêu Vũ Với Nỗi Sợ Hãi” sẽ giúp bạn gạt bỏ lo lắng, sợ hãi và xấu hổ, hành động bất chấp nỗi sợ hãi để thành công.\r\nTại sao chúng ta lo lắng, sợ hãi? \r\n- Lúc còn là những đứa trẻ, chúng ta chẳng hề lo sợ khi bước khỏi vùng thoải mái của mình và thử những điều mới mẻ. Nhưng lúc lớn lên, khi phải buông mình vào những bộn bề cuộc sống, chúng ta bắt đầu biết sợ, biết lo lắng về mọi thứ.\r\n - Vậy nỗi lo lắng, sợ hãi là gì và tại sao chúng ta lại sợ hãi quá nhiều thứ? Thực tế, thứ chúng ta thiếu chính là hiểu biết về tâm trí của bản thân, về bản chất của nỗi sợ hãi và cách chúng vận hành. Cuốn sách “Khiêu vũ với nỗi sợ hãi” sẽ giúp bạn kiểm soát nỗi lo lắng và tuyệt vọng, giữ bình tĩnh và tỉnh táo trong mọi hoàn cảnh.\r\nCuốn sách sẽ giúp bạn:\r\n- Hiểu được nội dung cuốn sách sẽ giúp chúng ta hiểu biết về tâm trí của bản thân, về bản chất của nỗi sợ hãi và cách chúng vận hành. Cuốn sách “Khiêu vũ với nỗi sợ hãi” sẽ giúp bạn kiểm soát nỗi lo lắng và tuyệt vọng, giữ bình tĩnh và tỉnh táo trong mọi hoàn cảnh và giúp bạn trả lời những câu hỏi sau: \r\n- Làm thế nào để một người đàn ông chưa được nỗi sợ bị từ chối chỉ trong một ngày – và những gì chúng ta có thể học được từ câu chuyện của anh ta \r\n- Làm thế nào tác giả vượt qua được nỗi sợ diễn thuyết trước công chúng khi bản thân đã có ý thức được nỗi sợ hãi tồi tệ nhất của đời mình \r\n- Làm thế nào để đối phó với nỗi sợ rằng bản thân không đủ tốt, cùng với sự xấu hổ về cảm giác thiếu sót và không hoàn hảo \r\n- Làm thế nào để giữ bình tĩnh và tỉnh táo trong một nơi làm việc điên rồ với đầy nỗi lo\r\n\r\n', 2),
(135, 'Sách - The Book Of Leadership ', 156000, '/server/picture/2c1e195853.jpg', '4392', '- Tác giả: Anthony Gell \r\n- Ngày xuất bản: 01-2018 \r\n- Kích thước: 14.5 x 20.5 cm \r\n- Nhà xuất bản: Nhà Xuất Bản Hồng Đức \r\n- Dịch Giả: Thảo Trần \r\n- Loại bìa: Bìa mềm \r\n- Số trang: 564\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“The Book Of Leadership” là cuốn cẩm nang giúp cho nhà lãnh đạo có thể dẫn dắt bản thân , đội nhóm và tổ chức vươn xa đạt được thành công to lớn.\r\nKhi bạn nhận ra được tự lãnh đạo bản thân, đội nhóm hay tổ chức sẽ mang lại cho bạn những giá trị quan trọng như thế nào, bạn có muốn thay đổi những thói quen hàng ngày của mình hay không? Một cuốn sách mà tôi muốn bạn biết đến chính là “Dẫn dắt bản thân, đội nhóm và tổ chức vươn xa”.\r\nLeadership là thứ chúng ta hoàn toàn có thể tự học, chứ không nhất thiết phải qua trường lớp hay dưới quyền chỉ đạo của một vị sếp quyền uy nào đó. Một khi đã hiểu rõ đặc điểm của nó, chúng ta chủ động mong ước, lên kế hoạch, thực hiện kế hoạch của mình triệt để mỗi ngày, đó chính là đang biến chúng ta thành một leader chân chính. Cái khó nhất là phải chiến đấu với nhân vật vô hình và kè kè bên mình mỗi ngày, đó chính là tiếng nói lười biếng của bản thân.\r\nLeadership là tính cách, nhưng không ai học được tính cách cả nếu không được ngấm nó qua các hành động. Do vậy, nếu chúng ta tạo ra được bối cảnh khiến mình phải hành động, thì sau đó tính leadership sẽ ngấm triệt để vào chúng ta.Leadership là tạo thành khuôn phép của chính chúng ta trong cuộc sống!\r\nCuốn sách thực sự là cuốn sách đáng để tìm hiểu, chiêm nghiệm. Hãy khám phá bản thân, nâng cao khả năng lãnh đạo bằng việc sở hữu ngay cuốn sách này nhé!\r\n\r\n', 2),
(136, 'Sách - Mindmap English Grammar ', 110000, '/server/picture/906d437ac6.jpg', '4321', '- Tác giả: Nhiều tác giả \r\n- Nhà sản xuất: NXB Hồng Đức. \r\n- Công ty phát hành: MCBooks \r\n- Số Trang: 292 \r\n- Năm xuất bản: 2019\r\n\r\nMÔ TẢ SẢN PHẨM\r\n\"Mindmap English Grammar - Ngữ Pháp Tiếng Anh Bằng Sơ Đồ Tư Duy\" tổng những cấu trúc ngữ pháp căn bản nhất bằng những sơ đồ tư duy sinh động, hình ảnh minh họa đầy màu sắc giúp việc học tiếng anh trở nên thú vị và dễ dàng hơn bao giờ hết \r\n\"Mindmap English Grammar\" sẽ giúp chúng ta: \r\n- Đột phá việc ghi nhớ kiến thức qua sơ đồ tư duy \r\n- Nắm trọn ngữ pháp thông qua những từ khóa chính \r\n- Kích thích sự phát triển não bộ qua sơ đồ tư duy \r\n- Cải thiện kỹ năng nghe qua các ví dụ hội thoại \r\n- Tăng tính ứng dụng thực tế trong các tình huống\r\nNội dung cuốn sách: \r\n- Nội dung cuốn sách là tổng hợp những cấu trúc ngữ pháp căn bản nhất bằng những sơ đồ tư duy sinh động, hình ảnh minh họa đầy màu sắc giúp việc học tiếng anh trở nên thú vị và dễ dàng hơn bao giờ hết. \r\n- Cuốn sách giúp người học nắm được những kiến thức về ngữ pháp, đồng thời hiểu cách sử dụng từng cấu trúc đó qua những đoạn hội thoại ngắn.\r\n', 3),
(137, 'Sách - Your Very First English', 65000, '/server/picture/214b5e9dde.jpg', '4321', '- Tác giả: The Windy \r\n- Nhà xuất bản: NXB Hồng Đức. \r\n- Số trang: 232\r\n - Năm xuất bản: 2019 \r\n- Hình thức: Bìa mềm.\r\n\r\nMÔ TẢ SẢN PHẨM\r\nYour very first English là cuốn sách rất hữu ích trong việc phát triển kỹ năng nghe cũng như làm gia tăng vốn từ vựng, ngữ pháp cho người học.\r\nCuốn sách Your very first English Volume 1 sẽ giúp bạn: \r\n- Lấy lại gốc tiếng Anh.\r\n - Kỹ năng bắt chuyện linh hoạt dựa vào những tình huống thực tế. \r\n- Kỹ năng kéo dài, dẫn dắt câu chuyện bằng tiếng Anh một cách tự nhiên bằng kỹ thuật đặt câu hỏi. - Khả năng phản xạ - hỏi – đáp trôi chảy về các chủ đề trong giao tiếp hàng ngày.\r\n - Ứng dụng được ngay vào thực tế. \r\n- Làm chủ giao tiếp tiếng Anh thực tế. \r\n- Luyện nghe nói tiếng Anh theo giọng Mỹ. \r\n- Ứng dụng được ngay sau khi học.\r\nĐối tượng sử dụng Your very first English Volume 1: \r\n- Đây là bộ sách học tiếng Anh giao tiếp Phù hợp mọi trình độ từ mất gốc đến căn bản, đặc biệt phù hợp dành cho người người học tiếng Anh trình độ căn bản. \r\nNội dung của Your very first English Volume 1: \r\n- Nội dung cuốn sách này được biên soạn gồm 60 bài học nhỏ theo từng chủ đề nhằm mục đích giúp các bạn có thể tự học Nghe – Nói tiếng Anh một cách dễ dàng và đơn giản nhất trong một thời gian ngắn.\r\n - Nội dung cuốn sách được chia theo từng chủ đề thông dụng trong cuộc sống hằng ngày, có phiên âm quốc tế và phiên âm tiếng Việt để các bạn có thể thực hành và ứng dụng được ngay vào các cuộc nói chuyện thực tế.\r\n - Cuốn sách cũng rất phù hợp làm tài liệu tham khảo giảng dạy cho các thầy cô. Ngoài ra, các bạn cũng tìm thấy cuốn sách này rất hữu ích trong việc phát triển kỹ năng nghe cũng như làm gia tăng vốn từ vựng của mình. Các bạn sẽ hài lòng vì có được nguồn tài liệu phong phú và phù hợp với mình.\r\n', 3),
(138, 'Sách - Ielts Writing Step By Step', 65000, '/server/picture/4c6a4f2619.jpg', '808', '- Tác giả: Mike Wattie \r\n- Nhà xuất bản: NXB Hồng Đức\r\n - Số trang: 172 \r\n- Ngày xuất bản: 01-2018\r\n - Loại bìa: Bìa mềm\r\n\r\nMÔ TẢ SẢN PHẨM\r\nBộ sách Ielts Writing Step By Step là bộ sách tự học Ielts hiệu quả giúp bạn nắm vững cấu trúc bài thi IELTS, lộ trình học bài bản, bám sát giúp tiết kiệm thời gian ôn luyện và cải thiện trình độ nhanh chóng\r\nCuốn sách Ielts Writing Step By Step sẽ giúp bạn: \r\n- Tự trang bị cho bản thân những kỹ năng và thông tin cần để nâng cao số điểm bài thi viết đặc biệt là được hướng dẫn chi tiết để hoàn thành task 1 và task 2. \r\n- Biết cách giải quyết từng dạng bài báo cáo, thư, bài luận\r\n - Hiểu được tiêu chí chấm điểm bài thi để đưa ra hướng làm bài phù hợp.\r\n - Biết được những lỗi “kinh điển” trong phần thi viết và cách phòng tránh. \r\n- Nâng cao nhanh nhất kỹ năng viết khi kết hợp việc học cuốn sách này cùng việc luyện viết thường xuyên.\r\nNội dung cuốn sách: \r\nVới mong muốn việc ôn tập của các thí sinh trong phần thi Viết trở nên nhẹ nhàng hơn, chúng tôi xin giới thiệu tới các bạn cuốn sách “IELTS Writing Step By Step”. Cuốn sách này sẽ hướng dẫn cho bạn từng bước làm phần thi viết IELTS hiệu quả.\r\nCuốn sách này bao gồm 4 phần như sau: \r\n- Task 1: Introduction to the IELTS Writing test: Giới thiệu tổng quan về bài thi viết trong IELTS\r\n - Task 2: Academic Reports: Báo cáo học thuật\r\n - Task 3 General: Letters: Viết thư\r\n - Task 4: Essay Writing: Viết bài luận\r\n', 3),
(139, 'Sách - Real English For You', 68000, '/server/picture/199ce48573.jpg', '430', '- Tác giả: The Windy\r\n - Kích thước: 14.5 x 20.5 x 1 cm \r\n- Loại bìa: Bìa mềm \r\n- Số trang: 220 trang \r\n- Trọng lượng: 250g \r\n- Ngày phát hành: 11-2018\r\n\r\nMÔ TẢ SẢN PHẨM\r\nTự Học Giao Tiếp Tiếng Anh Thực Tế (Real English For You)\r\nSự lưu loát có được khi bạn nói chuyện, giao tiếp dễ dàng với người bản xứ, họ dễ dàng hiểu bạn và tất nhiên bạn cũng hiểu họ đang nói gì Bạn hiểu và nói được tiếng Anh một cách hoàn toàn và nhanh chóng mà không phải qua bước trung gian rườm rà là phiên dịch lại qua tiếng mẹ đẻ trong đầu.\r\nThử tưởng tượng nếu bạn làm thế, bạn sẽ thế nào? Người bản xứ nói, bạn nghe, dịch sang tiếng Việt trong đầu, nghĩ bằng tiếng Việt, dịch sang tiếng Anh qua một mớ ngữ pháp hỗn độn mà bạn vẫn lo ngay ngáy là mình nói sai ngữ phá Kết quả là bạn ngại ngùng, ấp úng và cảm thấy quá khó khăn khi giao tiếp với người khác!\r\nĐiều này không tốt một chút nào cả! Phiên dịch là một điều cấm kị nếu muốn học tốt ngoại ngữ, bạn hoàn toàn phải hiểu, suy nghĩ và nói được bằng tiếng Anh.\r\nNghe cái gì? \r\nNghe như thế nào?\r\nNhư đã nói ở trên, bạn cần nghe những gì hiểu được và được lặp đi lặp lại nhiều lần! Hai yếu tố này đều quan trọng:\r\nHiểu được và lặp đi lặp lại nhiều lần\r\nNếu bạn nghe mà không hiểu, bạn sẽ chẳng học được gì cả!\r\nBạn sẽ không hề tiến bộ!\r\nTuy nhiên, hiểu được mới chỉ là một nửa! Không chỉ nghe hiểu mà bạn phải nghe lặp đi lặp lại nhiều lần! Khi bạn nghe một từ mới chỉ một lần, chắc chắn bạn sẽ nhanh chóng quên nó. Có quá nhiều thứ mới và chúng được não của bạn tiếp nhận hàng ngày hàng giờ. Nếu không có gì đặc biệt, ấn tượng, những thứ này sẽ tự động bị quên đi để thế chỗ cho những thứ khác! Nếu bạn nghe từ mới đó năm lần, bạn vẫn có thể quên. Bạn phải chịu khó nghe từ mới đó nhiều lần trong ngày, nhiều ngày trong tuần liên tục một thời gian dài trước khi bộ não bạn ghi nhớ nó thành công và hiểu nó ngay lập tức khi tai nghe thấy từ đó. Vậy bao nhiêu lần là đủ?\r\n', 3),
(140, 'Sách - Listen English Faster', 106000, '/server/picture/cf3a37f030.png', '8432', '- Tác giả: The Windy \r\n- Nhà xuất bản: NXB Hồng Đức \r\n- Số trang: 322 \r\n- Năm xuất bản: 2019 \r\n- Hình thức: Bìa mềm\r\n\r\nMÔ TẢ SẢN PHẨM\r\nSách - Nghe tiếng Anh hiệu quả ngay hôm nay - Listen English faster\r\n“Listen English Faster – Nghe hiệu quả ngay hôm nay” là một kim chỉ nam giúp bạn tự học tiếng Anh hiệu quả và phát triển toàn diện kỹ năng nghe - hiểu để tự tin làm chủ ngôn ngữ thứ hai này.\r\nƯu điểm của cuốn sách: \r\n- Lấy lại được gốc tiếng Anh với Phương Pháp Lồng Ghép \"Nghe Ngấm\" Giúp Bạn Tăng Vọt Nghe Hiểu Sau 3 Tháng \r\n- Kỹ năng nghe hiểu linh hoạt dựa vào những tình huống thực tế \r\n- Khả năng phản xạ hỏi đáp về các chủ đề giao tiếp trong giao tiếp hàng ngày \r\n- Kỹ năng dẫn dắt chuyện 1 cách tự nhiên, tự tin trong giao tiếp Nội dung của cuốn sách gồm \r\n- Cuốn sách dành riêng cho các bạn đọc muốn cải thiện kỹ năng nghe - hiểu. \r\n- “Listen English Faster – Nghe hiệu quả ngay hôm nay” gồm 6 phần tương ứng với 6 nội dung tiếng Anh mà chúng ta thường nghe nhất trong cuộc sống hàng ngày. \r\nPhần 1: Bật mí bí mật học tiếng Anh hiệu quả \r\nPhần 2: Những bài hát tiếng Anh hay nhất giúp bạn hào hứng luyện nghe tiếng Anh \r\nPhần 3: Những câu chuyện cười về tiếng Anh giúp bạn thoải mái và sẵn sàng tiếp thu ngôn ngữ mới Phần 4: Những chủ đề hội thoại thông thường giúp bạn nhanh chóng hiểu và ứng dụng vào thực tế Phần 5: Những truyện tranh tiếng Anh tình huống giúp bạn luyện tập và tự kiểm tra khả năng nghe tiếng Anh của mình \r\nPhần 6: Tin tức thế giới giúp bạn mở rộng kiến thức về văn hóa, sự kiên toàn cầu bằng tiếng Anh. - Với tất cả những nội dung trên, bạn hoàn toàn có thể nâng cao trình độ nghe tiếng Anh của mình và thoải mái giao tiếp chỉ sau 6 tháng mà không mất một chi phí nào để đi học ở trung tâm\r\n', 3),
(141, 'Sách - Instant self-study English', 69000, '/server/picture/b2b8694bda.jpg', '48302', '- Tác giả: The Windy\r\n - Nhà sản xuất: NXB Hồng Đức. \r\n- Số Trang: 248 \r\n- Năm xuất bản: 2018\r\n\r\nMÔ TẢ SẢN PHẨM\r\nSách - Instant self-study English - Tự Học Tiếng Anh Cấp Tốc Cho Người Mất Gốc \r\n Instant self-study English tổng hợp những kiến thức cơ bản nhất dành cho những người mới học và tự học tiếng Anh mà không có người hướng dẫn. Đặc biệt, phần phiên âm bồi bằng tiếng Việt giúp người học dễ dàng đọc được mọi từ vựng, câu, hội thoại mặc dù chưa từng học tiếng Anh trước đó. \r\n\"Instant self-study English\" sẽ giúp chúng ta: \r\n- Giao tiếp được tiếng anh ở mức độ căn bản. \r\n- Kỹ năng bắt chuyện linh hoạt dựa vào những tình huống thực tế. \r\n- Kỹ năng kéo dài, dẫn dắt câu chuyện bằng tiếng Anh một cách tự nhiên bằng kỹ thuật đặt câu hỏi. - Kỹ năng phản xạ - hỏi - đáp trôi chảy về các chủ đề trong giao tiếp hằng ngày.\r\n - Ứng dụng được ngay vào thực tế. Đối tượng sử dụng sản phẩm: \r\n- Đây là cuốn sách sử dụng cho người mới học và tự học tiếng Anh mà không có người hướng dẫn. - Đặc biệt, phần phiên âm bồi bằng tiếng Việt giúp người học dễ dàng đọc được mọi từ vựng, câu, hội thoại mặc dù chưa từng học tiếng Anh trước đó \r\nNội dung sản phẩm:\r\n - Nội dung cuốn sách tổng hợp những kiến thức cơ bản nhất dành cho những người mới học và tự học tiếng Anh mà không có người hướng dẫn. \r\n- Cuốn sách giúp người học tiếp cận với tiếng Anh và nhanh chóng chinh phục ngôn ngữ này. \r\n- Sách có tích hợp App để nghe audio bài học.\r\n', 3),
(142, 'Sách - 5000 Từ Vựng Tiếng Hàn Thông Dụng ', 100000, '/server/picture/9fb38b443c.jpg', '789', '- Tác giả The Changmi \r\n- Ngày xuất bản 01-2018\r\n- Kích thước 10.5 x 15.5 cm \r\n- Nhà xuất bản Nhà Xuất Bản Hồng Đức \r\n- Loại bìa Bìa mềm \r\n- Số trang 450\r\n\r\nMÔ TẢ SẢN PHẨM\r\nCuốn \"5000 Từ vựng tiếng Hàn thông dụng\" giúp bạn tăng vốn từ vựng hàng ngày tự nhiên như hơi thở khi có thể đem nó đi đâu tùy thích, lấy ra tra lúc nào tuỳ ý. \r\nƯu điểm khi sử dụng cuốn sách \r\n- 5000 từ vựng thường dùng nhất trong giao tiếp tiếng Hàn \r\n- Dưới sự nghiên cứu, tìm tòi và tham khảo rất nhiều nguồn để có thể hệ thống cho bạn đọc được 5000 từ vựng thường sử dụng trong giao tiếp tiếng Hàn quả là không đơn giản chút nào. Tuy nhiên, những từ vựng được lựa chọn đều có căn cứ rất rõ ràng.\r\n - Hệ thống từ vựng sắp xếp khoa học và logic \r\n- Hệ thống từ vựng trong cuốn sách đều đã được biến hóa sắp xếp theo alphabet, nội dung hợp lý, trình bày logic. \r\n- Dễ tìm, dễ nhớ, dễ ứng dụng vào học tập, cuộc sống. Hơn nữa sự sinh động các hình ảnh màu sắc bắt mắt còn kích thích người học, nhắc nhở bạn chủ động học tìm tòi ngay khi cầm trên tay cuốn sách. \r\nNội dung của cuốn sách \r\n- Gồm 5000 từ tiếng hàn thông dụng với thiết kế tiện lợi mọi nơi bạn đến trong lúc học, đi chơi hay bất cứ khi nào trên đường đi làm về, trong xe buýt lúc rảnh rang. Thấy trên bảng quảng cáo chỉ dẫn, hay tờ báo đang đọc gặp từ lạ đem cuốn sách ra tra. Sau đó tận dụng học hiểu phát âm, cách sử dụng một từ mới. Như thế thường xuyên bạn đã xây dựng cho mình một kho từ vựng khổng lồ dễ dàng. \r\n\r\n', 3),
(143, 'Sách - 15 Phút Tự Học Tiếng Hàn Mỗi Ngày', 92000, '/server/picture/5201d316ab.png', '302', '- Tác giả: The Changmi \r\n- Nhà xuất bản: NXB Hồng Đức \r\n- Số trang: 302\r\n - Năm xuất bản: 2017\r\n - Hình thức: Bìa mềm.\r\n\r\nMÔ TẢ SẢN PHẨM\r\n “15 phút tự học tiếng hàn mỗi ngày” là cuốn sách dành cho những người bắt đầu tiếp xúc với ngôn ngữ Hàn Quốc với những kiến thức cơ bản đến tình huống giao tiếp cụ thể. \r\n- Cuốn sách sẽ cung cấp những mẫu câu đơn giản và thông dụng nhất giúp bạn dễ dàng học và sử dụng chúng. \r\n- Mô hình Từ vựng – Mẫu câu – Hội thoại giúp người học nắm rõ bản chất từ vựng, giúp ghi nhớ từ lâu hơn. \r\n- Trình bày khoa học từ bảng chữ cái, cách chào hỏi, giới thiệu bản thân,… đến những tình huống giao tiếp cụ thể tại nhà hàng, khách sạn, trường học,... dễ dàng học và ghi nhớ. Đối tượng và nội dung cơ bản cuốn sách Người mới bắt đầu tiếp xúc với ngôn ngữ Hàn Quốc, người có thời gian eo hẹp, học sinh, sinh viên, học viên, người tự học,..\r\n - Phần 1: Những mẫu câu thông dụng: Cung cấp 116 mẫu câu tiếng Hàn được sử dụng nhiều nhất trong cuộc sống hàng ngày ở xứ sở kim chi. Mỗi mẫu câu các bạn sẽ được tìm hiểu thêm về các chủ điểm ngữ pháp kèm ví dụ minh họa, từ mới và phần luyện tập giúp các bạn nhanh chóng ôn lại và ghi nhớ bài học. Bên cạnh đó các bài luyện tập dịch cũng chính là cơ hội để người học phát triển tư duy song ngữ. \r\n- Phần 2: Đáp án. Phần 2 cung cấp đáp án cho các bài luyện tập ở phần 1. Đáp án được trình bày chi tiết và dễ hiểu, những người mới học hoàn toàn có thể nắm bắt được.\r\n', 3),
(144, 'Sách - Vitamin Tiếng Hàn 1', 212000, '/server/picture/387a52176f.jpg', '402', '- Tác giả: Cho Jung Soon, Jeong Seonga, Jun Ha Na, Ryu Jeong Min \r\n- Nhà xuất bản: NXB Hồng Đức. \r\n- Số trang: 284 \r\n- Năm xuất bản: 2018 \r\n- Hình thức: Bìa mềm.\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Vitamin Tiếng Hàn 1” là một cuốn sách tiếng Hàn đáp ứng đầy đủ 4 kỹ năng Nghe - Nói - Đọc - Viết giúp người học nắm bắt toàn bộ kiến thức để giao tiếp tiếng Hàn thành thạo.\r\nCuốn sách “Vitamin Tiếng Hàn 1” này sẽ giúp bạn: \r\n- Nâng cao kỹ năng đọc hiểu thông qua hội thoại, đoạn văn ngắn theo chủ đề \r\n- Tự viết câu tiếng Hàn hoàn chỉnh bằng cách diễn đạt riêng của bản thân \r\n- Rèn luyện khả năng nắm bắt tình huống và giải quyết vấn đề. \r\n- Màu bắt mắt, có các hình ảnh minh họa thiết thực tạo nên hứng thú với người học dễ học, nhớ lâu kiến thức. \r\nĐối tượng và nội dung cơ bản cuốn sách \r\n- Cung cấp lộ trình học dễ hiểu, hấp dẫn dành cho người mới bắt đầu học tiếng Hàn, giúp bạn chinh phục tiếng Hàn trình độ sơ cấp. \r\n- Cuốn sách bao gồm 5 chương đi từ những kiến thức căn bản trong tiếng Hàn đến những kỹ năng trong giao tiếp tiếng Hàn thông dụng, được trình bày cụ thể như sau: Gồm giới thiệu chữ Hangeul, các mẫu câu thông dụng, từ vựng, ngữ pháp và luyện tập ngữ pháp, các đoạn hội thoại và bài luyện tập theo chủ đề. \r\nVới mục đích giúp người đọc có thể dễ dàng nắm bắt những kỹ năng cần thiết trong giao tiếp tiếng Hàn, cuốn sách Vitamin tiếng Hàn sẽ là loại vitamin bổ ích cung cấp nguồn năng lượng cho bạn học ngay từ khi mới bắt đầu.\r\n', 3),
(145, 'Sách - Vitamin Tiếng Hàn 2', 212000, '/server/picture/5bec2c4aa9.png', '320', '- Tác giả: Cho Jung Soon, Jeong Seonga, Jun Ha Na, Ryu Jeong Min \r\n- Nhà xuất bản: NXB Hồng Đức. \r\n- Số trang: 284 \r\n- Năm xuất bản: 2018\r\n - Hình thức: Bìa mềm.\r\n\r\nMÔ TẢ SẢN PHẨM\r\n“Vitamin Tiếng Hàn 2” là một cuốn sách tiếng Hàn đáp ứng đầy đủ 4 kỹ năng Nghe - Nói - Đọc - Viết giúp người học nắm bắt toàn bộ kiến thức để giao tiếp tiếng Hàn thành thạo.\r\nCuốn sách “Vitamin Tiếng Hàn 2” này sẽ giúp bạn: \r\n- Nâng cao kỹ năng đọc hiểu thông qua hội thoại, đoạn văn ngắn theo chủ đề \r\n- Tự viết câu tiếng Hàn hoàn chỉnh bằng cách diễn đạt riêng của bản thân \r\n- Rèn luyện khả năng nắm bắt tình huống và giải quyết vấn đề. \r\n- Màu bắt mắt, có các hình ảnh minh họa thiết thực tạo nên hứng thú với người học dễ học, nhớ lâu kiến thức. \r\nĐối tượng và nội dung cơ bản cuốn sách \r\n- Cung cấp lộ trình học dễ hiểu, hấp dẫn dành cho người mới bắt đầu học tiếng Hàn, giúp bạn chinh phục tiếng Hàn trình độ sơ cấp. \r\n- Cuốn sách bao gồm 5 chương đi từ những kiến thức căn bản trong tiếng Hàn đến những kỹ năng trong giao tiếp tiếng Hàn thông dụng, được trình bày cụ thể như sau: Chủ đề và tiêu đề, mục tiêu và hướng dẫn, từ vựng và luyện tập từ vựng, ngữ pháp và luyện tập ngữ pháp, các đoạn hội thoại và văn hóa Hàn quốc. \r\nVới mục đích giúp người đọc có thể dễ dàng nắm bắt những kỹ năng cần thiết trong giao tiếp tiếng Hàn, cuốn sách Vitamin tiếng Hàn 2 sẽ là loại vitamin bổ ích cung cấp nguồn năng lượng cho bạn học ngay từ khi mới bắt đầu.\r\n', 3),
(146, 'Sách - Quản lý thời gian thông minh của người thành đạt', 116000, '/server/picture/d9bd202932.jpg', '59', '- Năm xuất bản 2020 \r\n- Nhà xuất bản NXB Hồng Đức \r\n- Tác giả Duncan Bannatyne \r\n- Số trang: 212\r\n\r\nMÔ TẢ SẢN PHẨM\r\n\"Quản lý thời gian thông minh của người thành đạt: Bí quyết thành công của triệu phú Anh” là cẩm nang giúp bạn cân đối và sử dụng thời gian một cách hiệu quả.\r\nThời gian, không giống như tiền bạc, cơ hội hay ngoại hình đẹp, là một tài nguyên được phân bổ đồng đều cho tất cả chúng ta. Bất kể tình hình tài chính và hoàn cảnh riêng của chúng ta như thế nào, mỗi chúng ta đều có 24h mỗi ngày. \r\nĐó chính là lý do tại sao sử dụng thời gian hiệu quả hơn có thể thay đổi cuộc sống của bạn.\r\nMỗi người đều có 24h mỗi ngày, nhưng ai là người biết quản lý thời gian thông minh? \r\n- Brian Tracy từng nói rằng: 1 phút lập kế hoạch sẽ giúp bạn tiết kiệm được 10 phút thực thi, điều này cho bạn 1000% năng lượng thu lại. \r\n- Chúng ta đều biết, thời gian là thứ duy nhất nếu mất đi sẽ không bao giờ quay trở lại nữa, bởi vậy nhiều giả tưởng cho rằng, nó là thứ níu kéo thời gian, nhưng giả tưởng đấy không bao giờ là hiện thực cả. Trân trọng và làm những điều ý nghĩa mỗi ngày sẽ giúp bạn không phải hối tiếc nhiều về sau. \r\nCó gì trong cuốn sách Quản lý thời gian thông minh? \r\n- Điều quý giá ở cuốn sách chính là việc tác giả không chỉ bày cho bạn cách quản lý thời gian hiệu quả mà còn giúp bạn giải quyết tận gốc vấn đề. \r\n- Cuốn sách còn giúp bạn quản lý ngay từ việc xác định mục tiêu cuộc sống. \r\n- Cuốn sách sẽ chỉ ra cách giúp bạn giải quyết và hoàn thành công việc, nói không với sự trì hoãn hoặc lười biếng. \r\n- Hướng dẫn bạn cách quản lý thời gian trong từng việc, từ việc lên kế hoạch, bắt đầu ngày mới, giao tiếp, làm việc nhóm hay sử dụng công nghệ, duy trì lối sống ngăn nắp để tiết kiệm thời gian. \r\n- Quan điểm chung của người thành công: Thời gian là tài sản quý báu nhất. Người thành công hiểu rằng thời gian là tài sản cần thiết và quý báu không kém gì tiền bạc – vì vậy, họ sử dụng nó theo cách khôn ngoan và tốt nhất có thể. Quãng thời gian bị phung phí sẽ chẳng bao giờ quay trở lại; việc trân trọng từng phút từng giây sẽ quyết định một ngày của bạn có hiệu quả hay không.\r\n\r\n', 4),
(147, 'Sách - Giáo Trình Quản Trị Kinh Doanh', 99000, '/server/picture/5aa7681710.jfif', '3290', 'Năm xuất bản 2012\r\nKích thước: 14 x 20 cm\r\nBìa mềm\r\nSố Trang 527\r\n\r\nMỤC LỤC\r\nChương 1: Khái lược về quản trị kinh doanh\r\n1. Doanh nghiệp\r\n2. Môi trường kinh doanh\r\n3. Quản trị kinh doanh\r\n4. Các trường phái lí thuyết quản trị kinh doanh\r\nChương 2: Nhà quản trị\r\n1. Kỹ năng quản trị\r\n2. Phong cách quản trị\r\n3. Nghệ thuật quản trị\r\nChương 3: Tạo lập doanh nghiệp\r\n1. Nghiên cứu cơ hội và điều kiện kinh doanh\r\n2. Lựa chọn hình thức pháp lí và xây dựng triết lí kinh doanh\r\n3. Các lựa chọn chủ yếu khi thiết kế hệ thống sản xuất\r\n4. Xây dựng bộ máy quản trị\r\nChương 4: Quản trị quá trình sản xuất\r\n1. Khái lược\r\n2. Xây dựng kế hoạch sản xuất\r\n3. Công cụ hỗ trợ lập kế hoạch tác nghiệp và phối hợp sản xuất\r\n4. Một số phương pháp điều hành quá trình sản xuất\r\nChương 5: Quản trị nhân lực\r\n1. Khái lược\r\n2. Phân tích và thiết kế công việc\r\n3. Lập kế hoạch nguồn nhân lực\r\n4. Tuyển dụng nhân lực\r\n5. Đào tạo, bồi dưỡng và phát triển\r\n6. Tạo động lực lao động\r\nChương 6: Quản trị chất lượng\r\n1. Chất lượng sản phẩm\r\n2. Khái lược về quản trị chất lượng\r\n3. Xây dựng hệ thống quản trị định hướng chất lượng\r\n4. Một số kĩ thuật quản trị chất lượng\r\nChương 7: Quản trị công nghệ\r\n1. Khái lược\r\n2. Quản trị nghiên cứu và phát triển\r\n3. Lựa chọn và đổi mới công nghệ\r\n4. Qui phạm, qui trình kỹ thuật và tiêu chuẩn hóa\r\n5. Bảo dưỡng và sửa chữa\r\nChương 8: Quản trị cung ứng nguyên vật liệu\r\n1. Khái lược\r\n2. Xác định các chỉ tiêu cung ứng và dự trữ\r\n3. Lựa chọn người cung cấp\r\n4. Xây dựng và quản trị hệ thống kho tàng\r\n5. Tổ chức hoạt động vận chuyển\r\nChương 9: Quản trị tiêu thụ\r\n1. Khái lược\r\n2. Nghiên cứu thị trường\r\n3. Xây dựng và quản trị hệ thống kênh phân phối\r\n4. Xây dựng các chính sách tiêu thụ\r\n5. Xây dựng kế hoạch tiêu thụ\r\n6. Tổ chức bán hàng và dịch vụ sau bán hàng\r\nChương 10: Quản trị tài chính\r\n1. Khái lược về hoạt động tài chính\r\n2. Đa dạng các nguồn cung ứng vốn\r\n3. Hoạch định tài chính\r\n4. Phân tích tài chính doanh nghiệp\r\nChương 11: Quản trị sự thay đổi\r\n1. Khái lược về quản trị sự thay đổi\r\n2. Những nội dung chủ yếu của quản trị sự thay đổi\r\n3. Khái lược về thay đổi của doanh nghiệp\r\n4. Quá trình phát triển tổ chức của doanh nghiệp\r\nChương 12: Tính toán kết quả và chi phí\r\n1. Khái lược về tính toán kết quả và chi phí\r\n2. Các khái niệm cơ sở\r\n3. Khái lược về kế toán tài chính\r\n4. Khái lược về tính toán chi phí kinh doanh\r\nChương 13: Hiệu quả kinh doanh\r\n1. Bản chất của hiệu quả kinh doanh\r\n2. Phân tích hiệu quả kinh doanh\r\n3. Các nhân tố ảnh hưởng đến hiệu quả kinh doanh\r\n4. Các biện pháp nâng cao hiệu quả kinh doanh', 4),
(148, 'Sách - Để xây dựng doanh nghiệp hiệu quả', 107000, '/server/picture/3e38aa2e96.jpg', '382', 'Cuốn sách mang đến cho bạn 4 ý tưởng sâu sắc mà nếu thấu hiểu được, bạn sẽ có thêm kiến thức và sức mạnh để tạo dững một doanh nghiệp nhỏ phát triển bền vững.\r\n\r\nCòn nếu bỏ qua, bạn sẽ giống như hàng nghìn người đầu tư công sức, tiền bạc và cả cuộn sống để khởi nghiệp nhưng vẫn thất bại, hay phải vất vả vật lộn chỉ để duy trì sự tồn tại ngắc ngoải cho doanh nghiệp của mình.\r\n\r\n\"Để xây dựng doanh nghiệp hiệu quả\" của Gerber chỉ ra một thực tế là hầu hết các chủ doanh nghiệp nhỏ đều xuất phát từ các nhà chuyên môn: kỹ sư, lập trình viên, kế toán... họ làm rất tốt công việc chuyên môn, vì vậy họ tin rằng nếu thành lập doanh nghiệp riêng, họ sẽ có cơ hội tự do làm công việc yêu thích và kiếm được nhiều tiền hơn.\r\n\r\nNhưng khi thành lập doanh nghiệp, các nhà chuyên môn thường có khuynh hướng tiếp tục làm những gì họ giỏi và phớt lờ các yếu tố quan trọng khác của kinh doanh. Thiếu mục tiêu nên quá tải, kiệt sức và cuối cùng phá sản. Thay vì sở hữu doanh nghiệp, họ chỉ sở hữu công việc.', 4),
(149, 'Sách - Khác biệt để bứt phá', 69000, '/server/picture/4f03f18635.jpg', '372', '\"Khác biệt để bứt phá\" thực sự là một cuốn sách kinh tế khác biệt khi đặt ra những vấn đề trong kinh doanh kiểu như \"Ít hơn là tốt\" hay \"Họp hành là độc dược”.\r\n\r\nChính nhờ điều đó mà \"Khác biệt để bứt phá\" không chỉ là một cuốn sách dạy người đọc về những \"mánh khoé\" kinh doanh mà còn giúp nhiều người định vị mình trong cuộc sống dù có muốn kinh doanh hay không.\r\n\r\nKhông đặt những vấn đề to tát như những tập đoàn kinh tế, cũng không đưa những nguyên tắc kinh tế khuôn mẫu, cứng nhắc, \"Khác biệt để bứt phá\" truyền cho người đọc cảm hứng để sống, để làm việc, để bứt khỏi những thứ nhàm chán xung quanh và tự hào về những gì mình đã làm được.', 4),
(150, 'Sách - Đắc nhân tâm', 86000, '/server/picture/a4870dfddd.jpeg', '6439', 'Đây là cuốn sách kinh điển của Dale Carnegie về cách phát huy ảnh hưởng của một người tới những người xung quanh.\r\n\r\nMặc dù được viết từ năm 1936 nhưng những lời khuyên của \"Đắc nhân tâm\" vẫn còn nguyên giá trị cho đến tận ngày nay.\r\n\r\nNghệ thuật thu phục lòng người trong \"Đắc nhân tâm\" chắc chắn sẽ rất hữu dụng trong công việc kinh doanh, đặc biệt là trong quản lý nhân sự và đàm phán với khách hàng.', 4),
(151, 'Truyện - Doraemon Ngắn tập 1', 18000, '/server/picture/c2e99d8c33.jfif', '492', 'Tác giả: Fujiko F Fujio\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 11,3 x17,6 cm\r\nSố trang: 192\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 140 gram\r\nBộ sách: Doraemon truyện ngắn\r\nNgày phát hành: 12/02/2021\r\n\r\nGIỚI THIỆU TÁC PHẨM\r\nNhững câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 5),
(152, 'DORAEMON TRUYỆN NGẮN - TẬP 12 (2021)', 18000, '/server/picture/9a58d9bfd8.webp', '678', 'Tác giả: \r\nFujiko F Fujio\r\nĐối tượng: \r\nNhi đồng (6 – 11)\r\nKhuôn Khổ: \r\n11,3 x 17,6 cm\r\nSố trang: \r\n192\r\nĐịnh dạng: \r\nbìa mềm\r\nTrọng lượng: \r\n140 gram\r\nBộ sách: \r\nDoraemon truyện ngắn\r\nNgày phát hành: \r\n11/03/2021', 5),
(153, 'DORAEMON TRUYỆN NGẮN - TẬP 33 (2021)', 18000, '/server/picture/8ee6fb173d.webp', '3902', 'Tác giả: \r\nFujiko F Fujio\r\nĐối tượng: \r\nNhi đồng (6 – 11)\r\nKhuôn Khổ: \r\n11,3 x 17,6 cm\r\nSố trang: \r\n192\r\nĐịnh dạng: \r\nbìa mềm\r\nTrọng lượng: \r\n140 gram\r\nBộ sách: \r\nDoraemon truyện ngắn\r\nNgày phát hành: \r\n07/03/2021', 5),
(154, 'THÁM TỬ LỪNG DANH CONAN - TẬP 99', 18000, '/server/picture/b0ba3f036e.webp', '4320', 'Tác giả: Gosho Aoyama\r\nĐối tượng: Thiếu niên (11 – 15)\r\nKhuôn Khổ: 11.3x17.6 cm\r\nSố trang: 184\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 140 gram\r\nBộ sách: Thám tử lừng danh Conan', 5),
(155, 'DANH NHÂN THẾ GIỚI - EDISON', 27000, '/server/picture/02388df458.jpg', '213', 'Tác giả: Neung In Publishing Company\r\nĐối tượng: Nhi đồng (6 – 11)\r\n                  Thiếu niên (11 – 15)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 160\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 195 gram\r\nBộ sách: Danh nhân thế giới', 5),
(156, 'CÔ BÉ QUÀNG KHĂN ĐỎ', 43000, '/server/picture/6f27859e10.webp', '954', 'Tác giả: Pitiporn Vatatiyarporn\r\nĐối tượng: Nhà trẻ - mẫu giáo (0 - 6)\r\nKhuôn Khổ: 23x23 cm\r\nSố trang: 16\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 160 gram', 2),
(157, 'NẾP NHĂN CỦA BÀ', 44000, '/server/picture/1690beacec.webp', '6997', 'Tác giả: Simona Ciraolo\r\nĐối tượng: Nhà trẻ - mẫu giáo (0 - 6)\r\nKhuôn Khổ: 21x25 cm\r\nSố trang: 36\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 150 gram', 5),
(158, 'KEM DÂU TRÚNG LỜI NGUYỀN', 67000, '/server/picture/fdadf2420f.webp', '439', 'Tác giả: Vân Vũ\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 116\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 200 gram\r\nCúc dại và tia nắng là một câu chuyện giản dị và xúc động về tình bạn. Cúc dại nhỏ bé mà kiên cường. Tia nắng hồn nhiên và cực kì tốt bụng. Hai người bạn đã cùng nhau đi tìm câu trả lời cho việc vì sao giữa nơi ban công trong căn nhà bỏ hoang, lại có một bông cúc dại ra đời. Và liệu cúc dại có thành công hay không trong việc gieo tiếp hạt mầm sống cho những cây cúc dại tiếp theo? \r\nCúc dại và tia nắng còn là một câu chuyện cảm động về sự quan trọng của gia đình, tình yêu thương, cách mà chúng ta vượt qua nỗi đau và tiếp tục gieo trồng những tin yêu trong cuộc sống.', 6),
(159, 'CÚC DẠI VÀ TIA NẮNG ', 58000, '/server/picture/480d1156f4.webp', '589', 'Tác giả: Dy Duyên\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 156\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 260 gram\r\nCúc dại và tia nắng là một câu chuyện giản dị và xúc động về tình bạn. Cúc dại nhỏ bé mà kiên cường. Tia nắng hồn nhiên và cực kì tốt bụng. Hai người bạn đã cùng nhau đi tìm câu trả lời cho việc vì sao giữa nơi ban công trong căn nhà bỏ hoang, lại có một bông cúc dại ra đời. Và liệu cúc dại có thành công hay không trong việc gieo tiếp hạt mầm sống cho những cây cúc dại tiếp theo? \r\nCúc dại và tia nắng còn là một câu chuyện cảm động về sự quan trọng của gia đình, tình yêu thương, cách mà chúng ta vượt qua nỗi đau và tiếp tục gieo trồng những tin yêu trong cuộc sống.', 6),
(160, 'TAY CHỊ TAY EM ', 63000, '/server/picture/4aef7a8f8f.webp', '6008', 'Tác giả: Nguyễn Thị Kim Hòa\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 104\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 180 gram\r\nNhân vật chính là một cô bé có hai cái tay không giống nhau. Bàn tay trái mập mạp, ngón tay tròn tròn, ngắn ngủn. Còn bàn tay phải thật đẹp. Nó bé xíu mềm mại, ngón tay thuôn thuôn xinh xắn. Cô bé gọi nó là bàn tay em, còn bàn tay trái là bàn tay chị. Tay chị hằng ngày làm đủ mọi việc, còn tay em thì chẳng làm gì, nó được mẹ gọi là bàn tay công chúa. Nhưng cô bé biết mẹ chỉ nói thế thôi chứ tay em không phải bàn tay công chúa. Nó là bàn tay không xài được, xinh đẹp nhưng yếu ớt. \r\nVậy nhưng cô bé yêu cả tay chị và tay em, những người xung quanh cô bé cũng yêu hai bàn tay ấy vô cùng. Cùng với tay chị và tay em, cô bé đã học được rất nhiều điều ý nghĩa về cuộc sống và tình yêu thương.', 6),
(161, 'TÉT ĐẠI CA - CẬU THẬT RẮC RỐI', 45000, '/server/picture/d62ebd6f11.webp', '690', 'Tác giả: Ngọc Linh\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14,5x20,5 cm\r\nSố trang: 168\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram\r\nBạn làm gì khi bạn là một nhóc con lớp hai?\r\nCòn Tét Đại ca tớ đây thì mỗi một ngày lại có bao nhiêu là sự kiện hay ho xảy ra. Nào cho chuồn chuồn cắn rốn để biết bơi, nào đấu một trận bóng nảy lửa, rồi thực hiện chuyến phiêu lưu đầu tiên trong đời. Mà mới hôm nọ thôi, tớ còn có một vai diễn “để đời” nữa đấy!\r\nNếu các bạn chưa tin, thì hãy hỏi ngay mèo Mactun đang ngồi trên mái nhà và cún Tô Tô đang nằm dưới sân kia kìa.\r\nChúng sẽ kể lại cho các bạn nghe những phi vụ rắc rối nhưng cực kì thú vị với nhân vật chính là Tét Đại ca tớ đây!', 6),
(162, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - TỰ TIN LÊN NÀO CÔ GÁI', 67000, '/server/picture/0351fe1ee2.webp', '6789', 'Tác giả: Peng Fan\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 180\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram', 7),
(163, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - BÍ QUYẾT ĐỂ ĐƯỢC BẠN BÈ YÊU MẾN', 67000, '/server/picture/8de183a0fc.webp', '6069', 'Tác giả: Peng Fan\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 176\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram', 7),
(164, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - CÔ GÁI CÁ TÍNH', 67000, '/server/picture/4242be8425.webp', '4392', 'Tác giả: Peng Fan\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 176\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram', 7),
(165, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - BÍ QUYẾT HỌC HÀNH GIỎI GIANG', 67000, '/server/picture/966bd8c3f9.webp', '3280', 'Tác giả: Peng Fan\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 180\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram', 7),
(166, 'BÁCH KHOA THƯ KĨ NĂNG SỐNG - BÍ QUYẾT GIAO TIẾP THÀNH CÔNG', 67000, '/server/picture/d6150151b4.webp', '3280', 'Tác giả: Peng Fan\r\nĐối tượng: Nhi đồng (6 – 11)\r\nKhuôn Khổ: 14.5x20.5 cm\r\nSố trang: 180\r\nĐịnh dạng: bìa mềm\r\nTrọng lượng: 210 gram', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `quangcao`
--

CREATE TABLE `quangcao` (
  `id` int(11) NOT NULL,
  `hinhanh` varchar(500) COLLATE utf8mb4_unicode_nopad_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_nopad_ci;

--
-- Đang đổ dữ liệu cho bảng `quangcao`
--

INSERT INTO `quangcao` (`id`, `hinhanh`) VALUES
(5, '/server/picture/e984e086f1.jpg'),
(6, '/server/picture/e0955c1820.jpg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_Person_id` (`id_account`);

--
-- Chỉ mục cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `quangcao`
--
ALTER TABLE `quangcao`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `doanhthu`
--
ALTER TABLE `doanhthu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `donhang`
--
ALTER TABLE `donhang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT cho bảng `quangcao`
--
ALTER TABLE `quangcao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_Person_id` FOREIGN KEY (`id_account`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
