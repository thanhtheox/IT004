create database QLSV

create table KHOA
(
MaKhoa char(4) not null,
TenKhoa nvarchar(100),
constraint PK_MaKhoa primary key (MaKhoa)
)

create table LOP
(
MaLop char(6) not null,
TenLop nvarchar(100),
MaKhoa char(4) not null,
constraint PK_MaLop primary key (MaLop),
constraint FK_MaKhoa foreign key (MaKhoa) references KHOA(MaKhoa)
)

create table SINHVIEN
(
MaSinhVien char(8) not null,
HoTen nvarchar(100),
NgaySinh date,
MaLop char(6) not null
constraint PK_MaSinhVien primary key (MaSinhVien),
constraint FK_MaLop foreign key (MaLop) references LOP(MaLop)
)

create table MONHOC
(
MaMonHoc char(10) not null,
TenMonHoc nvarchar(100),
constraint PK_MaMonHoc primary key (MaMonHoc),
)

create table DIEM
(
MaSinhVien char(8) not null,
MaMonHoc char(10) not null,
Diem float,
constraint PK_Diem primary key (MaSinhVien, MaMonHoc)
)

select NgaySinh,
convert(varchar(10), NgaySinh, 105) as newNgaySinh
from SINHVIEN 

insert into KHOA (MaKhoa, TenKhoa) values
('CNTT',N'Công Nghệ Thông Tin')

--sửa
update KHOA
set TenKhoa = N'Khoa Học Máy Tính'
where MaKhoa = 'CNTT'

insert into KHOA (MaKhoa, TenKhoa) values
('KT',N'Kinh Tế')

insert into KHOA (MaKhoa, TenKhoa) values
('QTKD',N'Quản Trị Kinh Doanh')

--xóa
delete from KHOA where MaKhoa = 'KT'
delete from SINHVIEN where MaSinhVien = 'sv09'

insert into LOP(MaLop, TenLop, MaKhoa) values
('DH20CT', N'Công Nghệ Thông Tin khóa 20', 'CNTT') 

insert into SINHVIEN(MaSinhVien, HoTen, MaLop) values
('SV01', N'Trần Tuấn Kiệt', 'DH20CT'),
('SV02', N'Nguyễn Hữu Thiên', 'DH20CT')

update SINHVIEN set HoTen = 'Lệ vi', NgaySinh = '2002-06-28' where MaSinhVien = 'SV04'

select * from KHOA

insert into MONHOC (MaMonHoc, TenMonHoc) values
('TCC', N'Toán cao cấp')

select MaKhoa from KHOA

select count (*) from MONHOC where MaMonHoc = 'TCC'

delete from SINHVIEN where MaLop = 'DH20QN'

select count(*) from SINHVIEN where MaSinhVien = 'SV01'

select count (*) from MONHOC where MaMonHoc = 'TCC'

select * from DIEM where MaSinhVien = 'SV01'

select D.Diem, D.MaSinhVien, O.TenMonHoc
from  DIEM as D,MONHOC as O
where D.MaMonHoc = O.MaMonHoc and MaSinhVien = 'SV01'

update Diem set Diem = '9' where MaSinhVien = 'sv01' and MaMonHoc = 'THML'