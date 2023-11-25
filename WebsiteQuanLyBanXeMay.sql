--Tạo database là WebsiteQuanLyBanXeMay
--Tạo database là WebsiteQuanLyBanXeMay
--Tạo database là WebsiteQuanLyBanXeMay

--backup database WebsiteQuanLyBanXeMay to disk = 'F:\WebsiteQuanLyBanXeMay.bak'

------------------------------------------------------------------------------------------------------------------------
go
SET ANSI_NULLS ON

------------------------------------------------------------------------------------------------------------------------
go
SET QUOTED_IDENTIFIER ON


------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng Account (Tài Khoản)
CREATE TABLE Account (
	maAccount int IDENTITY(1,1) NOT NULL,
	username nvarchar(100) NULL,
	password nvarchar(100) NULL,
	isAdmin bit ,
	email nvarchar(100) NULL,
	CONSTRAINT PK_Account PRIMARY KEY CLUSTERED ([maAccount] ASC) 
);

------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng DanhMuc (Danh Mục)
CREATE TABLE DanhMuc(
	maDanhMuc int CONSTRAINT PK_DanhMuc PRIMARY KEY,
	tenDanhMuc nvarchar(100) NULL
);

------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng XeMay (Xe Máy)
CREATE TABLE XeMay(
	maXe int IDENTITY(1,1) NOT NULL,
	tenXe nvarchar(200) NULL,
	hinhAnh1 nvarchar(500),
	giaTien float check(giaTien >0),
	title nvarchar(500) NULL,
	gioiThieu nvarchar(max) NULL,
	maDanhMuc int CONSTRAINT FK_XeMay_maDanhMuc FOREIGN KEY REFERENCES DanhMuc(maDanhMuc),
	khoiLuong nvarchar(100) NULL, --mấy cái này ghi chuỗi cho dễ in ra, chứ không có xử lý gì mấy cái này hết mà
	daiRongCao nvarchar(100) NULL,
	dungTichXiLanh nvarchar(100) NULL,
	tiSoNen nvarchar(100) NULL,
	dungTichBinhXang nvarchar(100) NULL,
	hinhAnh2 nvarchar(500),
	hinhAnh3 nvarchar(500),
	hinhAnh4 nvarchar(500),
	CONSTRAINT PK_XeMay PRIMARY KEY (maXe)
);

------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng SoLuongXeDaBan (Số Lượng Xe Đã Bán)
CREATE TABLE SoLuongXeDaBan(
	maXe int CONSTRAINT FK_SoLuongXeDaBan FOREIGN KEY REFERENCES XeMay(maXe),
	soLuongDaBan int NOT NULL,
	CONSTRAINT PK_SoLuongXeDaBan PRIMARY KEY (maXe,soLuongDaBan)
);

------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng FeedBack (Đánh Giá)
CREATE TABLE FeedBack(
	maFeedBack int IDENTITY(1,1) NOT NULL,
	maAccount int CONSTRAINT FK_FeedBack_maAccount FOREIGN KEY REFERENCES Account(maAccount),
	maXe int CONSTRAINT FK_FeedBack_maXe FOREIGN KEY REFERENCES XeMay(maXe),
	noiDung nvarchar(500),
	ngayDanhGia date NULL,
	CONSTRAINT PK_Feedback PRIMARY KEY (maFeedBack)
);

------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng GioHang (Giỏ Hàng)
CREATE TABLE GioHang(
	maGioHang int IDENTITY(1,1) NOT NULL,
	maAccount int CONSTRAINT FK_GioHang_maAccount FOREIGN KEY REFERENCES Account(maAccount),
	maXe int CONSTRAINT FK_GioHang_maXe FOREIGN KEY REFERENCES XeMay(maXe),
	soLuong int NULL,
	CONSTRAINT PK_GioHang PRIMARY KEY (maGioHang)
);

---------------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng TongChiTieuMuaHang (Tổng Chi Tiêu Mua Hàng)
CREATE TABLE TongChiTieuMuaHang(
	maAccount int CONSTRAINT FK_TongChiTieuMuaHang_maAccount FOREIGN KEY REFERENCES Account(maAccount),
	tongChiTieu int,
	CONSTRAINT PK_TongChiTieuMuaHang PRIMARY KEY (maAccount)
);


---------------------------------------------------------------------------------------------------------------------------------------------
go
--Tạo bảng HoaDon (Hóa Đơn)
CREATE TABLE HoaDon(
	maHoaDon int IDENTITY(1,1) NOT NULL,
	maAccount int CONSTRAINT FK_HoaDon_maAccount FOREIGN KEY REFERENCES Account(maAccount),
	tongTien float NULL,
	ngayThanhToan Datetime NULL,
	CONSTRAINT PK_HoaDon PRIMARY KEY (maHoaDon)
);

---------------------------------------------------------------------------------------------------------------------------------
go
--Tạo proc cập nhật số lượng đã bán
create procedure [dbo].[proc_CapNhatSoLuongXeDaBan] @maXe int, @soLuongBanThem int
as
begin
	update SoLuongXeDaBan set [soLuongDaBan]=[soLuongDaBan] + @soLuongBanThem where maXe = @maXe
end

---------------------------------------------------------------------------------------------------------------------------------
go
--Tạo proc cập nhật Tổng Chi Tiêu
create procedure [dbo].[proc_CapNhatTongChiTieu] @maAccount int, @chiTieuThem float
as
begin
	update TongChiTieuMuaHang set TongChiTieu= TongChiTieu + @chiTieuThem where [maAccount]=@maAccount
