단일행 함수

임시로 사용하는 테이블 dual

select ename, initcap('ABCDE'), initcap(ename)
from emp;

select lower(name), upper(name)
from student;

select length('abcdefaef'), lengthb('sggkrkd'),
        length('점심'), lengthb('점심')
from dual;

select *
from emp
where length(ename) >=5;

select '아침' || '점심' || '저녁' , concat( concat('아침', '점심'), '저녁')
from dual;

-- substr(대상, 시작지점, 자리수)
select substr('abcdefg', 2, 3),
       substr('abcdefg', 3, 5),
       substr('abcdefg', -5, 2)
from dual;

select name, substr(jumin, 3, 4) Birthday,
        substr(jumin, 3, 4) - 1 "Birthday - 1"
        from student
        where deptno1 = 101;
        
--INSTR(대상, 찾는, 시작, 몇번째[1] )
select INSTR('2024/11/04 10/45/45', '/', 1),
        INSTR('2024/11/04 10/45/45', '/', 6),
        INSTR('2024/11/04 10/45/45', '/', 1, 4), --첫 번째부터 시작하는데 4번째 /의 위치
        INSTR('2024/11/04 10/45/45', '/', 6, 2),
        INSTR('2024/11/04 10/45/45', '/', 1,5),
        INSTR('2024/11/04 10/45/45', '/', 16, 2)
from dual;

select name, tel, instr(tel, ')')
    from student
    where deptno1 = 201;
    
    select *
    from student;
    
select
    LPAD('문자', 10, '*'),
    LPAD(123, 5, 0),
    LPAD(33, 3, 0)
from dual;

select
    LPAD(id, 10, '*'),
    RPAD(id, 10, '*')
from student;

select LPAD(ename, 9,12345678) -- 9자리로 나타낼 건데 나머지를 12345...로 나타낼 거임
from emp;

--TRIM -> 불필요한 요소 제거
--공백제거용
select LTRIM('abcd', 'a'),  --왼쪽에 있는 a를 지우겠다
    RTRIM('abcd', 'd'),
    RTRIM('abcd','b'),--이건 안 됨
    TRIM(' abcd ')
from dual;


select
    replace('abcde', 'c' , '*'), --c를 *로 바꾸겠다
    replace('2024-11-94', '-', '/')
from dual;

select *
from emp;

-----------------------------------
select
    ROUND(1.66, 1),
    ROUND(1.4567, 2),
    TRUNC(1.4567, 0), 
    TRUNC(123.4567, -1),
    MOD(15,4),
    CEIL(123.133), --제일 가까운 큰 정수
    FLOOR(123.1333), --제일 가까운 작은 정수
    POWER(3,5)
FROM dual;



select rownum,--행번호
        ceil(rownum/3),
        empno,
        ename
from emp;


select
    null,
    sysdate,
    systimestamp,
    months_between('2024-01-05', '2024-03-05'),
    add_months(sysdate, 3), --3개월 후는 언제인가
    last_day(sysdate), --그 달의 마지막 날이 언제인가
    next_day(sysdate, '수'), --오늘 기준으로 돌아오는 수욜이 언제임
    next_day(sysdate, '토')
from dual;


select
    ROUND(SYSDATE), --하루 24시 기준으로 절반 넘어가면 반올림
    TRUNC(SYSDATE), --반올림 상관없이 버리기
    TRUNC(123.113, 1), -- 소수 첫번째 자리만 보이고 나머지 버리기
    TRUNC(SYSDATE, 'MM'),
    TRUNC(SYSDATE, 'YY'), -- 올해 기준으로 YY빼고 다 버리기
    ADD_MONTHS(SYSDATE, 1),
    SYSDATE + 3,
    SYSDATE -3,
    --다음달의 첫날
    TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM'),
    Last_day(sysdate)+1,
    --전월의 마지막 날
    trunc(sysdate, 'MM') -1,
     Last_day(ADD_MONTHS(SYSDATE, -1))
from dual;


-----------------------------------
select 2 + '2' --자동형변환
from dual;

select 2 || '123a'
from dual;

