��[����Ŭ �Լ�]
-- �������̺� : dual
1. ���ڿ� �Լ�
select lower('Hello World') from dual; --���� �ҹ��ڷ� ��ȯ
select upper('Hello World') from dual; --���� �빮�ڷ� ��ȯ
select initcap('hello world') from dual; 
select length('Hello World') from dual; --���� ����
select substr('Hello World',1,7) from dual; --���ڿ� �ڸ���(ù��° ���ں��� 7��)
select instr('Hello World','W') from dual; --Ư������ ��ġ 5
select lpad('SKY',5,'*') from dual; --5ĭ������ ����ϰ� ���� ��ĭ�� *�� ä��
select rpad('SKY',5,'*') from dual; --5ĭ������ ����ϰ� ������ ��ĭ�� *�� ä��
select replace('happy','p','k') from dual; --Ư������ ��ȯ

select chr(65) from dual; --ASCII ���� ��ȯ 'A'
select chr(66) from dual;
select chr(97) from dual; --'a'
select chr(98) from dual;

--���ڿ� �����ϱ�
select concat('�ι̿�','�ٸ���') from dual; --�ι̿��ٸ���
--concat(Į����, '���ڿ�')
select concat(uname, '�� �����'), concat(aver, '�Դϴ�') from sungjuk; 

-- || ���տ�����
select uname || '�� ����� ' || aver || '�Դϴ�' from sungjuk;
select uname || '�� ����� ' || aver || '�Դϴ�' as str from sungjuk;
////////////////////////////////////////////////////////////////////

2. ���� ���� �Լ�
select abs(-7) from dual; --���밪
select mod(5,3) from dual; --������ ������
select ceil(12.4) from dual;      --13   �ø��Լ�
select floor(12.4) from dual;     --�����Լ�
select trunc(-13.56, 1) from dual; --13.5 ���� �ڸ��� ����

select avg(kor) from sungjuk; --66.363636
select ceil(avg(kor)) from sungjuk;   --67
select round(avg(kor),3) from sungjuk; --66.364
select trunc(avg(kor),3) from sungjuk; --66.363

--to_number('���������� ���ڿ�')
select to_number('123')+1 from dual; --124
select '100'+1 from dual; --101 
--SQL������ ''�ȿ� ���ڱ�ȣ�� ������ ���������� to_number()�� ȣ���. �����ؾ���!!
///////////////////////////////////////////////////////////////////

3.��¥ ���� �Լ�
select sysdate from dual; --�ý����� ���� ��¥�� �ð������� �����ϴ� �Լ�

--sysdate ����� �����ϱ�
select extract(year from sysdate) from dual; --2022
select extract(month from sysdate) from dual; --8
select extract(day from sysdate) from dual; --23

select to_number(extract(year from sysdate))+1 from dual;

--��¥ �������� ����
select sysdate+100 from dual; --���� ��¥ +100��
select sysdate-100 from dual; --���� ��¥ -100��

--�ΰ��� ��¥�����Ϳ��� ���� �� ���
select months_between('2022-08-23', '2022-05-25') from dual; --2.93
select months_between('2022-08-23', '2022-12-25') from dual; --4.06

--���ڿ��� ��¥������ ��ȯ
select to_date('2022-10-25') from dual;
select to_date('2022-10-25') - to_date('2022-10-30') from dual; -- -5

//////////////////////////////////////////////////////////////////////
��nvl() �Լ� -null���� �ٸ������� �ٲ�
mariadb�� ifnull()�� ���.
����) �ּҰ� 'Incheon'�� ���� �������� �ִ밪, �ο����� ��ȸ�Ͻÿ�
select max(kor),count(*) from sungjuk
group by addr
having addr='Incheon';

select max(kor),count(*)
from sungjuk
where addr='Incheon'; --�ִ밪(null), �ο���(0)

select count(*)+1     --0+1
from sungjuk
where addr='Incheon';

select max(kor)+1     --null+1
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0) --null���̸� 0���� ��ü��
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 --null���̸� 0���� ��ü��
from sungjuk
where addr='Incheon';

select nvl(max(kor), 0)+1 as max_kor
from sungjuk
where addr='Incheon';

//////////////////////////////////////////////////////////////////////
�ܸ��� Į��(�̰� sql�������� ���� ���� ����)
 - rownum : ���ȣ
 - rowid  : ���� �ּҰ�
sno�ʹ� �ٸ�. sno�� �������� �����ϴ� ���̰� rownum�� �� �ٸ��� ���ȣ�� ����

select sno, uname, addr, rownum, rowid
from sungjuk;

select sno, uname, addr, rownum
from sungjuk
where rownum>=1 and rownum<=5;

select sno, uname, addr, rownum
from sungjuk
where addr='Seoul';

--�ڽ��� ���ȣ�� �����ؼ� ���ĵ�. rownum�� �߰��ϴ� ������ ����ؾ� ��.
--order by�� ���� ����ϰ� �Ǹ� rownum�� ����ä�� �������ϰ� �ȴ�.
--join�� �����Ѵٸ� rownum�� ���̴� �ñ⵵ �� �����ؾ���
select sno, uname, addr, rownum
from sungjuk
order by uname;