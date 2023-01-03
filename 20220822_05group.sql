��[������ �׷�ȭ]
--sungjuk_seq ������ ����
drop sequence sungjuk_seq;

--sungjuk���̺��� ����� ������ ����
create sequence sungjuk_seq;

--sungjuk ���̺� ����
drop table sungjuk;

--sungjuk ���̺� ����
create table sungjuk (
    sno    int          primary key                  
   ,uname  varchar(50)  not null                         
   ,kor    int          check(kor between 0 and 100)                    
   ,eng    int          check(eng between 0 and 100)                    
   ,mat    int          check(mat between 0 and 100)
   ,addr   varchar(20)  check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int          default 0
   ,aver   int          default 0
   ,wdate  date         default sysdate              
);

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values(sungjuk_seq.nextval,'�ֵ���ũ', 90, 85, 95, 'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',40,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���޷�',90,50,90,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,50,20,'Jeju',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',90,90,90,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'���Ȳ�',50,50,90,'Suwon',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',70,50,20,'Seoul',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'�ҳ���',90,60,90,'Busan',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'������',20,20,20,'Jeju',sysdate);
insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'ȫ�浿',90,90,90,'Suwon',sysdate);

insert into sungjuk(sno,uname,kor,eng,mat,addr,wdate)
values(sungjuk_seq.nextval,'����ȭ',80,80,90,'Suwon',sysdate);

commit;
select count(*) from sungjuk; --��ü ���ڵ� ����
select * from sungjuk;

/////////////////////////////////////////////////

��[distinct]
 - Į���� �ߺ� ������ ������ ��ǥ�� 1���� ���
 - ����) distinct Į����
 
select addr from sungjuk;
select addr from sungjuk order by addr; --asc ��������
select addr from sungjuk order by addr desc;

select distinct(addr) from sungjuk;
select distinct(uname) from sungjuk;
/////////////////////////////////////////////////

��[group by]
 - Į���� ���� ���볢�� �׷�ȭ ��Ŵ
 - ����) group by Į��1, Į��2, Į��3, ~~~
 
 --�ּҰ� ������ ���� �׷�ȭ��Ű�� �ּҸ� ��ȸ
 select addr
 from sungjuk
 group by addr; --distinct�� ����� ����
 
 --ORA-00979: GROUP BY ǥ������ �ƴմϴ�. 00979. 00000 -  "not a GROUP BY expression"
select addr, uname --�׷��Ű�� ���� �� �ִ� ���� 1���� ������ ���� ��ȸ
from sungjuk
group by addr; --����

--��1)�ּҺ� �ο����� ��ȸ�Ͻÿ�
select addr,count(*) as �ο���
from sungjuk
group by addr;

select addr, count(*) as cnt --Į���� �ӽ� �ο�
from sungjuk
group by addr;

select addr, count(*) cnt  --as ��������
from sungjuk
group by addr;

--�ּҺ� �������� �����ؼ� ��ȸ
select addr
from sungjuk
group by addr
order by addr;

--�ּҺ� �ο����� �������� �����ؼ� ��ȸ
select addr, count(*)
from sungjuk
group by addr
order by count(*) desc;

select addr, count(*) as cnt --�ؼ����� 3)
from sungjuk                 --�ؼ����� 1)
group by addr                --�ؼ����� 2)
order by cnt desc;           --�ؼ����� 4)
/////////////////////////////////////////////////

��[�����Լ�]
--��2) �ּҺ� ���������� ���ؼ� �����Ͻÿ�
--count(*)�� ���� ������ NULL���� ��� count�� �� �� ��� Ȯ���� �����ִ� ����
--����, �ִ밪, �ּҰ�, �հ�, ��� 
select addr, count(*), max(kor), min(kor), sum(kor),avg(kor) 
from sungjuk
group by addr;

--�ּҼ����� ����
select addr, count(*), max(kor), min(kor), sum(kor),avg(kor) 
from sungjuk
group by addr
order by addr;

--round(��, 0) �Ҽ��� ���ϰ����� �ݿø��ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),0)
from sungjuk
group by addr
order by addr;

