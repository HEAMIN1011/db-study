--연습문제
--1.
--emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
--글자만 '-' 으로 변경해서 출력하세요 .
select ename, replace(ename, substr(ename, 3, 2), '-') REPLACE
from emp
where deptno=20;

--2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게 출력하세요.
select name, replace(jumin, substr(jumin, 7), '-/-/-/-') 주민뒷자리숨김,
            substr(jumin, 1, 6) || '-/-/-/-' 주민뒷자리숨김2, 
            concat(substr(jumin, 1, 6), '-/-/-/-') 주민뒷자리숨김3
from student
where deptno1 = 101;

--3,
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
--단 모든 국번은 3자리로 간주합니다.
select name, tel, replace(tel, substr(tel, 5, 3), '***') REPLACE,
                substr(tel, 1, 4) || '****' || substr(tel, 8, 5) 숨김2,
                substr(tel, 1, 4) || '****' || substr(tel, -5, 5) 숨김3,
                concat( concat(substr(tel, 1, 4), '****'), substr(tel, -5, 5) ) 숨김4
from student
where deptno1 = 102;

--++Option 응용
--) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
       3자리 -> ***
       4자리 -> ****
       
select tel,
    INSTR(tel, ')') 괄호위치,
    INSTR(tel, '-') 빼기위치,
    INSTR(tel, '-') - INSTR(tel, ')') - 1 가운데자리수개수,
    substr(tel, instr(tel, ')') +1,  INSTR(tel, '-') - INSTR(tel, ')') - 1 ) 가운데자리,
    substr(tel, 1, instr(tel, ')'))||  LPAD('*',  INSTR(tel, '-') - INSTR(tel, ')') - 1, '*') || substr(tel, -5, 5) "가운데 별"

from student;

--4.
Student 테이블에서 아래와 같이 deptno1 이
101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.
select name, tel, replace(tel,12,substr(tel, -4), '****') REPLACE
from student
where deptno1=101;