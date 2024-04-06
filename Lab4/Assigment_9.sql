---Assigment 9
CREATE TABLE NhaCungCap(
	MaNhaCC varchar(20) PRIMARY KEY,
	TenNhaCC text NOT NULL,
	DiaChi text NOT NULL,
	SoDT varchar(20) NOT NULL UNIQUE,
	MaSoThue varchar(20))
CREATE TABLE LoaiDichVu(
	MaLoaiDV varchar(20) PRIMARY KEY,
	TenLoaiDV text NOT NULL)
CREATE TABLE MucPhi(
	MaMP varchar(20) PRIMARY KEY,
	DonGia Decimal(10),
	MoTa text)
CREATE TABLE DongXe(
	DongXe varchar(255) PRIMARY KEY,
	HangXe varchar(255) NOT NULL,
	SoChoNgoi int NOT NULL CHECK(SoChoNgoi>1))
CREATE TABLE DangKyNhaCungCap(
	MaDKCC varchar(10) PRIMARY KEY,
	MaNhaCC varchar(20) REFERENCES NhaCungCap(MaNhaCC),
	MaLoaiDV varchar(20) REFERENCES LoaiDichVu(MaLoaiDV),
	DongXe varchar(255) REFERENCES DongXe(DongXe),
	MaMP varchar(20) REFERENCES MucPhi(MaMP),
	NgayBatDauCungCap DATE,
	NgayKetThucCungCap DATE,
	SoLuongXeDangKy INT)
INSERT INTO NhaCungCap(MaNhaCC,TenNhaCC,DiaChi,SoDT,MaSoThue) VALUES
	('NCC001','Cty TNHH Toan Phap','Hai Chau','05113999888','568941'),
	('NCC002','Cty Co Phan Dong Du','Lien Chieu','05113999889','456789'),
	('NCC003','Ong Nguyen Van A','Hoa Thuan','05113999890','321456'),
	('NCC004','Cty Co Phan Cau Xanh','Hai Chau','05113658945','513364'),
	('NCC005','Cty TNHH AMA','Thanh Khe','05113875466','546546'),
	('NCC006','Ba Tran Thi Bich Van','Lien Chieu','05113587469','524545'),
	('NCC007','Cty TNHH Phan Thanh','Thanh Khe','05113987456','113021'),
	('NCC008','Ong Phan Dinh Nam','Hoa Thuan','05113532456','121230'),
	('NCC009','Tap Doan Dong Nam A','Lien Chieu','05113987121','533654'),
	('NCC0010','Cty Co Phan Rang Dong','Lien Chieu','05113569654','187864');
SELECT * FROM NhaCungCap;
INSERT INTO LoaiDichVu(MaLoaiDV,TenLoaiDV) VALUES
	('DV01','Dich vu taxi'),
	('DV02','Dich vu xe bus cong cong theo tuyen co dinh'),
	('DV03','Dich vu cho thue xe theo hop dong ');
SELECT * FROM LoaiDichVu;
INSERT INTO MucPhi(MaMP,DonGia,MoTa) VALUES
	('MP01',10000,'Ap dung tu 1/2015'),
	('MP02',15000,'Ap dung tu 2/2015'),
	('MP03',20000,'Ap dung tu 1/2010'),
	('MP04',25000,'Ap dung tu 2/2011');
SELECT * FROM MucPhi;
INSERT INTO DongXe(DongXe,HangXe,SoChoNgoi) VALUES
	('Hiace','Toyota',16),
	('Vios','Toyota',5),
	('Escape','Ford',5),
	('Cerato','KIA',7),
	('Forte','KIA',5),
	('Starex','Hyundai',7),
	('Grand-i10','Hyundai',7);
SELECT * FROM DongXe;
INSERT INTO DangKyNhaCungCap(MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap,SoLuongXeDangKy) VALUES
	('DK001','NCC001','DV01','Hiace','MP01','2015-11-20','2016-11-20',4),
	('DK002','NCC002','DV02','Vios','MP02','2017-11-20','2017-11-20',3),
	('DK003','NCC003','DV03','Escape','MP03','2017-11-20','2018-11-20',5),
	('DK004','NCC005','DV01','Cerato','MP04','2015-11-20','2019-11-20',7),
	('DK005','NCC002','DV02','Forte','MP03','2019-11-20','2020-11-20',1),
	('DK006','NCC004','DV03','Starex','MP04','2016-11-10','2021-11-20',2),
	('DK007','NCC005','DV01','Cerato','MP03','2015-11-20','2016-11-20',8),
	('DK008','NCC006','DV01','Vios','MP02','2015-11-20','2016-11-20',9),
	('DK009','NCC005','DV03','Grand-i10','MP02','2015-11-20','2016-11-20',10),
	('DK010','NCC006','DV01','Forte','MP02','2015-11-20','2016-11-20',4),
	('DK011','NCC007','DV01','Forte','MP01','2015-11-20','2016-11-20',5),
	('DK012','NCC007','DV03','Cerato','MP01','2015-11-20','2016-11-20',6),
	('DK013','NCC003','DV02','Cerato','MP01','2015-11-20','2016-11-20',8),
	('DK014','NCC008','DV02','Cerato','MP01','2015-11-20','2016-11-20',1),
	('DK015','NCC003','DV01','Hiace','MP01','2015-11-20','2016-11-20',6),
	('DK016','NCC001','DV03','Grand-i10','MP02','2015-11-20','2016-11-20',8),
	('DK017','NCC002','DV03','Cerato','MP03','2015-11-20','2016-11-20',4),
	('DK018','NCC006','DV03','Escape','MP04','2015-11-20','2016-11-20',2),
	('DK019','NCC003','DV03','Escape','MP03','2015-11-20','2016-11-20',8),
	('DK020','NCC002','DV03','Cerato','MP04','2015-11-20','2016-11-20',7),
	('DK021','NCC006','DV01','Forte','MP02','2015-11-20','2016-11-20',9),
	('DK022','NCC002','DV02','Cerato','MP04','2015-11-20','2016-11-20',6),
	('DK023','NCC002','DV01','Forte','MP03','2017-11-30','2018-05-20',5),
	('DK024','NCC003','DV03','Forte','MP04','2017-12-23','2019-11-30',8),
	('DK025','NCC003','DV03','Hiace','MP02','2016-08-24','2017-10-25',1);
SELECT * FROM DangKyNhaCungCap;
