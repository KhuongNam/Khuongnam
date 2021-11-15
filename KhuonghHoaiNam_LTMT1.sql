create database QLSV01
go
use QLSV01
go
create table dmkhoa
(makhoa char(10) primary key,
tenkhoa nvarchar(20))
go
select * from dmkhoa
go
insert into dmkhoa
values
('cntt',N'công nghệ thông tin'),
('kt',N'kế toán'),
('sp',N'sư phạm')
go
create table dmnganh
(manganh char(10) primary key,
tennganh nvarchar(30),
makhoa char(10))
go 
select * from dmnganh
go
insert into dmnganh
values
('140902',N'sư phạm toán tin','sp'),
('480202',N'tin học ứng dụng','CNTT')
go
create table dmlop
(malop char(10) primary key,
tenlop nvarchar(30),
manganh char(10),
khoahoc char(10),
hedt nvarchar(20),
namnhaphoc char(10))
go
select * from dmlop
go
insert into dmlop
values
('ct11',N'cao đẳng tin học','480202',11,N'tc','2013'),
('ct12',N'cao đẳng tin học','480202',12,N'cđ','2013'),
('ct13',N'cao đẳng tin học','480202',13,N'cđ','2014')
go
create table dmhocphan
(mahp char(10) primary key,
tenhp nvarchar(30),
sodvht int,
manganh char(10),
hocky int)
go
select * from dmhocphan
go
insert into dmhocphan
values
('001',N'toán cao cấp A1',4,'480202',1),
('002',N'toán rời rạc',4,'480202',1),
('003',N'tiếng anh',3,'140902',1),
('004',N'tiếng anh 2',7,'480202',1),
('005',N'toán xắc suất',3,'140902',2)
go
create table diemhp
(masv char(10),
mahp char(10),
diemhp float)
go
select * from diemhp
go
insert into diemhp
values
('002','002',5.9),
('002','003',4.5),
('003','001',4.3),
('003','002',6.7),
('003','003',7.3),
('004','001',4)
go
create table sinhvien
(masv char(10) primary key,
hoten nvarchar(30),
malop char(10),
gioitinh int,
ngaysinh date,
diachi nvarchar(20))
go
select * from sinhvien
go
insert into sinhvien
values
('001',N'nguyễn ánh','ct12',1,'2001-07-21',N'hà nội'),
('002',N'nguyễn thanh bằng','ct12',1,'2001-04-28',N'hà nội'),
('003',N'trần thị thuận','ct12',0,'2000-05-17',N'tuyên quang'),
('004',N'nguyễn hải yến','ct13',0,'2002-03-18',N'nam định'),
('005',N'trần nguyên khải','ct13',1,'2000-04-21',N'hà nam')
go
--TẠO KHÓA NGOẠI CHO BẢNG diemhp (masv)--
alter table diemhp add foreign key (masv) references sinhvien(masv)
--TẠO KHÓA NGOẠI CHO BẢNG sinhvien (malop)--
alter table sinhvien add foreign key (malop) references dmlop(malop)
--TẠO KHÓA NGOẠI CHO BẢNG diemhp (mahp)--
alter table diemhp add foreign key (mahp) references dmhocphan(mahp)
--TẠO KHÓA NGOẠI CHO BẢNG dmlop (manganh)--
alter table dmlop add foreign key (manganh) references dmnganh(manganh)
--TẠO KHÓA NGOẠI CHO BẢNG dmnganh (makhoa)--
alter table dmnganh add foreign key (makhoa) references dmkhoa(makhoa)