��[�ڷ���]
1)������
  - ������ varchar(5) 'SKY'     ��) ���̵�, ��й�ȣ, �̸�, �ּ� ~~
  - ������ char(5)    'SKY  '   ��) �ֹι�ȣ, �����ȣ, ���¹�ȣ, ~~
  
2)������
  - int ������
  
3)��¥��
  - ����Ͻú���
  - ���б�ȣ - �� / ��ȣ�� ����Ѵ�
  - �Է½� ���ڿ�Ÿ������ �Է��Ѵ�
  - date
  
///////////////////////////////////////////////////////////////////////

��[���̺� ��������]
1) primary key
   �⺻Ű. ���ϼ�
   where�������� �ɸ� �� �ִ� ��ǥ���� Į���� ������ �� �ִ�
   ��) �ֹι�ȣ, �ڵ�����ȣ, ���¹�ȣ, ���̵�, �̸��� ~~
   �ߺ��� ������� ����. null�� ������� ����(���� ������� ����. �ݵ�� �Է��ؾ� ��)
2) not null
   ���� ������� ����
3) check
   �Է��� ���� Ư�� ������ ���ϴ� ����
   
4) default
   ����ڰ� ���� �Է����� ������ �ش� Į���� ������ �⺻���� �ڵ����� �Է��� �ش�.
5) unique
   �ߺ� ��� ����(�̸����̳� �ڵ�����ȣ�� unique�� ���� ��)
   null���� �ѹ��� ���
   --unique�� not null�� �ѹ��� �����. �ι��� ��� �� ��.(�ֳĸ� 2���̸� �ΰ��� �ߺ��Ǳ� ����)
   --pk�� �ѹ��� ��� ���� ����.
6) foreign key
   �ܷ�Ű. ���̺� �����ϴ� ��� �θ�� �ڽ� ���踦 ������ �� ��.
   
///////////////////////////////////////////////////////////////////////

-- sungjuk ���̺� ����
drop table sungjuk;

-- sungjuk ���̺� ����
create table sungjuk(
    sno    int          primary key --�⺻Ű(���ϼ�)
    ,uname varchar(50)  not null
    ,kor   int          check(kor between 0 and 100) --�������� 0~100 ���̸� �Է°���
    ,eng   int          check(eng between 0 and 100) --�������� 0~100 ���̸� �Է°���
    ,mat   int          check(mat between 0 and 100) --�������� 0~100 ���̸� �Է°���
    ,addr  varchar(20)  check(addr in ('Seoul','Jeju','Busan','Suwon'));
    ,tot   int          default 0
    ,aver  int          default 0
    ,wdate date         default sysdate              -- ���� ��¥ �Լ�
);

///////////////////////////////////////////////////////////////////////

create table sungjuk(
    sno    int           primary key                    --�⺻Ű(���ϼ�)
   ,uname  varchar(50)   not null                        
   ,kor    int           check(kor between 0 and 100)  --�������� 0~100���̸� �Է°���
   ,eng    int           check(eng between 0 and 100)  --�������� 0~100���̸� �Է°���
   ,mat    int           check(mat between 0 and 100)  --�������� 0~100���̸� �Է°���
    ,addr   varchar(20)   check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int           default 0
   ,aver   int           default 0
   ,wdate  date          default sysdate               --���� ��¥ �Լ�
);

///////////////////////////////////////////////////////////////////////
��[���̺� �������� ���� �޼���]
-- primary key ��������
-- ORA-00001: ���Ἲ ���� ����(SYSTEM.SYS_C007326)�� ����˴ϴ�
-- sno Į���� �⺻Ű(PK)�̹Ƿ� �ߺ��� ���� ������� ����
insert into sungjuk(sno, uname) values(1, 'ȫ�浿'); --2�� �������� �� ���� �߻�

-- not null ��������
-- ORA-01400: NULL�� ("SYSTEM"."SUNGJUK"."UNAME") �ȿ� ������ �� �����ϴ�
-- uname Į���� �ݵ�� ���� �Է��ؾ� ��.
insert into sungjuk(sno) values(1); -- uname Į���� �ݵ�� ���� �Է��ؾ� ��.

-- check ��������
-- ORA-02290: üũ ��������(SYSTEM.SYS_C007324)�� ����Ǿ����ϴ�
-- ������ ���Ҵ� 0-100 ���̸� ����
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, 'ȫ�浿', -10, 20, 300); --������ ������ 0~100���̸� ����

-- ORA-02290: üũ ��������(SYSTEM.SYS_C007325)�� ����Ǿ����ϴ�
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, 'ȫ�浿', 10, 20, 30, 'Incheon'); --addr Į���� 'Incheon' ��� �� ��.