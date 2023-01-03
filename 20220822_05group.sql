●[데이터 그룹화]
--sungjuk_seq 시퀀스 삭제
drop sequence sungjuk_seq;

--sungjuk테이블에서 사용할 시퀀스 생성
create sequence sungjuk_seq;

--sungjuk 테이블 삭제
drop table sungjuk;

--sungjuk 테이블 생성
create table sungjuk (
    sno    int          primary key                  
   ,uname  varchar(50)  not null                         
   ,kor    int          check(kor between 0 and 100)                    
   ,eng    int          check(eng between 0 and 100)                    
   ,mat    int          check(mat between 0 and 100)
   ,addr   varchar(20)  check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int          default 0
   ,aver   int          default 0
   ,wdate  date         default sysdate              
);

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'솔데스크', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'진달래',90,50,90,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'개나리',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'봉선화',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'나팔꽃',50,50,90,'Suwon',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'선인장',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'소나무',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'참나무',20,20,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'홍길동',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'무궁화',80,80,90,'Suwon',sysdate);

commit;
select count(*) from sungjuk; --전체 레코드 갯수
select * from sungjuk;

/////////////////////////////////////////////////

●[distinct]
 - 칼럼에 중복 내용이 있으면 대표값 1개만 출력
 - 형식) distinct 칼럼명
 
select addr from sungjuk;
select addr from sungjuk order by addr; --asc 생략가능
select addr from sungjuk order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;
/////////////////////////////////////////////////

●[group by]
 - 칼럼에 동일 내용끼리 그룹화 시킴
 - 형식) group by 칼럼1, 칼럼2, 칼럼3, ~~~
 
 --주소가 동일한 값을 그룹화시키고 주소를 조회
 select addr
 from sungjuk
 group by addr; --distinct와 결과값 동일
 
 --ORA-00979: GROUP BY 표현식이 아닙니다. 00979. 00000 -  "not a GROUP BY expression"
select addr, uname --그룹시키고 나올 수 있는 값은 1개만 가능한 값만 조회
from sungjuk
group by addr; --에러

--문1)주소별 인원수를 조회하시오
select addr,count(*) as 인원수
from sungjuk
group by addr;

select addr, count(*) as cnt --칼럼명 임시 부여
from sungjuk
group by addr;

select addr, count(*) cnt  --as 생략가능
from sungjuk
group by addr;

--주소별 오름차순 정렬해서 조회
select addr
from sungjuk
group by addr
order by addr;

--주소별 인원수를 내림차순 정렬해서 조회
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt --해석순서 3)
from sungjuk                 --해석순서 1)
group by addr                --해석순서 2)
order by cnt desc;           --해석순서 4)
/////////////////////////////////////////////////

●[집계함수]
--문2) 주소별 국어점수에 대해서 집계하시오
--count(*)로 적는 이유는 NULL값일 경우 count를 안 할 까봐 확실히 적어주는 것임
--갯수, 최대값, 최소값, 합계, 평균 
select addr, count(*), max(kor), min(kor), sum(kor),avg(kor) 
from sungjuk
group by addr;

--주소순으로 정렬
select addr, count(*), max(kor), min(kor), sum(kor),avg(kor) 
from sungjuk
group by addr
order by addr;

--round(값, 0) 소수점 이하값에서 반올림하고 소수점은 없음
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),0)
from sungjuk
group by addr
order by addr;

--round(값, 2) 소수점 3번째값에서 반올림하고 소수점은 없음
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),2)
from sungjuk
group by addr
order by addr;

--국어 평균을 소수점 없이 반올림하고 내림차순 정렬해서 조회
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),0)
from sungjuk
group by addr
order by round(avg(kor),0) desc;

--칼럼명 부여
select addr
      ,count(*) as cnt
      ,max(kor) as max_kor
      ,min(kor) as min_kor
      ,sum(kor) as sum_kor
      ,round(avg(kor),0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor),0) desc;

select * from sungjuk order by addr;

--문3) 총점(tot), 평균(aver) 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
--문4) 평균(aver)이 80점이상 행을 대상으로 주소별 인원수를 인원수순으로 조회하시오
select addr, count(*) as 인원수
from sungjuk
where aver>=80
group by addr;

select addr, aver
from sungjuk
where aver>=80
order by aver desc;

select addr, count(*)  --4)
from sungjuk           --1)
where aver>=80         --2)
group by addr          --3)
order by count(*);     --5)

//////////////////////////////////////////////////////////

●[2차 그룹]
--주소별 순으로 조회하시오
select addr, kor, eng, mat from sungjuk order by addr, kor;

--주소별(1차) 그룹을 하고, 주소가 같다면 국어점수(2차)로 그룹화 하기

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

select addr, kor
from sungjuk
group by addr, kor;

select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat --동점자가 몇 명인지 체크 가능
order by kor, eng, mat;

//////////////////////////////////////////////////////////

●[having 조건절]
 - group by 와 같이 사용하는 조건절
 - 그룹화를 하고 난 후의 조건절을 추가
 - 형식) having 조건절
 
 -- 주소별 인원수를 조회하시오
 select addr, count(*)
 from sungjuk
 group by addr;
 
 -- 주소별 인원수가 3인 행을 조회하시오
 select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- 주소별 인원수가 3이상인 행을 조회하시오
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

--문5) 주소별 국어평균값이 50이상 행을 조회하시오
--    (단, 평균값은 소수점없이 반올림)

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

1)주소별 국어평균값 구하기
select addr, avg(kor)
from sungjuk
group by addr;

2)국어 평균값을 소수점에서 반올림하기
select addr, round(avg(kor),0)
from sungjuk
group by addr;

3) 2)번 결과에서 국어 평균값이 50이상 조회하기
select addr, round(avg(kor),0), count(*)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

4) 3)결과에서 국어 평균값을 내림차순으로 조회하기
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

5) 4)결과에서 국어평균값 칼럼명을 avg_kor로 변경하기
select addr, round(avg(kor),0) as avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

--문6) 평균(aver)이 70이상 행을 대상으로 주소별 인원수를 구한후
--     그 인원수가 2미만 행을 인원수 순으로 조회하시오
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

1) 전체 행을 조회
select * from sungjuk;

2) 평균(aver)값이 70이상 행 조회
select *
from sungjuk
where aver>=70;

3) 주소별 인원수를 구하시오
select addr, count(*)
from sungjuk
where aver>=70
group by addr;

4) 3)의 결과에서 그 인원수가 2미만 행 조회
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

select * from sungjuk order by addr;