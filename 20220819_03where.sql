select uname from sungjuk where uname='대한민국';

select uname
from sungjuk
where uname like '%화';

select uname
from sungjuk
where uname like '%나%';

select uname
from sungjuk
where uname like'_란';

insert into sungjuk(uname, kor, eng, mat)
values ('국화', 100, 100, 100);

insert into sungjuk(uname, kor, eng, mat)
values ('모란', 90, 95, 97);

select * from sungjuk;

select uname from sungjuk where uname like '_나_';

select 제목, 내용 from 게시판 where 제목 like '%파스타%' or 내용 like '%파스타%';
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3 where kor>=50;
select uname, tot, aver from sungjuk where kor >= 50;
rollback;

[NULL] - 비어 있는 값
-- 총점의 갯수를 구하시오
select count(tot) from sungjuk; --null값은 카운트 되지 않음
-- 총점에 NULL이 있는 행의 갯수를 구하시오
select count(*) from sungjuk where tot=null; --null값 확인 못함
--db에서는 null값을 확인하지 못 하므로 null값을 다른 값으로 바꾼다음에 처리함.
--is null을 사용함.
select count(*) from sungjuk where tot is null;
--평균에 비어있지 않은 행의 갯수를 구하시오(null이 아닌 값)is not null 사용
select count(*) from sungjuk where aver is not null;

select * from sungjuk;
select uname,(kor+eng+mat) as tot, (kor+eng+mat)/3 as aver from sungjuk where tot is null and aver is null;
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

commit;
rollback;
delete from sungjuk;