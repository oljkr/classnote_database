�ܿ���Ŭ DB �ڷ���

1. ������
   - number      ��ü�ڸ���(38)���� ǥ��. ǥ��SQL���� int���� ����������, �Ҽ��� ǥ���� ������
   - number(3)   ��ü�ڸ���(3) -999~999. 3ĭ�� ��ڴٴ� �ǹ�.
   - number(6,2) ��ü �ڸ���(6)�̰�, 6ĭ������ �Ҽ��� �ڸ���(2)

2. ������
   - char        ������. �ִ���� 2000����Ʈ
   - varchar2    ������. �ִ���� 4000����Ʈ 
   - long        �ִ� 2GB����
   
3. ��������
   - blob     db�� ������ ������ �� ����. �ٵ� ���� ������� ����!!!!!!
              db���� ���ϸ� �����ϰ� ���� ������ �ϵ��ũ�� �����ϱ�
   - ���ǻ��� : ������ �����ͺ��̽��� �������� ����
   
4. ��¥��
   - date       ����Ͻú���
   - timestamp  �⺻��¥���� Ȯ���� �ڷ���

////////////////////////////////////////////////////////////////////////
��Maria DB �ڷ���

1. ������ : tinyint, smallint, mediumint, int, bigint, float, double, boolean
              TINYINT(�ڸ���) --��¥ ���� ������ �ִ� ������ �̰� �� ��(��,����  31�� �ִ�ϱ�)
              SMALLINT(�ڸ���)
              MEDIUMINT(�ڸ���)
              INT(�ڸ���)
              BIGINT(�ڸ���)
              FLOAT(��ü�ڸ���, �Ҽ��������ڸ���)
              DOUBLE(��ü�ڸ���, �Ҽ��������ڸ���)
              
2. ������ :  char, varchar, tinytext, text, mediumtext, longtext
               CHAR(���ڼ�)    => 255�ڱ���
               VARCHAR(���ڼ�) => 255�ڱ���
               TINYTEXT        => 255�ڱ���
               TEXT            => 65535�ڱ��� --���̾�. �Խñ� ���� ��
               MEDIUMTEXT      => 16777215�ڱ���
               LONGTEXT        => 4294967295�ڱ���
               
3. ��¥�� : date, datetime, timestamp, time, year


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

