drop table sungjuk;

create table sungjuk(
    uname varchar(50) not null --���� ������� ����.
                               --������ 50���� �̳����� �Է�
                               --�ѱ� 16���� �̳� �Է�
    ,kor int          not null
    ,eng int          not null
    ,mat int          not null
    ,tot int          null     --�� ���
    ,aver int                  --null ��������
);

insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('������',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);

select * from sungjuk;
select count(*) from sungjuk;

[as] --Į������ �ӽ� ����. as�� ���� ����.Į���� �����̽� �Ұ�.
select kor as korea, eng as english, mat as math
from sungjuk;

select kor korea, eng english, mat math
from sungjuk;

select kor as ����, eng as ����, mat as ����
from sungjuk;   --�ӽ� �ѱ� Į������ �Ͻ������� �м��ؾ� �ϴ� ��츸 ��õ!!

select count(uname) from sungjuk;
select count(eng) as cnt_eng from sungjuk;
select count(kor) as ��������� from sungjuk; --�ӽ� �ѱ� Į������ �Ͻ������� �м��ؾ� �ϴ� ��츸 ��õ!!
select count(mat) ���а��� from sungjuk; --as���� ����!

--null���� ī��Ʈ���� �ʴ´�.
select count(tot) from sungjuk; --0
select count(aver) from sungjuk;  --0

--sungjuk ���̺��� ��ü ���� ����
select count(*) from sungjuk;
select count(*) as ��ü�హ�� from sungjuk;
select count(*) ��ü�హ�� from sungjuk;
///////////////////////////////////////////////////////

[��ɾ� �Ϸ�� ���]
-insert, update, delete ��ɾ ����ϴ� ���, ��ɾ� ��ҿ� ��ɾ� �ϷḦ ������ �� �ִ�.
-commit     : ��ɾ� �Ϸ�
-rollback   : ��ɾ� ���

�� SQL Developer������ �ڵ�Ŀ�� ������ ���� �� �ִ�
   ����->ȯ�漳��->�����ͺ��̽�->��ü���->�ڵ�Ŀ�Լ���
cf. sqlplus������ �̷� ������ �����Ƿ� �ݵ�� commit;�� �ؾ��Ѵ�.,

delete from sungjuk; --��ü ���ڵ� ����
select * from sungjuk;
rollback;
select * from sungjuk;
rollback;

insert into sungjuk(uname,kor,eng,mat) values ('ȫ�浿', 70, 85, 100);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',30,30,40);
insert into sungjuk(uname,kor,eng,mat) values ('���޷�',90,90,20);
insert into sungjuk(uname,kor,eng,mat) values ('������',100,60,30);
insert into sungjuk(uname,kor,eng,mat) values ('���϶�',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('����ȭ',80,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',10,65,35);
insert into sungjuk(uname,kor,eng,mat) values ('�عٶ��',30,80,40);
insert into sungjuk(uname,kor,eng,mat) values ('���Ȳ�',30,80,20);
insert into sungjuk(uname,kor,eng,mat) values ('���ѹα�',100,100,100);

select * from sungjuk;

delete from sungjuk;

rollback;