USE [PRJ301_SE08D_Assignment_Nhom8]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 6/28/2021 8:31:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](20) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblFlower]    Script Date: 6/28/2021 8:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlower](
	[flowerID] [nvarchar](10) NOT NULL,
	[flowerName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[image] [nvarchar](500) NOT NULL,
	[categoryID] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblFlower_1] PRIMARY KEY CLUSTERED 
(
	[flowerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 6/28/2021 8:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](100) NOT NULL,
	[createDate] [date] NOT NULL,
	[deliveryDate] [date] NOT NULL,
	[total] [float] NOT NULL,
	[address] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 6/28/2021 8:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[flowerID] [nvarchar](10) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 6/28/2021 8:31:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[userName] [varchar](100) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[role] [varchar](10) NULL,
	[phone] [varchar](20) NULL,
 CONSTRAINT [PK_tblUser_1] PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Type1', N'Hoa Sinh Nhật')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Type2', N'Hoa Chia Buồn')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Type3', N'Hoa Khai Trương')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Type4', N'Hoa Tình Yêu')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'Type5', N'Hoa Cưới')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb1', N'HOA TANG LỄ DÒNG THỜI GIAN', N'Hãy nhớ rằng, hoa chia buồn không nhất thiết phải thật buồn hoặc ảm đạm. Giữa khoảng thời gian khó khăn này, hãy để những người xung quanh tưởng nhớ đến khoảng thời gian tươi đẹp, đầy sự cống hiến của người đã an nghỉ bằng những đoá hoa tươi từ Flower Corner. Hoa tươi không chỉ dâng sắc, dâng màu, mà còn dâng hương, tạo nên bầu không khí nhẹ nhàng thoải mái hơn cho gia quyến.', 1120000, 400, N'chiabuon1.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb2', N'HOA CHIA BUỒN AN GIẤC', N'Mẫu vòng hoa chia buồn An giấc được thiết kế theo tông màu trắng tinh khiết, màu sắc được sử dụng nhiều nhất trong các đám tang. Màu trắng thể hiện sự tôn kính và sự thương tiếc vô vàn với người đã khuất, đồng thời cũng thể hiện sự chia sẻ với gia đình của họ.', 1090000, 500, N'chiabuon2.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb3', N'VÒNG HOA TANG LỄ THƯƠNG TIẾC', N'"Vòng hoa tang lễ nhỏ nhưng sự chân thành của người gửi san sẻ lớn vô cùng dành cho người nhà, và sự thương tiếc vô hạn của bạn dành cho người đã mãi đi xa. Sự ra đi đột ngột và nỗi buồn vô hạn của người gửi với mong ước trao lời chia xa cùng bằng vòng hoa nhỏ này."', 1050000, 500, N'chiabuon3.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb4', N'VÒNG HOA TANG LỄ PHÂN ƯU', N'Mỗi vòng hoa được gửi đi đều hàm chứa nhiều ý nghĩa lớn, vừa là lời chia ly cùng người đã khuất, lời chia buồn với người ở lại, lời động viên với người đang chịu đựng nỗi đau lớn. Vì thế, từng thiết kế, từng chi tiết của vòng hoa luôn được chúng tôi để tâm nhất để truyền đạt một cách trọn vẹn nhất những lời chưa nói của bạn. ', 1100000, 500, N'chiabuon4.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb5', N'VÒNG HOA TANG LỄ NHỚ THƯƠNG', N'Giờ phút chia ly là chuyện thường tình trong cuộc sống, kiếp người nào rồi cũng kết thúc, dẫu biết thế, nhưng mỗi lần mất đi người thân yêu đều để lại trong lòng người ở lại một nỗi đau khó vơi. Trong những giai đoạn này, một lời an ủi, sẻ chia dù nhỏ nhất, như một vòng hoa chia buồn, cũng sẽ mang một ý nghĩa to lớn.', 930000, 500, N'chiabuon5.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'cb6', N'HOA CHIA BUỒN LỜI CUỐI', N'Một kết cấu vòng hoa khác biệt với hai nửa trắng - tím mang đến nét khác biệt, độc đáo, nhưng vẫn không kém phần nhẹ nhàng, thành kính. Để cho lời chia tay không quá nặng nề, đau buồn; hãy gửi những vòng hoa độc đáo, khác biệt để thể hiện sự quan tâm, chân thành của người gửi.', 950000, 500, N'chiabuon6.jpg', N'Type2')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc1', N'HOA CẦM TAY CÔ DÂU CHÂN TÌNH', N'Có khoảng khắc nào hạnh phúc hơn giấy phút chàng nói tiếng tỏ tình? Nếu có chỉ có thể là lúc chàng nói lời cầu hôn, là hạnh phúc vỡ òa. Cảm xúc của cô gái đón nhận tình yêu trong khoảng khắc cầu hôn là cảm ứng cho thiết kế hoa "Chân Tình", nồng nàn dịu dàng nghẹn ngào rất riêng , rất đỗi con gái.', 600000, 400, N'hc1.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc2', N'HOA CẦM TAY CÔ DÂU MÔI HỒNG', N'Một chút sắc hồng lãng mạn, một chút sắc trắng tinh khôi hòa quyện lại tạo nên một bó hoa rất dễ thương. Bó hoa là điều tuyệt vời nhất cho các cô nàng yêu sắc hồng và theo đuổi phong cách sang trọng quí phái.', 600000, 500, N'hc2.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc3', N'HOA CƯỚI BABY HỒNG', N'Mẫu hoa cầm tay được Flowercorner.vn thiết kế từ hoa baby phun hồng phù hợp với các cô dâu mặc áo cưới màu trắng. Bó hoa cưới tiếng yêu là lựa chọn hoàn hảo cho các cô dâu yêu thích sự mới lạ và hiện đại.

