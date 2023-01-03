●오라클 DB 자료형

1. 숫자형
   - number      전체자릿수(38)까지 표현. 표준SQL문의 int형과 동일하지만, 소수점 표현도 가능함
   - number(3)   전체자릿수(3) -999~999. 3칸만 잡겠다는 의미.
   - number(6,2) 전체 자릿수(6)이고, 6칸내에서 소수점 자릿수(2)

2. 문자형
   - char        고정형. 최대길이 2000바이트
   - varchar2    가변형. 최대길이 4000바이트 
   - long        최대 2GB까지
   
3. 이진파일
   - blob     db에 파일을 저장할 수 있음. 근데 절대 사용하지 말것!!!!!!
              db에는 파일명만 기입하고 실제 파일은 하드디스크에 저장하기
   - 주의사항 : 파일을 데이터베이스에 저장하지 않음
   
4. 날짜형
   - date       년월일시분초
   - timestamp  기본날짜형을 확장한 자료형

////////////////////////////////////////////////////////////////////////
●Maria DB 자료형

1. 숫자형 : tinyint, smallint, mediumint, int, bigint, float, double, boolean
              TINYINT(자리수) --날짜 같이 정해져 있는 값들은 이걸 잘 씀(월,일은  31이 최대니깐)
              SMALLINT(자리수)
              MEDIUMINT(자리수)
              INT(자리수)
              BIGINT(자리수)
              FLOAT(전체자리수, 소수점이하자리수)
              DOUBLE(전체자리수, 소수점이하자리수)
              
2. 문자형 :  char, varchar, tinytext, text, mediumtext, longtext
               CHAR(글자수)    => 255자까지
               VARCHAR(글자수) => 255자까지
               TINYTEXT        => 255자까지
               TEXT            => 65535자까지 --많이씀. 게시글 같은 것
               MEDIUMTEXT      => 16777215자까지
               LONGTEXT        => 4294967295자까지
               
3. 날짜형 : date, datetime, timestamp, time, year


SELECT M.PRODUCT CODE,
      (SELECT S.PRODUCT_NAME
         FROM PRODUCT S
        WHERE S.PRODUCT_CODE = M.PRODUCT_CODE) AS PRODUCT_NAME,
      (SELECT S.PRICE
         FROM PRODUCT S
        WHERE S.PRODUCT_CODE = M.PRODUCT_CODE) AS PRICE,
       M.MEMBER_ID,
       M.CONTENT
FROM PRODUCT_REVIEW M;

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
  FROM (SELECT * FROM EMP WHERE DEPTNO = 10) E10,
       (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = D.DEPTNO;

SELECT M.PRODUCT_CODE,
       S.PRODUCT_NAME,
       S.PRICE,
       M.MEMBER_ID,
       M.CONTENT
  FROM PRODUCT_REVIEW M,
       (SELECT PRODUCT_CODE,
               PRODUCT_NAME,
               PRICE
          FROM PRODUCT) S
 WHERE M.PRODUCT_CODE = S.PRODUCT_CODE;

SELECT A.PRODUCT_CODE,
       A.PRODUCT_NAME,
       B.MEMBER_ID,
       B.CONTENT,
       B.REG_DATE
  FROM PRODUCT A INNER JOIN PRODUCT_REVIEW B
    ON A.PRODUCT_CODE = B.PRODUCT_CODE;

SELECT A.COL1, B.COL2
  FROM SAMPLE1 A INNER JOIN SAMPLE2 B
    ON A.COL1 = B.COL1;
    

FROM PRODUCT A LEFT OUTER JOIN PRODUCT_REVIEW B
ON 

