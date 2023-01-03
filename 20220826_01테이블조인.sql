�� [���̺� ����]
 - ���� ���̺��� �ϳ��� ���̺�ó�� ����ϴ� ����
 - �ΰ��̻��� ���̺��� �����Ͽ� �����͸� �����ϴ� ���
 - �����̺��� ���밪�� �̿��Ͽ� �÷��� �����ϴ� ����

 ����)
      select Į���� 
      from ���̺�1 join ���̺�2
      on  ������;                     --ANSI(ǥ��) SQL��
      
      select Į����
      from ���̺�1 , ���̺�2
      on  ������;                     --Oracle DB SQL��
      
      select T1.*, T2.*              --T1.���Į��, T2.���Į��
      from T1 join T2
      on T1.x = T2.x;                --���̺��.Į����
      
      select T1.*, T2.*, T3.*
      from T1 join T2
      on T1.x = T2.x join T3         --3�� ���̺� ����
      on T1.y = T3.y;
      
      select T1.*, T2.*, T3.*, T4.*  --4�� ���̺� ����
      from T1 join T2
      on T1.x = T2.x join T3
      on T1.y = T3.y join T4
      on T1.z=T4.Z;
      
�� ������ : where������, having������, on������

�� ������ ���̺�� ���� ���̺��� ���� ������ �����̴�
   - ������ ���̺� : ���� create table�� ���̺�
   - ���� ���̺� : SQL���� ���� ������ ���̺�
   
   select * from tb_student;
   select count(*) from tb_student;
////////////////////////////////////////////////////////////////////////////////

�� ���� 

-- �й��� �������� �������̺�� �л����̺� ����
select tb_sugang.*, tb_student.*
from tb_sugang join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- �� ���̺��� ������ ����. inner ��������. ����
select tb_sugang.*, tb_student.*
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

-- ������û�� �л����� �й�, �����ڵ�, �̸�, �̸��� ��ȸ�Ͻÿ�
select tb_sugang.*, tb_student.uname, tb_student.email
from tb_sugang inner join tb_student
on tb_sugang.hakno = tb_student.hakno;

select A.*, B.uname, B.email
from tb_sugang A inner join tb_student B
on A.hakno = B.hakno;

--�����ڵ带 �������� �������̺�� �������̺� ����
select tb_sugang.*, tb_gwamok.gname, tb_gwamok.ghakjum
from tb_sugang inner join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

--3�� ���̺� ���� : �������̺� + �л����̺�(�̸�) + �������̺�(�����)
select tb_sugang.*, tb_student.uname, tb_gwamok.gname
from tb_sugang join tb_student 
on tb_sugang.hakno = tb_student.hakno join tb_gwamok
on tb_sugang.gcode = tb_gwamok.gcode;

select A.*, B.uname, C.gname
from tb_sugang A join tb_student B  --inner ���� ������
on A.hakno = B.hakno join tb_gwamok C
on A.gcode = C.gcode;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E NATURAL JOIN DEPT D
 ORDER BY DEPTNO, E.EMPNO;
 
 --���̺���� alias(��Ī)�� �����ϴ�
 select SU.*, ST.uname, ST.email
 from tb_sugang SU join tb_student st --��ҹ��� ���� �� ��.
 on SU.hakno = ST.hakno;
 
 select SU.*, GW.gname, GW.ghakjum
 from tb_sugang SU join tb_gwamok GW
 on SU.gcode = GW.gcode;
 
 select ��.*, ��.uname, ��.email
from tb_sugang �� inner join tb_student ��
on ��.hakno = ��.hakno;

select SU.*, ST.uname, ST.email, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

-- ��ȸ�� ���̺��� �ߺ����� ���� Į������ ���̺���� ������ �� �ִ�.
select SU.*, uname, email, gname, ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

--�ߺ��Ǵ� Į������ �Ҽ� ���̺���� ��Ȯ�� ����ؾ� �Ѵ�.
--ORA-00918: ���� ���ǰ� �ָ��մϴ�
select hakno, gcode, uname, email, gname, ghakjum --���⼭ hakno�� SU�Ҽ����� ST�Ҽ����� �𸣱⿡ ������ ��. ����� �����.
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

select SU.hakno, SU.gcode, uname, email, gname, ghakjum --���⼭ hakno�� SU�Ҽ����� ST�Ҽ����� �𸣱⿡ ������ ��. ����� �����.
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
       DEPTNO, D.DNAME, D.LOC
  FROM EMP E JOIN DEPT D USING (DEPTNO)
 WHERE SAL >= 3000
 ORDER BY DEPTNO, E.EMPNO;
 ///////////////////////////////////////////////////////////////////////////////
 
 �� [���̺� ���� ����]
