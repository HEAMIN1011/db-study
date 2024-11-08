--11/08
--연습문제

--1.
--student, department 테이블 활용
--학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
select * from student;
select * from department;

--1)다중컬럼 비교

--1-1 ) join
select d.dname, s.height MAX_HEIGHT, s.name, s.height
from student s, department d
where(s.deptno1, s.height) in (
                            select deptno1, max(height)
                            from student
                            group by deptno1)
and s.deptno1 = d.deptno;

--1-2) 서브쿼리 
select (select dname
            from department
            where deptno = deptno1) DNAME,
            height max_height, name, height
    from student
    where (deptno1, height) in (select deptno1, max(height)
                                from student
                                group by deptno1);
                            
--2-1) 인라인뷰 (서브쿼리)
select d.dname, t.max_height, s.name, s.height
from( select deptno1, max(height) MAX_HEIGHT
                    from student
                    group by deptno1) t, student s, department d
    where t.deptno1 = s.deptno1
    and t.max_height = s.height
    and s.deptno1 = d.deptno;
    
--2-2) 서브쿼리
select (select dname
            from department
            where deptno = t.deptno1) DNAME,
            t.max_height, s.name, s.height
    from (select deptno1, max(height) MAX_HEIGHT
                    from student
                    group by deptno1) t, student s
    where t.deptno1 = s.deptno1
    and t.max_height = s.height;
                                
                            
--2.
--student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
--해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)
select * from student;
    
 --1)   
select s.grade, s.name, s.height, t.avg_height
from
    (select grade, avg(height) avg_height
    from student
    group by grade) t, student s
where t.grade = s.grade
and t.avg_height < s.height
order by s.grade;


--2)
select s.grade, s.name, s.height,
                        (select avg(t.height)
                            from student t
                            where t.grade = s.grade) avg_height
from student s
where s.height > (select avg(t.height)
                    from student t
                    where t.grade = s.grade
                    )
    order by s.grade;