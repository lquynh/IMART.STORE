
USE shop0903


GO
create table slide
(id  int not null identity(1,1),
 image nvarchar(100) not null,
 link nvarchar(100) not null,
 title nvarchar(100) default null ,
 status tinyint NOT NULL DEFAULT '1', --'1: show , 0: hide'
 primary key (id)
 );

 create table page_url
 (id int Not null identity(1,1),
  url nvarchar(255) Not null unique,
  primary key (id)
  )

  create table categories
  (id int not null identity(1,1),
   id_parent int DEFAULT NULL,
   name nvarchar(200) not null,
   id_url int DEFAULT NULL,
   icon nvarchar(50) DEFAULT NULL,
   primary key (id),
   foreign key (id_url) references page_url(id)
   )
   
   create table products
   (id int Not null identity(1,1),
    id_type int Not null,
	id_url int DEFAULT NULL,
	name nvarchar(100) Not null ,
	detail nvarchar(1000) Not null,
	price float Not null,
	promotion_price float Not null DEFAULT '0',
	promotion nvarchar(1000),
	image nvarchar(100) Not null,
	status tinyint Not null DEFAULT '0' , --'0: sp bình thường, 1: sp đặc biệt' 
	new tinyint Not null DEFAULT '0' , --'0: old, 1:new'
	update_at date Not null,
	deleted tinyint Not null DEFAULT '0'  , --'0: chua xoa, 1: da xoa'
	primary key (id),
	foreign key (id_type) references categories(id),
	foreign key (id_url) references page_url(id)

	)

 create table customers
 (id int Not null identity(1,1),
  name nvarchar(100) Not null,
  username nvarchar(20) Not null unique,
  password nvarchar(100) NOT NULL,
  gender nvarchar(50) DEFAULT NULL,
  email nvarchar(50) Not null,
  address nvarchar(100) Not null,
  phone nvarchar(50) Not null,
  note nvarchar(255) Not null,
  primary key (id)
  )
  
  CREATE TABLE users (
  id int not null identity(1,1),
  username nvarchar(20) Not null unique,
  password nvarchar(100) NOT NULL,
  fullname nvarchar(100) DEFAULT NULL,
  birthdate date DEFAULT NULL,
  gender nvarchar(10) DEFAULT NULL,
  address nvarchar(100) DEFAULT NULL,
  email nvarchar(50) NOT NULL unique,
  phone nvarchar(20) DEFAULT NULL,
  remember_token nvarchar(1000) DEFAULT NULL,
  updated_at datetime NOT NULL ,
  created_at datetime NOT NULL,
  primary key (id)
)

  CREATE TABLE role (
  id int not null identity(1,1),
  role nvarchar(10) not null DEFAULT 'staff',
  primary key (id)
)

CREATE TABLE role_user (
  id int not null,
  role_id int not null,
  user_id int not null,
  primary key (id),
  foreign key (role_id) references role(id),
  foreign key (user_id) references users(id)
)

create table bills
(id int not null identity(1,1),
 id_customers int not null,
 date_order date not null,
 total float not null,
 payment_method nvarchar(100) default null,
 note nvarchar(255) default null,
 token nvarchar(100) default null,
 toke_date float default null,
 status tinyint not null default '0',
 primary key (id),
 foreign key (id_customers) references customers(id)
 )
 
 create table bill_detail
 (id int not null identity(1,1),
  id_bill int  not null,
  id_product int not null,
  quanlity int not null,
  price float not null,
  primary key (id),
  foreign key (id_bill) references bills(id),
  foreign key (id_product) references products(id)
  )

INSERT INTO shop0903.dbo.slide VALUES ('slider-img3.jpg', '', 'Sale off 75% all products', 1),
('slider-img1.jpg', '', 'Slide 01', 1),
('slider-img2.jpg', '', 'Slide  02', 1),
('slider-img4.jpg', '', 'Slide 04', 0),
('slider-img5.jpg', '', 'Slide 05', 0);

INSERT INTO shop0903.dbo.role
        ( role )
VALUES  ( N'admin'  -- role - nvarchar(10)
          )


INSERT INTO shop0903.dbo.users VALUES('huonghuong', '1', N'Huong Hương', '2018-04-03', N'nữ', N'Quận 1', 'huongnguyenak96@gmail.com', '', NULL, '2018-04-15 01:35:57', '2018-04-15 01:35:57'),
('huong', '$2y$10$VUzKYiO.2u2Xgqm9ve7CqeyyxSufM4LQTlKImXn576go7.DeeHvQC', NULL, NULL, NULL, NULL, 'huong@gmail.com', NULL, NULL, '2018-04-24 23:28:25', '2018-04-24 23:28:25'),
('1377764620473', '$2y$10$u8e2QbsKypZ6.B5X7vANMO1dN0xjgaEGpZzqaB5hUDHDbvJ4YnqNm', NULL, NULL, NULL, NULL, '206154413404huong@gmail.com', NULL, NULL, '2018-04-24 23:31:01', '2018-04-24 23:31:01'),
('712286668573', '$2y$10$IOvA1jVv1tUrKY0bD8VyOe0bNCbIVMQKNX2.zkOyXZ0s1g9U4vt..', NULL, NULL, NULL, NULL, '400563674038huong@gmail.com', NULL, NULL, '2018-04-24 23:31:02', '2018-04-24 23:31:02'),
('430470243514', '$2y$10$86AhDsGbqaeNIRD1xiAfTuLuMHkcyzrtC09ieQNUIeniKCVheYJI.', NULL, NULL, NULL, NULL, '365431308610huong@gmail.com', NULL, NULL, '2018-04-24 23:35:26', '2018-04-24 23:35:26'),
('1290848086886', '$2y$10$g1q9ZWlhsiO6xztfEEL.Wey5v7lKJoz6GtLWkoTZKolMpPk7Yctia', NULL, NULL, NULL, NULL, '520082013187huong@gmail.com', NULL, NULL, '2018-04-24 23:46:55', '2018-04-24 23:46:55'),
('508681521599', '$2y$10$m8RqEzvCT5kGMLsJwOu/aOgKwCpFLm8qCHlQDJXQTaQ6jZK23CyRy', NULL, NULL, NULL, NULL, '176387046602huong@gmail.com', NULL, NULL, '2018-04-24 23:47:06', '2018-04-24 23:47:06'),
('743473894842', '$2y$10$IHBNFF49q98SbU06dcB9AuTv9U9fkIVrUptBGKhMlDd8iTZXsFDcK', NULL, NULL, NULL, NULL, '554508995187huong@gmail.com', NULL, NULL, '2018-04-24 23:49:37', '2018-04-24 23:49:37'),
('1193393599394', '$2y$10$Wed3VIJK0GUJi16md4FG3.cLrsN9PClpnykQPZrNbJvk7D3OOy552', NULL, NULL, NULL, NULL, '396956636862huong@gmail.com', NULL, NULL, '2018-04-24 23:51:54', '2018-04-24 23:51:54');


