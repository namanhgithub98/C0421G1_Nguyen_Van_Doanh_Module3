use quan_ly_ban_hang;
-- Thêm dữ liệu vào csdl quản lý bán hàng

insert into customer
values
(1,"Minh Quan",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);

insert into order1(order1_id,customer_id,order1_date)
values
(1,1,"2006-03-21"),
(2,2,"2006-03-23"),
(3,1,"2006-03-16");

insert into product
values
(1, "May Giat",3),
(2, "Tu lanh",5),
(3, "Dieu Hoa",7),
(4, "Quat",1),
(5, "Bep Dien",2);

insert into order_detail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select order1.order1_id,order1.order1_date,product.product_price
from order1
join order_detail on order1.order1_id=order_detail.order1_id
join product on order_detail.product_id=product.product_id;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.customer_name,product.product_name,product.product_price
from customer
join order1 on customer.customer_id=order1.customer_id
join order_detail on order1.order1_id=order_detail.order1_id
join product on order_detail.product_id= product.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer.customer_name
from customer
left join order1 on customer.customer_id=order1.customer_id
where order1.order1_id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)

 select order1.order1_id,order1.order1_date,sum(order_detail.order_detail_QTY*product.product_price) as price
 from order1
 join order_detail on order1.order1_id=order_detail.order1_id
 join product on order_detail.product_id=product.product_id
 group by order1.order1_id;