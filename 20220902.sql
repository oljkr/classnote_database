create table accesories(
    acccode    char(5)          primary key
    ,accsort char(2)  not null --REFERENCES scode(sortcode)
    ,sortcode   char(2)         not null
    ,accname   varchar2(100)        not null
    ,color   varchar2(50)       not null
    ,feature  varchar2(50)  not null
    ,details   varchar2(255)     not null
    ,price  number(9)         not null
    ,pic varchar2(100)         
);
drop table accesories;
insert into accesories(acccode,accsort,sortcode,accname,color,feature,details,price,pic) 
values ('a1001', 'ba', 'aw', 'Pride Edition Nike Sport Loop','Pride Edition','41(mm)','���Ϸ� ��� ����� ���� / ��ũ �ص� ���� �н��� Ÿ���̶� ������ �����ϰ� ���� ����',65000,'a1001.png');

--insert into accesories(acccode,accsort,sortcode,accname,color,feature,details,price,pic) 
--values ('a1002', 'ba', 'aw', 'Pride Edition Nike Sport Loop','Cargo Khaki','45(mm)','���Ϸ� ��� ����� ���� / ��ũ �ص� ���� �н��� Ÿ���̶� ������ �����ϰ� ���� ����',65000,'a1002.png');

insert into accesories(acccode,accsort,sortcode,accname,color,feature,details,price,pic) 
values ('a1003', 'ba', 'aw', 'Sport Band','Blue Fog','41(mm)','��ź�� ��ȭź������ü�� ����� ưư�ϰ� ������ / �ε巯�� ��е� ������ ���',65000,'a1003.png');

insert into accesories(acccode,accsort,sortcode,accname,color,feature,details,price,pic) 
values ('a3001', 'tp', 'ma', 'Magic Trackpad Multi-Touch','Black','6.3(inch)','��� ������ Multi-Touch ����ó�� Force Touch ����� ���� / Mac�� �ڵ����� �� / ������ ���͸��� ����Ǿ� ����',175000,'a3001.png');

insert into accesories(acccode,accsort,sortcode,accname,color,feature,details,price,pic) 
values ('a5002', 'ca', 'ph', '13 Pro Leather Case','Midnight','6.7(inch)','���� �� �����ϰ� ��ȣ�ϸ鼭 ���õ� ��Ÿ���� ������ / Ư�� ���� ó�� �� ���� ������ ��ģ �������� ����',75000,'a5002.png');

select * from accesories;

select sum(tot) as hap from sungjuk where addr='Seoul'
group by addr;

select round((kor+eng+mat)/3,2) from sungjuk where addr='Seoul';

--1)주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';

--2)주소가 서울인 행을 대상으로 국영수 평균구하기
select avg(kor), avg(eng), avg(mat)
from sungjuk
where addr='Seoul';

--3)주소가 서울인 행을 대상으로 국영수 평균 구하고 반올림해서 소수점 둘째 자리까지 표현
select round(avg(kor),2), round(avg(eng),2), round(avg(mat),2)
from sungjuk
where addr='Seoul';

--4)3의 결과에서 칼럼명 변경.
select round(avg(kor),2) as avg_kor
     , round(avg(eng),2) as avg_eng 
     , round(avg(mat),2) as avg_mat
from sungjuk
where addr='Seoul';

--문제) 이름에 '나' 문자 있는 행을 조회하시오
select *
from sungjuk
where uname like '%나%';

select SU.hakno, Su.gcode, GW. gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where su.hakno='g1001'          --실제 자바코드에서 학번을 변수처리 한다
order by SU.gcode;


select SU.hakno, SU.gcode, GW.gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
where SU.hakno='g1001'
order by SU.gcode;

select * from tb_sugang;
select * from tb_gwamok;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select * from sungjuk;

select sno, uname, addr, rownum
from sungjuk
order by uname;

select AA.*, rownum
from (
    select sno, uname, addr
    from sungjuk
    order by uname
    )AA;
    
select BB.sno, BB.uname, BB.addr, rownum as rnum
from (
    select AA.sno,AA.uname, AA.addr
    from (
        select sno, uname, addr
        from sungjuk
        order by uname
        )AA
)BB

select *
from(
select BB.sno, BB.uname, BB.addr, rownum as rnum
from (
    select AA.sno,AA.uname, AA.addr
    from (
        select sno, uname, addr
        from sungjuk
        order by uname
        )AA
    )BB
)
where 4<=rnum and rnum<=6;

1)
select uname, aver, addr
from sungjuk
order by uname;

2)rownum도 같이 정렬된다
select uname, aver, addr, rownum
from sungjuk
order by uname;


3) 1)의 결과를 한번 더 셀프조인하고, rownum 추가하기
select uname, aver, addr, rownum
from(
      select uname, aver, addr
      from sungjuk
      order by uname
    );
    
4) 행번호 4~6 조회하기 (결과:조회되지 않음)
select uname, aver, addr, rownum
from(
      select uname, aver, addr
      from sungjuk
      order by uname
    )
where rownum>=4 and rownum<=6;

5) 3)의 내용을 한번 더 셀프조인하고, 행번호 4~6 조회하기
아래처럼 칼럼명이 다 노출된 경우 *처리해도 됨.

select *
from (
    select uname, aver, addr, rownum as rnum
    from(
          select uname, aver, addr
          from sungjuk
          order by uname
        )
)
where rnum>=4 and rnum<=6;

INSERT INTO sungjuk(sno, uname, kor, eng, mat, aver, addr, wdate)
VALUES(sungjuk_seq.nextval, ?, ?, ?, ?, ?, ?, sysdate)

SELECT sno, uname, kor, eng, mat, wdate
FROM sungjuk
ORDER BY sno DESC

DELETE FROM sungjuk
WHERE sno=?

UPDATE sungjuk
SET uname=?, kor=?, eng=?, mat=?, aver=?, addr=?, wdate=sysdate
WHERE sno=?