select
    TO_CHAR(123),
    TO_CHAR(48363.4634),
    TO_CHAR(502.23),
    sysdate,
    TO_CHAR(sysdate),
    TO_CHAR(sysdate, 'YYYY'),
    TO_CHAR(sysdate, 'MM'),
    TO_CHAR(sysdate, 'DD'),
    TO_CHAR(sysdate, 'YYYYMMDD'),
    TO_CHAR(sysdate, 'YYYY/MM/DD'),
    TO_CHAR(sysdate, 'YYYY-MM-DD')
from dual;


select
    sysdate,
    to_char(sysdate, 'YYYY-MM_DD HH24:MI:SS'),
    to_char(Round(sysdate), 'YYYY-MM_DD HH24:MI:SS')
from dual;


select
    to_char(1234,'999999'),
    to_char(1234,'099999'),
    to_char(1234,'$99999'),
    '$' || 1234,
    to_char(1234,'$9999.99'),
    to_char(1234,'$99,999')
from dual;



 -- 문자 -> 날짜  TO_DATE
 select
    to_date('2024-06-02') + 3,
    to_date('2024/06/02') + 3,
    to_date('24/06/02') + 3,
    to_date('20240602') + 3,
     last_day('2024-08-05'),
     to_date('24:06:02') +3,
     to_char(sysdate, 'YYYY/MM/DD'),
     to_date('2024-01-05', 'YYYY-MM-DD'),
     to_date('2024,01,05', 'YYYY,MM,DD'),
     to_date('12/21/20', 'MM/DD/YY')
from dual;



--NVL

select
    sal,
    comm,
    sal*12 + comm,  --null이 포함돼있으면 제대로 계산ㄴㄴ
    sal*12 + NVL(comm,0) --comm이 null이면 0으로 계산ㄱ
from emp;


select
    NVL(null, 10),
    NVL2(123, '있다', '없다'),
    NVL2(null, '있다', '널이다')
from dual;

--sal*12 + comm = 총연봉 NVL NVL2

select empno, ename, comm, 
        sal*12+comm TOTAL,
        sal*12 + NVL(comm,0) TOTAL2,
        sal*12 + NVL2(comm, comm, 0) TOTAL3,
        NVL2(comm, sal*12+comm, sal*12) TOTAL4
from emp
where deptno = 30;



--DECODE

select
    decode(10,10, '같다', '다르다'),
    decode(10,20, '같다', '다르다'),
    decode(10,20, '같다'), --null으로 나옴 , null은 생략가능
    decode(10,20, '같다', null),
    decode(10,30,'30이다', 40, '40이다', 50, '50이다','아니다'),
    decode(10,30,'30이다', 40, '40이다', 50, '50이다', 60, '60이다', '아니다'),
    decode(10,30,'30이다', 40, '40이다', 50, '50이다', 60, '60이다', null),
    decode(10,30,'30이다', 40, '40이다', 50, '50이다', 60, '60이다')
from dual;


select deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', '다른학과'),
    DECODE(deptno, 101, '컴퓨터공학', 'ETC'),
    DECODE(deptno, 101, '컴퓨터공학'),
    DECODE(deptno, 101, '컴퓨터공학', null)
from professor;

select 
    deptno, name,
    DECODE(deptno, 101, '컴퓨터공학', 102, '멀티미디어', 103, '소프트웨어', 'ETC') DNAME,
    deptno
from professor;

-- 조건? 참:거짓         조건? 참:거짓            조건? 참:거짓(조건? 참:거짓)

--case

--grade학년
--1 1학년 2 2학년 3 3학년 4 4학년

select grade || '학년'
from student;

--1 저학년 2 저학년 3고학년 4고학년
SELECT
    grade,
    DECODE(grade, 1, '저학년', 2, '저학년', 3, '고학년', 4, '고학년') 구분,
    CASE grade
        WHEN 1 THEN '저학년'
        WHEN 2 THEN '저학년'
        WHEN 3 THEN '고학년'
        WHEN 4 THEN '고학년'
    END AS "학년구분",
    CASE
        WHEN grade IN (1,2) THEN '저학년'
        WHEN grade BETWEEN 3 AND 4 THEN '고학년'
    END 학년구분
FROM student;


