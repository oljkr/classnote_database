● [PL/SQL (Procedural Language) 프로시저]
  - 절차적인 데이터베이스 프로그래밍 언어
  - 변수, 조건문, 반복문
  
--콘솔창 출력하기 위한 사전 준비작업
set serveroutput on;

● [PL/SQL 기본 문법]
아래 declare자리에 create를 넣어주면 저장이 된다.
1)변수선언
declare
    --변수선언
    a number := 3;
    b number := 5;
begin
    --콘솔창 출력
    dbms_output.put_line('* 실행 결과 *');
    dbms_output.put_line(a);
    dbms_output.put_line(b);
    dbms_output.put_line(a+b);
    --결합연산자 ||
    dbms_output.put_line(a || '+' || b || '=' || (a+b));
end;


2)조건문
declare 
    --성적 프로그램
    uname varchar2(50) := '무궁화';
    kor number := 100;
    eng number := 95;
    mat number := 80;
    aver number := (kor+eng+mat)/3;
    grade varchar2(10) := NULL;
begin
    if aver>=90 then grade:='A';
    elsif aver>=80 then grade:='B';
    elsif aver>=70 then grade:='C';
    elsif aver>=60 then grade:='D';
    else grade:='F';
    end if;     --end if로 if문 마감처리하는 것 잊지말기!
    
    --출력
    dbms_output.put_line('*실행결과*');
    dbms_output.put_line('이름 : ' || uname);
    dbms_output.put_line('국어 : ' || kor);
    dbms_output.put_line('영어 : ' || eng);
    dbms_output.put_line('수학 : ' || mat);
    dbms_output.put_line('평균 : ' || round(aver,2));
    dbms_output.put_line('학점 : ' || grade);
end;

declare
begin
end;

3)반복문
declare
    --구구단 출력
    dan number := 4;
    i number default 0;
begin
    while i<10 loop
        i := i+1;
        exit when i=10;
        dbms_output.put_line(dan || '*' || i || '=' || (dan*i));
    end loop;
end;

///////////////////////////////////////////////////////////////////////

[sungjuk 테이블 관련 프로시저]
select * from sungjuk order by sno desc;
select * from sungjuk where sno=45;
--연습) 프로시저를 이용해서 sno=45행을 조회하시오
declare
    v_sno number;
    v_uname varchar2(50);
    v_kor number;
    v_eng number;
    v_mat number;
    v_addr varchar2(30);
    v_wdate date;
    v_juso varchar2(30);    --한글주소
begin
    --SQL문 작성
    select sno, uname, kor, eng, mat, addr, wdate
    into v_sno, v_uname, v_kor, v_eng, v_mat, v_addr, v_wdate
    from sungjuk
    where sno=45;
    
    if v_addr='Seoul' then v_juso:='서울';
    elsif v_addr='Jeju' then v_juso:='제주';
    elsif v_addr='Suwon' then v_juso:='수원';
    elsif v_addr='Busan' then v_juso:='부산';
    end if;  
    
    --출력
    dbms_output.put_line('*실행결과*');
    dbms_output.put_line('번호 : ' || v_sno);
    dbms_output.put_line('이름 : ' || v_uname);
    dbms_output.put_line('국어 : ' || v_kor);
    dbms_output.put_line('영어 : ' || v_eng);
    dbms_output.put_line('수학 : ' || v_mat);
    dbms_output.put_line('주소 : ' || v_addr);
    dbms_output.put_line('작성일 : ' || v_wdate);    
end;

● [프로시저 생성]
형식) create or replace  procedure 프로시저명


● [프로시저 삭제]
형식) drop  procedure 프로시저명


● [프로시저 호출]
형식) execute 프로시저명
---------------------------------------------
● [sp_text 프로시저 연습]
앞에선 create를 declare라고 했는데 여기선 create로 하면 생성이 된다.
이후에는 update를 사용하면 된다.
나중에 자바에서 연동할 때도 프로시저 이름(여기선 sp_test)으로 부를 수 있다.
--sp_text 프로시저 생성
create or replace procedure sp_test
is
begin
    dbms_output.put_line('sp_test 프로시저 호출');
end;

--sp_test 프로시저 호출
execute sp_test;

--sp_test 프로시저 삭제
drop procedure sp_test;