INSERT INTO shop0903.dbo.page_url VALUES
('iphone'),
('ipad'),
('macbook'),
('apple-watch'),
('phu-kien'),
('iphone-x'),
('iphone-8-8plus'),
('iphone-7-7plus'),
('iphone-6-6plus'),
('ipad-pro'),
('ipad-new-2017'),
('ipad-mini-4'),
('imac-mac-pro'),
('macbook-12-inch'),
('macbook-air'),
('macbook-pro-retina'),
('imac'),
('mac-pro'),
('mac-mini'),
('iphone-x-256gb'),
('iphone-x-64gb'),
('iphone-8-plus-256gb'),
('iphone-8-256gb'),
('iphone-8-plus-64gb'),
('iphone-8-64gb'),
('iphone-7-plus-32gb'),
('iphone-7-32gb'),
('iphone-6s-plus-32gb'),
('iphone-6-32gb-(2017)'),
('ipad-pro-105-wi-fi-64gb-(2017)'),
('ipad-pro-105-wi-fi-4g-64gb-(2017)'),
('ipad-pro-105-wi-fi-4g-256gb-(2017)'),
('ipad-pro-129-wi-fi-4g-512gb-(2017)'),
('ipad-pro-105-wi-fi-256gb-(2017)'),
('ipad-pro-129--wi-fi-64gb-(2017)'),
('ipad-pro-129-wi-fi-4g-64gb-(2017)'),
('ipad-pro-129-wi-fi-256gb-(2017)'),
('ipad-pro-129-wi-fi-4g-256gb-(2017)'),
('ipad-pro-105-wi-fi-4g-512gb-(2017)'),
('ipad-wi-fi-32gb-(2017)'),
('ipad-wi-fi-128gb-(2017)'),
('ipad-wi-fi-4g-32gb-(2017)'),
('ipad-wi-fi-4g-128gb-(2017)'),
('ipad-mini-4-wi-fi-4g-128gb'),
('apple-watch-series-1-38mm,-vien-nhom,-day-mau-trang'),
('apple-watch-series-1-42mm,-vien-nhom,-day-mau-den'),
('apple-watch-series-3-gps-38mm,-vien-nhom,-day-mau-trang-xam'),
('apple-watch-series-3-gps-38mm,-vien-nhom,-day-mau-hong'),
('apple-watch-series-3-gps-42mm,-vien-nhom,-day-mau-den'),
('apple-cap-chuyen-doi-lightning-to-35mm'),
('apple-sac-magsafe-to-magsafe-2-converter'),
('apple-sac-nguon-5w-usb-power-adapter'),
('apple-cap-ket-noi-lightning-to-usb-cable'),
('apple-cap-apple-cap-ket-noi-30-pin-to-usb-cable'),
('apple-sac-12w-usb-power-adapter'),
('apple-cap-lightning-to-usb-cable-(2m)'),
('apple-cap-hdmi-to-hdmi-cable-18m'),
('apple-cap-usb-c-charge-cable-(2m)'),
('pknk-cap-ket-noi-lightning-to-usb-c-mk0x2zaa'),
('apple-tai-nghe-earpods-with-lightning-connection'),
('apple-cap-ket-noi-apple-lightning-to-30-pin-adapter'),
('apple-tai-nghe-earpods-with-remote-and-mic'),
('apple-cap-usb-c-to-usb'),
('apple-cap-lightning-to-usb-camera-adapter'),
('apple-cap-mini-displayport-to-vga-adapter'),
('apple-cap-thunderbolt-to-gigabit-ethernet-adapter'),
('apple-op-lung-iphone-78-silicon-cocoa'),
('apple-op-lung-iphone-78-silicon-pink-sand'),
('apple-op-lung-iphone-78-silicon-sea-blue'),
('apple-op-lung-iphone-78-silicon-red'),
('apple-op-lung-iphone-87--silicon-rose-red'),
('apple-op-lung-iphone-87--silicon-white'),
('pknk-op-lung-iphone-87--silicon-dark-olive-mr3n2fea'),
('pknk-op-lung-iphone-87--silicon-ultra-violet-mqgr2fea'),
('apple-op-lung-iphone-66s-leather-red'),
('apple-op-lung-iphone-66s-plus-leather-midnight-blue'),
('apple-op-lung-iphone-7-plus8-plus-silicon-pink-sand'),
('apple-op-lung-iphone-7-plus8-plus-silicon-cocoa'),
('imac-2017-4k-retina-display-215-inch---mndy2---core-i5-30ghz-8gb-hdd-1tb'),
('imac-2017-5k-retina-display-27inch---mne92---core-i5-34ghz-8gb-fusion-drive-1tb'),
('imac-2017-4k-retina-display-215-inch---mne02---core-i5-34ghz-8gb-hdd-1tb'),
('imac-2017-5k-retina-display-27inch---mned2---core-i5-38ghz-8gb-fusion-drive-2tb'),
('imac-215-inch-2017---mmqa2---core-i5-23ghz-8gb-hdd-1tb'),
('imac-mk482-(retina-5k,-27-inch,-late-2015)---core-i5--33ghz-fursion-drive'),
('mac-pro-md878-6-core-dual-gpu-d700-12gb-new-99-used'),
('imac-pro-–-mq2y2-(8core32g1tbvega-56)-–-new'),
('mac-pro-me253-quad-core-256gb-dual-gpu-d300-new-99-used'),
('imac-pro-mq2y2-option-(10core128gb2tbvega-64)-like-new-99'),
('imac-pro-–-mq2y2-option-(14core64g2tbvega-64)'),
('mac-mini-2014-core-i5-26ghz-8gb-1tb-new-99'),
('macbook-12-inch-2017-core-i5-8gb-512gb-(nhieu-mau)'),
('macbook-12-inch-2017-core-m3-8gb-256gb-(-nhieu-mau-)'),
('the-new-macbook-2016---mmgm2---12--core-m5--ram-8gb--ssd-512gb-(rose-gold)'),
('macbook-air-2015--116-inch-mjvp2--max-option'),
('macbook-air-mjvm2-(116-inch,-early-2015)---core-i5--ram-4gb--ssd-128gb'),
('macbook-air-mqd32-(133-inch,-2017)---core-i5--ram-8gb--ssd-128gb'),
('macbook-air-mqd32-(133-inch,-2017)---core-i5--ram-8gb--ssd-128gb-new-99'),
('macbook-air-mqd42-(133-inch,-2017)---core-i5--ram-8gb--ssd-256gb'),
('macbook-pro-133-2017-mpxq2-(core-i5--8gb--128gb)-(gray-space-)'),
('macbook-pro-133-2017-mpxt2-(core-i5--8gb--256gb)-new-100'),
('macbook-pro-retina-mjlq2-(154-inch,-mid-2015)---core-i7--ram-16gb--ssd-256gb'),
('mlh12-macbook-2016-touchbar-13-inch-16gb-256gb-touchbar-likenew-99'),
('mnqf2-macbook-2016-touchbar-13-inch-16gb-used-new-97'),
('mnqf2-macbook-2016-touchbar-13-inch-i5-16gb-512gb-ssd-touchbar'),
('mnqg2---macbook-pro-retina-2016-13inch-512gb-touch-bar-(silver)--new-99'),
('mptr2---macbook-pro-2017-15-inch-ssd-256gb-touchbar-(-space-gray)'),
('mptt2---macbook-pro-2017-15-inch-quad-i7-31ghz-1tb-ssd-option-(space-gray)'),
('mptt2---macbook-pro-2017-15-inch-ssd-512gb-touchbar-(-space-gray)'),
('mptu2---macbook-pro-2017-15-inch-ssd-256gb-touchbar-(sliver)'),
('mptv2---macbook-pro-2017-15-inch-ssd-512gb-touchbar-(-silver-)'),
('mpxv2--macbook-pro-retina-2017-13-inch-256gb-touchbar-(-gray-space-)'),
('mpxw2---macbook-pro-retina-2017-13inch-ssd-512gb-touchbar-(gray-space-)'),
('mpxx2---macbook-pro-retina-2017-13inch-ssd-256gb-touchbar-(-silver-)'),
('mpxy2---macbook-pro-retina-2017-13inch-ssd-512gb-touchbar-(-silver-)');

