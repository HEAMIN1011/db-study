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









