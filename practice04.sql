--1
--Student 테이블의 birthday 컬럼을 사용하여 생일이 1월인 학생의 이름과 birthday 를 출력하세요.
select studno, name, to_char(birthday, 'YYYY-MM-DD') BIRTHDAY
from student
where TO_char(birthday,'MM') = '01'; --문자로 바꾸는 거니까 '01'이 더 좋

--2
--emp 테이블의 hiredate 컬럼을 사용하여 입사일이 1,2,3 월인 사람들의 사번과 이름, 입사일을 출력하세요.
select empno, ename, hiredate, TO_CHAR(hiredate, 'MM')
from emp
where to_char(hiredate, 'MM') in ('01', '02', '03');