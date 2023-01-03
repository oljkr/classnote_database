�� [index ����]
  - �� ���� �˻��� ���� �ε���
  - �����͸� ������ ã�� �� �ִ� ����
  - ���̺� ���� ��ȸ �ӵ��� ���� �ִ� �ڷᱸ��
  - PKĮ���� �ڵ����� �ε��� �����ȴ�
  
�� [�ε��� ���]  
  - full scan
    ó������ ������ ������ �˻��ϴ� ���. ��������        
    
  - index range scan
    �̸��� �������� ��� ������ ã�Ƽ� �������� ã�ư�
    �ξ� ����. ������ �޸𸮰� �־�� ��.
    
  - index unique scan
    �й��� 1���� ������. ������ ��
    
�� [�ε��� ����]   
- ����) create index �ε����� on ���̺��(Į����)
  
  
�� [�ε��� ����]  
- ����) drop index �ε�����
/////////////////////////////////////////////////////////////

�� [���� 1] - PK�� ���� ���̺�

--���̺����
create table emp2(
  id        number(5)    
  ,name     varchar2(25)
  ,salary   number(7, 2)
  ,phone    varchar2(15)
  ,dept_id  number(7)
);

--���߰� 
insert into emp2(id,name) values (10,'kim');
insert into emp2(id,name) values (20,'park');
insert into emp2(id,name) values (30,'hong');
commit;

--�ε��� ���� ��
select * from emp2 where name='hong'; --Ŀ�� ���⿡ ���� F10
--F10 ��ȹ���� ���� -> full scan cost 2

--�ε��� ���� �� (���� �������� ������ ������)
create index emp2_name_idx on emp2(name);
drop index emp2_name_idx on emp2(name); --�ε��� ����

select * from emp2 where name='hong'; --Ŀ�� ���⿡ ���� F10
--F10 ��ȹ���� ���� -> full scan cost 2

�� [���� 2] - PK�� �ִ� ���̺�
--PK�� �ε����� �ڵ����� �����Ǹ鼭 ���ĵȴ�(����ó��)

create table emp3 (
   no    number       primary key
  ,name varchar2(10)
  ,sal  number
);

select * from emp3;
select * from emp3 where no=3;  --Ŀ�� ���⿡ ���� F10
--F10 ��ȹ������ -> unique scan, cost 1
///////////////////////////////////////////////////////////////////

-- ����3)
-- 100������ ���ڵ� ������� cost ��
create table emp4(
   no     number
  ,name   varchar2(10)
  ,sal    number
);


���ν����� �̿��ؼ� 100���� �߰��ϱ� ///////////////////////////////////////
declare --����
    --��������
    i     number      := 1;      --i������ 1 ���� := ������
    name  varchar(20) := 'kim';
    sal   number      := 0;
begin
    -- T-SQL��
    while i<=1000000 loop
        if i mod 2 = 0 then
            name := 'kim' || to_char(i);
            sal := 300;
        elsif i mod 3 = 0 then
            name := 'park' || to_char(i);
            sal := 400;
        elsif i mod 5 = 0 then
            name := 'hong' || to_char(i);
            sal := 500;
        else
            name := 'shin' || to_char(i);
            sal := 250;
        end if;
        
        insert into emp4(no, name, sal) values (i, name, sal); --���߰�
        i := i+1;
        
    end loop;
end;
/////////////////////////////////////////////////////////////////////////

commit;
select count(*) from emp4;
select * from emp4;

--1)�ε����� ������� ���� ���
select * from emp4 where name='kim466'; --�����ϰ� �� ��, ���⿡ Ŀ�� ���� F10 ��ȹ����
                                        --FULL scan, COST 904
select * from emp4 where no=466;        --FULL scan, COST 903

select * from emp4 where sal>300;       --FULL scan, COST 906

--2)�ε����� ����� ���
--name Į���� �������� �ε��� ����
create index emp4_name_idx on emp4(name);

select * from emp4 where name='kim466'; --�����ϰ� �� ��, ���⿡ Ŀ�� ���� F10 ��ȹ����
                                        --RANGE SCAN, COST 3
                                        
create index emp4_name_sal_idx on emp4(name, sal);

select * from emp4 where name='kim466' and sal>200; --RANGE SACN, COST 3

--�ε��� ������ ����
select * from user_indexes;
select * from user_indexes where index_name like 'EMP4%';

create index zip_idx1 on zipdoro(zipaddress);
drop index zip_idx1;
select * from zipdoro where zipno = '55711';



select
     nvl(cho.addr1, '-') as ����
    ,nvl(cho.ckinds, '�ʵ��б�') as �б�����
    ,nvl(cho.c_cnt, 0) as ����
    ,nvl(jung.addr2, '-') as ����
    ,nvl(jung.jkinds, '���б�') as �б�����
    ,nvl(jung.j_cnt, 0) as ����
from(
     select addr1, ckinds, count(*) as c_cnt
     from (
           select substr(saddress, 0, instr(saddress, ' ')) as addr1, scategory as ckinds
           from school
           )
     group by addr1, ckinds
     having ckinds like '��%'
     ) cho full join (
                      select addr2, jkinds, count(*) as j_cnt
                      from (
                          select substr(saddress, 0, instr(saddress, ' ')) as addr2, scategory as jkinds
                          from school
                          )
                      group by addr2, jkinds
                      having jkinds like '��%'
     ) jung
on cho.addr1 = jung.addr2
order by cho.addr1;

select * from sungjuk;

create table test11(
    acccode    varchar(50)          primary key 
    ,addcode  varchar(50)
    ,FOREIGN KEY (addcode) REFERENCES sungjuk(uname) ON UPDATE CASCADE
);

create table tb_sugang1(
       sno    number(3)  not null

      ,hakno  char(5)    not null references tb_student(hakno) 

      ,gcode  char(4)    not null references tb_gwamok(gcode)  

      ,primary key(sno)                                                         
    );
    
    select * tb_sugang1;