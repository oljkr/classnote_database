�� [���� ��������]
select count(*) from tb_student; --6��
select count(*) from tb_gwamok; --9��
select count(*) from tb_sugang; --14��

��1) ������ �������߿��� ������ ���� ���� �������� ������û�� ����� ��ȸ�Ͻÿ�
    (�й�, �̸�, �����ڵ�)    
d002 g1005 ���޷�;

select gcode, gname, ghakjum from tb_gwamok where gcode like 'd%' order by ghakjum desc;

select gcode, gname, ghakjum, rownum
from(
select gcode, gname, ghakjum from tb_gwamok where gcode like 'd%' order by ghakjum desc
) AA
where rownum = 1;

select BB.*, SU.hakno  
from(
    select gcode, gname, ghakjum, rownum
    from(
    select gcode, gname, ghakjum from tb_gwamok where gcode like 'd%'order by ghakjum desc
    ) AA
    where rownum = 1
) BB join tb_sugang SU
on BB.gcode=SU.gcode;

�й�, �̸�, �����ڵ�
select CC.hakno, ST.uname, CC.gcode
from( 
    select BB.*, SU.hakno
    from(
        select gcode, gname, ghakjum, rownum
        from(
        select gcode, gname, ghakjum from tb_gwamok where gcode like 'd%' order by ghakjum desc
        ) AA
        where rownum = 1
    ) BB join tb_sugang SU
    on BB.gcode=SU.gcode
) CC join tb_student ST
on CC.hakno = ST.hakno;

--������ Ǯ��
--�����α������� ���� ��ȸ�ϱ�
select *
from tb_gwamok
where gcode like 'd%'
order by ghakjum desc;

--1)������ �������߿��� ������ ���� ���� ���� ��ȸ�ϱ�
select max(ghakjum)
from tb_gwamok
where gcode like 'd%';

--2) 1)������� ���� ����(5)�� ������ ������ ���� �ִ� �࿡�� �����ڵ� ����
--  ��, ������ �������߿��� ������ ���� ���� �����ڵ�(��, �ߺ��� ������ ���ٴ� �����Ͽ�)
select gcode
from tb_gwamok
where ghakjum=(5); --d002

select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum)from tb_gwamok where gcode like 'd%');

--�̻��¿��� ���̺� 3�� �����ϸ� �ɵ�(�Ʒ��� �� Ǯ��)
select SU.hakno, SU.gcode, ST.uname
from tb_sugang SU join (select gcode
from tb_gwamok
where ghakjum=(select max(ghakjum)from tb_gwamok where gcode like 'd%')
) AA
on SU.gcode = AA.gcode join tb_student ST
on SU.hakno = ST.hakno;

--������ Ǯ�� �̾
--3) 2)���� ���� �����ڵ�(d002)�� ������û�� ����� ��ȸ
select gcode, hakno from tb_sugang where gcode=('d002');

select gcode, hakno
from tb_sugang
where gcode=(
    select gcode
    from tb_gwamok
    where ghakjum=(select max(ghakjum)from tb_gwamok where gcode like 'd%')
);

--4)3)�� ����� AA���̺�� ���� �� , �л� ���̺��� �����ؼ� �̸� ��������
select AA.gcode, AA.hakno, ST.uname
from(
      select gcode, hakno
      from tb_sugang
      where gcode =(
                    select gcode
                    from tb_gwamok
                    where ghakjum=(select max(ghakjum)from tb_gwamok where gcode like 'd%')
                    )
      ) AA join tb_student ST
on AA.hakno=ST.hakno;

��2) �й��� ������û�� �������� ���ϰ� �й��� �����ؼ�(������ �ƹ��� �� �ϸ� ��������) �ٹ�ȣ 4~6�� ��ȸ�Ͻÿ�
    (��, ������û���� ���� �л��� �������� 0���� ǥ��)_�̸��� ���� �� ������ ����
g1004   0   4
g1005   12  5
g1006   3   6
left outer join�ؼ� gwamok�߰� ����, sum.;

select *
from tb_student ST left outer join tb_sugang SU
on ST.hakno = SU.hakno
order by ST.hakno;

