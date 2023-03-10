1. 테이블 생성
---------------------- 학생테이블
create table tb_student(
   hakno    char(5)     not null         --학번
  ,uname    varchar(20) not null         --이름
  ,email    varchar(20) unique           --이메일
  ,address  varchar(20) not null         --주소
  ,phone    varchar(20)                  --전화번호
  ,regdt    date        default sysdate  --등록일
  ,primary key(hakno)                    --기본키
);

---------------------- 과목테이블
create table tb_gwamok(
   gcode    char(4)      not null        --과목코드 (p:프로그램교과목, d:디자인교과목)
  ,gname    varchar(20)  not null        --과목이름
  ,ghakjum  number(2)    default 1       --학점
  ,regdt    date         default sysdate --등록일
  ,primary key(gcode)                    --기본키
);

---------------------- 수강테이블
create table tb_sugang(
   sno    number(3)  not null   --일련번호
  ,hakno  char(5)    not null   --학번
  ,gcode  char(4)    not null   --과목코드
  ,primary key(sno)             --기본키
);

2. 수강테이블 시퀀스 생성
create sequence sugang_seq;

3. 행추가
---------------------------------------tb_student테이블에 행 추가하기
insert into tb_student(hakno,uname,address,phone,email)
values('g1001','홍길동','서울','111-5558','11@naver.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1002','홍길동','제주','787-8877','33@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1003','개나리','서울','554-9632','77@naver.com');
insert into tb_student(hakno,uname,address,phone,email)
values('g1004','홍길동','부산','555-8844','88@daum.net');

insert into tb_student(hakno,uname,address,phone,email)
values('g1005','진달래','서울','544-6996','33@nate.com');

insert into tb_student(hakno,uname,address,phone,email)
values('g1006','개나리','제주','777-1000','66@naver.com');


---------------------------------------tb_gwamok테이블에 행 추가하기
insert into tb_gwamok(gcode,gname,ghakjum) values('p001','JAVA',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p002','Oracle',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p003','JSP',2);
insert into tb_gwamok(gcode,gname,ghakjum) values('d001','HTML',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('d002','포토샵',5);
insert into tb_gwamok(gcode,gname,ghakjum) values('d003','일러스트',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('d004','CSS',1);
insert into tb_gwamok(gcode,gname,ghakjum) values('p004','Python',3);
insert into tb_gwamok(gcode,gname,ghakjum) values('p005','AJAX',2);

---------------------------------------tb_sugang테이블에 행 추가하기

insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1002','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p004');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','p001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1005','d003');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','d001');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p002');
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1006','p001');
//////////////////////////////////////////////////////////////////////////////////

commit;

-- tb_student 테이블 전체 레코드 갯수
select count(*) from tb_student; --6

--tb_gwamok 테이블 전체 레코드 갯수
select count(*) from tb_gwamok; --9

--tb_sugang 테이블 전체 레코드 갯수
select count(*) from tb_sugang; --13
//////////////////////////////////////////////////////////////////////////////////

● [참조 무결성 제약조건]
  - foreign key 제약조건
  - 동일한 테이블 또는 다른 테이블에서 기본키 또는 고유키를 참조하는 제약 조건
  - on delete cascade  부모테이블의 행이 삭제되는 경우 자식테이블의 종속행을 삭제
  - on delete set null 부모테이블의 행이 삭제되는 경우 종속 외래키 값을 null로 변환
  - 부모:Primary Key 기본키 <---> 자식:Foreign Key 외래키
  
    예) 수강테이블 제약조건
     create table tb_sugang(
        sno    number(3)  not null
       ,hakno  char(5)    not null
       ,gcode  char(4)    not null
       ,primary key(sno)                                 --sno칼럼 기본키
       ,foreign key(hakno) references tb_student(hakno)  --hakno칼럼은 부모테이블(학생)의 hakno 참조
       ,foreign key(gcode) references tb_gwamok(gcode)   --gcode칼럼은 부모테이블(과목)의 gcode 참조
        on update cascade                                --부모테이블의 값이 수정되면 자식테이블 값도 같이 수정
        on delete no action                              --부모테이블의 행이 삭제되더라도 자식테이블은 삭제되지 않음
     );
        
 문1)학생테이블에서 지역별 인원수를 인원수순으로 조회하시오;
select address, count(*)
from tb_student
group by address
order by count(*) desc;

문2)학생테이블에서 동명이인이 각 몇명인지 조회하시오
select distinct(uname) from tb_student;
select uname, count(*)
from tb_student
group by uname
order by count(*);

문3)학생테이블의 학번, 이름, 주소를 조회하시오 (주소는 영문으로 출력)
select hakno, uname, address
from tb_student;

select hakno 학번, uname 이름, case address
                             when '서울' then 'Seoul'
                             when '제주' then 'Jeju'
                             when '부산' then 'Busan'
                             end as 주소
from tb_student;

SELECT * FROM ALL_CONSTRAINTS
WHERE TABLE_NAME = 'TB_STUDENT';
문4)학생테이블에서 주소별 인원수가 3명미만 행을 조회하시오
select address, count(*)
from tb_student
group by address
having count(address)<3;

문5)과목테이블에서 프로그램 교과목만 조회하시오
select *
from tb_gwamok
where gcode like 'p%'; --프로그램 교과목

select *
from tb_gwamok
where gcode like 'd%'; --디자인 교과목

문6)과목테이블에서 디자인 교과목중에서 3학점만 조회하시오
select *
from tb_gwamok
where gcode like 'd%' and ghakjum=3;

문7)과목테이블에서 프로그램 교과목의 학점 평균보다 낮은 프로그램 교과목을 조회하시오
select gcode, gname, ghakjum
from tb_gwamok
where gcode like 'p%' and ghakjum < (select avg(ghakjum) from tb_gwamok where gcode like 'p%');

select avg(ghakjum)
from tb_gwamok
where gcode like 'p%';

SELECT CAST,
       GENDER,
       A.JOB AS R_JOB,
       B.JOB AS I_JOB
  FROM RUNNING_MAN A JOIN INFINITE_CHALLENGE B
 USING (CAST, GENDER);