use caseStudy_Database;

-- Task17
 create temporary table bang_tam_id_tong_tien (select kh.id_loai_khach,hd.id_khach_hang,
		sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as "tong_tien"
        from hop_dong hd
        join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
        join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
        where year(hd.ngay_lam_hop_dong)=2019
        group by hd.id_khach_hang
        having tong_tien > 10000000);
select * from bang_tam_id_tong_tien;

update khach_hang 
set id_loai_khach = 1
where id_khach_hang = (select bang_tam_id_tong_tien.id_khach_hang from bang_tam_id_tong_tien);           

select * from khach_hang;
drop table bang_tam_id_tong_tien;

-- Task18
delete from khach_hang kh
where  kh.id_khach_hang in (select hd.id_khach_hang
	from hop_dong hd
	where year(hd.ngay_lam_hop_dong) < 2016);
    
-- Task19
create temporary table bang_tam_dich_vu_di_kem (select dvdk.id_dich_vu_di_kem as "id" , count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung"
            from dich_vu_di_kem dvdk
            join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            group by hdct.id_dich_vu_di_kem 
            having so_lan_su_dung > 10);
update dich_vu_di_kem
set gia = gia*2
where dich_vu_di_kem.id_dich_vu_di_kem in (select bang_tam_dich_vu_di_kem.id from bang_tam_dich_vu_di_kem);
select * from dich_vu_di_kem;
drop table bang_tam_dich_vu_di_kem;

-- Task20
 select id_khach_hang as id,ho_ten,email,SDT,ngay_sinh,dia_chi
 from khach_hang
 union all
 select id_nhan_vien as id,ho_ten,email,SDT,ngay_sinh,dia_chi
 from nhan_vien;
 
-- Task21
 create view v_nhan_vien as (select nv.* from nhan_vien nv
 join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where nv.dia_chi = "Hai Chau" and hd.ngay_lam_hop_dong = "2019/12/12");
select * from v_nhan_vien;

-- Task22
update v_nhan_vien
set v_nhan_vien.dia_chi = "Lien Chieu"
where v_nhan_vien.id_nhan_vien = 4;
select * from nhan_vien;

-- Task23
create unique index ix_khach_hang on khach_hang (id_khach_hang);
explain select * from khach_hang where id_khach_hang = 4;