--round(��, 2) �Ҽ��� 3��°������ �ݿø��ϰ� �Ҽ����� ����
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),2)
from sungjuk
group by addr
order by addr;

--���� ����� �Ҽ��� ���� �ݿø��ϰ� �������� �����ؼ� ��ȸ
select addr, count(*), max(kor), min(kor), sum(kor),round(avg(kor),0)
from sungjuk
group by addr
order by round(avg(kor),0) desc;

--Į���� �ο�
select addr
      ,count(*) as cnt
      ,max(kor) as max_kor
      ,min(kor) as min_kor
      ,sum(kor) as sum_kor
      ,round(avg(kor),0) as avg_kor
from sungjuk
group by addr
order by round(avg(kor),0) desc;

select * from sungjuk order by addr;

--��3) ����(tot), ���(aver) ���Ͻÿ�
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3;
--��4) ���(aver)�� 80���̻� ���� ������� �ּҺ� �ο����� �ο��������� ��ȸ�Ͻÿ�
select addr, count(*) as �ο���
from sungjuk
where aver>=80
group by addr;

select addr, aver
from sungjuk
where aver>=80
order by aver desc;

select addr, count(*)  --4)
from sungjuk           --1)
where aver>=80         --2)
group by addr          --3)
order by count(*);     --5)

//////////////////////////////////////////////////////////

��[2�� �׷�]
--�ּҺ� ������ ��ȸ�Ͻÿ�
select addr, kor, eng, mat from sungjuk order by addr, kor;

--�ּҺ�(1��) �׷��� �ϰ�, �ּҰ� ���ٸ� ��������(2��)�� �׷�ȭ �ϱ�

select addr, kor, count(*)
from sungjuk
group by addr, kor
order by addr;

select addr, kor
from sungjuk
group by addr, kor;

select kor, eng, mat, count(*)
from sungjuk
group by kor, eng, mat --�����ڰ� �� ������ üũ ����
order by kor, eng, mat;

//////////////////////////////////////////////////////////

��[having ������]
 - group by �� ���� ����ϴ� ������
 - �׷�ȭ�� �ϰ� �� ���� �������� �߰�
 - ����) having ������
 
 -- �ּҺ� �ο����� ��ȸ�Ͻÿ�
 select addr, count(*)
 from sungjuk
 group by addr;
 
 -- �ּҺ� �ο����� 3�� ���� ��ȸ�Ͻÿ�
 select addr, count(*)
from sungjuk
group by addr
having count(*)=3;

-- �ּҺ� �ο����� 3�̻��� ���� ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
group by addr
having count(*)>=3;

--��5) �ּҺ� ������հ��� 50�̻� ���� ��ȸ�Ͻÿ�
--    (��, ��հ��� �Ҽ������� �ݿø�)

select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

1)�ּҺ� ������հ� ���ϱ�
select addr, avg(kor)
from sungjuk
group by addr;

2)���� ��հ��� �Ҽ������� �ݿø��ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr;

3) 2)�� ������� ���� ��հ��� 50�̻� ��ȸ�ϱ�
select addr, round(avg(kor),0), count(*)
from sungjuk
group by addr
having round(avg(kor),0)>=50;

4) 3)������� ���� ��հ��� ������������ ��ȸ�ϱ�
select addr, round(avg(kor),0)
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

5) 4)������� ������հ� Į������ avg_kor�� �����ϱ�
select addr, round(avg(kor),0) as avg_kor
from sungjuk
group by addr
having round(avg(kor),0)>=50
order by round(avg(kor),0) desc;

--��6) ���(aver)�� 70�̻� ���� ������� �ּҺ� �ο����� ������
--     �� �ο����� 2�̸� ���� �ο��� ������ ��ȸ�Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

1) ��ü ���� ��ȸ
select * from sungjuk;

2) ���(aver)���� 70�̻� �� ��ȸ
select *
from sungjuk
where aver>=70;

3) �ּҺ� �ο����� ���Ͻÿ�
select addr, count(*)
from sungjuk
where aver>=70
group by addr;

4) 3)�� ������� �� �ο����� 2�̸� �� ��ȸ
select addr, count(*)
from sungjuk
where aver>=70
group by addr
having count(*)<2;

select * from sungjuk order by addr;