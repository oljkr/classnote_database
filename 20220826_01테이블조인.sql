● [테이블 조인]
 - 여러 테이블을 하나의 테이블처럼 사용하는 조인
 - 두개이상의 테이블을 결합하여 데이터를 추출하는 기법
 - 두테이블의 공통값을 이용하여 컬럼을 조합하는 수단

 형식)
      select 칼럼명 
      from 테이블1 join 테이블2
      on  조건절;                     --ANSI(표준) SQL문
      
      select 칼럼명
      from 테이블1 , 테이블2
      on  조건절;                     --Oracle DB SQL문
      
      select T1.*, T2.*              --T1.모든칼럼, T2.모든칼럼
      from T1 join T2
      on T1.x = T2.x;                --테이블명.칼럼명
      
      select T1.*, T2.*, T3.*
      from T1 join T2
      on T1.x = T2.x join T3         --3개 테이블 조인
      on T1.y = T3.y;
      
      select T1.*, T2.*, T3.*, T4.*  --4개 테이블 조인
      from T1 join T2
      on T1.x = T2.x join T3
      on T1.y = T3.y join T4
      on T1.z=T4.Z;
      
● 조건절 : where조건절, having조건절, on조건절

● 물리적 테이블과 논리적 테이블은 서로 동등한 관계이다
   - 물리적 테이블 : 실제 create table한 테이블
   - 논리적 테이블 : SQL문에 의해 가공된 테이블
   
   select * from tb_student;
   select count(*) from tb_student;
////////////////////////////////////////////////////////////////////////////////

● 연습 

-- 학번을 기준으로 수강테이블과 학생테이블 조인
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- 두 테이블간의 교집합 조인. inner 생략가능. 가본
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- 수강신청한 학생들의 학번, 과목코드, 이름, 이메일 조회하시오
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

select A.*, B.uname, B.email
from tb_sugang A inner join tb_student B
on A.hakno = B.hakno;

--과목코드를 기준으로 수강테이블과 과목테이블 조인
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

--3개 테이블 조인 : 수강테이블 + 학생테이블(이름) + 과목테이블(과목명)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student 
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

select A.*, B.uname, C.gname
from tb_sugang A join tb_student B  --inner 글자 생략함
on A.hakno = B.hakno join tb_gwamok C
on A.gcode = C.gcode;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E NATURAL JOIN DEPT D
 ORDER BY DEPTNO, E.EMPNO;
 
 --테이블명의 alias(별칭)도 가능하다
 select SU.*, ST.uname, ST.email
 from tb_sugang SU join tb_student st --대소문자 구분 안 함.
 on SU.hakno = ST.hakno;
 
 select SU.*, GW.gname, GW.ghakjum
 from tb_sugang SU join tb_gwamok GW
 on SU.gcode = GW.gcode;
 
 select 냠.*, 얌.uname, 얌.email
from tb_sugang 냠 inner join tb_student 얌
on 냠.hakno = 얌.hakno;

select SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

-- 조회시 테이블간에 중복되지 않은 칼럼명은 테이블명을 생략할 수 있다.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--중복되는 칼럼명은 소속 테이블명을 정확히 명시해야 한다.
--ORA-00918: 열의 정의가 애매합니다
select hakno, gcode, uname, email, gname, ghakjum --여기서 hakno이 SU소속인지 ST소속인지 모르기에 오류가 남. 명시해 줘야함.
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum --여기서 hakno이 SU소속인지 ST소속인지 모르기에 오류가 남. 명시해 줘야함.
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E JOIN DEPT D USING (DEPTNO)
 WHERE SAL >= 3000
 ORDER BY DEPTNO, E.EMPNO;
 ///////////////////////////////////////////////////////////////////////////////
 
 ● [테이블 조인 연습]
--전체 행 갯수
select count(*) from tb_student; --6개
select count(*) from tb_gwamok; --9개
select count(*) from tb_sugang; --13개

문1)수강신청을 한 학생들 중에서 '제주'에 사는 학생들만 학번, 이름, 주소를 조회하시오

--수강신청한 학생들 목록 보기
select * from tb_sugang;

--수강테이블 + 학생테이블
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--'제주'만 조회하기
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '제주';

select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '제주';

--가공된 논리적 테이블의 이름을 AA라고 지정하고, 다시 재가공 할 수 있다
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) AA
where AA.address='제주';


--AA 별칭 생략가능
select hakno, gcode, uname, address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) 
where address='제주';

문2) 지역별로 수강신청 인원수, 지역을 조회하시오
     서울 2명
     제주 2명;
     
--1)수강테이블 조회
select * from tb_sugang;

--2)수강 신청한 학생들의 명단(학번)
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno; --group by절은 내부적으로 정렬을 가지고 있음

--3)수강신청한 학번(AA)들의 주소를 학생테이블에서 가져오기
select AA.hakno, ST.address
from (
        select hakno from tb_sugang group by hakno
     ) AA join tb_student ST
on AA.hakno = ST.hakno;

--4) 3)의 결과를 BB테이블로 만든 후 주소별 그룹후 행 갯수 구하기
select BB.address, count(*) || '명' as cnt
from (
      select AA.hakno, ST.address
       from (
             select hakno from tb_sugang group by hakno
             ) AA join tb_student ST
         on AA.hakno = ST.hakno
     ) BB
group by BB.address;

--아래는 내가 푼 것
select distinct hakno, address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) ;

