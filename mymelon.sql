CREATE TABLE mediagroup (
  mediagroupno NUMBER        NOT NULL PRIMARY KEY, -- 그룹번호
  title        VARCHAR2(255) NOT NULL              -- 그룹제목 
);

create sequence mediagroup_seq;

commit;

SELECT AA.*
FROM (
        SELECT ROWNUM as RNUM, BB.*
        FROM (
                SELECT mediagroupno, title
                FROM mediagroup
                ORDER BY mediagroupno DESC
                ) BB
            )AA
WHERE AA.RNUM>=1 AND AA.RNUM <=7;

CREATE TABLE media (
  mediano  NUMBER        NOT NULL PRIMARY KEY,          -- 미디어 번호
  title    VARCHAR2(255) NOT NULL,                      -- 제목
  poster   VARCHAR2(255) DEFAULT 'poster.jpg' NOT NULL, -- 포스터 이미지
  filename VARCHAR2(255) NOT NULL,                      -- 음원 파일명
  filesize NUMBER        DEFAULT 0 NOT NULL,
  mview    CHAR(1)       DEFAULT 'Y' NOT NULL,          -- 출력모드
  rdate    DATE          NOT NULL,                      -- 등록일
  mediagroupno NUMBER    NULL                           -- 부모테이블 PK
);

create sequence media_seq;

commit;

mediano  NUMBER        NOT NULL PRIMARY KEY,          -- 미디어 번호
  title    VARCHAR2(255) NOT NULL,                      -- 제목
  poster   VARCHAR2(255) DEFAULT 'poster.jpg' NOT NULL, -- 포스터 이미지
  filename VARCHAR2(255) NOT NULL,                      -- 음원 파일명
  filesize NUMBER        DEFAULT 0 NOT NULL,
  mview    CHAR(1)       DEFAULT 'Y' NOT NULL,          -- 출력모드(목록에 보여줄거면 y, 아니면 숨김)
  rdate    DATE          NOT NULL,                      -- 등록일
  mediagroupno NUMBER    NULL                           -- 부모테이블 PK
  
SELECT mediano, title, rdate, poster, filename, filesize, mview, mediagroupno
FROM media
WHERE mview='Y' AND mediagroupno=13
ORDER BY mediano DESC;

-- 테이블 생성
create table mem(
   num number,
   name varchar2(20),
   age number
);

-- 시퀀스 생성
create sequence mem_seq;

commit;

select * from mem;