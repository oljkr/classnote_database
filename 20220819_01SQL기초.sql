CREATE TABLE emp 
( 
    empno       NUMBER(4)	NOT NULL,
    ename       VARCHAR2(10),
    job         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    sal         NUMBER(7,2),
    comm        NUMBER(7,2),
    deptno      NUMBER(2)
);
select * from emp;
drop table emp;
CREATE TABLE emp 
( 
    empno       NUMBER(4)	NOT NULL,
    ename       VARCHAR2(10),
    job         VARCHAR2(9),
    mgr         NUMBER(4),
    hiredate    DATE,
    sal         NUMBER(7,2),
    comm        NUMBER(7,2),
    deptno      NUMBER(2)
);
create table fruits
(
    apple int,
    banana int,
    orange int,
    kiwi int
);
select * from fruits;
insert into fruits(apple, banana, orange, kiwi)
values (1,2,3,4);
select * from fruits;
create table days
(
    monday int,
    tuesday int,
    wednesday int,
    thursday int,
    friday int
);
select * from days;
insert into days(monday, tuesday)
values (1, 2);
select * from days;
select tuesday, monday from days;
select * from days;
create table sungjuk
(
    uname varchar(20),
    kor int,
    eng int,
    mat int,
    tot int,
    aver int
);
select * from sungjuk;
insert into sungjuk(uname, kor, eng, mat)
values('홍길동', 100, 90, 80);
select * from sungjuk;
insert into sungjuk(unname, kor,eng,mat)
values('진달래',85,75,60);
select * from sungjuk;
insert into sungjuk(uname, kor,eng,mat)
values ('진달래',85,75,60);
select * from sungjuk;
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
select * from sungjuk;