select address, count(address)
from(
    select distinct hakno, address
    from (
          select SU.hakno, SU.gcode, uname, address
          from tb_sugang SU join tb_student ST
          on SU.hakno = ST.hakno
    )
)
group by address;

--경환님 풀이
select AA.address, count(*) || '명'
from(
    select SU.hakno, address
    from tb_sugang SU join tb_student ST
    on SU.hakno = ST.hakno
    group by SU.hakno, address
     ) AA
group by AA.address;

--영은님 풀이
select ST.address, count(distinct(ST.hakno))
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

--도훈님 풀이
SELECT
    address,
    count(*)
FROM
    (
        SELECT
            DISTINCT SU.hakno,
            address
        FROM
            tb_sugang SU
            JOIN tb_student ST ON SU.hakno = ST.hakno
    )
GROUP BY
    address;

문3) 과목별 수강 신청 인원수, 과목코드, 과목명를 조회하시오 
     d001 HTML   2명 
     d002 포토샵   1명
     p001 OOP    2명

--1) 수강테이블에서 과목코드 정렬해서 조회하기
select * from tb_sugang order by gcode;

--2) 수강테이블에서 과목코드가 동일한 행을 그룹
select gcode, count(*)
from tb_sugang
group by gcode;

--3) 2)의 결과를 AA테이블로 생성하고
select AA.gcode, concat(AA.cnt, '명') 인원수, GW.gname
from (
        select gcode, count(*) as cnt
        from tb_sugang
        group by gcode
      ) AA join tb_gwamok GW
on AA.gcode = GW.gcode
where AA.gcode like 'p%'
order by AA.gcode;

select SU.gcode, GW.gname, count(*) || '명' as cnt
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.gcode, GW.gname;


문4) 학번별 수강신청과목의 총학점을 학번별순으로 조회하시오
     g1001  홍길동  9학점
     g1002  홍길동  6학점
     g1005  진달래  9학점

--1) 수강테이블에서 학번별로 조회
select hakno, gcode from tb_sugang order by hakno;

--2) 수강테이블에 과목코드가 일치하는 학점을 과목테이블에서 가져와서 붙이기
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

--3) 2)의 결과를 AA테이블로 만들고, 학번별로 그룹화한 후, 학점의 합계를 구하기
select aa.hakno, sum(ghakjum)
from(
      select su.hakno, su.gcode, gw.ghakjum
      from tb_sugang su join tb_gwamok gw
      on su.gcode = gw.gcode
    ) AA
group by aa.hakno;


--4) 3)의 결과를 BB테이블로 만들고, 학번을 기준으로 학생테이블에서 이름 가져와서 붙이기
select BB.hakno, ST.uname, concat(bb.합계, '학점') 총학점
from(
      select aa.hakno, sum(ghakjum) as 합계
      from(
            select su.hakno, su.gcode, gw.ghakjum
            from tb_sugang su join tb_gwamok gw
            on su.gcode = gw.gcode
          ) AA
      group by aa.hakno
    ) BB join tb_student ST
on BB.hakno = ST. hakno;

--------------------------------------------------------------------------------

문4)의 또다른 방법
--1)수강테이블 + 학생테이블 + 과목테이블 3개 테이블 한꺼번에 조인
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
order by su.hakno;

--2) 1차 그룹(학번), 2차 그룹(이름)으로 그룹화하고, 총학점 구하기
select su.hakno, st.uname, sum(gw.ghakjum) || '학점' as hap
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno, st.uname;


select aa.hakno, aa.uname, aa.ghakjum, sum(aa.ghakjum)
from(
select su.hakno, st.uname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
order by gw.ghakjum
)aa
group by aa.hakno, aa.uname, aa.ghakjum
order by aa.ghakjum;

select AA.hakno, AA.uname, sum(ghakjum)||'학점' as 학점
from (
        select su.hakno, st.uname, gw.ghakjum
        from tb_sugang su join tb_student st
        on su.hakno = st.hakno join tb_gwamok gw
        on su.gcode = gw.gcode
    ) AA
group by AA.hakno, AA.uname;
     
select SU.*, ST.uname, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

select AA.hakno, AA.uname, sum(AA.ghakjum)
from(
select SU.*, ST.uname, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
)AA
group by AA.uname, AA.hakno;

문5) 학번 g1001이 수강신청한 과목을 과목코드별로 조회하시오
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  HTML;

--1)수강테이블 + 과목테이블 조인
select SU.hakno, Su.gcode, GW. gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2)학번 g1001이 신청한 정보 조회하기
select SU.hakno, Su.gcode, GW. gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where su.hakno='g1001'          --실제 자바코드에서 학번을 변수처리 한다
order by SU.gcode;
     
문6)수강신청을 한 학생들의 학번, 이름 조회
        g1001 홍길동
        g1002 홍길동
        g1005 진달래
        g1006 개나리
--1) 수강신청을 한 학생들의 학번 조회
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001', 'g1002', 'g1005', 'g1006');

--3)
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);
////////////////////////////////////////////////////////////////////////////////    
--아래 코드 참고
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;

select AA.hakno, BB.uname
from (select distinct(hakno) from tb_sugang order by hakno) AA join tb_student BB
on AA.hakno = BB.hakno;

문7)수강신청을 하지 않은 학생들의 학번, 이름 조회
        g1003 개나리
        g1004 홍길동

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);

--아래 코드 참고
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;

select hakno, uname
from tb_student
where hakno not in(select AA.hakno
from (select distinct(hakno) from tb_sugang order by hakno) AA join tb_student BB
on AA.hakno = BB.hakno);
------------------------------------------------------