', 600000, 500, N'hc3.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc4', N'HOA CẦM TAY CÔ DÂU KIM CƯƠNG', N'Cô dâu nào lại không muốn ngày trọng đại của mình thật đặc biệt, từ đường may trên chiếc váy cưới đến bó hoa cầm tay xinh xắn. Mọi thứ nên hoàn hảo và lộng lẫy trong ngày đặc biệt này. Bó hoa thủy tiên trắng kết hợp cùng hoa hồng trắng như một viên kim cương sáng lấp lánh quý giá trên tay nàng với nụ cười xinh tươi trên môi, trong một lễ cưới lộng lẫy ngập tràn bởi tông trắng tinh khôi khiến tất cẻ mọi người phải trầm trồ khen ngợi và đắm chìm vào một thiên đường hạnh phúc mãi chẳng muốn xa rời', 600000, 500, N'hc4.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc5', N'NGÀY HẠNH PHÚC', N'Ngọt ngào, lãng mạn và dễ thương, bó hoa cầm tay được dựa trên cảm hứng từ những câu chuyện tình trẻ trung, đáng yêu và đầy nhiệt huyết. Tông màu pastel đáng yêu sẽ góp phần tô thêm màu sắc hạnh phúc vào đám cưới của bạn đấy.

', 600000, 500, N'hc5.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'hc6', N'HOA CẦM TAY CÔ DÂU VƯỜN TÌNH YÊU', N'Sen đá bí ẩn như vị vua vương quyền sánh vang bên cạnh nữ hoàng hồng trong dáng vẻ cao sang thanh thoát,bó hoa thích hợp với các nàng yêu thích tinh tế mà vô cùng gần gũi với tông màu xanh chủ đạo cho bó hoa ngày cưới.', 600000, 500, N'hc6.jpg', N'Type5')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt1', N'HOA CHÚC MỪNG VƯƠN LÊN', N'Trên con đường sự nghiệp thành công của mỗi người luôn có sự chung tay, giúp đỡ từ phía những người bạn, những người đối tác hay doanh nghiệp. Vì vậy đôi lúc một lời cảm ơn hay một lời chúc mừng sẽ thắt chặt tình cảm giữa mọi người hơn đấy. Lẵng hoa chúc mừng Vươn Lên được tạo nên từ hoa hồng, tú cầu và hướng dương với màu sắc rực rỡ tượng trưng cho một lời chúc hướng đến tương lai đầu thành công và tươi sáng đấy.', 1000000, 400, N'kt1.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt2', N'KỆ HOA KHAI TRƯƠNG TRANG TRỌNG', N'Kệ hoa mừng khai trương với thiết đầy sáng tạo và tinh tế, được phối hợp từ các loại hoa khác nhau như hoa hồng, hướng dương... mỗi loài hoa tượng trưng cho những ý nghĩa sâu sắc và phong phú khác nhau. Cùng với tông màu vàng tươi sáng, kệ hoa là món quà mang thông điệp chúc chủ cửa hàng, công ty, chi nhánh mau gặt hái nhiều thành công và phát triển bền vững.', 1200000, 489, N'kt2.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt3', N'KỆ HOA KHAI TRƯƠNG ĐẠI CÁT', N'Mang tông màu chủ đạo của vàng- tượng trưng cho sự cao quý, thành đạt và sự mạnh mẽ và chiến thắng. Kết hợp giữa sắc vàng của đồng tiền và sắc hồng, tím tình cảm từ lilies và cát tường, kệ hoa khai trương đại cát sẽ thay bạn gửi đi dòng thông điệp: chúc khai trương tấn tới, phát đạt và vững tin bước trên con đường hướng đến thành công đầy rạng ngời và tươi sáng.', 900000, 500, N'kt3.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt4', N'KỆ HOA KHAI TRƯƠNG PHÁT ĐẠT', N'Mang một sắc màu đầy tinh tế, kệ hoa là sự kết hợp giữa những loại hoa thanh tao mà quí phái nhất. Kệ hoa gồm hoa ly, hồng đỏ, tú cầu và nhiều loại hoa khác tượng trưng cho sự may mắn, niềm vui chiến thắng đầy hân hoan. Kệ hoa khai trương phát đạt là một món quà tuyệt vời thay cho lời cảm ơn đến những người đã luôn sát cánh, giúp đỡ bạn trong con đường sự nghiệp.', 950000, 500, N'kt4.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt5', N'KỆ HOA CHÚC MỪNG TẤN TIẾN', N'Kệ hoa đầy tinh tế được tạo nên từ các loại đồng tiền đủ màu sắc trên nền tú cầu xanh tươi mang đến không khí tươi vui, ấm áp và đầy nụ cười. Kệ hoa thích hợp là một món quà đến bạn bè, người thân, đối tác cùng lời chúc cho sự hy vọng, hạnh phúc và nhiều điều tốt đẹp nhất.', 1000000, 500, N'kt5.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'kt6', N'CHÚC THÀNH CÔNG', N'Chúc thành công sẽ là món quà hoàn hảo để dành tặng đối tác, bạn bè hoặc người thân trong ngày lễ khai trương cửa hàng hoặc công ty bởi sự sang trọng và thông điệp tốt lành được ẩn chứa đằng sau lẵng hoa. Bên cạnh đó, bạn cũng hoàn toàn có thể lựa chọn lẵng hoa chúc thành công như một món quà tặng sinh nhật, tốt nghiệp đầy màu sắc để gửi tới bạn bè, người thân.', 850000, 500, N'kt6.jpg', N'Type3')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn1', N'TUỔI HỒNG', N'Cẩm chướng là loài hoa tượng trưng cho vẻ đẹp dịu dàng, đáng yêu nhưng cũng đầy bản lĩnh và mạnh mẽ. Trong cuộc đời mỗi người, cảm giác hạnh phúc nhất chính là yêu và được yêu. Một sớm mai thức dậy nhận được một bó hoa cẩm chướng xinh xắn, chắc chắn người con gái ấy sẽ cảm thấy hạnh phúc đến chừng nào. Đừng chần chừ bạn nhé, hãy gửi tình yêu bạn đến người con gái đặc biệt ấy nào.', 490000, 0, N'sinhnhat1.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn2', N'VẠN LỘC', N'Lẵng hoa khai trương Vạn Lộc gồm có:

Sen thái trắng
Hoa hướng dương
Hồng vàng
Lan mokara
Hồng môn xanh
Các loại lá phụ khác.
Được thiết kế từ những loài hoa mang ý nghĩa may mắn, tài lộc, lẵng hoa chúc mừng khai trương Vạn Lộc phù hợp để làm quà tặng đố tác trong dịp khai trương cửa hàng, công ty. Quà chúc mừng sinh nhật cấp trên.
', 900000, 500, N'sinhnhat2.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn3', N'CỔ TÍCH', N'Những câu chuyện tình có khi dịu dàng và sáng trong như những giọt nắng, có khi dịu dàng trầm lặng và lãng mạn như những buổi hoàng hôn. Hãy cùng điểm tô thêm những sắc màu vào câu chuyện tình yêu của hai bạn nhé. Bó hoa 40 cành hồng kem viền baby phun hồng đầy ngọt ngào, chứa đầy tình yêu thương sẽ là một món quà cực kỳ đặc biệt đấy.', 450000, 500, N'sinhnhat3.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn4', N'TƯƠI SÁNG', N'Lẵng hoa khai trương Tươi Sáng mang tông màu sáng đầy vui tươi, ngập tràn ánh nắng và niềm vui hân hoan sẽ giúp bạn gửi đến đối tác, doanh nghiệp những lời chúc chân thành và hoan hỉ nhất. Luôn tỏa sáng và hướng đến tương lai tươi đẹp cũng là ý nghĩa mà giỏ hoa này mang đến với hoa hướng dương, hồng vàng và điểm lan vàng.', 820000, 500, N'sinhnhat4.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn5', N'SUNNY', N'Mở cửa sổ đón nắng sớm vào trong căn phòng, cùng với 1 bó hoa xinh bên cạnh cửa sổ, không gian căn phòng sẽ càng rạng ngời, màu sắc. Hãy khiến cho cô gái của bạn rạng rỡ như những bông hoa này cùng với nụ cười thật tươi trên mặt bằng cách tặng nàng bó hoa xinh xắn này nhé! Hướng dương rạng rỡ kết hợp với các loại hoa phụ đầy sức sống sẽ là món quà đầy ngọt ngào mà tinh tế đó.', 500000, 500, N'sinhnhat5.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'sn6', N'CÂU HÁT', N'Nắng luôn mang trong mình sự vui tươi, reo vui và trong sáng. Lấy cảm hứng từ vẻ đẹp của nắng, bó hoa mang trong mình một lời chúc may mắn và thành công dễ thương mà đầy ý nghĩa. Hãy gửi tặng bó hoa đầy may mằn này đến bạn bè, đồng nghiệp hay người thân và mang nắng đến một ngày của họ nhé.', 620000, 500, N'sinhnhat6.jpg', N'Type1')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty1', N'LUÔN BÊN EM', N'Giữa cuộc sống với bao nhiêu khó khăn, căng thẳng và tấp nập, một chút nhẹ nhàng, hồn nhiên của đóa hồng đỏ chắc chắn sẽ mang đến niềm vui khó tả cho một ai đó. Sống chậm lại và yêu thương nhiều hơn, chia sẻ nhiều hơn và quan tâm nhiều hơn, hãy để bó hồng này giúp bạn gửi đi thông điệp đó nhé.', 500000, 390, N'ty1.jpg', N'Type4')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty2', N'YÊU KIỀU', N'Hạnh phúc đôi khi không được tính bằng năm, bằng tháng mà hạnh phúc có thể đong đầy dù trong một khoảnh khắc. Hãy gửi đến người bạn yêu thương nhất những khoảnh khắc chứa đựng đầy yêu thương nhé. Bó hoa gồm tông màu hồng lãng mạn của hồng kem kết hợp với vẻ đẹp đầy đáng yêu của thạch thảo trắng.', 500000, 500, N'ty2.jpg', N'Type4')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty3', N'ĐÁNG YÊU', N'Hồng đỏ và cẩm chướng hồng kết hợp cùng những loài hoa lá phụ khác tạo nên một bó hoa đầy tinh tế. Bó hoa đáng yêu là lựa chọn hoàn hảo để gửi tặng bạn gái trong ngày lễ tình nhân Valentine hay trong ngày sinh nhật.', 500000, 500, N'ty3.jpg', N'Type4')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty4', N'ONLY YOU', N'Dịu dàng mà đầy tươi vui. Bó hoa được kết hợp từ những bông hồng phun xan xinh tươi nhất cùng những loài hoa lá phụ nhỏ xinh khác là một món quà đặc biệt thích hợp tặng đồng nghiệp, bạn bè, cô giáo hay cô bạn gái đáng yêu của bạn. Nhỏ nhắn nhưng đầy ý nghĩa là điều bó hoa này mang đến cho bạn.', 500000, 500, N'ty4.jpg', N'Type4')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty5', N'HỒNG DỊU DÀNG', N'Có khi nhớ lắm một nụ cười ai đó nhưng ngại ngùng không muốn nói, có khi cần lắm một bàn tay ấm áp dịu dàng nhưng lại ở quá xa, có khi yêu lắm một ánh nhìn đầy đáng yêu, lãng mạn. Những giây phút ấy hẳn sẽ không bao giờ có thể quên, vì vật hãy tạo thêm những giây phút yêu đầu đầy hạnh phúc và bất ngờ cho người bạn yêu nhé. Tặng ngay cho người ấy một bó hoa lãng mạn với 15 hồng kem pastel thật ngọt ngào này nha.', 500000, 500, N'ty5.jpg', N'Type4')
INSERT [dbo].[tblFlower] ([flowerID], [flowerName], [description], [price], [quantity], [image], [categoryID]) VALUES (N'ty6', N'RIÊNG MÌNH EM', N'Bó hoa với thiết kế đặt biệt từ những cánh hồng đỏ tươi đầy rực rỡ cùng 1 cánh hồng kem dễ thương nổi bật ngay giữa. Bó hoa tượng trưng cho thông điệp " Em là tình yêu duy nhất của cuộc đời anh, dù có chuyện gì xảy ra, dù buồn hay vui anh vẩn ở cạnh em đến cuối con đường". Đừng đợi chờ bạn nhé, hãy để bó hoa thay bạn nói những lời yêu thương ngọt ngào nhất.', 500000, 500, N'ty6.jpg', N'Type4')
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userID], [createDate], [deliveryDate], [total], [address]) VALUES (1, N'daihv', CAST(N'2021-06-26' AS Date), CAST(N'2021-06-26' AS Date), 5000000, N'Quan 9, Man Thien')
INSERT [dbo].[tblOrder] ([orderID], [userID], [createDate], [deliveryDate], [total], [address]) VALUES (6, N'daihv', CAST(N'2021-06-26' AS Date), CAST(N'2021-06-27' AS Date), 5000000, N'Dai Hoc FPT, Quan 9')
INSERT [dbo].[tblOrder] ([orderID], [userID], [createDate], [deliveryDate], [total], [address]) VALUES (7, N'daihv', CAST(N'2021-06-28' AS Date), CAST(N'2021-06-28' AS Date), 13200000, N'Quan9')
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [flowerID], [price], [quantity]) VALUES (5, 1, N'sn3', 450000, 10)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [flowerID], [price], [quantity]) VALUES (6, 6, N'ty1', 500000, 10)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [flowerID], [price], [quantity]) VALUES (7, 7, N'kt2', 1200000, 11)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
INSERT [dbo].[tblUser] ([userName], [password], [fullName], [role], [phone]) VALUES (N'daihv', N'123', N'Hoang Van Dai', N'user', N'0978649888')
INSERT [dbo].[tblUser] ([userName], [password], [fullName], [role], [phone]) VALUES (N'thangdh', N'123456', N'Äáº·ng Hiáº¿u Tháº¯ng', N'user', N'0978649666')
INSERT [dbo].[tblUser] ([userName], [password], [fullName], [role], [phone]) VALUES (N'user', N'123456', N'DaiHV', N'user', N'0978649888')
ALTER TABLE [dbo].[tblFlower]  WITH CHECK ADD  CONSTRAINT [FK_tblFlower_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblFlower] CHECK CONSTRAINT [FK_tblFlower_tblCategory]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([userName])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblFlower] FOREIGN KEY([flowerID])
REFERENCES [dbo].[tblFlower] ([flowerID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblFlower]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrder]
GO