end

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng Account
insert into Account values
('admin','admin',1,'21133021@student.hcmute.edu.vn'),
('user1','user1',0,'dung12c11b10a@gmail.com'),
('user2','user2',0,'dung11112003qnga@gmail.com'),
('user3','user3',0,'dung8b7i6i@gmail.com'),
(N'naruto', N'123456',0, N'naruto@gmail.com'),
(N'sasuke', N'123456', 0, N'sasuke@gmail.com'),
(N'sakura', N'123456', 0, N'sasuke@gmail.com'),
(N'itachi', N'123456', 0, N'sasuke@gmail.com'),
(N'kakashi', N'123456', 0, N'kakashi@gmail.com'),
(N'jiraiya', N'123456', 0, N'kakashi@gmail.com')

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng DanhMuc
insert into DanhMuc values
(1, 'AirBlade'),
(2, 'Vision'),
(3, 'Wave'),
(4, 'Exciter')

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng XeMay
insert into XeMay values
(N'AirBlade 125', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/5XuDeCZU1ItWHg2346a3.jpg', 42012000, N'Xe Máy Honda AirBlade 125 (Tiêu Chuẩn)',N'Xứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', 1, N'113 kg',N'1.887 x 687 x 1.092 mm',N'124,8 cc',N'11,5:1',N'4,4 lít', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/2B1nycBIkpqCIZl4mk4Z.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/STeO5pVQ7LZdD96HVuD0.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/TE6Pse3qm96hLzOmaiae.jpg'),
(N'AirBlade 160', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/5XuDeCZU1ItWHg2346a3.jpg', 42012000, N'Xe Máy Honda AirBlade 126 (Tiêu Chuẩn)',N'Xứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', 1, N'114 kg',N'1.890 x 686 x 1.116 mm',N'156,9 cc',N'12:1',N'4,4 lít', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/2B1nycBIkpqCIZl4mk4Z.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/STeO5pVQ7LZdD96HVuD0.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/TE6Pse3qm96hLzOmaiae.jpg'),
(N'AirBlade 2008', N'https://cdn.chotot.com/u-2BwE3aW0Env1nas6WLv1TdmRFK1RJfvyrtnfrsqoM/preset:view/plain/acc7456f846ad24640739816267bbf72-2852185308416170959.jpg', 6500000, N'Xe Máy Honda AirBlade 2008 (Tiêu Chuẩn)', N'Thiết kế khỏe khoắn, bắt mắt nên dòng xe này rất được nhiều người đón nhận mặc dù chúng có giá khá cao. Phiên bản đầu tiên, Air Blade được trang bị khối dung tích là 108cc. Xe được sử dụng bộ chế hòa khí, đây là đặc điểm khác biệt nhất để người tiêu dùng có thể phân biệt được xe Air Blade đời đầu so với những đời sau này.', 1, N'105kg',N'chiều dài 1890mm, chiều cao yên 767mm',N'108 cc',N'12:1',N'4,4 lít', N'https://cdn.chotot.com/M-ni73tuNp4y4khSm_WX2-wZRmcO5rl1G0ykChcF9rU/preset:view/plain/60c7c5d63b985ff9eb59ec794f7e52fa-2852185312090512335.jpg', N'https://cdn.chotot.com/QNL07Ai_Wrv_Q3I3q6dCcBWXHIwulY1rYYdlAH5ejMU/preset:view/plain/735c8d6ff7c0e085fff2829f759fd29e-2852185312999256024.jpg', N'https://cdn.chotot.com/eAcYM_1EWlLsseU4p6kqOLM4ptXCdwtsg0mUh4zSLiA/preset:view/plain/a74a2ec9c596edc8bed4359e7a059fb8-2852185314462429935.jpg'),
(N'AirBlade 2015', N'https://cdn.chotot.com/z4xISVuwyNmW27TsMKajqsFd4bUa-YLEGNuMj2jm8iM/preset:view/plain/73d9afdb8a1a831811a9137dab81d9b8-2851201114905047515.jpg', 20500000, N'Xe Máy Honda AirBlade 2015 (Tiêu Chuẩn)',N'Xứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', 1, N'113 kg',N'1901 x 687 x 1115 mm',N'124,8 cc',N'11,5:1',N'4,4 lít', N'https://cdn.chotot.com/cFX595Huwd3TDh2TiGwNAAr2Qbn72BYdmkMHL4WpKVs/preset:view/plain/c360c21d4e84227564893783819a39b9-2851201116765992878.jpg', N'https://cdn.chotot.com/nX8HdMeidHAj4QhwRRIBT8HHphY7QXzmyEAZ3YRuv4k/preset:view/plain/e0f62de02ed81cbc00e07d3cc8c48baa-2851201117005632144.jpg', N'https://cdn.chotot.com/lcs4A1qHgIUVA9j2sZqxs5rZkxtuthwv0ZCD0swarto/preset:view/plain/2dea04bb1428f8e55594fb0c7eab1f35-2851201118582821520.jpg'),
(N'AirBlade 125', N'https://cdn.honda.com.vn/motorbike-strong-points/May2022/5XuDeCZU1ItWHg2346a3.jpg', 43200000, N'Xe Máy Honda AirBlade 125 (Đặc Biệt)',N'Xe Honda Air Blade 125 Đặc Biệt là dòng xe tay ga trung tính được mọi người yêu thích bởi thiết kế, động cơ và tiện ích mạnh mẽ, hiện đại phù hợp với nhiều lứa tuổi. Hiểu và đáp ứng tốt được nhu cầu của mọi người, Honda đã cho ra mắt phiên bản xe Honda Air Blade 125 Đặc Biệt với giá chỉ từ 40 triệu vừa túi tiền người tiêu dùng.', 1, N'113 kg',N'1.887 x 687 x 1.092 mm',N'124,8 cc',N'11,5:1',N'4,4 lít', N'https://cdn.abphotos.link/photos/resized/x/2023/10/03/1696322733_ZhTPSpnmiBwkY7uM_1696326002-phphiszhr.png', N'https://cdn.abphotos.link/photos/resized/x/2023/10/03/1696322748_THKpyGCQzi7DYZS3_1696330703-phphvq0hw.png', N'https://cdn.abphotos.link/photos/resized/x/2023/10/03/1696322765_0iemPv43lXrj8ISf_1696330067-phpe3iko9.png'),
(N'AirBlade 160', N'https://cdn.abphotos.link/photos/resized/640x/1654939227-phpo1dmz5.png', 57500000, N'Xe Máy Honda AirBlade 126 (Đặc Biệt)',N'Honda Air Blade 160 Đặc Biệt không chỉ là sự nâng cấp từ phiên bản 125, mà là một bước tiến lớn đưa trải nghiệm lái xe lên một tầm cao mới. Đám mây bụi sẽ chỉ thấy lưng người lái chinh phục mọi cung đường cùng Honda Air Blade 160 Đặc Biệt.', 1, N'114 kg',N'1.890 x 686 x 1.116 mm',N'156,9 cc',N'12:1',N'4,4 lít', N'https://cdn.abphotos.link/photos/resized/x/2023/10/04/1696409060_McZL8Qp2gWTvGDEB_1696416386-phpwlx30w.png', N'https://cdn.abphotos.link/photos/resized/x/2023/10/04/1696409154_pth4XSB8usoab3GM_1696411653-phprdbsrn.png', N'https://cdn.abphotos.link/photos/resized/x/2023/10/04/1696408828_FaEXCnBmb7eZIOR5_1696411228-phpczkeja.png'),
(N'AirBlade 2014', N'https://cdn.chotot.com/11rrbX3iduWjZ1CzHnlzYAmLgOLXga0CjJzTaVBOM44/preset:view/plain/b01fc076e897c82357d597b84fc34349-2851907307927844846.jpg', 21999999, N'Xe Máy Honda AirBlade 2014 (Tiêu Chuẩn)',N'Xứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', 1, N'113 kg',N'1901 x 687 x 1115 mm',N'124,8 cc',N'11,5:1',N'4,4 lít', N'https://cdn.chotot.com/jelF6_DI5QlLeA_wMStqEp_P0ikPc3WF6rVCinummS8/preset:view/plain/91a8c6487c18b83c23cf7c8cd2c0e5ed-2851907305675434202.jpg', N'https://cdn.chotot.com/zjF8QQQi5NjN1xowHYmzoXwNL7SCv9lgNg4JHfhLT48/preset:view/plain/366f5ca23bbb3b97ab1c09bafed7d4d5-2851907305443870725.jpg', N'https://cdn.chotot.com/YcqWVs1ItRz5hc6cdq-x3-pWga9zzIDQtSba0VVJXpg/preset:view/plain/f911ad41874b5e2a2d241cc1d14262ba-2851907302743488494.jpg'),
(N'AirBlade 2016', N'https://cdn.chotot.com/HwCMRAFesBUb-GYvtAGie2UwiPj2xCI15gLDsn17Pag/preset:view/plain/259882e17b6957580b69ee97ac192a74-2851579567240270270.jpg', 22000000, N'Xe Máy Honda AirBlade 2016 (Tiêu Chuẩn)',N'Xứng danh mẫu xe tay ga thể thao tầm trung hàng đầu trong suốt hơn một thập kỷ qua, AIR BLADE hoàn toàn mới nay được nâng cấp động cơ eSP+ 4 van độc quyền, tiên tiến nhất giúp mang trong mình mãnh lực tiên phong.', 1, N'110 kg',N'1881 x 687 x 1111 mm',N'124,9 cc',N'11:1',N'4,4 lít', N'https://cdn.chotot.com/iT0Y5dT77FPAGIZ4mX9AqPK80Pa8AT_kHCzpekXDADI/preset:view/plain/bda69f5c3a4a611da51f8803eb49b1a2-2851579567825575906.jpg', N'https://cdn.chotot.com/srlATsYfMuEjCztW76lGUAB9JxO5Zr24ubtYnjqxpYw/preset:view/plain/8e12c8583790d3c7d864741a19809a1e-2851579567011333113.jpg', N'https://cdn.chotot.com/UpVcY49bnhZFxGR3XraLJESYuXwJ9sC_h4u2U1_qKoE/preset:view/plain/c4ea253fb8723d1cd9003db90d944d7a-2851579567842364022.jpg'),
(N'AirBlade Fi', N'https://cdn.chotot.com/e3HWkdHHHhjkA3dB5Qq2YeRBlLYzsaQGSYhjri2g9dw/preset:view/plain/3ae7230b837211c9afcd924bb27bf3d0-2848681956845658036.jpg', 17900000, N'Xe Máy Honda AirBlade Fi (Tiêu Chuẩn)',N'Air Blade Fi được trang bị thêm khóa thông minh đây là một trong những phụ tùng xe AB được đánh giá cao bởi người dùng. Các phiên bản thể thao và từ tính có sự xáo trộn về màu sắc. Cụ thể, khóa thông minh chỉ được trang bị trên 3 bản cao cấp, từ tính và đen mờ. Riêng bản thể thao không có smartkey.', 1, N'110 kg',N'1881 x 687 x 1111 mm',N'124,9 cc',N'11:1',N'4,4 lít', N'https://cdn.chotot.com/sBNrrNsmiVjEDYKyX2Y5a7jbCK_4pG-MIytarfCEPcc/preset:view/plain/411bbc8f7cc80eff9107deabec96c07a-2848681956570677383.jpg', N'https://cdn.chotot.com/9tH8i9Iy_JMFawxqoCTqA8067dGzGfNW23Fpzy3ErJY/preset:view/plain/e5ef526e5b0f6500a1c0056c948c691b-2848681956632028044.jpg', N'https://cdn.chotot.com/4Alv_Ew4Q-1IgpBKhNgANLUUUI9GAvg8Th_6iNSZs-Q/preset:view/plain/139c949e9a5212b9b7e3cffd0fe6151f-2848681956063104238.jpg'),
(N'AirBlade 125i', N'https://cdn.chotot.com/jD-PWuvJCD6RtD9xMZYQedyr7Zl32scBDOL5d5Qe9tI/preset:view/plain/2e0b0e8694d98951946f3ce76f0d9635-2850280285781720457.jpg', 23900000, N'Xe Máy Honda AirBlade 125i (Tiêu Chuẩn)',N'Air Blade 125i remost 9 chủ công chứng,uỷ quyền , Mua bán sang tên ok.', 1, N'110 kg',N'1881 x 687 x 1111 mm',N'124,9 cc',N'11:1',N'4,4 lít', N'https://cdn.chotot.com/2QSbJ-O_vfLnM48tPyseFA-Titupu0AY_Do7Y35-C8I/preset:view/plain/57fc4adb15c621c08c3e0f9968d5e18b-2850280285330997959.jpg', N'https://cdn.chotot.com/YfzhVlDLtPnucMgxSFaeKDjUGd5jyP3hJIWAnBiTllk/preset:view/plain/b96b01cef5257565eb26960cf3bf060d-2850280285407834708.jpg', N'https://cdn.chotot.com/LYzbvu5bHtQz660pjB_GnP1EvAC5ueimyYXn4E5hacs/preset:view/plain/19a26d329dd1ed9362a68f4b160c490b-2850280285669845185.jpg'),

