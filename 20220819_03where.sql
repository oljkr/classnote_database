select uname from sungjuk where uname='���ѹα�';

select uname
from sungjuk
where uname like '%ȭ';

select uname
from sungjuk
where uname like '%��%';

select uname
from sungjuk
where uname like'_��';

insert into sungjuk(uname, kor, eng, mat)
values ('��ȭ', 100, 100, 100);

insert into sungjuk(uname, kor, eng, mat)
values ('���', 90, 95, 97);

select * from sungjuk;

select uname from sungjuk where uname like '_��_';

select ����, ���� from �Խ��� where ���� like '%�Ľ�Ÿ%' or ���� like '%�Ľ�Ÿ%';
update sungjuk set tot=kor+eng+mat, aver=(kor+eng+mat)/3 where kor>=50;
select uname, tot, aver from sungjuk where kor >= 50;
rollback;

[NULL] - ��� �ִ� ��
-- ������ ������ ���Ͻÿ�
select count(tot) from sungjuk; --null���� ī��Ʈ ���� ����
-- ������ NULL�� �ִ� ���� ������ ���Ͻÿ�
select count(*) from sungjuk where tot=null; --null�� Ȯ�� ����
--db������ null���� Ȯ������ �� �ϹǷ� null���� �ٸ� ������ �ٲ۴����� ó����.
--is null�� �����.
select count(*) from sungjuk where tot is null;
--��տ� ������� ���� ���� ������ ���Ͻÿ�(null�� �ƴ� ��)is not null ���
select count(*) from sungjuk where aver is not null;

select * from sungjuk;
select uname,(kor+eng+mat) as tot, (kor+eng+mat)/3 as aver from sungjuk where tot is null and aver is null;
update sungjuk
set tot=kor+eng+mat, aver=(kor+eng+mat)/3
where tot is null or aver is null;

commit;
rollback;
delete from sungjuk;