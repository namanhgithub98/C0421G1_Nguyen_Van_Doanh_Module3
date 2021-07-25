use caseStudy_Database;

-- Task11
select dvdk.id_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai_kha_dung,lk.ten_loai_khach,kh.dia_chi
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
where kh.id_loai_khach = 1 and (kh.dia_chi = "Quang Ngai" or kh.dia_chi = "Vinh");

-- Task12
select hd.id_hop_dong,nv.ho_ten as "ten_nhan_vien",kh.ho_ten as "ten_khach_hang",kh.SDT as "so_dien_thoai_khach_hang",dv.ten_dich_vu,count(hdct.id_hop_dong) as "so_luong_dich_vu_di_kem",hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong 
where year(hd.ngay_lam_hop_dong)=2019 and month(hd.ngay_lam_hop_dong) in (10,11,12)and month(hd.ngay_lam_hop_dong) not in (select month(hd.ngay_lam_hop_dong)
	from hop_dong
	where month(hd.ngay_lam_hop_dong)between 1 and 6); 
    
    -- Task13
select dvdk.* , count(hdct.id_hop_dong_chi_tiet) as "so_hop_dong"
from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
having count(hdct.id_hop_dong_chi_tiet) >= all (select count(hdct.id_hop_dong_chi_tiet)
from hop_dong_chi_tiet hdct
group by hdct.id_dich_vu_di_kem);

-- Task14
select hd.id_hop_dong, ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung"
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_dich_vu
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
group by hdct.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) = 1;

-- Task15
select nv.id_nhan_vien,nv.ho_ten,td.trinh_do,bp.ten_bo_phan,nv.SDT,nv.dia_chi,count(hd.id_hop_dong) as "so_lan_lam_hop_dong"
from nhan_vien nv
join trinh_do td on nv.id_trinh_do = td.id_trinh_do
join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where (year(hd.ngay_lam_hop_dong) between 2018 and 2019)
group by hd.id_nhan_vien
having count(hd.id_hop_dong) <=3;

-- Task16
delete from nhan_vien nv
where  nv.id_nhan_vien not in (select hd.id_nhan_vien
	from hop_dong hd
	where year(hd.ngay_lam_hop_dong) between 2017 and year(curdate()));
