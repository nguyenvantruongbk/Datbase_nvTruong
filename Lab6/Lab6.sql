----Lab 6
----Tao bang
CREATE TABLE products(
	id varchar(20) PRIMARY KEY NOT NULL,
	product_date Date);
CREATE TABLE product_types(
	id varchar(20) PRIMARY KEY NOT NULL,
	name varchar(255) NOT NULL);
DROP TABLE product_types;
CREATE TABLE PICS(
	id varchar(20) PRIMARY KEY NOT NULL,
	name varchar(150) NOT NULL);
CREATE TABLE product_producttype_pics(
	id int PRIMARY KEY IDENTITY(1,1), 
	product_id varchar(20) NOT NULL REFERENCES products(id),
	product_type_id varchar(20) NOT NULL REFERENCES product_types(id),
	pic_id varchar(20) NOT NULL REFERENCES PICS(id));
DROP TABLE product_producttype_pics;


----Nhap lieu
SELECT * FROM products;
INSERT INTO products(id,product_date) VALUES 
	('Z37 111111','2009-12-12');
INSERT INTO products(id,product_date) VALUES 
	('Z37 111113','2009-12-13');
INSERT INTO products(id,product_date) VALUES 
	('Z37 111114','2009-12-14');
SELECT * FROM product_types;
INSERT INTO product_types(id, name) VALUES
	('Z37E','May tinh sach tay Z37');
INSERT INTO product_types(id, name) VALUES
	('Z37E3','May tinh sach tay Z373');
INSERT INTO product_types(id, name) VALUES
	('Z37E4','May tinh sach tay Z374');
SELECT * FROM PICS;
INSERT INTO PICS(id,name) VALUES
	('987688','Nguyen Van An');
INSERT INTO PICS(id,name) VALUES
	('987683','Nguyen Van Ba');
INSERT INTO PICS(id,name) VALUES
	('987684','Nguyen Van Bon');
SELECT * FROM product_producttype_pics;
INSERT INTO product_producttype_pics(product_id,product_type_id,pic_id) VALUES
	('Z37 111111','Z37E','987688');
INSERT INTO product_producttype_pics(product_id,product_type_id,pic_id) VALUES
	('Z37 111113','Z37E3','987683');
INSERT INTO product_producttype_pics(product_id,product_type_id,pic_id) VALUES
	('Z37 111114','Z37E4','987684');
INSERT INTO product_producttype_pics(product_id,product_type_id,pic_id) VALUES
	('Z37 111113','Z37E3','987688');
----Li?t kê danh sách lo?i s?n ph?m c?a công ty
SELECT * FROM product_types;
----Li?t kê danh sách s?n ph?m c?a công ty.
SELECT * FROM products;

----Li?t kê danh sách ng??i ch?u trách nhi?m c?a công ty.
SELECT * FROM PICS;
-------5. Vi?t các câu l?nh truy v?n ?? l?y
---Li?t kê danh sách lo?i s?n ph?m c?a công ty theo th? t? t?ng d?n c?a tên
SELECT * FROM product_types ORDER BY name asc;
---Li?t kê các s?n ph?m c?a lo?i s?n ph?m có mã s? là Z37E.
SELECT * FROM product_types WHERE id = 'Z37E';