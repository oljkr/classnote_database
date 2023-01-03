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

