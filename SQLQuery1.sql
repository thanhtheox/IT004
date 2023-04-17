create database QLBH
use QLBH
CREATE TABLE KHACHHANG 
( 
	MAKH CHAR (4), 
	HOTEN VARCHAR (40), 
	DCHI VARCHAR (50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	DOANHSO MONEY,
	NGDK SMALLDATETIME,
	
) 
alter table KHACHHANG alter column MAKH char(4) not null
alter table KHACHHANG add constraint PK_KH primary key (MAKH)
ALTER TABLE KHACHHANG ADD LOAIKH TINYINT
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR

CREATE TABLE NHANVIEN 
( 
	MANV CHAR (4), 
	HOTEN VARCHAR (40), 
	SODT VARCHAR(20),
	NGLV SMALLDATETIME,
	constraint PK_KH primary key (MANV),
) 
alter table NHANVIEN  alter column MANV char(4) not null
alter table NHANVIEN  add constraint PK_NV primary key (MANV)

CREATE TABLE SANPHAM
( 
	MASP CHAR (4), 
	TENSP VARCHAR (40), 
	DVT VARCHAR(20),
	NUOCSX VARCHAR (40), 
	GIA MONEY,
	GHICHU VARCHAR(100),
) 
alter table SANPHAM  alter column MASP char(4) not null
alter table SANPHAM  add constraint PK_SP primary key (MASP)
ALTER TABLE SANPHAM ADD CONSTRAINT SANPHAM_DVT CHECK (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')
ALTER TABLE SANPHAM DROP GHICHU
ALTER TABLE SANPHAM 


CREATE TABLE HOADON
( 
	SOHD INT,  
	NGHD SMALLDATETIME,
	MAKH CHAR (4), 
	MANV CHAR (4), 
	TRIGIA MONEY,
)
alter table HOADON  alter column SOHD INT not null
alter table HOADON  add constraint PK_HD primary key (SOHD)
alter table HOADON add constraint FK_NV foreign key (MANV) references KHACHHANG(MAKH)

CREATE TABLE CTHD
(
	SOHD INT,
	MASP CHAR(4),
	SL INT,
)
alter table CTHD  alter column SOHD INT not null
alter table CTHD  alter column MASP INT not null
alter table CTHD add constraint PK_CTHD primary key (SOHD, MASP)

