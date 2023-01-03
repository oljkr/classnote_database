select * from tb_bbs;

SELECT indent
from tb_bbs
where grpno가 같고 indent는 하나 많고;

select count(*)
from tb_bbs
where grpno=83 and indent in (1,2);

select *
from tb_bbs
where bbsno=83;

SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
from (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 );
     
SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
from (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 )
where rownum>=1 and rownum<=5;

SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum
from (
		SELECT bbsno,subject,wname,readcnt,indent,regdt
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	 )
where rownum>=6 and rownum<=10;

SELECT *
FROM (
		SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r
	    FROM (
				SELECT bbsno,subject,wname,readcnt,indent,regdt
				FROM tb_bbs
				ORDER BY grpno DESC, ansnum ASC
	 		 )
	 )
WHERE r>=6 AND r<=10;

SELECT *
FROM (
		SELECT bbsno,subject,wname,readcnt,indent,regdt, rownum as r
	    FROM (
				SELECT bbsno,subject,wname,readcnt,indent,regdt
				FROM tb_bbs
				WHERE subject LIKE '%수정%'
				ORDER BY grpno DESC, ansnum ASC
	 		 )
	 )
WHERE r>=1 AND r<=5;

CREATE TABLE member (
    id       VARCHAR(10)  NOT NULL, -- 아이디, 중복 안됨.
    passwd   VARCHAR(10)  NOT NULL, -- 패스워드
    mname    VARCHAR(20)  NOT NULL, -- 성명
    tel      VARCHAR(14)  NULL,     -- 전화번호
    email    VARCHAR(50)  NOT NULL  UNIQUE, -- 전자우편 주소, 중복 안됨
    zipcode  VARCHAR(7)   NULL,     -- 우편번호, 12345
    address1 VARCHAR(255) NULL,     -- 주소 1
    address2 VARCHAR(255) NULL,     -- 주소 2(나머지주소)
    job      VARCHAR(20)  NOT NULL, -- 직업
    mlevel   CHAR(2)      NOT NULL, -- 회원 등급, A1, B1, C1, D1, E1, F1
    mdate    DATE         NOT NULL, -- 가입일    
    PRIMARY KEY (id)
);

commit;

select * from member;

-- 행추가
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('webmaster', '12341234', '웹마스터', '123-4567', 'webmaster@itwill.com'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'A1', sysdate );
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('itwill', '12341234', '웹마스터', '123-4567', 'itwill@itwill.com'
     , '12345', '서울시 강남구 역삼동', '삼원타워4층', 'A02', 'D1', sysdate );
insert into member(id, passwd, mname, tel, email, zipcode, address1, address2, job, mlevel, mdate)
values('user1', '12341234', '웹마스터', '123-4567', 'user1@soldesk.com'
     , '12345', '서울시 종로구 관철동', '코아빌딩8층', 'A02', 'F1', sysdate );
     
select mlevel
from member
where id='webmaster' and passwd='12341234' and mlevel in ('A1','B1','C1','D1');

select mlevel
from member
where id='itwill' and passwd='12341234' and mlevel in ('A1','B1','C1','D1');

select mlevel
from member
where id='user1' and passwd='12341234' and mlevel in ('A1','B1','C1','D1');

SELECT count(id)
FROM member
WHERE id=?;

select * from member;

SELECT count(email) as cnt
FROM member
WHERE mname='sunday' AND email='sunday';

SELECT BB.subject, AA.reply
FROM(
   SELECT grpno, count(*)-1 as reply
   FROM tb_bbs
   GROUP BY grpno
    )AA JOIN tb_bbs BB
ON AA.grpno=BB.grpno
WHERE BB.indent=0
ORDER BY BB.grpno desc;

select * from tb_bbs;

   SELECT grpno, count(*)-1
   FROM tb_bbs
   where grpno=83
   GROUP BY grpno;

SELECT BB.subject, AA.reply
FROM(
   SELECT grpno, count(*)-1 as reply
   FROM tb_bbs
   WHERE grpno=?
   GROUP BY grpno
    )AA JOIN tb_bbs BB
ON AA.grpno=BB.grpno
WHERE BB.indent=0
ORDER BY BB.grpno desc;

select BB.subject, AA.reply
from(
   select grpno, count(*)-1 as reply
   from tb_bbs
   group by grpno
    )AA join tb_bbs BB
on AA.grpno=BB.grpno
where BB.indent=0
order by BB.grpno desc;

--유진이꺼
SELECT AA.grpno, AA.cnt, BB.subject, BB.indent
FROM(
   SELECT grpno, count(*)-1 as cnt
   FROM tb_bbs
   GROUP BY grpno
    )AA INNER JOIN tb_bbs BB
ON AA.grpno=BB.grpno
WHERE BB.indent=0
ORDER BY AA.grpno desc;

select * from member;

update member set mlevel='F1' where id='ramen' and passwd=15151515;