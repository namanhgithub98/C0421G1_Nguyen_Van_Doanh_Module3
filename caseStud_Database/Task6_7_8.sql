use caseStudy_Database;

-- Task6
select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where dich_vu.id_dich_vu not in (select hop_dong.id_dich_vu 
	from hop_dong 
	where (year(ngay_lam_hop_dong)=2019) and (month(ngay_lam_hop_dong) in (01,02,03)));
    
    -- Task7
    select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where year(ngay_lam_hop_dong)=2018 and year(ngay_lam_hop_dong) not in (select year(ngay_lam_hop_dong)
	from hop_dong 
	where (year(ngay_lam_hop_dong)=2019)); 
    
    -- Task8
    select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 2:
select distinct khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 3:
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

