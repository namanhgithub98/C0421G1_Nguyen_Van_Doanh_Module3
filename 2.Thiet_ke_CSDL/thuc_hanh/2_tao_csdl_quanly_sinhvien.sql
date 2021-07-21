create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create  table class(
classID int primary key not null auto_increment,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit
);

create table student(
student_id int primary key not null auto_increment,
student_name varchar(30) not null,
address varchar(50) ,
phone varchar(20),
`status` bit,
class_id int not null
);

create table `subject`(
sub_id int primary key not null auto_increment,
sub_name varchar(30) not null,
credit tinyint not null default 1 check (credit >=1),
`status` bit default 1
);

create table mark(
mark_id int not null primary key auto_increment,
sub_id int not null unique key,
student_id int not null unique key,
mark float default 0 check (mark between 0 and 100),
exam_times tinyint default 1,
foreign key (sub_id) references `subject` (sub_id),
foreign key (student_id) references student (student_id)
);