select ST.hakno, ST.uname, SU.gcode
from tb_student ST left outer join tb_sugang SU
on ST.hakno = SU.hakno
order by ST.hakno;

select AA.hakno, AA.uname, sum(GW.ghakjum)
from(
    select ST.hakno, ST.uname, SU.gcode
    from tb_student ST left outer join tb_sugang SU
    on ST.hakno = SU.hakno
)AA left outer join tb_gwamok GW
on AA.gcode = GW.gcode
group by AA.hakno, AA.uname
order by AA.hakno;

select BB.*, rownum
from(
    select AA.hakno, AA.uname, sum(GW.ghakjum)
    from(
        select ST.hakno, ST.uname, SU.gcode
        from tb_student ST left outer join tb_sugang SU
        on ST.hakno = SU.hakno
    )AA left outer join tb_gwamok GW
    on AA.gcode = GW.gcode
    group by AA.hakno, AA.uname
    order by AA.hakno
) BB;

select *
from(
    select BB.hakno, BB.uname, nvl(������, 0), rownum as rnum
    from(
        select AA.hakno, AA.uname, sum(GW.ghakjum) as ������
        from(
            select ST.hakno, ST.uname, SU.gcode
            from tb_student ST left outer join tb_sugang SU
            on ST.hakno = SU.hakno
        )AA left outer join tb_gwamok GW
        on AA.gcode = GW.gcode
        group by AA.hakno, AA.uname
        order by AA.hakno
    ) BB
)
where 4<=rnum and rnum<=6;

--������ Ǯ��
--�л����̺� ��ȸ�ϱ�
select hakno, uname from tb_student order by hakno;

--1) ������û�� ������ ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) �й����� ������ ���ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno;

--4)hakno�� ����
    --3) ������û���� ���� �л��鵵 ������ �� �ֵ��� �л����̺� left join �ϰ�,
        --2)��� (AA���̺�)�� ����
select ST.hakno, ST.uname, nvl(AA.������, 0)
from tb_student ST left outer join (
                                     select SU.hakno, sum(GW.ghakjum) as ������
                                     from tb_sugang SU join tb_gwamok GW
                                     on SU.gcode=GW.gcode
                                     group by SU.hakno
                                     )AA 
on ST.hakno = AA.hakno
order by ST.hakno;

--5) �ٹ�ȣ �߰� (�ٹ�ȣ�� �ִ� ���¿��� ���ĵ�)
select ST.hakno, ST.uname, nvl(AA.������, 0), rownum
from tb_student ST left outer join (
                                     select SU.hakno, sum(GW.ghakjum) as ������
                                     from tb_sugang SU join tb_gwamok GW
                                     on SU.gcode=GW.gcode
                                     group by SU.hakno
                                     )AA 
on ST.hakno = AA.hakno
order by ST.hakno;

--6) 5�� ����� ���������ϰ� ����, �ٹ�ȣ �߰��ϱ�
select BB.hakno, BB.uname, BB.������2, rownum as rnum
from(
      select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
      from tb_student ST left outer join (
                                           select SU.hakno, sum(GW.ghakjum) as ������
                                           from tb_sugang SU join tb_gwamok GW
                                           on SU.gcode=GW.gcode
                                           group by SU.hakno
                                           )AA 
      on ST.hakno = AA.hakno
      order by ST.hakno
     ) BB;
     
--7) 6)�� ����� ��������(CC���̺�)�ϰ� �ٹ�ȣ(rnum) 4~6 ��ȸ�ϱ�
select CC.hakno, CC.������2, rnum
from(
select BB.hakno, BB.uname, BB.������2, rownum as rnum
from(
      select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
      from tb_student ST left outer join (
                                           select SU.hakno, sum(GW.ghakjum) as ������
                                           from tb_sugang SU join tb_gwamok GW
                                           on SU.gcode=GW.gcode
                                           group by SU.hakno
                                           )AA 
      on ST.hakno = AA.hakno
      order by ST.hakno
     ) BB
)CC
where 4<=rnum and rnum<=6;

