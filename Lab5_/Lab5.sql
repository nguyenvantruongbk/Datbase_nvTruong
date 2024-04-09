-------SQL1----
CREATE TABLE customers( 
-- list all columns 
	tel varchar(20) PRIMARY KEY, 
	customer_name varchar(255), 
	customer_address text );

--- DROP TABLE customers; 
CREATE TABLE products( 
	id int PRIMARY KEY IDENTITY(1,1), 
	product_name varchar(255), 
	price decimal(14,2), 
	unit varchar(20), 
	product_description text );

CREATE TABLE orders( 
	id int PRIMARY KEY IDENTITY(1,1), 
	order_date DATETIME, 
	grand_total DECIMAL(14,2), 
	customer_tel varchar(20) FOREIGN KEY REFERENCES customers(tel) );

CREATE TABLE order_products( 
	order_id int FOREIGN KEY REFERENCES orders(id), 
	product_id int FOREIGN KEY REFERENCES products(id), 
	qty int, 
	total decimal(14,2) );
----sql2-------
CREATE TABLE departments( 
	id varchar(20) PRIMARY KEY, 
	name varchar(100) NOT NULL UNIQUE );
 
CREATE TABLE machines( 
	id varchar(20) PRIMARY KEY, 
	name varchar(100) NOT NULL );
 
CREATE TABLE employees( 
	id int PRIMARY KEY IDENTITY(1,1), 
	name varchar(150) NOT NULL, 
	dob DATE, 
	salary varchar(10), 
	address text, 
	tel varchar(20) NOT NULL UNIQUE, 
	job_title varchar(50), 
	education varchar(50), 
	department_id varchar(20) NOT NULL FOREIGN KEY REFERENCES departments(id) ); 

CREATE TABLE employee_machines( 
	employee_id int NOT NULL FOREIGN KEY REFERENCES employees(id), 
	machine_id VARCHAR(20) NOT NULL FOREIGN KEY REFERENCES machines(id), 
	qty int NOT NULL CHECK(qty > 0) );

------sql3---------
CREATE TABLE classes( 
	id varchar(20) PRIMARY KEY, 
	name varchar(100) NOT NULL UNIQUE, 
	room varchar(20) ); 
CREATE TABLE students( 
	id varchar(20) PRIMARY KEY, 
	name varchar(100) NOT NULL, 
	dob DATE ); 
CREATE TABLE subjects( 
	id varchar(20) PRIMARY KEY, 
	name varchar(150) NOT NULL UNIQUE ); 
CREATE TABLE results( 
	id int PRIMARY KEY IDENTITY(1,1), 
	mark int NOT NULL CHECK(mark >= 0 AND mark <=10), 
	result varchar(50) NOT NULL, 
	student_id varchar(20) NOT NULL REFERENCES students(id), 
	subject_id varchar(20) NOT NULL REFERENCES subjects(id) ); 

CREATE TABLE student_subjects( 
	student_id varchar(20) NOT NULL REFERENCES students(id), 
	subject_id varchar(20) NOT NULL REFERENCES subjects(id) );

--drop TABLE students;

-------sql4-----
-- create data 
INSERT INTO customers(tel,customer_name,customer_address) VALUES('987654321','Nguyen Van An','111 Nguyen Trai, Thanh Xuan, Ha Noi');

INSERT INTO orders(order_date,grand_total,customer_tel) VALUES('2019-11-19 15:30:27',1500,'987654321');

INSERT INTO products(product_name,price,unit,product_description) VALUES('May Tinh T450',1000,'Chiec','May nhap moi'), ('Dien thoai Nokia 5670',2000,'Chiec','Dien thoai dang hot'), ('May in Samsung 450',100,'Chiec','May in dang e');

INSERT INTO order_products(order_id,product_id,qty,total) VALUES(1,1,1,1000), (1,2,2,400), (1,3,1,100); 
INSERT INTO order_products(order_id,product_id,qty,total) VALUES(3,1,1,1000), (3,2,2,400), (3,3,1,100); 
-- Read data SELECT * FROM customers; 
SELECT * FROM orders; 
SELECT * FROM products; 
SELECT * FROM order_products;

------sql5-----
INSERT INTO departments(id,name) VALUES('HCNS','Hanh chinh nhan su');

INSERT INTO machines(id,name) VALUES('MTDB-21','May tinh de ban'), ('MIHP','May in HP');

INSERT INTO employees(name,dob,salary,address,tel,job_title,education,department_id) VALUES('Nguyen Van An','1995-03-28','U2','Cau Giay, Ha Noi','0987654321','Nhan vien hanh chinh', 'Cu nhan','HCNS');

SELECT * FROM employees; INSERT INTO employee_machines(employee_id,machine_id,qty) VALUES(1,'MTDB-21',1),(1,'MIHP',1);

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

