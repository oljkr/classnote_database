● [CSV 파일]
 - 모든 데이터가 , 로 구분되어 있는 파일

● [CSV 파일을 데이터베이스로 가져오기]
 - 공공데이터포털 https://data.go.kr/ 활용
 
 
 문) 도로명 우편번호 테이블 구축하기
 
csv 파일의 내용을 토대로 테이블을 설계한다
--1) zipdoro.csv준비 (258267행)

--2) zipdoro.csv 내용을 저장하는 zipdoro테이블 생성

create table zipdoro(
    zipno       char(5) --우편번호
    ,zipaddress varchar(1000) --주소
);

commit;
drop table zipdoro; --테이블 삭제

--3) 가져오기와 내보내기
- zipdoro 테이블 우클릭 -> 데이터 임포트 (가져오기)
- zipdoro 테이블 우클릭 -> export (내보내기)

select count(*) from zipdoro;

--서울특별시 강남구로 시작되는 우편번호가 몇개인지 확인하시오
select count(*) from zipdoro
where zipaddress like '서울특별시 강남구%';

select * from zipdoro
where zipaddress like '서울특별시 강남구%';

////////////////////////////////////////////////////////////////////////////////

문2)한국교원대학교_초중등학교위치.csv를 변환하시오 (11874행)
-- 비어있는 값(null)을 찾으시오

create table school(
    sid       char(10)
    ,sname    varchar(100)
    ,scategory varchar(100)
    ,saddress varchar(1000)
    ,cdate  date
    ,rdate  date
    ,latitude number(10,8)
    ,longitude number(10,7)
);

commit;

drop table school;
select count(*) from school;

select count(saddress) from school; --11872
select * from school
where saddress is null;

SELECT * FROM school
order by saddress nulls first;

과제) 각 시도별 초등학교, 중학교 갯수를 구하시오
select count(*) from school where saddress like '서울특별시%';
select distinct(substr(saddress,0, instr(saddress,' ',1,2))) from school;
select scategory, substr(saddress,0, instr(saddress,' ',1,2)) from school group by substr(saddress,0, instr(saddress,' ',1,2)),scategory;
select distinct scategory from school;

select substr(saddress,0, instr(saddress,' ',1,1)), scategory, count(*) from school group by substr(saddress,0, instr(saddress,' ',1,1)),scategory
order by substr(saddress,0, instr(saddress,' ',1,1)), scategory desc;

select distinct(substr(saddress, 0, instr(saddress, ' '))) as addr1, scategory as ckinds
from school
order by addr1, ckinds desc;
