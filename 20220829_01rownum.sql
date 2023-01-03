�� [����Į��]
 - Oracle DBMS���� ������ �ش�
 - rownum ���ȣ ->����¡ ó���� ���
  select uname, address, rownum from tb_student;
 - rowid ���� �ּҰ�
  select uname, address, rowid from tb_student;
  
�� [rownum]

--�ٹ�ȣ
select hakno, uname, rownum from tb_student;

--�ٹ�ȣ�� ��Ī �ο��ϱ�
select hakno, uname, rownum as rnum from tb_student;

--�ٹ�ȣ�� ���� �ο��ǰ� ���ĵȴ�.
--order by�� �ָ� ���� ���� ������ �ִ� �ٹ�ȣ�� ������ ������ ��.
--oracle�� rownum�� �ִ� �ñ⵵ �߿���.
select hakno, uname, rownum as rnum from tb_student order by uname;

--where ������������ rownum ��밡��. �ٹ�ȣ 1~3���� ��ȸ
select hakno, uname, rownum from tb_student where rownum>=1 and rownum<=3;

--�ٹ�ȣ 4~6���� ��ȸ (��ȸ�ȵ�_������ ����Ե� �𸣽�)
--�׷��� ����¡ ó���� �� �� 1~3�� 1������ ,4~6�� 2��������� �ϸ� 2��������
--��ȸ�� �� �̷��� �ϸ� �� ��..
select hakno, uname, rownum from tb_student where 4<=rownum and rownum<=6;
////////////////////////////////////////////////////////////////////////////////
�� [rownum�� Ȱ���� ����¡]
 - rownum�� ����Į���̹Ƿ� �������� ���� ������� ����, ���� Į������ �ν� �� ����� ���� ��õ
 - rownumĮ���� �������� �Ŀ� �ٹ�ȣ �߰��ϰ� �������� Ȱ���Ѵ�
 
��) �ٹ�ȣ(rownum)�� �̿��ؼ� �ٹ�ȣ 4~6 ��ȸ
--1) �̸������� ��ȸ (�ٹ�ȣ���� ���� ����)
select uname, hakno, address, rownum
from tb_student
order by uname;

--2) 1)�� ����� ��������(AA)�ϰ� �ٹ�ȣ�� �߰��Ͻÿ�
--AA �ȿ� �ٹ�ȣ �����ϴ� �� ����!!!
select uname, hakno, address, rownum as rnum
from (
    select uname, hakno, address
    from tb_student
    order by uname
    ) AA;
    
--3) 2)�� ����� BB���̺�� �����, �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
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

--4) 3)�� ������� ���̺� ��Ī(AA, BB) �����ϱ�
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
