--복수행 함수

COUNT(대상) 갯수

select count(*)
from emp;

select count(empno), count(*)
from emp;

select count(job), count(mgr), count(hiredate), count(comm) --null은 갯수로 안 쳐짐
from emp;

select count(*)
from emp
where comm is not null;

select sum(sal), count(*)
from emp;

--10,20번 부서 다니는 애들 총 몇명? 총 급여?
select count(*), sum(sal)
from emp
where deptno in (10,20);


select avg(height), max(height), min(height), stddev(height), variance(height)
from student;

--student 평균 키
--전체 평균키 ㄴㄴ, 각 학년별 평균 키

select '1학년' 학년, avg(height) 평균키
from student 
where grade = 1
union all
select '2학년', avg(height)
from student 
where grade = 2
union all
select '3학년', avg(height)
from student 
where grade = 3
union all
select '4학년', avg(height)
from student 
where grade = 4;


--group by 특정 컬럼을 기준으로 그룹지어서 계산
--group by에 명시된 컬럼은 같이 조회 가능
select grade, avg(height)
from student
group by grade; 

select studno, avg(height)
from student
group by studno;

select grade, avg(height) height
from student
group by grade
order by height;


select deptno, avg(sal)
from emp
--where avg(sal) >= 2000
group by deptno
having avg(sal) >= 2000;


1) 급여가 1500 이상인 직원들만 대상으로, 부서별 평균 급여 계산
select *
from emp;

select deptno, avg(sal)
from emp
where sal >= 1500
group by deptno;

2) 부서별 평균 급여가 1500 이상인 경우만, 부서별 평균 급여 보여주기
select deptno, avg(sal)
from emp
group by deptno
having avg(sal) >=1500
order by deptno;


--student 각 학년별 평균 몸무게
--평균 몸무게 65키로 이상인 경우만
select grade, avg(weight)
from student
group by grade
having avg(weight) >=65;

--student 각 학년별 평균 몸무게
--평균 몸무게 65키로 이상인 경우만
-- 근데 4학년 제외
select grade, avg(weight)
from student
where grade <> 4
group by grade
having avg(weight) >=65;


select deptno, job, ROUND(AVG(sal), 1)
from emp
group by deptno, job;

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job);

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by CUBE(deptno, job);

select *
from emp
where job = 'SALESMAN' and deptno = 30;




group by ROLLUP(deptno, job);
1) deptno, job 그룹화
2) deptno 그룹화 계
3) () 그룹화 계

group by ROLLUP( (deptno, job) );
1) (deptno, job) 그룹화
2) () 그룹화 계

select deptno, job, ROUND(AVG(sal), 1)
from emp
group by ROLLUP( (deptno, job) );

group by ROLLUP(deptno, job, mgr);
1) deptno, job, mgr 그룹
2) deptno, job 계
3) deptno 계
4) () 계

group by ROLLUP(deptno, (job, mgr) );
1) deptno, job, mgr 그룹
2) deptno 계
3) () 계

select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, job, mgr);

select deptno, job, mgr, ROUND(AVG(sal), 1)
from emp
group by ROLLUP(deptno, (job, mgr) );



--rank , dense rank

순위 rank() over (order by 정렬기준)
그룹단위로 순위 나타낼 때 rank() over (partition by 기준 order by 정렬기준)

select ename,
        sal, 
        rank() over (order by sal desc),
        dense_rank() over (order by sal desc)
from emp;
--order by sal;

select name, height,
        rank() over (order by height desc) 순위1,
        dense_rank() over (order by height desc) 순위2,
        grade,
        rank() over (partition by grade order by height desc) 순위3,
        dense_rank() over (partition by grade order by height desc) 순위4
from student
order by grade, height desc;















