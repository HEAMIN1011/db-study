----복수행 함수 연습문제
--emp 전체 sal 급여 평균
select avg(sal) "전체 sal 급여 평균"
from emp;

--emp 30번 부서 사람들 평균 급여
select avg(sal) "30번 부서 사람들 평균 급여"
from emp
where deptno=30;

--emp 각 부서별 평균 급여
select deptno "부서", avg(sal)
from emp
group by deptno;

--emp 각 부서별 인원과 평균 급여
select deptno "부서", count(*) "인원", avg(sal) "평균 급여"
from emp
group by deptno;

--emp 각 직업별 평균 급여
select job "직업", avg(sal) "평균 급여"
from emp
group by job;

--emp 각 직업별 가장 높은 급여 얼마
select job "직업", max(sal)"높은 급여"
from emp
group by job;

--emp 각 부서별 가장 높은 급여 얼마?
select deptno"부서", max(sal)"높은 급여"
from emp
group by deptno;
