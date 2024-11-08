--subquery

select *
from emp;

--사번이 7844인 사원과 같은 부서 사람들

select *
from emp
where deptno = (select deptno
                    from emp
                    where empno = 7844);

select deptno
from emp
where empno = 7844;


select * from emp2;

select * from dept2;

select * 
from dept2
where area = 'Pohang Main Office';


select *
from emp2
where deptno in (select dcode
                    from dept2
                    where area = 'Pohang Main Office');
                    
 select dcode
 from dept2
where area = 'Pohang Main Office'
and dcode = 1003;

select *
from emp2
where exists (select dcode
                    from dept2
                    where area = 'Pohang Main Office'
                    and dcode = deptno);


select *
from emp2
where deptno = &dno;


select *
from emp2
where deptno = :dno;   --한번 넣어서 적용하면 계속 남아있음





-----다중컬럼

select * 
from student
where (grade, weight) in (
                            select grade, max(weight)
                            from student
                            group by grade);
                        

select *
from student
where (weight) IN ( select MAX(weight)
                            from student
                            group by grade );


select * from emp2 e1
where e1.pay >=     (select avg(pay)
                    from emp2 e2
                    where e2.position = e1.position);
                    
                    
--join         
select e.name, d.dname
from emp2 e, dept2 d
where e.deptno = d.dcode;


--subquery
select dname
from dept2
where dcode = 1006;

select name, (select dname 
                from dept2 
                where dcode = deptno) dname
                -- where dcode > deptno) dname 이거는 다중행 결과를 만들어서 안 됨, 결과가 하나만 나오는 거면 가능함ㅇㅇ
from emp2;

select dname
        from dept2 
        where dcode > 1010;
        
        
select empno, ename, job, '직원'
from emp;


select empno, ename, job, mgr, sal, comm, deptno
from emp;

select sal, mgr
from (
        select empno, ename, job, mgr, sal
        from emp) ;

select * from dept;



--emp테이블과 dept테이블을 조회하여 부서번호와 부서별 최대급여 및 부서명을 출력하세요

-- groupby집계 -> join
select e.deptno, e.max_sal, d.dname
from (select deptno, MAX(sal) max_sal
        from emp
        group by deptno) e, dept d
where e.deptno = d.deptno;

--join -> groupby 

select deptno, max(sal), dname
from (select e.sal, e.deptno, d.dname
        from emp e, dept d
        where e.deptno = d.deptno )
group by deptno, dname;

