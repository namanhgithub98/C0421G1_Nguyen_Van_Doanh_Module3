create database `student_management`;

use student_management;

create table student(
id int key not null,
`name` varchar(50),
date_of_birth date
);

 insert into student
value(1, 'nam', '2000-12-16');

insert into student
value(2,'anh', '1998-08-26');

select 'nam','anh' 
from student;


create table class(
id int key not null,
`name` varchar(50)
);




create table teacher(
id int key not null,
`name` varchar(50),
date_of_birth date,
age int,
country varchar(50)
);

create database quan_ly_diem_thi;

use quan_ly_diem_thi;

create table hoc_sinh(
ma_hs varchar(20) primary key,
ten_hs varchar(50),
ngay_sinh datetime,
lop varchar(20),
gioi_tinh varchar(20)
);

create table mon_hoc(
ma_mh varchar(20) primary key,
ten_mh varchar(20)
);

create table bang_diem(
ma_hs varchar(20),
ma_mh varchar(20),
diem_thi int,
ngay_kt datetime,
primary key (ma_hs, ma_mh),
foreign key (ma_hs) references hoc_sinh(ma_hs),
foreign key (ma_mh) references mon_hoc(ma_mh)
);

create table giao_vien(
ma_gv varchar(20) primary key,
ten_gv varchar(50),
sdt varchar(10)
);

alter table mon_hoc add ma_gv varchar(20);
alter table mon_hoc add constraint fk_ma_gv foreign key (ma_gv) references giao_vien(ma_gv);