--��ü �� ����
select count(*) from tb_student; --6��
select count(*) from tb_gwamok; --9��
select count(*) from tb_sugang; --13��

��1)������û�� �� �л��� �߿��� '����'�� ��� �л��鸸 �й�, �̸�, �ּҸ� ��ȸ�Ͻÿ�

--������û�� �л��� ��� ����
select * from tb_sugang;

--�������̺� + �л����̺�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno;

--'����'�� ��ȸ�ϱ�
select SU.*, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '����';

select SU.hakno, SU.gcode, uname, address
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno
where address = '����';

--������ ���� ���̺��� �̸��� AA��� �����ϰ�, �ٽ� �簡�� �� �� �ִ�
select AA.hakno, AA.gcode, AA.uname, AA.address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) AA
where AA.address='����';


--AA ��Ī ��������
select hakno, gcode, uname, address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) 
where address='����';

��2) �������� ������û �ο���, ������ ��ȸ�Ͻÿ�
     ���� 2��
     ���� 2��;
     
--1)�������̺� ��ȸ
select * from tb_sugang;

--2)���� ��û�� �л����� ���(�й�)
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;
select hakno from tb_sugang group by hakno; --group by���� ���������� ������ ������ ����

--3)������û�� �й�(AA)���� �ּҸ� �л����̺��� ��������
select AA.hakno, ST.address
from (
        select hakno from tb_sugang group by hakno
     ) AA join tb_student ST
on AA.hakno = ST.hakno;

--4) 3)�� ����� BB���̺�� ���� �� �ּҺ� �׷��� �� ���� ���ϱ�
select BB.address, count(*) || '��' as cnt
from (
      select AA.hakno, ST.address
       from (
             select hakno from tb_sugang group by hakno
             ) AA join tb_student ST
         on AA.hakno = ST.hakno
     ) BB
group by BB.address;

--�Ʒ��� ���� Ǭ ��
select distinct hakno, address
from (
      select SU.hakno, SU.gcode, uname, address
      from tb_sugang SU join tb_student ST
      on SU.hakno = ST.hakno
) ;

select address, count(address)
from(
    select distinct hakno, address
    from (
          select SU.hakno, SU.gcode, uname, address
          from tb_sugang SU join tb_student ST
          on SU.hakno = ST.hakno
    )
)
group by address;

--��ȯ�� Ǯ��
select AA.address, count(*) || '��'
from(
    select SU.hakno, address
    from tb_sugang SU join tb_student ST
    on SU.hakno = ST.hakno
    group by SU.hakno, address
     ) AA
group by AA.address;

--������ Ǯ��
select ST.address, count(distinct(ST.hakno))
from tb_sugang SU join tb_student ST
on SU.hakno=ST.hakno
group by address;

--���ƴ� Ǯ��
SELECT
    address,
    count(*)
FROM
    (
        SELECT
            DISTINCT SU.hakno,
            address
        FROM
            tb_sugang SU
            JOIN tb_student ST ON SU.hakno = ST.hakno
    )
GROUP BY
    address;

��3) ���� ���� ��û �ο���, �����ڵ�, ����� ��ȸ�Ͻÿ� 
     d001 HTML   2�� 
     d002 ���伥   1��
     p001 OOP    2��

--1) �������̺��� �����ڵ� �����ؼ� ��ȸ�ϱ�
select * from tb_sugang order by gcode;

--2) �������̺��� �����ڵ尡 ������ ���� �׷�
select gcode, count(*)
from tb_sugang
group by gcode;

--3) 2)�� ����� AA���̺�� �����ϰ�
select AA.gcode, concat(AA.cnt, '��') �ο���, GW.gname
from (
        select gcode, count(*) as cnt
        from tb_sugang
        group by gcode
      ) AA join tb_gwamok GW
on AA.gcode = GW.gcode
where AA.gcode like 'p%'
order by AA.gcode;

select SU.gcode, GW.gname, count(*) || '��' as cnt
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
group by SU.gcode, GW.gname;


��4) �й��� ������û������ �������� �й��������� ��ȸ�Ͻÿ�
     g1001  ȫ�浿  9����
     g1002  ȫ�浿  6����
     g1005  ���޷�  9����

--1) �������̺��� �й����� ��ȸ
select hakno, gcode from tb_sugang order by hakno;

--2) �������̺� �����ڵ尡 ��ġ�ϴ� ������ �������̺��� �����ͼ� ���̱�
select su.hakno, su.gcode, gw.ghakjum
from tb_sugang su join tb_gwamok gw
on su.gcode = gw.gcode;

