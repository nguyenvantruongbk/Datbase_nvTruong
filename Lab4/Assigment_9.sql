-- Tạo bảng Nhà cung cấp
CREATE TABLE NhaCungCap (
    MaNhaCC INT PRIMARY KEY IDENTITY,
    TenNhaCC NVARCHAR(255),
    DiaChi NVARCHAR(255),
    SoDienThoai NVARCHAR(20),
    MaSoThue NVARCHAR(20)
);

-- Tạo bảng Loại dịch vụ
CREATE TABLE LoaiDichVu (
    MaLoaiDV INT PRIMARY KEY IDENTITY,
    TenLoaiDV NVARCHAR(255)
);

-- Tạo bảng Đăng ký cung cấp
CREATE TABLE DangKyCungCap (
    MaDKCC INT PRIMARY KEY IDENTITY,
    MaNhaCC INT,
    MaLoaiDV INT,
    DongXe NVARCHAR(255),
    MaMP INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    SoLuongXe INT,
    FOREIGN KEY (MaNhaCC) REFERENCES NhaCungCap(MaNhaCC),
    FOREIGN KEY (MaLoaiDV) REFERENCES LoaiDichVu(MaLoaiDV)
);

-- Tạo bảng Mức phí
CREATE TABLE MucPhi (
    MaMP INT PRIMARY KEY IDENTITY,
    DonGia MONEY,
    MoTa NVARCHAR(255)
);

-- Tạo bảng Dòng xe
CREATE TABLE DongXe (
    DongXe NVARCHAR(255) PRIMARY KEY,
    HangXe NVARCHAR(255),
    SoChoNgoi INT
);
