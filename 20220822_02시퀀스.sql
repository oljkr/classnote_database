*수업내용
-sort 정렬
-테이블 수정
-시퀀스

*[sort정렬]
-특정값(keyfield)을 기준으로 순서대로 재배치
-오름차순 ascending sort asc 생략하면 기본값 1->10 A->Z a->z ㄱ->ㅎ
-내림차순 descending sort
-형식) order by 칼럼명1, 칼럼명2, 칼럼명3, ~~~

--sungjuk테이블을 조회하시오
select * from sungjuk;

-- 전체 레코드를 이름순으로  정렬해서 조회하시오
select uname
from sungjuk
order by uname asc; --오름차순 정렬

select uname
from sungjuk
order by uname; --asc 생략가능

select uname
from sungjuk
order by uname desc; --내림차순 정렬

--국어점수순으로 정렬해서 조회하시오
select uname, kor
from sungjuk
order by kor asc;

--1차 정렬 : 국어점수순으로 정렬
--2차 정렬 : 국어점수가 같다면 이름을 기준으로 내림차순 정렬
select uname, kor
from sungjuk
order by kor asc, uname desc;

select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc;

select uname,aver
from sungjuk
where aver<=70
order by uname;

select uname,aver
from sungjuk
order by uname
where aver<=70; --에러 ORA-00933
commit;
[alter문] - 테이블의 구조 수정 및 변경
1. 컬럼 추가
   형식) alter table table명 add (컬럼명 데이터타입);
   
--music 칼럼 추가
alter table sungjuk add(music int null);
select * from sungjuk;

2. 컬럼명 수정
   형식) alter table table명 rename column 원래컬럼명 to 바꿀컬럼명;
   
-- 국어칼럼 kor를 korea칼럼명으로 수정하시오
alter table sungjuk rename column kor to korea;

3. 컬럼 데이터 타입 수정
  형식) alter table table명 modify(컬럼명 데이터타입);
4. 컬럼 삭제
  형식)alter table table명 drop(컬럼명);
----------------------------------------------------
●[시퀀스 sequence[
함수 .nextval 사용.

●[sysdate 함수] - 시스템의 현재 날짜 정보
insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval, '홍길동', 89, 85, 90, 'Seoul', sysdate);

--문제) sno=2 행을 삭제하시오
delete from sungjuk where sno=2;

--sungjuk테이블 삭제
drop table sungjuk;
select * from sungjuk;
select count(*) from sungjuk;
commit;

--sungjuk 테이블 생성
create table sungjuk(
     sno    int          not null  --일련번호
    ,uname  varchar(50)  not null
    ,kor    int          not null
    ,eng    int          not null
    ,mat    int          not null
    ,tot    int             
    ,aver   int          
    ,addr   varchar(50)            --주소
    ,wdate  date                   --등록일(년월일시분초)
);
                                                                                                                                                                                                                                                            
●[sungjuk 테이블 입력 데이터]
-----------------------------------------------------------
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
-------------------------------------------------------
commit;

● [문제]

-- 문1) 전체행에 대해서 총점(tot), 평균(aver)을 구하시오
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
select * from sungjuk;

-- 문2) 이름에 '나' 글자가 있는 행을 조회하시오
select * from sungjuk where uname like '%나%';

-- 문3) 주소가 서울, 제주 행을 조회하시오
select uname, addr from sungjuk where addr ='Seoul' or addr='Jeju';
select uname, addr from sungjuk where addr in ('Seoul', 'Jeju');

-- 문4) 국영수 세과목 모두 90점이상 행이 몇개인지 조회하시오
select count(*) from sungjuk where kor>=90 and eng>=90 and mat>=90;
select count(*) as cnt --칼럼명변경.as는 생략가능. 칼럼명은 한글 가능
from sungjuk where kor>=90 and eng>=90 and mat>=90; 

-- 문5) 주소별로 정렬해서 조회하시오.(오름차순) 주소가 같다면 일련번호 순으로 다시 정렬해서 조회하시오
select * from sungjuk
order by addr, sno;