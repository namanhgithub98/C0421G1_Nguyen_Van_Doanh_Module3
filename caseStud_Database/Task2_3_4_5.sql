use caseStudy_Database;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu
--  là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select id_nhan_vien,ho_ten,substring(ho_ten, (length(ho_ten)-instr(reverse(ho_ten)," ")+2),instr(reverse(ho_ten)," ")-1) as ten,
ngay_sinh,dia_chi
from nhan_vien
where (substring(ho_ten,length(ho_ten)-instr(reverse(ho_ten)," ") + 2,instr(reverse(ho_ten)," ")-1) like "T%" or "H%" or "K%")
and length(ho_ten)<=15;

-- Task 3:
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và 
-- có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khach_hang
where(year(curdate()) - year(ngay_sinh) between 18 and 50) and (dia_chi ="Da Nang" or dia_chi ="Quang Tri");

-- Task 4:
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.id_khach_hang,khach_hang.ho_ten,count(hop_dong.id_hop_dong) as so_luong
from khach_hang
join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
where khach_hang.id_loai_khach=1
group by khach_hang.ho_ten
order by so_luong;

-- Task 5:
-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khach_hang.id_khach_hang, khach_hang.ho_ten,loai_khach.ten_loai_khach,hop_dong.id_hop_dong
,dich_vu.ten_dich_vu,hop_dong.ngay_lam_hop_dong,hop_dong.ngay_ket_thuc, 
sum(dich_vu.chi_phi_thue + hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as 'tong_tien'
from khach_hang
left join loai_khach on khach_hang.id_loai_khach=loai_khach.id_loai_khach
left join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
left join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
left join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
group by khach_hang.id_khach_hang;