(N'Vision 2023 Thể Thao', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/3ZJP2EtKs2VxtoISRczj.jpg', 31113818, N'Xe Máy Honda Vision 2023 (Thể Thao)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/fL07ot4CJbt3Eliq9fQ2.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/OZwGqyrQizHXocCsgS1x.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/NfweVPjeSDcMN4WQuqcI.jpg'),
(N'Vision 2023 Tiêu Chuẩn', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/3ZJP2EtKs2VxtoISRczj.jpg', 31113818, N'Xe Máy Honda Vision 2023 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'94 kg',N'1.871 mm x 686 mm x 1.101 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/fL07ot4CJbt3Eliq9fQ2.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/OZwGqyrQizHXocCsgS1x.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/NfweVPjeSDcMN4WQuqcI.jpg'),
(N'Vision 2023 Đặc Biệt', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/3ZJP2EtKs2VxtoISRczj.jpg', 31113818, N'Xe Máy Honda Vision 2023 (Đặc Biệt)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'95 kg',N'1.871 mm x 686 mm x 1.101 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/fL07ot4CJbt3Eliq9fQ2.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/OZwGqyrQizHXocCsgS1x.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/November2022/NfweVPjeSDcMN4WQuqcI.jpg'),
(N'Vision 2023 Cổ Điển', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/ygwXyCxYYUBku0uC9aoA.jpg', 36612000, N'Xe Máy Honda Vision 2023 (Cổ Điển)',N'Kế thừa nét thiết kế của dòng xe SH, thân xe nhỏ gọn với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, cùng phối màu mang đậm phong cách cổ điển, đem đến hình ảnh mới lạ và độc đáo cho Vision phiên bản mới 2023.', 2, N'98 kg',N'1.925mm x 686mm x 1.126mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/UJOeAovEE1IBLLdqT2Be.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/lkueECNrm0mg65cLKQPP.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/October2023/gZS2wUcOGHhm2bqft7w8.jpg'),
(N'Vision 11Fi', N'https://cdn.chotot.com/aWpu2zGennvPccTgjCXnpcf8cCr9KgIo0sKwM0Y1h_I/preset:view/plain/4a3a40b80a0abd158be9bc51478df6bd-2850043751370265125.jpg', 11800000, N'Xe Máy Honda Vision 11Fi (Tiêu Chuẩn)', N'Mọi chức năng theo xe còn hoạt động đầy đủ ACE mua về SD ngay ko cần tốn thêm chi phí nào nữa.', 2, N'98 kg',N'1.925mm x 686mm x 1.126mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/RyWju7E-FLyAvg-6OLOrdRdCi7xGQGsdiS6cWbF3RD4/preset:view/plain/40bfc8228f1249ccee044ffbf33d13e9-2850043756538768127.jpg', N'https://cdn.chotot.com/--rFZSRclKCYZ969rHRJp3SzIJgJSqp3-KeJdbn603Y/preset:view/plain/b532d442e77f5e9fa7f41f84721d0e80-2850043753970799141.jpg', N'https://cdn.chotot.com/nHpcdYjSBEKbQOq9HAkpC9RowVVaXZiy0TozhISsnoo/preset:view/plain/b9f0540de2992610b94e64eab73129f6-2850043751841082111.jpg'),
(N'Vision 2020', N'https://cdn.chotot.com/8z8zm2weXo7n27eB08q9H2kEElfvYL6gSGTc6_rn_tI/preset:view/plain/388c11029a9316d9329b049ab30e43e7-2851585811254387994.jpg', 28800000, N'Xe Máy Honda Vision 2020 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/RqHIc81zJixqyuUyAFD_vKzuIjc9r56awhCFt_lm1V4/preset:view/plain/5ffc50bec14826ef22065507827e5709-2851585813012490466.jpg', N'https://cdn.chotot.com/a7yb70U83Cp7i7DPdxSia6DKm5xPKD2b8wD8lGOHArc/preset:view/plain/00c38a91baa7a586a06a3771c0f83504-2851585805230672610.jpg', N'https://cdn.chotot.com/I0npNZKHlf3x4O7x_tisYjTJUTfa3ze66vIUrt1sL_U/preset:view/plain/d2f0722954661b02cad47bdc5d42007e-2851585808163743970.jpg'),
(N'Vision BS43 ', N'https://cdn.chotot.com/jT9Tp17s1glluRvV2tlroKjRlP6P_d6hXSTlOHslTD8/preset:view/plain/8c492e342f719e9d059576b20fb3e967-2835669767230230574.jpg', 13500000, N'Xe Máy Honda Vision BS43 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/4V0e7_63BulSWroIZ_4AurZIx99LLDUh1ZUBEQPxhzM/preset:view/plain/90164377b3dab06c162d33a40233529c-2835669765605864531.jpg', N'https://cdn.chotot.com/2RSEY7MEtFyg-ceMq7-QU5qQlvumGlKmE0mP31wU26Q/preset:view/plain/3028b4f3a799b566681b881f52efda78-2835669762884800558.jpg', N'https://cdn.chotot.com/CKhJMubHc-u3PTb5LEcxOj7E5gfRhIoi-hxoAT_TE4A/preset:view/plain/f445b06982c1a2e29c6aafcc8960bf55-2835669765121357541.jpg'),
(N'Vision 2011', N'https://cdn.chotot.com/i0MDE8wVBGwtoI6AtbNKwhz2eISY8vnoyw2x4Lny_9o/preset:view/plain/ddd1dca05a2e4c31287933f3ddb69b6f-2850778078430195286.jpg', 20800000, N'Xe Máy Honda Vision 2011 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/F-AnBR7IL_bpcSzvGvtP7vy04qKaP02WmeWDyv-8MS8/preset:view/plain/26e98898aa734b0ed03ae6a545aee7ad-2850778076329191008.jpg', N'https://cdn.chotot.com/ZkCw9EZZ6-CkCZnHKxrfI6YLbwYuIRnDLf36LzG2oyo/preset:view/plain/9a47d96c5ad0fbae45b006ebad183347-2850778077794150264.jpg', N'https://cdn.chotot.com/jyQulO9liCh5c0i7hNybZhgpZMqpVPaH_Ovt2saDd4k/preset:view/plain/57dd4cdb4366ebb10f192c7c1daee304-2850778077851498763.jpg'),
(N'Vision 2018', N'https://cdn.chotot.com/y1j6iT4a8ANFbKQRJbtNyjESSoN4ogx8apXKk--IqtA/preset:view/plain/349ca9cecb24dbc94b09eef6df68b0d7-2808280040133341476.jpg', 17500000, N'Xe Máy Honda Vision 2018 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/bN4VYgR_Jw5BMTaAfK1SHZmLoYNqhx7lTca-WarhMZQ/preset:view/plain/0aea49b8c12ad5285337925593d17506-2808280040604877368.jpg', N'https://cdn.chotot.com/VoBgHuTLDmiJ_adr8TglLdEiR56_SbWJ8Y_UiNeuJSw/preset:view/plain/840507ec737d89144dfa3e06d3259c70-2808280040360671838.jpg', N'https://cdn.chotot.com/HnlHD84SKe0aM5TY-zBi9QAUqISYY0EA31R36kkVebQ/preset:view/plain/1dc08cddbc86077c0e5e65541a944869-2808280040294947876.jpg'),
(N'Vision 7/2020', N'https://cdn.chotot.com/dWP2aUmp45mqPr4hTUYWxHAI8vDZleLtyHPPsJPAWW8/preset:view/plain/f74c4008fc7b2af6116cfe3b9de12228-2852469615396895796.jpg', 26500000, N'Xe Máy Honda Vision 7/2020 (Tiêu Chuẩn)',N'Thân xe nhỏ gọn kế thừa nét thiết kế của dòng xe SH, với những đường nét rõ ràng, liền mạch kết hợp hài hòa với phong cách trẻ trung, thời trang, nay nổi bật và cuốn hút hơn với màu mới lạ trên phiên bản đặc biệt và phiên bản thể thao. Ngoài ra, các họa tiết tinh tế được thể hiện trên nhiều chi tiết thiết kế giúp đem lại hình ảnh thời trang cho mẫu xe mới.', 2, N'98 kg',N'1.925 mm x 686 mm x 1.126 mm',N'109,5 cc',N'10,0:1',N'4,9 L', N'https://cdn.chotot.com/RiIKQAx3C6IsLM_z8YvVDZIhN964cLmJg0wpEd_Fw3o/preset:view/plain/c1dae1c951311feb200cd9d28314c2b7-2852469615891493498.jpg', N'https://cdn.chotot.com/PEnDoCuinTuxwpQ4DLTXdikN79HtxRd9bLoFJzORKZM/preset:view/plain/fe50b0772b5d6bfee1b9ff6c106e2c7b-2852469617913543732.jpg', N'https://cdn.chotot.com/2-TsTspK6V_C87-ukxnTPAQaOduAFpzoSMa6jOP4uT8/preset:view/plain/f034a69b76c516ebe441388803478ce7-2852469613903658036.jpg'),

(N'Wave Alpha Cổ Điển', N'https://cdn.honda.com.vn/motorbikes/September2023/MC0pjdXcHPj9gBxllqiW.png', 18939273, N'Xe Máy Honda Wave Alpha phiên bản cổ điển',N'Ra mắt tháng 09 năm 2023, Wave Alpha phiên bản cổ điển với 2 màu hoàn toàn mới cùng bộ tem được phối màu đầy ấn tượng, thu hút ánh nhìn, giúp bạn thể hiện phong cách cổ điển trong thời đại mới.', 3, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'109,2 cc',N'9,0:1',N'3,7 L', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/OQqfDpCrAHqf7HgM7aBY.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/aMYRXiTDzwKd0EjU9HYd.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/September2023/v5OAWqdhRz64wfvRpfZJ.jpg'),
(N'Wave Alpha 110cc', N'https://cdn.honda.com.vn/motorbikes/July2023/SBHwws3nBDfY9EKLU6Eh.png', 17859273, N'Xe Máy Honda Wave Alpha 110cc (Tiêu Chuẩn)',N'Wave Alpha được trang bị động cơ 110cc với hiệu suất vượt trội nhưng vẫn đảm bảo tiết kiệm nhiên liệu tối ưu, cho bạn thêm tự tin và trải nghiệm tốt nhất trên mọi hành trình. Thêm vào đó, 4 màu - 2 phiên bản cùng thiết kế bộ tem mới phong cách đầy ấn tượng trên xe giúp bạn thể hiện sự trẻ trung, năng động, thu hút mọi ánh nhìn.', 3, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'109,2 cc',N'9,0:1',N'3,7 L', N'https://cdn.honda.com.vn/motorbike-strong-points/July2023/NyeJDaabXKegK3tRHzwy.png', N'https://cdn.honda.com.vn/motorbike-strong-points/July2023/z85orAXNqebWITiPOhD1.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/July2023/d01MTcRPw5eXTcokRLkq.jpg'),
(N'Wave RSX FI 110', N'https://cdn.honda.com.vn/motorbike-strong-points/December2022/Y2oE0HQfpu9GvVKkFLZo.jpg', 21737455, N'Xe Máy Honda Wave RSX FI 110 (Tiêu Chuẩn)',N'Sắc đen nhám được áp dụng lần đầu tiên trên phiên bản Đặc biệt (vành nan hoa, phanh đĩa) đem đến hình ảnh ấn tượng, nam tính. Phiên bản Thể thao (vành đúc, phanh đĩa) tạo điểm nhấn với 3 màu sắc đỏ, trắng, xanh được biến tấu về tông màu, giúp tăng thêm vẻ thể thao, nổi bật. Phiên bản Tiêu chuẩn (vành nan hoa phanh cơ) sở hữu sắc đỏ mạnh mẽ.', 3, N'99 kg (vành đúc) 98 kg (vành nan hoa/phanh cơ) 99 kg (vành nan hoa/phanh đĩa)',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.honda.com.vn/motorbike-strong-points/December2022/CZctuw4jMDQn8y5T8PmP.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/December2022/2i1AGHLNYxYr2SRHWaZb.jpg', N'https://cdn.honda.com.vn/motorbike-strong-points/December2022/RnY4xpVdb1yTAq4fDjdT.jpg'),
(N'Wave ZX', N'https://cdn.chotot.com/zkILOWIGSBPR1tZyeRn5Im2fUpJP0t8s78A1Z3JZuR4/preset:view/plain/bca8ed1781b5b18d67e9c8eacbe8e01b-2852533153856109713.jpg', 12000000, N'Xe Máy Honda Wave ZX (Tiêu Chuẩn)',N'Máy êm .Điện đề đủ.', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/5wR7nW6kJKDiExsdZ6HAx4rdpxLl69EPna6PriRCYdI/preset:view/plain/f73fcdd73e4d91de073a35966794484e-2852533154866620654.jpg', N'https://cdn.chotot.com/qVEswxh666r4_gw2hDKXc8EAzG7rQAfB4eqfVtRLTew/preset:view/plain/ae264d4611087130f7dcda2d7376d0ae-2852533153879054531.jpg', N'https://cdn.chotot.com/VW2fHygKVpzvpPp17SaX0M_SzF3lx7axfpL6RXapIDM/preset:view/plain/3cddf9eb481599721340931c16af9bd1-2852533153873185977.jpg'),
(N'Wave A 110', N'https://cdn.chotot.com/Ec9nUTVGEu3vQviAA-OkDC0WplxXJD7Kb0JUIhifKw0/preset:view/plain/3625c7fa79bf0e9115ab95b27819af0c-2851293481224073415.jpg', 10500000, N'Xe Máy Honda Wave A 100 (Tiêu Chuẩn)',N'Cần thanh lý xe wave a 110 bstp nhu hinh chup xe zin chay còn êm vot không hao xăng xe còn đầy đủ các chức năng giao cavet gôc mua bán tai nhà bao không ai tranh châp nhé.', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/f4NW_DYQTlxQc6L-gRy4WxHU1iMo3CWAkwBKuUgbqLc/preset:view/plain/4628f06361fd746bdb25adf2ac37c94e-2851293481233667807.jpg', N'https://cdn.chotot.com/3xO_L-8vFWB1jtd-xYF8cpbPLHh1xWJDwJeb-pjx3-c/preset:view/plain/7e6db2b3fb9c264ae18bb2688387cb0c-2847573117422267458.jpg', N'https://cdn.chotot.com/c0ILka2fYVSyaN34OoeFNjq4pm21boqRM4LXhM1XDn8/preset:view/plain/1d47e62937fb36dc0ec7ad65e6f1de33-2847573117345699397.jpg'),
(N'Wave Alpha 2004', N'https://cdn.chotot.com/MknR0bezce7VAxodFOocNl3o3pDlPxBMxrnJQIGHE44/preset:view/plain/01aefc44250b0e31e08250762aabacf3-2847427183871004301.jpg', 15800000, N'Xe Máy Honda Wave Alpha 2004 (Tiêu Chuẩn)',N'Xe không gì tả hình sao xe vậy ae qua xem xe trực tiếp.', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/rP8ASbiZnu_ta-THqRD2kOECa19OZCQluB_VI16D_KE/preset:view/plain/8170d1943581702f466e68e1febb2b0b-2847427183787331936.jpg', N'https://cdn.chotot.com/utrdv1MOIVrqICWqTetIi7BgA6HIjZoiNG5u67-NiPo/preset:view/plain/c214336a39d1d5272252fe4f736c9f89-2847427183814535921.jpg', N'https://cdn.chotot.com/ZUPRrPcTHDF5ajsw4VRJGdTY7tz6djZXATB5VnZHo08/preset:view/plain/6d2500fc9e3ac0616ccaa9d90b76f7a6-2847427183955123923.jpg'),
(N'Wave Blade 110', N'https://cdn.chotot.com/lHcMLhydS0_j9OFbDYf5TEvCsjiWkI1yDUar5lvy2zs/preset:view/plain/f90070d613fbf688f3244fc70a705985-2846795051623682331.jpg', 9500000, N'Xe Máy Honda Wave Blade 110 Đen Nguyên Bản',N'xe đăng ký chính chủ từ mới hàng ngày đi làm gần nhà nên còn rất mới chưa sửa chữa gì đảm bảo anh chị đến ngà xem xe sẽ ưng ý ngay . Mua bán tại nhà giêng giá có bớt cho người mua về sử dụng ạ .', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/peSgNwK6TlZR_px_h4wXQUhJ8y8vbQwPLpET19uUFGY/preset:view/plain/a469fc9cb2040a24f1db03a0287523f6-2846795052592214361.jpg', N'https://cdn.chotot.com/lxnvc9FXaYlm-gBTtXsoYOIMhscEimhjvUWiQ1MgS_A/preset:view/plain/2d481e774d564bf5cd8cb35f44e5f821-2846795052305446621.jpg', N'https://cdn.chotot.com/7Vs4eCkr02bU5zIMqFbvAT5-ov3D7lWMSWX5WNT17g4/preset:view/plain/442d15e09ea83f29e3442085fe1f788d-2846795052602202825.jpg'),
(N'Wave Hàn Quốc', N'https://cdn.chotot.com/U76MngIScRMjsCxw0QV2zlieQtysVorYQJT5L1ob_8A/preset:view/plain/186c755b5c6de0c665e9b4ea8329963d-2851328804366928671.jpg', 3700000, N'Xe Máy Honda Wave Hàn Quốc (Tiêu Chuẩn)',N'Cần bán xe wave hàng quốc xe đẹp giấy tờ đầy đủ xe chạy rất OK cho anh em đi làm tốt giá bình dân', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/vVRvuaNMnRRViBUw5mBg0wtKJiQl-dzKiB1S38w36xg/preset:view/plain/54952660c1ea10145a66b01f61503e3e-2851328799023023533.jpg', N'https://cdn.chotot.com/6Ih_JfbLs3K7sWGz6FojNQlQrT7l2CzPoU5ydc9WQOc/preset:view/plain/e2eda5275ccee394762d9688d41eef29-2851328798577129801.jpg', N'https://cdn.chotot.com/OaBFuPME36nMwoZnJC5UwvOVFJAGXKyvBldhIwyuUYY/preset:view/plain/0a23a653f0b2fc67922dc1f6bedcce83-2851328801766329119.jpg'),
(N'Wave 110', N'https://cdn.chotot.com/zfUXw3x9BA1VlgXaMp59DM39kWl22MWMWfoJfJJsqQE/preset:view/plain/fa23bf8ce21b579752d74a0657ddbe44-2852486096514429562.jpg', 3800000, N'Xe Máy Honda Wave 110 (Tiêu Chuẩn)',N'Wave 110 kiểng mới cứng y hình,phuộc đĩa Honda nhật rin máy bao yêm đi xa tur phượt đường dài tốt kéo tốc độ mướt,chạy cực kỳ yêm ko nghe tiếng động, đi xa tur phượt về quê tốt', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/Hi0fikSg8WMnnHMLHeagkeIbXhlK2M2SQ4zquKu_j-Q/preset:view/plain/b0da680de6ac01bccf85f6ac42fc57da-2852486096864191141.jpg', N'https://cdn.chotot.com/ecX4PlZBODJBpkOvjQ_YXVDlNwQ3TPfBH1_5xbuDFbE/preset:view/plain/81074869c99c5cdaa96d0825fc008f0f-2852486092617981981.jpg', N'https://cdn.chotot.com/D6VCruHM_me-uM89mHLusIFfbrjqLacuVybl4qY0Igw/preset:view/plain/21fcd26c8ca25c31a247d764e0a51136-2852486089532416677.jpg'),
(N'Wave Halim', N'https://cdn.chotot.com/2kqDpH9VTm21PFasWWrUscfBgrOxzib-F1X59Ajs3BA/preset:view/plain/e3b20deb42879b691eb5dd22d8a968aa-2851779039508223198.jpg', 4900000, N'Xe Máy Honda Wave Halim (Tiêu Chuẩn)',N'Rất phù hợp với a chi học sinh sinh viên di học đường xa', 3, N'99 kg',N'1.921 mm x 709 mm x 1.081 mm',N'109,2 cc',N'9,3 : 1',N'4,0 L', N'https://cdn.chotot.com/zVC36Dy14UWO3bxrngIRXAUWEnRYXA-XPRFWNmXWru0/preset:view/plain/3f616f9b7564edba13ad1e1e80c28347-2851779039924587957.jpg', N'https://cdn.chotot.com/8kNU3tS9NH4mAE9vevlTtAMlrPNVKiyl8_SZ-dguHlg/preset:view/plain/40ee01ddf8e52b67ff2f09654bd459eb-2851779045008215477.jpg', N'https://cdn.chotot.com/EyvbwIz-nh8E9BfTo8NYoV2L7mdUAl8RxlfK2VWGe6w/preset:view/plain/20d612a0a7af6ef52d4283c9bcafb976-2851779042465440996.jpg'),

(N'Exciter 2010 5p71', N'https://cdn.chotot.com/KrYH-ML_Tpw1odwUGWY_IA3Qij2cEw5lLvX48Ua26Nc/preset:view/plain/c1c6af840b35074334c32c5599a5cb1f-2829717064936482913.jpg', 37500000, N'Xe Máy Yamaha Exciter 2010 5p71',N'Xe máy móc Máy móc thì cực kì êm , cái này dám bao Ae nhe. Chạy bao tê nhe..! Dàn áo zin sơn còn đẹp leng keng. Rất thích hợp cho Ae chạy đi làm or chạy Grap..! Tiền nào của nấy nhe Ae. Xe lúc trước mua lại có giấy tờ cavet đầy đủ, mua bán tại nhà photto cmnd viết giấy bao tranh chấp cho Ae yên tâm.', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/0q8IUsbfLOTV9kfgnk4HEye0yzxXhaQUpbhWsGsUBbU/preset:view/plain/9690f6fb37ed8859ad34648f05eba522-2829717064925800310.jpg', N'https://cdn.chotot.com/tN1iQc3PmyF_lN_kGHnCPvkQyCrJvhb-qImbT7PWJAg/preset:view/plain/5be76df54c763728fbf87f6d29f2a154-2829717064735488308.jpg', N'https://cdn.chotot.com/0vm01hHwWVoL5vqiVJMypKvDfQnoCjI2aopjzA7HJSw/preset:view/plain/da8faae6b5576c581c4119d775f87b7d-2829717065335666723.jpg'),
(N'Exciter 2014', N'https://cdn.chotot.com/F-ve7DmQQEb3ZGOXbA2D_e2QJjYqGz0LNiNJXB0nGvw/preset:view/plain/369d69dff0e3dcda4862e146cc1d05bc-2850991870758734322.jpg', 24800000, N'Xe Máy Yamaha Exciter 2014',N'Exciter up ao full đồ chơi Xịn xò chất lượng', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/qqY7kktafkEmjPd2h5uAFN9HVEnS8JPYDjks6EMzqEk/preset:view/plain/df14535414794316d6648a4c9d26422b-2850991870881501012.jpg', N'https://cdn.chotot.com/ruGXbheoLSsgKX4M5ALDAk8QGBq-fLqro7v7DgyqXEs/preset:view/plain/311a04f98000a45f6a80ef306172c9a5-2850991869627793335.jpg', N'https://cdn.chotot.com/2Sb3Slt1oIRn6RrHVIhyha6z5lnQRqmN6UOshhqU46w/preset:view/plain/f3a226768345427d2be31a015c4589b7-2850991871125691265.jpg'),
(N'Exciter 155', N'https://cdn.chotot.com/ZnymHfpWOasnurdG6Tui3NjYdLSjAV0wD6jjV1s5WfY/preset:view/plain/97e6983e726e132fe2259c04b8aba8d8-2846574863604882373.jpg', 33500000, N'Xe Máy Yamaha Exciter 155',N'Cửa hàng có đầy đủ dịch vụ Sang tên, đổi biển, cấp lại đăng ký cho khách trong thời gian ngắn .', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/rsdUAQCZQR_GmDX5za-7_5NK0vnmz-YAxMl-gTrjzDI/preset:view/plain/b3ff8a951c77c545d3319e147202fb85-2846574863658631018.jpg', N'https://cdn.chotot.com/lc3iyrButWustYQsbTzWU2lXzrpVRW2G3gSihXVvjGo/preset:view/plain/7d03312a8ce499d941de15f0656a1316-2846574863995882477.jpg', N'https://cdn.chotot.com/U9IuFJX2ljA20WFY3cIouV1xrM93r5i1W8pRYgBxWBI/preset:view/plain/31d1b5c8cceae516a5f14d09f2680011-2846574862687004923.jpg'),
(N'Exciter 135', N'https://cdn.chotot.com/p3Ds1oVmWvL6HxU7k4jfO4ni2uuQR4JlJjgZWZuyLOU/preset:view/plain/6ff030eeccda3059fe942154cfb4791a-2847835298674950381.jpg', 12500000, N'Xe Máy Yamaha Exciter 135',N'Xe máy zin hình thức đẹp nilong dán kín xe đầy đủ 2 gương 2 khoá theo xe.', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/IFi9UqCf6eURQ20vH4pceu_7Tbg7RslE4oOSjNtRyBY/preset:view/plain/f1f8a497b256de7cb72224b6ce64fd70-2847835297727930170.jpg', N'https://cdn.chotot.com/XwGmXvX-5dpthsUqZ-NHNQjklhbUg8s39_sFk06Gzro/preset:view/plain/ca5a905615c13cf22db71a6370397743-2847835298113478110.jpg', N'https://cdn.chotot.com/Jq6VQkec-8vfp_CNBtZkCYB16aI67utEZ-9mofUKigk/preset:view/plain/4e4f1bf6cdf291c8d6f5c2f3e2c45407-2847835297914999352.jpg'),
(N'Exciter 2015', N'https://cdn.chotot.com/Yz-rrw_S9MnyLPITJP-WMffKRajvUOxRq2VhxQS34WM/preset:view/plain/c07d001ac5eafcb914a82126e38ae0aa-2852501388829965364.jpg', 16800000, N'Xe Máy Yamaha Exciter 2015',N'Bảo Hành Máy Móc 3Tháng Cho Anh Chị Yên Tâm Sử Dụng', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/lkoyHDBN1Et51GU-bspoDTGZNtMWfZ4S3aiBA2lr7hs/preset:view/plain/b71db5257e67571db5a5f8436a57a15e-2852501389847732466.jpg', N'https://cdn.chotot.com/yYpZq1F00MbHoxrd27Eu1JArDMQDOzQJV2ZSDTyXa9M/preset:view/plain/a9642a328db225b52f6b7ce311bbde78-2852501390839156695.jpg', N'https://cdn.chotot.com/cD9y4iAQ8sLtrh2V-7pgSKw5Ru9PPlJjYQcuh7z12Ho/preset:view/plain/83f9c5c3afd1a50cb76c34725a5f3309-2852501392012268209.jpg'),
(N'Exciter 150', N'https://cdn.chotot.com/odqD1duxJdYV_FF3Y_AdUs9jac1auXo3nuDy73y89LY/preset:view/plain/f048a066b5bc5e41870bd4fd12d90088-2821311611726994100.jpg', 22800000, N'Xe Máy Yamaha Exciter 150',N'cần bán Xe. máy móc nguyên bản xe còn mới tinh Đẹp xuất sắc luôn', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/R_oTQ2zoEOGT4ve76IDx9mIOQ62_hI4v_xrPdgawjFg/preset:view/plain/7e3cf52e8c86059aa45d0c0a36505cb0-2821311611671439835.jpg', N'https://cdn.chotot.com/kPo1NYrx9iiihi6KawocTNHyikPGoDXLn5hHs4TBlGo/preset:view/plain/a6da61942c4b8ef15e178dec0aa9da03-2821311611771039900.jpg', N'https://cdn.chotot.com/ed4YedVsd2k9J3GjVOxsohq8WE0HI0UVxut3pqFMRoU/preset:view/plain/df40351fc66b00bb4cef94125d12bb90-2821311611846680300.jpg'),
(N'Exciter 2018', N'https://cdn.chotot.com/WHVNz-vGNihPZ0uKcBHXFLfkc3tu1-ITlEp_WgxdwsM/preset:view/plain/6c58e819ed4efa462e54b48049b58e06-2852310989567317577.jpg', 22000000, N'Xe Máy Yamaha Exciter 2018',N'Máy cực kì chất, bao nhẹ ,Bao đầu chưa rớt , bao không một tiếng động lạ', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/wDq2vJf7WYcv8jEcnc_Ugq_54x4EdJzpdx5XoDYaVRI/preset:view/plain/9af7b5133044d1aaf99c11a0237d5d82-2852310989386009578.jpg', N'https://cdn.chotot.com/HGmmtRQ1ziKtJlZqCgVxoFvxpnQXg2ixgKwKEhLEPwU/preset:view/plain/527fd5bfd8beb3d5bf5abf8a9e2e99cf-2852310989372552980.jpg', N'https://cdn.chotot.com/CP2wWHTzDbpyt3u2zFCpF8vRZPdFwsXw9LANgtBGb6Y/preset:view/plain/b235b9ffcc9a30dd20af6f543ae2354c-2852310989290330450.jpg'),
(N'Exciter 2021', N'https://cdn.chotot.com/rJcM-_P1rWBsYr9VSFoYFE7a0mIeV6QOhYe3WQTwYcc/preset:view/plain/dd0d4ed04ba4af0640770d1de2715c81-2813638888345130859.jpg', 18500000, N'Xe Máy Yamaha Exciter 2021',N'Do ko có nhu cầu dùng nên mình cần bán chiếc xe này, xe vẫn còn nguyên bản 100%. Hình thức vẫn gián nilon cả xe. Xe nhà đi giữ gìn và bảo dưỡng thường xuyên nên các ah chị yên tâm. Xe đky đầy đủ vẫn còn hồ sơ nên ah chị về sang tên thỏa mái luôn', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/1re5tZzITVi8xZelFcsq6-jyZoEyMrvFw0g1sOcQnDM/preset:view/plain/fa06af71d5bc3a1c7b01780adb3ccf79-2813638887619349973.jpg', N'https://cdn.chotot.com/MGtuy2SWzOiZwEJ927898IXYDtuBAihfkAwf8sHNzrk/preset:view/plain/75fd352f9d8b56d4dc0a7164b454910a-2813638892222903515.jpg', N'https://cdn.chotot.com/RA18x--qoB38GWarjs7s3BkmgUEvFG4EqK9wGC4Hq6I/preset:view/plain/77696429ec66f22180d0239d46aa47eb-2813638891714793391.jpg'),
(N'Exciter RC 155cc', N'https://cdn.chotot.com/yUpYbWKfNNrT5__5MLyY4yGQYzbDBfRlgP4XnB2-dIc/preset:view/plain/a5a49e3e597e7c257166a7602f80253c-2836675906170904824.jpg', 32000000, N'Xe Máy Yamaha Exciter RC 155cc',N'xe ok , chuẩn bao hãng test bao thầy thợ luôn , nhanh tay nha cả nhà ơi', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/sP6p4I3tAtex9ww_SMRDQdFFCcPsB9ZugyQVyH6vOPk/preset:view/plain/f4721eb298420778337b93cb9a91ec6c-2836675905785535466.jpg', N'https://cdn.chotot.com/DXx76YhyYowWw2A9mdrr0LF48xi0uWtK7Ko2XoTbZec/preset:view/plain/c3c02cf23dee92b90cefeb2d5dba4ad2-2836675909476081912.jpg', N'https://cdn.chotot.com/MqquJfcsVSh1eW6HaEURae2MydBQKETtv1GwdrBr7Dw/preset:view/plain/e7f158116c018aa59ac3838388ba53fa-2836675906567305087.jpg'),
(N'Exciter 2017', N'https://cdn.chotot.com/G4HEOzxujghCZVix3jDXdTmkUbbx6jkC6t-jUVEmrC4/preset:view/plain/9717b8b3c5d0f2e68f02ebbd478fa8d0-2847238285347652278.jpg', 19800000 , N'Xe Máy Yamaha Exciter 2017',N'bộ phận máy móc nguyên zin , mình cam đoan ko tháo mở sửa chửa , ko độ bậy bạ nhé', 4, N'96 kg',N'1.913 mm x 689 mm x 1.076 mm',N'135 cc',N'10,9 : 1',N'4 lít', N'https://cdn.chotot.com/8GY0Bo-5dFOkM0K-T2KjsAoYzoAYsU5DCzwePp5Sk4Y/preset:view/plain/045e4f61eefaba2ceb4f7c431bae74cd-2847238285997964595.jpg', N'https://cdn.chotot.com/4h41yfXmDeNe2eaTqqYuwzMSIGjlGY4szplJGCEeKVA/preset:view/plain/e796650c6ed4cfe151ef145d28b7bc90-2847238285515091156.jpg', N'https://cdn.chotot.com/3MRXVOpVRGMl5Iwaxo_y-xFNJtkNyej2AHsLwwuQNSg/preset:view/plain/16dcbd4635dc6ddd5d07edcf545c91b2-2847238284824761621.jpg')

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng SoLuongXeDaBan
--LƯU Ý: XEM LẠI MÃ XE MÁY TRƯỚC KHI THÊM
INSERT INTO SoLuongXeDaBan VALUES 
(1,125),
(2,25),
(3,15),
(5,105),
(8,120),
(9,100),
(15,155),
(30,135),
(20,105),
(27,115)

--select top(10) *from SoLuongXeDaBan order by soLuongDaBan desc

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng FeedBack
--LƯU Y: XEM LẠI MÃ ACCOUNT, MÃ XE MÁY TRƯỚC KHI THÊM

--SELECT * FROM Account
--SELECT * FROM XeMay where tenXe = 'AirBlade Test 123'

INSERT INTO FeedBack VALUES 
(2,1,N'Xe gì mà tuyệt vời quá chừng','2023-11-18'),
(2,1,N'Trải nghiệm oke','2023-11-15'),
(2,1,N'Còn gì êm hơn','2023-11-18')

--select *from FeedBack

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng TongChiTieuMuaHang
--LƯU Ý: XEM LẠI MÃ ACCOUNT TRƯỚC KHI THÊM

--SELECT * FROM Account



INSERT INTO TongChiTieuMuaHang VALUES
(2,15000000),
(4,12000000)

---------------------------------------------------------------------------------------------------------------------------------
go
--Thêm Data Mẫu vào bảng HoaDon
insert into HoaDon values
(1, 39128292, CAST(N'2023-11-01T00:00:00.000' AS DateTime)),
(1, 30743724, CAST(N'2023-11-02T00:00:00.000' AS DateTime)),
(1, 39395216, CAST(N'2023-08-20T00:00:00.000' AS DateTime)),
(1, 89779598, CAST(N'2023-07-20T00:00:00.000' AS DateTime)),
(1, 75160471, CAST(N'2023-11-03T00:00:00.000' AS DateTime)),
(1, 52422919, CAST(N'2023-11-04T00:00:00.000' AS DateTime)),
(1, 37428657, CAST(N'2023-11-05T00:00:00.000' AS DateTime)),
(2, 48843013, CAST(N'2023-11-06T00:00:00.000' AS DateTime)),
(2, 34589668, CAST(N'2023-11-07T00:00:00.000' AS DateTime)),
( 1, 50492584, CAST(N'2023-09-20T00:00:00.000' AS DateTime)),
( 1, 89110186, CAST(N'2023-11-08T00:00:00.000' AS DateTime)),
( 1, 88412429, CAST(N'2023-10-20T00:00:00.000' AS DateTime)),
( 1, 60694999, CAST(N'2023-11-09T00:00:00.000' AS DateTime)),
( 2, 35977245, CAST(N'2023-10-01T00:00:00.000' AS DateTime)),
( 3, 95115631, CAST(N'2023-11-10T00:00:00.000' AS DateTime)),
( 2, 50408884, CAST(N'2023-09-05T00:00:00.000' AS DateTime)),
( 2, 31402624, CAST(N'2023-08-06T00:00:00.000' AS DateTime)),
( 3, 65378537, CAST(N'2023-07-07T00:00:00.000' AS DateTime)),
( 3, 88501726, CAST(N'2023-06-06T00:00:00.000' AS DateTime)),
( 3, 51744440, CAST(N'2023-05-05T00:00:00.000' AS DateTime)),
( 2, 39024653, CAST(N'2023-04-04T00:00:00.000' AS DateTime)),
( 3, 90828993, CAST(N'2023-03-03T00:00:00.000' AS DateTime)),
( 2, 86528691, CAST(N'2023-02-02T00:00:00.000' AS DateTime)),
( 1, 51707568, CAST(N'2023-01-01T00:00:00.000' AS DateTime)),
( 1, 37633273, CAST(N'2023-10-25T00:00:00.000' AS DateTime)),
( 1, 43689727, CAST(N'2023-10-26T00:00:00.000' AS DateTime)),
( 1, 91104010, CAST(N'2023-10-29T00:00:00.000' AS DateTime)),
( 1, 53769851, CAST(N'2023-10-29T00:00:00.000' AS DateTime)),
( 1, 92108076, CAST(N'2023-10-29T00:00:00.000' AS DateTime)),
( 1, 30520077, CAST(N'2023-11-11T00:00:00.000' AS DateTime)),
( 1, 77566170, CAST(N'2023-11-12T00:00:00.000' AS DateTime)),
( 1, 33040637, CAST(N'2023-11-13T00:00:00.000' AS DateTime)),
( 1, 89586006, CAST(N'2023-11-14T00:00:00.000' AS DateTime)),
(1, 74389279, CAST(N'2023-11-15T00:00:00.000' AS DateTime))
