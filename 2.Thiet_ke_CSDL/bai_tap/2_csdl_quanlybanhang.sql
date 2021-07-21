order_detail-- --- QUAN_LY_BAN_HANG--- 
create database quan_ly_ban_hang;

use quan_ly_ban_hang;

create table customer(
customer_id int not null auto_increment primary key,
customer_name varchar(30) not null,
customer_age int check(customer_age > 0)
);

create table order1(
order1_id int not null auto_increment primary key,
customer_id int,
order1_date datetime,
order1_total_price double,
foreign key (customer_id) references customer (customer_id)
);

create table product(
product_id int not null auto_increment primary key,
product_name varchar(50) not null,
product_price double
);

create table order_detail(
order1_id int,
product_id int,
order_detail_QTY int,
FOREIGN KEY (order1_id) REFERENCES order1 (order1_id),
    FOREIGN KEY (product_id) REFERENCES product (product_id)
);