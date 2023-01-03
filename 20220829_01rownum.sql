● [모조칼럼]
 - Oracle DBMS에서 제공해 준다
 - rownum 행번호 ->페이징 처리에 사용
  select uname, address, rownum from tb_student;
 - rowid 행의 주소값
  select uname, address, rowid from tb_student;
  
● [rownum]

--줄번호
select hakno, uname, rownum from tb_student;

--줄번호에 별칭 부여하기
select hakno, uname, rownum as rnum from tb_student;

--줄번호가 먼저 부여되고 정렬된다.
--order by를 주면 원래 내가 가지고 있던 줄번호를 가지고 정렬이 됨.
--oracle에 rownum을 주는 시기도 중요함.
select hakno, uname, rownum as rnum from tb_student order by uname;

--where 조건절에서도 rownum 사용가능. 줄번호 1~3사이 조회
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

--줄번호 4~6사이 조회 (조회안됨_이유는 강사님도 모르심)
--그래서 페이징 처리를 할 때 1~3을 1페이지 ,4~6을 2페이지라고 하면 2페이지를
--조회할 때 이렇게 하면 안 됨..
select hakno, uname, rownum from tb_student where 4<=rownum and rownum<=6;
////////////////////////////////////////////////////////////////////////////////
● [rownum를 활용한 페이징]
 - rownum은 모조칼럼이므로 조건절에 직접 사용하지 말고, 실제 칼럼으로 인식 후 사용할 것을 추천
 - rownum칼럼은 셀프조인 후에 줄번호 추가하고 조건절에 활용한다
 
문) 줄번호(rownum)을 이용해서 줄번호 4~6 조회
--1) 이름순으로 조회 (줄번호까지 같이 정렬)
select uname, hakno, address, rownum
from tb_student
order by uname;

--2) 1)의 결과를 셀프조인(AA)하고 줄번호를 추가하시오
--AA 안에 줄번호 빼야하는 것 주의!!!
select uname, hakno, address, rownum as rnum
from (
    select uname, hakno, address
    from tb_student
    order by uname
    ) AA;
    
--3) 2)의 결과를 BB테이블로 만들고, 줄번호 4~6행 조회하시오
select uname, hakno, address, rnum
from(
      select uname, hakno, address, rownum as rnum
      from (
          select uname, hakno, address
          from tb_student
          order by uname
          ) AA
    ) BB
where rnum>=4 and rnum<=6;

--4) 3)의 결과에서 테이블 별칭(AA, BB) 생략하기
select *
from(
      select uname, hakno, address, rownum as rnum
      from (
          select uname, hakno, address
          from tb_student
          order by uname
          ) 
    ) 
where rnum>=4 and rnum<=6;