------SQL6--Lab4----

-- truy van co ban 
SELECT * FROM products; 
SELECT id,product_name as tensanpham,product_description,price as gia_tien FROM products; 
-- lọc dữ liệu 
SELECT * FROM products WHERE price > 200 ; 
SELECT * FROM products WHERE price > 200 AND id > 1; 
SELECT * FROM products WHERE price > 2000 OR price < 200; 
SELECT * FROM products WHERE id = 1 OR id = 2 OR id = 3; 
SELECT * FROM products WHERE id IN (1,2,3,4,5,6,7,8); 
SELECT * FROM products WHERE product_name = 'May Tinh T450'; 
SELECT * FROM products WHERE product_name LIKE 'May Tinh T450'; 
-- Tim kiem 
SELECT * FROM products WHERE product_name LIKE 'May Tinh T45%'; 
SELECT * FROM products WHERE product_name LIKE '%450'; 
SELECT * FROM products WHERE product_name LIKE '%in%' OR product_description LIKE '%in%'; 
-- Sap xep 
SELECT * FROM products ORDER BY price asc;
SELECT * FROM products ORDER BY price desc; 
SELECT * FROM products WHERE price > 200 ORDER BY price desc; 
SELECT TOP 1 * FROM products ORDER BY price desc; 
--MYSQL: SELECT * FROM products ORDER BY price desc LIMIT 1;
SELECT TOP 50 PERCENT * FROM products ORDER BY price desc; 
-- thong ke 
SELECT COUNT(*) FROM products; 
SELECT COUNT(*) FROM orders; 
SELECT SUM(grand_total) FROM orders; 
SELECT COUNT(*) as soluong,SUM(grand_total) as tongtien, AVG(grand_total) as trungbinh FROM orders; 
-- thong ke nang cao 
SELECT SUM(grand_total) as tongtien, customer_tel FROM orders GROUP BY customer_tel; 
SELECT SUM(grand_total) as tongtien, customer_tel FROM orders WHERE grand_total > 1000 GROUP BY customer_tel HAVING SUM(grand_total) > 3000; 
-- subquery 
SELECT SUM(grand_total) as tongtien from orders WHERE customer_tel
IN (SELECT tel FROM customers WHERE customer_name LIKE 'Nguyen Van An'); 
--- tim xem Nguyen Van An da mua nhung san pham gi 
SELECT * FROM products WHERE id IN (
		SELECT DISTINCT product_id FROM order_products WHERE order_id IN (
			 SELECT id from orders WHERE customer_tel IN (SELECT tel FROM customers WHERE customer_name LIKE 'Nguyen Van An')));
			 --Distinc bo du lieu trung lap cua lan in ra, khong lien quan den du lieu goc
----------------------------------------------------------------------------------
---assigment 9-2--Câu 3: Liệt kê những dòng xe có số chỗ ngồi trên 5 chỗ
SELECT * FROM DongXe;
SELECT * FROM DongXe WHERE SoChoNgoi>5;
---Câu 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
----thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km hoặc những dòng xe
----thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
SELECT * FROM NhaCungCap;
SELECT * FROM DangKyNhaCungCap;
--SELECT * FROM NhaCungCap WHERE MaNhaCC IN (SELECT MaNhaCC FROM DangKyNhaCungCap WHERE DongXe LIKE ');
---Luu y cu lien quan den 2 bang thi phai dung Subquery
SELECT NhaCungCap.MaNhaCC, NhaCungCap.TenNhaCC, NhaCungCap.DiaChi, NhaCungCap.SoDT, NhaCungCap.MaSoThue
FROM NhaCungCap
INNER JOIN DangKyNhaCungCap ON NhaCungCap.MaNhaCC = DangKyNhaCungCap.MaNhaCC
INNER JOIN DongXe ON DangKyNhaCungCap.DongXe = DongXe.DongXe
INNER JOIN MucPhi ON DangKyNhaCungCap.MaMP = MucPhi.MaMP
WHERE (DongXe.HangXe = 'Toyota' AND MucPhi.DonGia = 15000)
    OR (DongXe.HangXe = 'KIA' AND MucPhi.DonGia = 20000);
--Câu 5: Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung
-- cấp và giảm dần theo mã số thuế
SELECT * FROM NhaCungCap ORDER BY TenNhaCC ASC;
SELECT *
FROM NhaCungCap
ORDER BY  MaSoThue DESC;
SELECT * FROM NhaCungCap;
SELECT * FROM NhaCungCap ORDER BY CAST(MaSoThue AS varchar(20)) DESC;
SELECT * FROM NhaCungCap ORDER BY CAST(TenNhaCC AS varchar(255)) ASC;

