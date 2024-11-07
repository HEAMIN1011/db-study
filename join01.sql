--join 01

select *
from emp;

select *
from dept;


--join 기준 deptno가 같은

--select empno, ename, dname, loc, d.deptno
select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e, dept d
where e.deptno = d.deptno;

-- , -> inner join / where -> on

select e.empno, e.ename, d.dname, d.loc, d.deptno
from emp e inner join dept d
on e.deptno = d.deptno;




select * 
from student;

select *
from professor;


select *
from student s, professor p
where s.profno = p.profno;

select *
from student s inner join professor p
on s.profno = p.profno;

--inner join VS outer join
select *
from student s, professor p
where s.profno = p.profno(+); --s기준으로 profno를 붙이겠다는 거
--WHERE s.profno(+) = p.profno;
--WHERE p.profno = s.profno(+);

--null인 경우를 살리면서 붙이겠다, 기준점 되는 테이블 ㄴㄱ, left / right 되는데 left는 왼쪽 기준으로 오른쪾 애를 붙이겠다
SELECT *
FROM student s LEFT OUTER JOIN professor p
--FROM student s RIGHT OUTER JOIN professor p
--FROM professor p  LEFT OUTER JOIN student s
ON s.profno = p.profno;


--------------------

select *
from student;

select *
from professor;

select *
from department;




select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p ,department d
where s.profno = p.profno
    and
    s.deptno1 = d.deptno;
    
    
select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from 
    student s 
    INNER JOIN professor p
    ON s.profno = p.profno
    INNER JOIN department d
    ON s.deptno1 = d.deptno;

--학생의 학과이름
select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    AND
    s.deptno1 = d.deptno    --student 학과번호 = department 학과번호
;

select s.name STU_NAME, d.dname DEPT_NAME , p.name PROF_NAME
from student s, professor p, department d
where s.profno = p.profno
    AND
    p.deptno = d.deptno    --professor 학과번호 = department 학과번호
;



--교수학과 이름, 학생학과 이름
SELECT 
    s.name, 
    s.deptno1,
    d.dname, 
    s.profno,
    p.profno,
    p.name,
    p.deptno,
    d2.dname
from student s, professor p, department d, department d2
where s.profno = p.profno
    AND s.deptno1 = d.deptno
    AND p.deptno = d2.deptno;
    

select *
from customer;

select *
from gift;



-- 1~65000~100000

select c.gname, c.point, g.gname
from customer c, gift g
where c.point BETWEEN g.g_start AND g.g_end;


--INNER JOIN
select *
from student s, professor p
where s.profno = p.profno;

--OUTER JOIN
select *
from student s, professor p
where s.profno = p.profno(+);

select *
from student s, professor p
where p.profno = s.profno(+);
--where s.profno(+) = p.profno;

내 사번, 내 이름, 내 상사 사번 ,상사 이름
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr = e2.empno;