INSERT INTO shop0903.dbo.categories VALUES(NULL, 'iPhone', 1, 'fa-mobile fa-2x'),
(NULL, 'iPad', 2, 'fa-tablet'),
(NULL, 'Macbook', 3, 'fa-laptop'),
(NULL, 'iMac - Mac Pro', 13, 'fa-desktop'),
(NULL, 'Apple Watch', 4, 'fa-clock-o'),
(NULL, 'Phụ kiện', 5, 'fa-headphones'),
(1, 'iPhone X', 6, NULL),
(1, 'iPhone 8|8Plus', 7, NULL),
(1, 'iPhone 7|7Plus', 8, NULL),
(1, 'iPhone 6|6Plus', 9, NULL),
(2, 'iPad Pro', 10, NULL),
(2, 'iPad (New) 2017', 11, NULL),
(2, 'iPad mini 4', 12, NULL),
(3, 'Macbook 12 inch', 14, NULL),
(3, 'Macbook Air', 15, NULL),
(3, 'Macbook Pro Retina', 16, NULL),
(4, 'iMAC', 17, NULL),
(4, 'MacPro', 18, NULL),
(4, 'Mac mini', 19, NULL);



INSERT INTO shop0903.dbo.products VALUES
(7, 20, 'iPhone X 256GB', N'Màn Hình: 5.8 inchs OLED\n        Camera: 7.0 MP/ Dual 12.0 MP\n        Pin: 2716 mAh, Li-Ion battery\n        Ram: 3 GB\n        CPU: Apple A11 Bionic\n        HĐH: iOS 11', 34790000, 32790000, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Giảm ngay 1,000,000đMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không q', 'iphone-x-256gb.png', 0, 0, '2018-04-03', 0),
(7, 21, N'iPhone X 64GB', N'Màn Hình: 5.8 inchs OLED\n        Camera: 7.0 MP/ Dual 12.0 MP\n        Pin: 2716 mAh, Li-Ion battery\n        Ram: 3 GB\n        CPU: Apple A11 Bionic\n        HĐH: iOS 11', 29990000, 29900000, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Giảm ngay 1,000,000đMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không q', 'iphone-x-64gb.png', 1, 1, '2018-04-02', 0),
(8, 22, N'iPhone 8 Plus 256GB', N'Màn Hình: 5.5 inchs HD Retina\n	Camera: 7.0 MP/ Dual 12.0 MP\n	Pin: 2675 mAh\n	Ram: 3 GB\n	CPU:Apple A11 Bionic\n	HĐH: iOS 11', 28790000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Giảm ngay 1,000,000đMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không q', 'iphone-8-plus-256gb.png', 0, 0, '2018-02-16', 0),
(8, 23, N'iPhone 8 256GB', N'Màn Hình: 4.7 inch\n	Camera: 12.0 MP/ 7.0 MP\n	Pin: 1821 mAh\n	Ram: 2 GB\n	CPU: Apple A11 Bionic\n	HĐH: iOS 11', 25790000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Giảm ngay 1,000,000đMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không q', 'iphone-8-256gb.png', 0, 0, '2018-02-16', 0),
(8, 24, N'iPhone 8 Plus 64GB', N'Màn Hình: 5.5 inchs HD Retina\n	Camera: 7.0 MP/ Dual 12.0 MP\n	Pin: 2675 mAh\n	Ram: 3 GB\n	CPU : Apple A11 Bionic\n	HĐH: iOS 11', 23990000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'iphone-8-plus-64gb.png', 0, 0, '2018-02-16', 0),
(8, 25, N'iPhone 8 64GB', N'Màn Hình: 4.7 inchs \n	Camera: 12.0 MP/ 7.0 MP\n	Pin: 1821 mAh\n	Ram: 2 GB\n	CPU: Apple A11 Bionic\n	HĐH: iOS 11', 20990000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'iphone-8-64gb.png', 0, 0, '2018-02-16', 0),
(9, 26, N'iPhone 7 Plus 32GB', N'Màn Hình: 5.5 inch (1920 x 1080 pixels)\n	Camera: Chính: Dual Camera 12.0MP; Phụ: 7.0MP\n	Pin:  Li-Ion 11.1 Wh (2900 mAh)\n	Ram: 3 GB\n	CPU : Apple A10, 4 Nhân, Quad-core 2.3 GHz\n	HĐH: iOS', 19999000, 19909000, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'iphone-7-plus-32gb.png', 1, 1, '2018-02-16', 0),
(9, 27, N'iPhone 7 32GB', N'Màn Hình: 4.7 inch(1334 x 750 pixel)\n	Camera: Chính: 12.0 MP, Phụ: 7.0 MP\n	Pin:  Li-Ion 7.45 Wh (1960 mAh)\n	Ram: 2 GB\n	CPU : Apple A10, 4 Nhân, 2.3 Ghz\n	HĐH: iOS 10', 15999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'iphone-7-32gb.png', 0, 0, '2018-02-16', 0),
(10, 28, N'iPhone 6s Plus 32GB', N'Màn Hình:  5.5 inch, 1080 x 1920 pixels\n	Camera: 12.0 MP/ 5.0MP\n	Pin:  lithium-ion battery 2750mAh\n	Ram: 2 GB\n	CPU : Apple A9, 2 Nhân, Dual-core 1.8 GHz\n	HĐH: iOS 10', 13999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Giảm ngay 1,000,000đMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không q', 'iphone-6s-plus-32gb.png', 0, 0, '2018-02-16', 0),
(10, 29, N'iPhone 6 32GB (2017)', N'Màn Hình:  4.7 inch (1334 x 750 pixels)\n	Camera: Chính: 8.0 MP, Phụ: 1.2 MP\n	Pin: Lithium - Ion 1810mAh\n	Ram: 1GB \n	CPU : Apple A8 2 nhân 64-bit, 2 Nhân, 1.4 GHz\n	HĐH: iOS', 7999000, 0, N'GÍA ĐẶC BIỆT ĐẾN 15.04 : 6,999,000đ\n\nMua combo (iPhone - Apple Watch) giảm thêm 1,000,000đ\nHOẶC MUA VỚI GIÁ THƯỜNG: 7,999,000đ\n\nTrả góp 0%\n	Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đ', 'iphone-6-32gb-(2017).png', 1, 0, '2018-02-16', 0),
(11, 30, N'iPad Pro 10.5 WI-FI 64GB (2017)', N'Màn Hình : Retina display, , 10.5 inch(1668 x 2224 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 30.4 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi\n	HĐH : iOS', 16999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-105-wi-fi-64gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 31, 'iPad Pro 10.5 WI-FI 4G 64GB (2017)', N'Màn Hình : Retina display, , 10.5 inch(1668 x 2224 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 30.4 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 19999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-105-wi-fi-4g-64gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 32, 'iPad Pro 10.5 WI-FI 4G 256GB (2017)', N'Màn Hình : Retina display, , 10.5 inch(1668 x 2224 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 30.4 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 23999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-105-wi-fi-4g-256gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 33, 'iPad Pro 12.9 WI-FI 4G 512GB (2017)', N'Màn Hình : Retina display, , 12.9 inch(2732 x 2048 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 41 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 32999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-129-wi-fi-4g-512gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 34, 'iPad Pro 10.5 WI-FI 256GB (2017)', N'Màn Hình : Retina display, , 10.5 inch(1668 x 2224 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 30.4 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Không\n	HĐH : iOS', 20999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-105-wi-fi-256gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 35, 'iPad Pro 12.9  WI-FI 64GB (2017)', N'Màn Hình : Retina display, , 12.9 inch(2732 x 2048 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 41 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Không\n	HĐH : iOS', 20999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-129--wi-fi-64gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 36, 'iPad Pro 12.9 WI-FI 4G 64GB (2017)', N'Màn Hình : Retina display, , 12.9 inch(2732 x 2048 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 41 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 23999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-129-wi-fi-4g-64gb-(2017).png', 0, 0, '2018-02-16', 0),
(11, 37, 'iPad Pro 12.9 WI-FI 256GB (2017)', N'Màn Hình : Retina display, , 12.9 inch(2732 x 2048 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 41 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Không\n	HĐH : iOS', 24999000, 24699000, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-129-wi-fi-256gb-(2017).png', 1, 0, '2018-02-16', 0),
(11, 38, 'iPad Pro 12.9 WI-FI 4G 256GB (2017)', N'Màn Hình : Retina display, , 12.9 inch(2732 x 2048 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 41 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 27999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-129-wi-fi-4g-256gb-(2017).png', 1, 1, '2018-02-16', 0),
(11, 39, 'iPad Pro 10.5 WI-FI 4G 512GB (2017)', N'Màn Hình : Retina display, , 10.5 inch(1668 x 2224 pixels)\n	Camera : 12.0 MP, /7.0 MP\n	Pin : 30.4 W/h Lithium - Polymer\n	Ram : 4 GB\n	Kết Nối : Wi-Fi (802.11a/b/g/n/ac), , Có, , Có\n	HĐH : iOS', 28999000, 28399000, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Tặng Office 365 PersonalKM2:Tặng Office 365 PersonalGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm n', 'ipad-pro-105-wi-fi-4g-512gb-(2017).png', 0, 1, '2018-02-16', 0),
(12, 40, 'iPad Wi-Fi 32GB (2017)', N'Màn Hình : Retina display, , 9.7 inch(2048 x 1536 pixels)\n	Camera : 8.0 MP, /1.2 MP\n	Pin : 32.4 Wh Lithium - Ion\n	Ram : 2 GB\n	Kết Nối : Không\n	HĐH : iOS', 8999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%KM2:Giảm ngay 500,000đGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm ngay 2% và không quá 300,000đ k', 'ipad-wi-fi-32gb-(2017).png', 0, 0, '2018-02-16', 0),
(12, 41, 'iPad Wi-Fi 128GB (2017)', N'Màn Hình : Retina display, , 9.7 inch(2048 x 1536 pixels)\n	Camera : 8.0 MP, /1.2 MP\n	Pin : 32.4 Wh Lithium - Ion\n	Ram : 2GB \n	Kết Nối : Không\n	HĐH : iOS', 10999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%KM2:Giảm ngay 500,000đGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm ngay 2% và không quá 300,000đ k', 'ipad-wi-fi-128gb-(2017).png', 0, 1, '2018-02-16', 0),
(12, 42, 'iPad Wi-Fi 4G 32GB (2017)', N'Màn Hình : Retina display, , 9.7 inch(2048 x 1536 pixels)\n	Camera : 8.0 MP, /1.2 MP\n	Pin : 32.4 Wh Lithium - Ion\n	Ram : 2 GB\n	Kết Nối : Wi‑Fi,3G,4G\n	HĐH : iOS', 12999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%KM2:Giảm ngay 500,000đGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm ngay 2% và không quá 300,000đ k', 'ipad-wi-fi-4g-32gb-(2017).png', 0, 0, '2018-02-16', 0),
(12, 43, 'iPad Wi-Fi 4G 128GB (2017)', N'Màn Hình : Retina display, , 9.7 inch(2048 x 1536 pixels)\n	Camera : 8.0 MP, /1.2 MP\n	Pin : 32.4 Wh Lithium - Ion\n	Ram : 2 GB\n	Kết Nối : Wi‑Fi (802.11a/b/g/n/ac); dual band (2.4GHz and 5GHz); HT80 with MIMO, , UMTS/HSPA/HSPA+/​DC‑HSDPA (850, 900, 1700/2100, 1900, 2100 MHz); GSM/EDGE (850, 900, 1800, 1900 MHz), , LTE (Bands 1, 2, 3, 4, 5, 7, 8, 12, 13, 17, 18, 19, 20, 25, 26, 28, 29, 38, 39, 40, 41)\n	HĐH : iOS', 14999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%KM2:Giảm ngay 500,000đGiảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm ngay 2% và không quá 300,000đ k', 'ipad-wi-fi-4g-128gb-(2017).png', 0, 0, '2018-02-16', 0),
(13, 44, 'iPad Mini 4 Wi-Fi 4G 128GB', N'Màn Hình : Rentina, , 7.9 inch(2048 x 1536 pixels)\n	Camera : 8.0 MP, /1.2 MP\n	Pin : 19.1Whr Li-Po\n	Ram : 2GB DDR3\n	Kết Nối : Wi‑Fi 802.11a/​b/​g/​n/​ac, , HSDPA 850/ 900/ 1700/ 1900/ 2100 MHz, , LTE\n	HĐH :', 13999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%KM2:Giảm ngay 4% và không quá 600,000đ khi Trả góp qua Thẻ tín dụng HSBC (áp dụng 3 ngày cuối tuần)Giảm ngay 2% và không quá 300,000đ khi Trả góp qua Thẻ', 'ipad-mini-4-wi-fi-4g-128gb.png', 0, 1, '2018-02-16', 0),
(5, 45, N'Apple Watch Series 1 38mm, viền nhôm, dây màu trắng', N'Dòng máy tương thích : iPhone\n	Hiển thị màn hình : OLED Retina display with Force Touch (450 nits)\n	Xử lý/ Bộ nhớ : S1P dual-core\n	Dung lượng Pin/Thời gian sử dụng : Lên đến 18h\n	Thông báo : Tin nhắn, cuộc gọi,...', 7999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'apple-watch-series-1-38mm,-vien-nhom,-day-mau-trang.png', 0, 0, '2018-02-16', 0),
(5, 46, N'Apple Watch Series 1 42mm, viền nhôm, dây màu đen', N'Dòng máy tương thích : iPhone\n	Hiển thị màn hình : OLED Retina display with Force Touch (450 nits)\n	Xử lý/ Bộ nhớ : S1P dual-core\n	Dung lượng Pin/Thời gian sử dụng : Lên đến 18h\n	Thông báo : Tin nhắn, cuộc gọi,...', 8999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'apple-watch-series-1-42mm,-vien-nhom,-day-mau-den.png', 0, 0, '2018-02-16', 0),
(5, 47, N'Apple Watch Series 3 GPS 38mm, viền nhôm, dây màu trắng xám', N'Dòng máy tương thích : iPhone\n	Hiển thị màn hình : OLED Retina display with Force Touch\n	Xử lý/ Bộ nhớ : W2 chip\n	Dung lượng Pin/Thời gian sử dụng : Lên đến 18h\n	Thông báo : Tin nhắn, cuộc gọi,..\n ', 9999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'apple-watch-series-3-gps-38mm,-vien-nhom,-day-mau-trang-xam.png', 0, 0, '2018-02-16', 0),
(5, 48, N'Apple Watch Series 3 GPS 38mm, viền nhôm, dây màu hồng', N'Dòng máy tương thích : iPhone\n	Hiển thị màn hình : OLED Retina display with Force Touch\n	Xử lý/ Bộ nhớ : W2 chip\n	Dung lượng Pin/Thời gian sử dụng : Lên đến 18h\n	Thông báo : Tin nhắn, cuộc gọi,..', 9999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'apple-watch-series-3-gps-38mm,-vien-nhom,-day-mau-hong.png', 0, 0, '2018-02-16', 0),
(6, 49, N'Apple Watch Series 3 GPS 42mm, viền nhôm, dây màu đen', N'Bộ nhớ: 8 GB\n	RAM: 768 MB\n	Màn hình: AMOLED\n	Đồ họa: PowerVR\n	Hệ điều hành: watchOS\n	Giao tiếp mạng: Wi-Fi 802.11 b/g/n, Bluetooth 4.2\n	Dung lượng pin: Li-Ion 279 mAh\n	Khối lượng: 32.3 g', 10999000, 0, N'Khách hàng chọn 1 trong 2 KM sau:KM1:Trả góp 0%Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đKM2:Mua combo (iPhone - Apple Watch) giảm thêm 1,000,000đGiảm ngay 4% và không quá 600,000đ khi Trả ', 'apple-watch-series-3-gps-42mm,-vien-nhom,-day-mau-den.png', 0, 0, '2018-02-16', 0),
(6, 50, N'Apple Cáp chuyển đổi Lightning to 3.5mm', '', 299000, 0, '', 'apple-cap-chuyen-doi-lightning-to-35mm.png', 0, 0, '2018-02-16', 0),
(6, 51, N'Apple Sạc Magsafe to Magsafe 2 Converter', '', 349000, 0, '', 'apple-sac-magsafe-to-magsafe-2-converter.png', 0, 0, '2018-02-16', 0),
(6, 52, N'Apple Sạc nguồn 5W USB Power Adapter', '', 499000, 0, '', 'apple-sac-nguon-5w-usb-power-adapter.png', 0, 0, '2018-02-16', 0),
(6, 53, N'Apple Cáp kết nối Lightning to USB Cable', '', 499000, 0, '', 'apple-cap-ket-noi-lightning-to-usb-cable.png', 0, 0, '2018-02-16', 0),
(6, 54, N'Apple Cáp Apple Cáp kết nối 30-pin to USB Cable', '', 599000, 0, '', 'apple-cap-apple-cap-ket-noi-30-pin-to-usb-cable.png', 0, 0, '2018-02-16', 0),
(6, 55, N'Apple Sạc 12W Usb Power Adapter', '', 599000, 0, '', 'apple-sac-12w-usb-power-adapter.png', 0, 0, '2018-02-16', 0),
(6, 56, N'Apple Cáp Lightning to USB Cable (2m)', '', 699000, 0, '', 'apple-cap-lightning-to-usb-cable-(2m).png', 0, 0, '2018-02-16', 0),
(6, 57, N'Apple Cáp HDMI to HDMI cable 1.8M', '', 699000, 0, '', 'apple-cap-hdmi-to-hdmi-cable-18m.png', 0, 0, '2018-02-16', 0),
(6, 58, N'Apple Cáp USB-C Charge Cable (2m)', '', 699000, 0, '', 'apple-cap-usb-c-charge-cable-(2m).png', 0, 0, '2018-02-16', 0),
(6, 59, N'PKNK Cáp kết nối Lightning to USB-C MK0X2ZA/A', '', 799000, 0, '', 'pknk-cap-ket-noi-lightning-to-usb-c-mk0x2zaa.png', 0, 0, '2018-02-16', 0),
(6, 60, N'Apple Tai nghe Earpods with Lightning Connection', '', 799000, 0, '', 'apple-tai-nghe-earpods-with-lightning-connection.png', 0, 0, '2018-02-16', 0),
(6, 61, N'Apple Cáp kết nối Apple Lightning to 30-pin Adapter', '', 799000, 0, '', 'apple-cap-ket-noi-apple-lightning-to-30-pin-adapter.png', 0, 0, '2018-02-16', 0),
(6, 62, N'Apple Tai nghe Earpods with Remote and Mic', '', 799000, 0, '', 'apple-tai-nghe-earpods-with-remote-and-mic.png', 0, 0, '2018-02-16', 0),
(6, 63, N'Apple Cáp USB-C to USB', '', 799000, 0, '', 'apple-cap-usb-c-to-usb.png', 0, 0, '2018-02-16', 0),
(6, 64, N'Apple Cáp Lightning to USB Camera Adapter', '', 899000, 0, '', 'apple-cap-lightning-to-usb-camera-adapter.png', 0, 0, '2018-02-16', 0),
(6, 65, N'Apple Cáp Mini DisplayPort to VGA Adapter', '', 999000, 0, '', 'apple-cap-mini-displayport-to-vga-adapter.png', 0, 0, '2018-02-16', 0),
(6, 66, N'Apple Cáp Thunderbolt to Gigabit Ethernet Adapter', '', 999000, 0, '', 'apple-cap-thunderbolt-to-gigabit-ethernet-adapter.png', 0, 0, '2018-02-16', 0),
(6, 67, N'Apple Ốp lưng iPhone 7/8 Silicon Cocoa', '', 999000, 988000, '', 'apple-op-lung-iphone-78-silicon-cocoa.png', 0, 0, '2018-02-16', 0),
(6, 68, N'Apple Ốp lưng iPhone 7/8 Silicon Pink Sand', '', 999000, 989000, '', 'apple-op-lung-iphone-78-silicon-pink-sand.png', 0, 0, '2018-02-16', 0),
(6, 69, N'Apple Ốp lưng iPhone 7/8 Silicon Sea Blue', '', 999000, 989000, '', 'apple-op-lung-iphone-78-silicon-sea-blue.png', 0, 0, '2018-02-16', 0),
(6, 70, N'Apple Ốp lưng iPhone 7/8 Silicon Red', '', 999000, 0, '', 'apple-op-lung-iphone-78-silicon-red.png', 0, 0, '2018-02-16', 0),
(6, 71, N'Apple Ốp lưng iPhone 8/7  Silicon Rose Red', '', 999000, 0, '', 'apple-op-lung-iphone-87--silicon-rose-red.png', 0, 0, '2018-02-16', 0),
(6, 72, N'Apple Ốp lưng iPhone 8/7  Silicon White', '', 999000, 0, '', 'apple-op-lung-iphone-87--silicon-white.png', 0, 0, '2018-02-16', 0),
(6, 73, N'PKNK Ốp lưng iPhone 8/7  Silicon Dark Olive MR3N2FE/A', '', 1099000, 1059000, '', 'pknk-op-lung-iphone-87--silicon-dark-olive-mr3n2fea.png', 0, 0, '2018-02-16', 0),
(6, 74, N'PKNK Ốp lưng iPhone 8/7  Silicon Ultra Violet MQGR2FE/A', '', 1099000, 0, '', 'pknk-op-lung-iphone-87--silicon-ultra-violet-mqgr2fea.png', 0, 0, '2018-02-16', 0),
(6, 75, N'Apple Ốp lưng iPhone 6/6s Leather Red', '', 1099000, 0, '', 'apple-op-lung-iphone-66s-leather-red.png', 0, 0, '2018-02-16', 0),
(6, 76, N'Apple Ốp lưng iPhone 6/6s Plus Leather Midnight Blue', '', 1299000, 0, '', 'apple-op-lung-iphone-66s-plus-leather-midnight-blue.png', 0, 0, '2018-02-16', 0),
(6, 77, N'Apple Ốp lưng iPhone 7 Plus/8 Plus Silicon Pink Sand', '', 1299000, 0, '', 'apple-op-lung-iphone-7-plus8-plus-silicon-pink-sand.png', 0, 0, '2018-02-16', 0),
(6, 78, N'Apple Ốp lưng iPhone 7 Plus/8 Plus Silicon Cocoa', '', 1299000, 0, '', 'apple-op-lung-iphone-7-plus8-plus-silicon-cocoa.png', 0, 0, '2018-02-16', 0),
(17, 79, 'iMac 2017 4K Retina Display 21.5 inch - MNDY2 - Core i5 3.0GHz/ 8GB/ HDD 1TB', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 31900000, 0, '', 'imac-2017-4k-retina-display-215-inch---mndy2---core-i5-30ghz-8gb-hdd-1tb.png', 0, 0, '2018-02-16', 0),
(17, 80, 'iMac 2017 5K Retina Display 27inch - MNE92 - Core i5 3.4GHz/ 8GB/ Fusion Drive 1TB', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 45990000, 0, '', 'imac-2017-5k-retina-display-27inch---mne92---core-i5-34ghz-8gb-fusion-drive-1tb.png', 0, 0, '2018-02-16', 0),
(17, 81, 'iMac 2017 4K Retina Display 21.5 inch - MNE02 - Core i5 3.4GHz/ 8GB/ HDD 1TB', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 38500000, 0, '', 'imac-2017-4k-retina-display-215-inch---mne02---core-i5-34ghz-8gb-hdd-1tb.png', 0, 0, '2018-02-16', 0),
(17, 82, 'iMac 2017 5K Retina Display 27inch - MNED2 - Core i5 3.8GHz/ 8GB/ Fusion Drive 2TB', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 57500000, 0, '', 'imac-2017-5k-retina-display-27inch---mned2---core-i5-38ghz-8gb-fusion-drive-2tb.png', 0, 0, '2018-02-16', 0),
(17, 83, 'iMac 21.5 inch 2017 - MMQA2 - Core i5 2.3GHz/ 8GB/ HDD 1TB', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 25500000, 0, '', 'imac-215-inch-2017---mmqa2---core-i5-23ghz-8gb-hdd-1tb.png', 0, 0, '2018-02-16', 0),
(17, 84, 'iMac MK482 (Retina 5K, 27 inch, Late 2015) - Core i5 / 3.3Ghz Fursion Drive', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 40900000, 0, '', 'imac-mk482-(retina-5k,-27-inch,-late-2015)---core-i5--33ghz-fursion-drive.png', 0, 0, '2018-02-16', 0),
(18, 85, 'Mac Pro MD878  - 6-Core / Dual GPU D700 12GB New 99% -USED', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 77000000, 0, '', 'mac-pro-md878----6-core--dual-gpu-d700-12gb-new-99--used.png', 0, 0, '2018-02-16', 0),
(17, 86, 'iMac Pro – MQ2Y2 (8Core/32G/1TB/Vega 56) – New', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 129000000, 0, '', 'imac-pro-–-mq2y2-(8core32g1tbvega-56)-–-new.png', 0, 0, '2018-02-16', 0),
(18, 87, 'Mac Pro ME253  - Quad-Core / 256GB / Dual GPU D300  New 99% -USED', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 39000000, 0, '', 'mac-pro-me253----quad-core--256gb--dual-gpu-d300--new-99--used.png', 0, 0, '2018-02-16', 0),
(17, 88, 'iMac Pro – MQ2Y2 Option (10Core/128Gb/2TB/Vega 64) Like New 99%', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 197000000, 195000000, '', 'imac-pro-–-mq2y2-option-(10core128gb2tbvega-64)-like-new-99.png', 1, 0, '2018-02-16', 0),
(17, 89, 'iMac Pro – MQ2Y2 Option (14Core/64G/2TB/Vega 64)', N'- Bộ vi xử lý: 3.4GHz Core i5 (Turbo Boost lên đến 3.8GHz)\n    - Ram: 8GB of 2400MHz DDR4\n    - Ổ cứng: 1TB (5400 rpm) Fusion Drive hoặc 256GB hoặc 512GB SSD\n    - Đồ họa: Radeon Pro 570 with 4GB of VRAM\n    - Màn hình: 27inch (diagonal) Retina 5K display\n    - Độ phân giải: 5210 × 2880pixels, với hỗ trợ hàng tỷ màu\n    - Cổng mạng: Wi-Fi 802.11ac Khả năng tương thích chuẩn IEEE 802.11a/b/g/n, Bluetooth 4.2\n    - Khe cắm: Giắc cắm tai nghe 3,5 mm, Khe cắm thẻ SDXC.', 209000000, 0, '', 'imac-pro-–-mq2y2-option-(14core64g2tbvega-64).png', 0, 0, '2018-02-16', 0),
(19, 90, 'Mac mini 2014 Core I5 2.6Ghz 8GB 1TB New 99%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 12500000, 0, '', 'mac-mini-2014-core-i5-26ghz-8gb-1tb-new-99.png', 0, 0, '2018-02-16', 0),
(14, 91, N'Macbook 12 inch 2017 Core I5 8GB 512GB (Nhiều Màu)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 36500000, 0, '', 'macbook-12-inch-2017-core-i5-8gb-512gb-(nhieu-mau).png', 0, 0, '2018-02-16', 0),
(14, 92, N'Macbook 12 inch 2017 Core M3 8GB 256GB ( Nhiều Màu )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 29900000, 0, '', 'macbook-12-inch-2017-core-m3-8gb-256gb-(-nhieu-mau-).png', 0, 0, '2018-02-16', 0),
(16, 93, 'The New MacBook 2016 - MMGM2 - 12 / Core m5 / RAM 8GB / SSD 512GB (Rose Gold)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 27900000, 0, '', 'the-new-macbook-2016---mmgm2---12--core-m5--ram-8gb--ssd-512gb-(rose-gold).png', 0, 0, '2018-02-16', 0),
(14, 94, 'Macbook Air 2015 -11.6 inch MJVP2- Max Option', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 19500000, 0, '', 'macbook-air-2015--116-inch-mjvp2--max-option.png', 1, 0, '2018-02-16', 0),
(14, 95, 'Macbook Air MJVM2 (11.6 inch, Early 2015) - Core i5 / RAM 4GB / SSD 128GB', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 16900000, 0, '', 'macbook-air-mjvm2-(116-inch,-early-2015)---core-i5--ram-4gb--ssd-128gb.png', 0, 0, '2018-02-16', 0),
(14, 96, 'Macbook Air MQD32 (13.3 inch, 2017) - Core i5 / RAM 8GB / SSD 128GB', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 20200000, 0, '', 'macbook-air-mqd32-(133-inch,-2017)---core-i5--ram-8gb--ssd-128gb.png', 0, 0, '2018-02-16', 0),
(14, 97, 'Macbook Air MQD32 (13.3 inch, 2017) - Core i5 / RAM 8GB / SSD 128GB New 99%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 17900000, 17300000, '', 'macbook-air-mqd32-(133-inch,-2017)---core-i5--ram-8gb--ssd-128gb-new-99.png', 0, 0, '2018-02-16', 0),
(14, 98, 'Macbook Air MQD42 (13.3 inch, 2017) - Core i5 / RAM 8GB / SSD 256GB', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 25500000, 0, '', 'macbook-air-mqd42-(133-inch,-2017)---core-i5--ram-8gb--ssd-256gb.png', 1, 0, '2018-02-16', 0),
(16, 99, 'Macbook Pro 13.3 2017 MPXQ2 (Core I5 / 8GB / 128GB) (Gray Space )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 28900000, 0, '', 'macbook-pro-133-2017-mpxq2-(core-i5--8gb--128gb)-(gray-space-).png', 1, 1, '2018-02-16', 0),
(16, 100, 'Macbook Pro 13.3 2017 MPXT2 (Core I5 / 8GB / 256GB) New 100%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 33700000, 0, '', 'macbook-pro-133-2017-mpxt2-(core-i5--8gb--256gb)-new-100%.png', 0, 0, '2018-02-16', 0),
(16, 101, 'Macbook Pro Retina MJLQ2 (15.4 inch, Mid 2015) - Core i7 / RAM 16GB / SSD 256GB', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 37500000, 0, '', 'macbook-pro-retina-mjlq2-(154-inch,-mid-2015)---core-i7--ram-16gb--ssd-256gb.png', 0, 0, '2018-02-16', 0),
(16, 102, 'MLH12-Macbook 2016 TouchBar 13 inch 16GB 256GB TouchBar LikeNew 99%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 34900000, 0, '', 'mlh12-macbook-2016-touchbar-13-inch-16gb-256gb-touchbar-likenew-99.png', 0, 0, '2018-02-16', 0),
(16, 103, 'MNQF2-Macbook 2016 TouchBar 13 inch 16GB USED New 97%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 30500000, 0, '', 'mnqf2-macbook-2016-touchbar-13-inch-16gb-used-new-97%.png', 0, 0, '2018-02-16', 0),
(16, 104, 'MNQF2-Macbook 2016 TouchBar 13 inch I5 16GB 512GB SSD TouchBar', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 35500000, 0, '', 'mnqf2-macbook-2016-touchbar-13-inch-i5-16gb-512gb-ssd-touchbar.png', 0, 0, '2018-02-16', 0),
(16, 105, 'MNQG2 - Macbook Pro Retina 2016 13inch 512GB Touch Bar (Silver)  New 99%', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 34500000, 0, '', 'mnqg2---macbook-pro-retina-2016-13inch-512gb-touch-bar-(silver)--new-99.png', 0, 0, '2018-02-16', 0),
(16, 106, 'MPTR2 - MacBook Pro 2017 15 inch SSD 256GB TouchBar ( Space Gray)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 50900000, 0, '', 'mptr2---macbook-pro-2017-15-inch-ssd-256gb-touchbar-(-space-gray).png', 0, 0, '2018-02-16', 0),
(16, 107, 'MPTT2 - MacBook Pro 2017 15 inch Quad I7 3.1Ghz 1TB SSD OPTION (SPACE GRAY)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 60500000, 0, '', 'mptt2---macbook-pro-2017-15-inch-quad-i7-31ghz-1tb-ssd-option-(space-gray).png', 0, 0, '2018-02-16', 0),
(16, 108, 'MPTT2 - MacBook Pro 2017 15 inch SSD 512GB TouchBar ( Space Gray)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 58900000, 0, '', 'mptt2---macbook-pro-2017-15-inch-ssd-512gb-touchbar-(-space-gray).png', 0, 0, '2018-02-16', 0),
(16, 109, 'MPTU2 - MacBook Pro 2017 15 inch SSD 256GB TouchBar (SLIVER)', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 50500000, 50000000, '', 'mptu2---macbook-pro-2017-15-inch-ssd-256gb-touchbar-(sliver).png', 0, 0, '2018-02-16', 0),
(16, 110, 'MPTV2 - MacBook Pro 2017 15 inch SSD 512GB TouchBar ( Silver )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 59800000, 0, '', 'mptv2---macbook-pro-2017-15-inch-ssd-512gb-touchbar-(-silver-).png', 0, 0, '2018-02-16', 0),
(16, 111, 'MPXV2 -Macbook Pro Retina 2017 13 inch 256GB TouchBar ( Gray Space )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 39500000, 0, '', 'mpxv2--macbook-pro-retina-2017-13-inch-256gb-touchbar-(-gray-space-).png', 1, 0, '2018-02-16', 0),
(16, 112, 'MPXW2 - Macbook Pro Retina 2017 13inch SSD 512GB TouchBar (Gray Space )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 44500000, 0, '', 'mpxw2---macbook-pro-retina-2017-13inch-ssd-512gb-touchbar-(gray-space-).png', 0, 0, '2018-02-16', 0),
(16, 113, 'MPXX2 - Macbook Pro Retina 2017 13inch SSD 256GB TouchBar ( Silver )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 40800000, 0, '', 'mpxx2---macbook-pro-retina-2017-13inch-ssd-256gb-touchbar-(-silver-).png', 0, 0, '2018-02-16', 0),
(16, 114, 'MPXY2 - Macbook Pro Retina 2017 13inch SSD 512GB TouchBar ( Silver )', N'- Bộ xử lý CPU: 3.7 GHz Intel Xeon E5 Quad-Core\n    - RAM: 16GB\n    - Lưu trữ SSD: 256GB PCIe-based Flash Storage (Option)\n    - Đồ họa: Dual AMD FirePro D300 GPUs (2 x 2GB)\n    - 6 cổng Thunderbolt 2\n    - 4 cổng USB 3.0, 1 cổng HDMI 1.4\n    - 802.11a/b/g/n/ac Wi-Fi, Bluetooth 4.0\n    - Thiết kế độc đáo, nhỏ gọn\n    - Hệ điều hành: Mac OS X 10.10 or 10.11', 44500000, 44400000, '', 'mpxy2---macbook-pro-retina-2017-13inch-ssd-512gb-touchbar-(-silver-).png', 0, 0, '2018-02-16', 0);


INSERT INTO customers VALUES
('Huong','huonghuong', '1', N'nữ', 'huongnguyenak96@gmail.com', N'Quận 1', '1632967751', '');

INSERT INTO bills VALUES (1, '2018-04-09', 23456780987, N'trực tiếp', NULL, NULL, NULL, 0);


INSERT INTO shop0903.dbo.bill_detail VALUES (1,46,2,8765432),
									(1,34,2,8765432),
									(2, 23, 2, 543232);
