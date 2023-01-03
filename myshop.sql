--상품 테이블
CREATE TABLE product (
     product_code  int           primary key --상품번호
    ,product_name  varchar(100)  not null    --상품명
    ,description   varchar(2000)             --상품내용
    ,price         int           default 0   --상품가격
    ,filename      varchar(500)              --파일명
);

--상품 시퀀스
CREATE SEQUENCE product_seq;

commit;

select * from product;

--상품 댓글 테이블
CREATE TABLE pcomment (
     cno      number         primary key --댓글번호
    ,pno      number         not null    --부모글 번호
    ,content  varchar2(255)  not null            --댓글내용
    ,wname    varchar(100)   not null   --작성자
    ,regdate  date           default sysdate         --작성일
);

--댓글 시퀀스
CREATE SEQUENCE pcomment_seq;

commit;

select * from pcomment;

SELECT cno, pno, content, wname, regdate
FROM pcomment
WHERE pno=2