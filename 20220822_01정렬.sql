*��������
-sort ����
-���̺� ����
-������

*[sort����]
-Ư����(keyfield)�� �������� ������� ���ġ
-�������� ascending sort asc �����ϸ� �⺻�� 1->10 A->Z a->z ��->��
-�������� descending sort
-����) order by Į����1, Į����2, Į����3, ~~~

--sungjuk���̺��� ��ȸ�Ͻÿ�
select * from sungjuk;

-- ��ü ���ڵ带 �̸�������  �����ؼ� ��ȸ�Ͻÿ�
select uname
from sungjuk
order by uname asc; --�������� ����

select uname
from sungjuk
order by uname; --asc ��������

select uname
from sungjuk
order by uname desc; --�������� ����

--�������������� �����ؼ� ��ȸ�Ͻÿ�
select uname, kor
from sungjuk
order by kor asc;

--1�� ���� : �������������� ����
--2�� ���� : ���������� ���ٸ� �̸��� �������� �������� ����
select uname, kor
from sungjuk
order by kor asc, uname desc;

select uname, kor, eng, mat
from sungjuk
order by kor desc, eng desc, mat desc;

select uname,aver
from sungjuk
where aver<=70
order by uname;

select uname,aver
from sungjuk
order by uname
where aver<=70; --���� ORA-00933
commit;
[alter��] - ���̺��� ���� ���� �� ����
1. �÷� �߰�
   ����) alter table table�� add (�÷��� ������Ÿ��);
   
--music Į�� �߰�
alter table sungjuk add(music int null);
select * from sungjuk;

2. �÷��� ����
   ����) alter table table�� rename column �����÷��� to �ٲ��÷���;
   
-- ����Į�� kor�� koreaĮ�������� �����Ͻÿ�
alter table sungjuk rename column kor to korea;

3. �÷� ������ Ÿ�� ����
  ����) alter table table�� modify(�÷��� ������Ÿ��);
4. �÷� ����
  ����)alter table table�� drop(�÷���);
----------------------------------------------------

