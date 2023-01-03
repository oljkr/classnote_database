--테이블 생성
CREATE TABLE tb_pds (
   pdsno      NUMBER         NOT NULL
  ,wname      VARCHAR2(100)  NOT NULL
  ,subject    VARCHAR2(250)  NOT NULL
  ,regdate    DATE           NOT NULL
  ,passwd     VARCHAR2(15)   NOT NULL
  ,readcnt    NUMBER         DEFAULT 0
  ,filename   VARCHAR2(250)  NOT NULL   --파일명
  ,filesize   NUMBER         DEFAULT 0  --파일크기
  ,PRIMARY KEY(pdsno)
);

--시퀀스 생성
create sequence pds_seq;

commit;

--행추가
--pdsno : PK임. 시퀀스넣으면 됨
--wname, subject, passwd : 사용자 입력 <form></form>
--regdate : 오늘날짜 (sysdate)
--filename, filesize : 첨부파일 관련 정보

INSERT INTO tb_pds(pdsno, wname, subject, passwd, filename, filesize, regdate) 
VALUES (pds.seq.nextval, ?, ?, ?, ?, ?, sysdate);

--전체목록
SELECT pdsno, wname, subject, filename, filesize, readcnt, regdate
FROM tb_pds
ORDER BY regdate DESC;

--상세보기
SELECT * FROM tb_pds WHERE pdsno=?;

--행삭제
--글번호와 비밀번호가 일치하면 테이블 행삭제 + /storage폴더에 저장된 첨부파일 삭제
delete FROM tb_pds WHERE pdsno=? AND passwd=?;

--행수정
UPDATE tb_pds 
SET wname=?, subject=?, content=?, filename=?, filesize=?
WHERE pdsno=? AND passwd=?;