��3) �й����� ������û �������� ���ϰ�, ������������ �������� ������
     ������ ���� 1�Ǹ� ��ȸ�Ͻÿ� (�й�, �̸�, ������) 
-- �������̺� ���߰� ���ּ���
-- (�������� �� ���� ���̿��� ���Ȯ���ϱⰡ ���� �ָ� �մϴ�)
insert into tb_sugang(sno,hakno,gcode) values(sugang_seq.nextval,'g1001','p005');
commit;

g1001 14 ȫ�浿 1;

select AA.hakno, AA.uname, nvl(sum(GW.ghakjum),0) as ������
from(
     select ST.hakno, ST.uname, SU.gcode
     from tb_student ST left outer join tb_sugang SU
     on ST.hakno = SU.hakno
    )AA left outer join tb_gwamok GW
on AA.gcode = GW.gcode
group by AA.hakno, AA.uname
order by ������ desc;

select BB.hakno, BB.uname, BB.������, rownum as rnum
from(
    select AA.hakno, AA.uname, nvl(sum(GW.ghakjum),0) as ������
    from(
         select ST.hakno, ST.uname, SU.gcode
         from tb_student ST left outer join tb_sugang SU
         on ST.hakno = SU.hakno
        )AA left outer join tb_gwamok GW
    on AA.gcode = GW.gcode
    group by AA.hakno, AA.uname
    order by ������ desc
) BB;

select *
from(
    select BB.hakno, BB.uname, BB.������, rownum as rnum
    from(
        select AA.hakno, AA.uname, nvl(sum(GW.ghakjum),0) as ������
        from(
             select ST.hakno, ST.uname, SU.gcode
             from tb_student ST left outer join tb_sugang SU
             on ST.hakno = SU.hakno
            )AA left outer join tb_gwamok GW
        on AA.gcode = GW.gcode
        group by AA.hakno, AA.uname
        order by ������ desc
    ) BB
)
where rnum=1;

--2���� ������ �� ����
select CC.hakno, CC.uname, CC.������2, rnum
from(
select BB.hakno, BB.uname, BB.������2, rownum as rnum
from(
      select ST.hakno, ST.uname, nvl(AA.������, 0) as ������2
      from tb_student ST left outer join (
                                           select SU.hakno, sum(GW.ghakjum) as ������
                                           from tb_sugang SU join tb_gwamok GW
                                           on SU.gcode=GW.gcode
                                           group by SU.hakno
                                           )AA 
      on ST.hakno = AA.hakno
      order by ������2 desc
     ) BB
)CC
where rnum=1;

--1)�����ڵ尡 ��ġ�ϴ� ���� ��������
select SU.hakno, SU.gcode, GW.ghakjum
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode;

--2) �й����� ������ ���ϰ�, ������������ �������� �����ϱ�
select SU.hakno, sum(GW.ghakjum) as ������
from tb_sugang SU join tb_gwamok GW
on SU.gcode=GW.gcode
group by SU.hakno
order by sum(GW.ghakjum) desc;

--3) 2)�� ����� AA���̺�� �����, �л����̺� �����ؼ� �̸� ��������
select AA.hakno, AA.������, ST.uname, rownum as rnum
from (
    select SU.hakno, sum(GW.ghakjum) as ������
    from tb_sugang SU join tb_gwamok GW
    on SU.gcode=GW.gcode
    group by SU.hakno
    order by sum(GW.ghakjum) desc
)AA join tb_student ST
on AA.hakno = ST.hakno;


--4) 3)�� ����� ���������ϰ� �ٹ�ȣ�� �̿��ؼ� ������ ���� 1�Ǹ� ��ȸ�ϱ�
select hakno, ������, uname, rnum
from(
        select AA.hakno, AA.������, ST.uname, rownum as rnum
        from (
            select SU.hakno, sum(GW.ghakjum) as ������
            from tb_sugang SU join tb_gwamok GW
            on SU.gcode=GW.gcode
            group by SU.hakno
            order by sum(GW.ghakjum) desc
        )AA join tb_student ST
        on AA.hakno = ST.hakno
)
where rnum=1;

-------------------------------------------------