--3) 2)�� ����� AA���̺�� �����, �й����� �׷�ȭ�� ��, ������ �հ踦 ���ϱ�
select aa.hakno, sum(ghakjum)
from(
      select su.hakno, su.gcode, gw.ghakjum
      from tb_sugang su join tb_gwamok gw
      on su.gcode = gw.gcode
    ) AA
group by aa.hakno;


--4) 3)�� ����� BB���̺�� �����, �й��� �������� �л����̺��� �̸� �����ͼ� ���̱�
select BB.hakno, ST.uname, concat(bb.�հ�, '����') ������
from(
      select aa.hakno, sum(ghakjum) as �հ�
      from(
            select su.hakno, su.gcode, gw.ghakjum
            from tb_sugang su join tb_gwamok gw
            on su.gcode = gw.gcode
          ) AA
      group by aa.hakno
    ) BB join tb_student ST
on BB.hakno = ST. hakno;

--------------------------------------------------------------------------------

��4)�� �Ǵٸ� ���
--1)�������̺� + �л����̺� + �������̺� 3�� ���̺� �Ѳ����� ����
select su.hakno, su.gcode, st.uname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
order by su.hakno;

--2) 1�� �׷�(�й�), 2�� �׷�(�̸�)���� �׷�ȭ�ϰ�, ������ ���ϱ�
select su.hakno, st.uname, sum(gw.ghakjum) || '����' as hap
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
group by su.hakno, st.uname;


select aa.hakno, aa.uname, aa.ghakjum, sum(aa.ghakjum)
from(
select su.hakno, st.uname, gw.ghakjum
from tb_sugang su join tb_student st
on su.hakno = st.hakno join tb_gwamok gw
on su.gcode = gw.gcode
order by gw.ghakjum
)aa
group by aa.hakno, aa.uname, aa.ghakjum
order by aa.ghakjum;

select AA.hakno, AA.uname, sum(ghakjum)||'����' as ����
from (
        select su.hakno, st.uname, gw.ghakjum
        from tb_sugang su join tb_student st
        on su.hakno = st.hakno join tb_gwamok gw
        on su.gcode = gw.gcode
    ) AA
group by AA.hakno, AA.uname;
     
select SU.*, ST.uname, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode;

select AA.hakno, AA.uname, sum(AA.ghakjum)
from(
select SU.*, ST.uname, GW.gname, GW.ghakjum
from tb_sugang SU join tb_student ST
on SU.hakno = ST.hakno join tb_gwamok GW
on SU.gcode = GW.gcode
)AA
group by AA.uname, AA.hakno;

��5) �й� g1001�� ������û�� ������ �����ڵ庰�� ��ȸ�Ͻÿ�
     g1001  p001  OOP
     g1001  p003  JSP  
     g1001  d001  HTML;

--1)�������̺� + �������̺� ����
select SU.hakno, Su.gcode, GW. gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode;

--2)�й� g1001�� ��û�� ���� ��ȸ�ϱ�
select SU.hakno, Su.gcode, GW. gname
from tb_sugang SU join tb_gwamok GW
on SU.gcode = GW.gcode
where su.hakno='g1001'          --���� �ڹ��ڵ忡�� �й��� ����ó�� �Ѵ�
order by SU.gcode;
     
��6)������û�� �� �л����� �й�, �̸� ��ȸ
        g1001 ȫ�浿
        g1002 ȫ�浿
        g1005 ���޷�
        g1006 ������
--1) ������û�� �� �л����� �й� ��ȸ
select hakno from tb_sugang;
select distinct(hakno) from tb_sugang;
select hakno from tb_sugang group by hakno;

--2)
select hakno, uname
from tb_student
where hakno='g1001' or hakno='g1002' or hakno='g1005' or hakno='g1006';

select hakno, uname
from tb_student
where hakno in ('g1001', 'g1002', 'g1005', 'g1006');

--3)
select hakno, uname
from tb_student
where hakno in (select hakno from tb_sugang group by hakno);
////////////////////////////////////////////////////////////////////////////////    
--�Ʒ� �ڵ� ����
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;

select AA.hakno, BB.uname
from (select distinct(hakno) from tb_sugang order by hakno) AA join tb_student BB
on AA.hakno = BB.hakno;

��7)������û�� ���� ���� �л����� �й�, �̸� ��ȸ
        g1003 ������
        g1004 ȫ�浿

select hakno, uname
from tb_student
where hakno not in (select hakno from tb_sugang group by hakno);

--�Ʒ� �ڵ� ����
select * from tb_sugang order by hakno;
select distinct(hakno) from tb_sugang order by hakno;

select hakno, uname
from tb_student
where hakno not in(select AA.hakno
from (select distinct(hakno) from tb_sugang order by hakno) AA join tb_student BB
on AA.hakno = BB.hakno);
------------------------------------------------------

