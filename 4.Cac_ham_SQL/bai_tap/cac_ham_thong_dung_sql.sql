use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select *
from subject1
where credit = (select max(credit) from subject1);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_id,s.sub_name,m.mark
from subject1 s
join mark m on s.sub_id=m.sub_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.student_id,s.student_name,s.address,s.phone,avg(mark) as "medium_score"
from student s
left join mark m on s.student_id=m.student_id
group by s.student_id,s.student_name
order by avg(mark) desc;