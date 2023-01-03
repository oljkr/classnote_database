●[오라클 함수]
-- 가상테이블 : dual
1. 문자열 함수
select lower('Hello World') from dual; --전부 소문자로 변환
select upper('Hello World') from dual; --전부 대문자로 변환
select initcap('hello world') from dual; 
select length('Hello World') from dual; --글자 개수
select substr('Hello World',1,7) from dual; --문자열 자르기(첫번째 글자부터 7개)
select instr('Hello World','W') from dual; --특정문자 위치 5
select lpad('SKY',5,'*') from dual; --5칸내에서 출력하고 왼쪽 빈칸은 *로 채움
select rpad('SKY',5,'*') from dual; --5칸내에서 출력하고 오른쪽 빈칸은 *로 채움
select replace('happy','p','k') from dual; --특정문자 변환

select chr(65) from dual; --ASCII 문자 변환 'A'
select chr(66) from dual;
select chr(97) from dual; --'a'
select chr(98) from dual;

--문자열 연결하기
select concat('로미오','줄리엣') from dual; --로미오줄리엣
--concat(칼럼명, '문자열')
select concat(uname, '의 평균은'), concat(aver, '입니다') from sungjuk; 

-- || 결합연산자
select uname || '의 평균은 ' || aver || '입니다' from sungjuk;
select uname || '의 평균은 ' || aver || '입니다' as str from sungjuk;
////////////////////////////////////////////////////////////////////

2. 숫자 관련 함수
select abs(-7) from dual; --절대값
select mod(5,3) from dual; --나머지 연산자
select ceil(12.4) from dual;      --13   올림함수
select floor(12.4) from dual;     --내림함수
select trunc(-13.56, 1) from dual; --13.5 이하 자릿수 버림

select avg(kor) from sungjuk; --66.363636
select ceil(avg(kor)) from sungjuk;   --67
select round(avg(kor),3) from sungjuk; --66.364
select trunc(avg(kor),3) from sungjuk; --66.363

--to_number('숫자형태의 문자열')
select to_number('123')+1 from dual; --124
select '100'+1 from dual; --101 
--SQL에서는 ''안에 숫자기호가 있으면 내부적으로 to_number()가 호출됨. 주의해야함!!
///////////////////////////////////////////////////////////////////

3.날짜 관련 함수
select sysdate from dual; --시스템의 현재 날짜와 시간정보를 리턴하는 함수

--sysdate 년월일 추출하기
select extract(year from sysdate) from dual; --2022
select extract(month from sysdate) from dual; --8
select extract(day from sysdate) from dual; --23

select to_number(extract(year from sysdate))+1 from dual;

--날짜 데이터의 연산
select sysdate+100 from dual; --오늘 날짜 +100일
select sysdate-100 from dual; --오늘 날짜 -100일

--두개의 날짜데이터에서 개월 수 계산
select months_between('2022-08-23', '2022-05-25') from dual; --2.93
select months_between('2022-08-23', '2022-12-25') from dual; --4.06

--문자열을 날짜형으로 변환
select to_date('2022-10-25') from dual;
select to_date('2022-10-25') - to_date('2022-10-30') from dual; -- -5

//////////////////////////////////////////////////////////////////////
●nvl() 함수 -null값을 다른값으로 바꿈
mariadb는 ifnull()로 사용.
문제) 주소가 'Incheon'인 행의 국어점수 최대값, 인원수을 조회하시오
select max(kor),count(*) from sungjuk
group by addr
having addr='Incheon';

select max(kor),count(*)
from sungjuk
where addr='Incheon'; --최대값(null), 인원수(0)

select count(*)+1     --0+1
from sungjuk
where addr='Incheon';

select max(kor)+1     --null+1
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0) --null값이면 0으로 대체함
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 --null값이면 0으로 대체함
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 as max_kor
from sungjuk
where addr='Incheon';

//////////////////////////////////////////////////////////////////////
●모조 칼럼(이건 sql종류따라 없을 수도 있음)
 - rownum : 행번호
 - rowid  : 행의 주소값
sno와는 다름. sno는 시퀀스로 설정하는 것이고 rownum은 또 다르게 행번호를 정함

select sno, uname, addr, rownum, rowid
from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';

--자신의 행번호를 포함해서 정렬됨. rownum을 추가하는 시점도 고려해야 함.
--order by와 같이 사용하게 되면 rownum을 가진채로 재정렬하게 된다.
--join을 생각한다면 rownum을 붙이는 시기도 잘 생각해야함
select sno, uname, addr, rownum
from sungjuk
order by uname;