●[자료형]
1)문자형
  - 가변형 varchar(5) 'SKY'     예) 아이디, 비밀번호, 이름, 주소 ~~
  - 고정형 char(5)    'SKY  '   예) 주민번호, 우편번호, 계좌번호, ~~
  
2)숫자형
  - int 정수형
  
3)날짜형
  - 년월일시분초
  - 구분기호 - 와 / 기호를 사용한다
  - 입력시 문자열타입으로 입력한다
  - date
  
///////////////////////////////////////////////////////////////////////

●[테이블 제약조건]
1) primary key
   기본키. 유일성
   where조건절에 걸릴 수 있는 대표적인 칼럼을 강제할 수 있다
   예) 주민번호, 핸드폰번호, 계좌번호, 아이디, 이메일 ~~
   중복을 허용하지 않음. null값 허용하지 않음(빈값을 허용하지 않음. 반드시 입력해야 함)
2) not null
   빈값을 허용하지 않음
3) check
   입력할 값을 특정 범위로 제하는 조건
   
4) default
   사용자가 값을 입력하지 않으면 해당 칼럼이 정의한 기본값을 자동으로 입력해 준다.
5) unique
   중복 허용 안함(이메일이나 핸드폰번호를 unique로 많이 줌)
   null값은 한번만 허용
   --unique는 not null을 한번은 허용함. 두번은 허용 안 함.(왜냐면 2번이면 널값이 중복되기 때문)
   --pk는 한번도 허용 하지 않음.
6) foreign key
   외래키. 테이블 조인하는 경우 부모와 자식 관계를 설정할 때 씀.
   
///////////////////////////////////////////////////////////////////////

-- sungjuk 테이블 삭제
drop table sungjuk;

-- sungjuk 테이블 생성
create table sungjuk(
    sno    int          primary key --기본키(유일성)
    ,uname varchar(50)  not null
    ,kor   int          check(kor between 0 and 100) --국어점수 0~100 사이만 입력가능
    ,eng   int          check(eng between 0 and 100) --영어점수 0~100 사이만 입력가능
    ,mat   int          check(mat between 0 and 100) --수학점수 0~100 사이만 입력가능
    ,addr  varchar(20)  check(addr in ('Seoul','Jeju','Busan','Suwon'));
    ,tot   int          default 0
    ,aver  int          default 0
    ,wdate date         default sysdate              -- 현재 날짜 함수
);

///////////////////////////////////////////////////////////////////////

create table sungjuk(
    sno    int           primary key                    --기본키(유일성)
   ,uname  varchar(50)   not null                        
   ,kor    int           check(kor between 0 and 100)  --국어점수 0~100사이만 입력가능
   ,eng    int           check(eng between 0 and 100)  --영어점수 0~100사이만 입력가능
   ,mat    int           check(mat between 0 and 100)  --수학점수 0~100사이만 입력가능
    ,addr   varchar(20)   check(addr in('Seoul','Jeju','Busan','Suwon'))
   ,tot    int           default 0
   ,aver   int           default 0
   ,wdate  date          default sysdate               --현재 날짜 함수
);

///////////////////////////////////////////////////////////////////////
●[테이블 제약조건 에러 메세지]
-- primary key 제약조건
-- ORA-00001: 무결성 제약 조건(SYSTEM.SYS_C007326)에 위배됩니다
-- sno 칼럼은 기본키(PK)이므로 중복된 값을 허용하지 않음
insert into sungjuk(sno, uname) values(1, '홍길동'); --2번 실행했을 때 에러 발생

-- not null 제약조건
-- ORA-01400: NULL을 ("SYSTEM"."SUNGJUK"."UNAME") 안에 삽입할 수 없습니다
-- uname 칼럼에 반드시 값을 입력해야 함.
insert into sungjuk(sno) values(1); -- uname 칼럼에 반드시 값을 입력해야 함.

-- check 제약조건
-- ORA-02290: 체크 제약조건(SYSTEM.SYS_C007324)이 위배되었습니다
-- 국영수 점소는 0-100 사이만 가능
insert into sungjuk(sno, uname, kor, eng, mat)
values(1, '홍길동', -10, 20, 300); --국영수 점수는 0~100사이만 가능

-- ORA-02290: 체크 제약조건(SYSTEM.SYS_C007325)이 위배되었습니다
insert into sungjuk(sno, uname, kor, eng, mat, addr)
values(1, '홍길동', 10, 20, 30, 'Incheon'); --addr 칼럼에 'Incheon' 허용 안 함.