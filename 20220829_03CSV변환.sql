�� [CSV ����]
 - ��� �����Ͱ� , �� ���еǾ� �ִ� ����

�� [CSV ������ �����ͺ��̽��� ��������]
 - �������������� https://data.go.kr/ Ȱ��
 
 
 ��) ���θ� �����ȣ ���̺� �����ϱ�
 
csv ������ ������ ���� ���̺��� �����Ѵ�
--1) zipdoro.csv�غ� (258267��)

--2) zipdoro.csv ������ �����ϴ� zipdoro���̺� ����

create table zipdoro(
    zipno       char(5) --�����ȣ
    ,zipaddress varchar(1000) --�ּ�
);

commit;
drop table zipdoro; --���̺� ����

--3) ��������� ��������
- zipdoro ���̺� ��Ŭ�� -> ������ ����Ʈ (��������)
- zipdoro ���̺� ��Ŭ�� -> export (��������)

select count(*) from zipdoro;

--����Ư���� �������� ���۵Ǵ� �����ȣ�� ����� Ȯ���Ͻÿ�
select count(*) from zipdoro
where zipaddress like '����Ư���� ������%';

select * from zipdoro
where zipaddress like '����Ư���� ������%';

////////////////////////////////////////////////////////////////////////////////

��2)�ѱ��������б�_���ߵ��б���ġ.csv�� ��ȯ�Ͻÿ� (11874��)
-- ����ִ� ��(null)�� ã���ÿ�

create table school(
    sid       char(10)
    ,sname    varchar(100)
    ,scategory varchar(100)
    ,saddress varchar(1000)
    ,cdate  date
    ,rdate  date
    ,latitude number(10,8)
    ,longitude number(10,7)
);

commit;

drop table school;
select count(*) from school;

select count(saddress) from school; --11872
select * from school
where saddress is null;

SELECT * FROM school
order by saddress nulls first;

����) �� �õ��� �ʵ��б�, ���б� ������ ���Ͻÿ�
select count(*) from school where saddress like '����Ư����%';
select distinct(substr(saddress,0, instr(saddress,' ',1,2))) from school;
select scategory, substr(saddress,0, instr(saddress,' ',1,2)) from school group by substr(saddress,0, instr(saddress,' ',1,2)),scategory;
select distinct scategory from school;

select substr(saddress,0, instr(saddress,' ',1,1)), scategory, count(*) from school group by substr(saddress,0, instr(saddress,' ',1,1)),scategory
order by substr(saddress,0, instr(saddress,' ',1,1)), scategory desc;

select distinct(substr(saddress, 0, instr(saddress, ' '))) as addr1, scategory as ckinds
from school
order by addr1, ckinds desc;
