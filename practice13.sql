--11/08
--연습문제

1.
emp2 테이블 활용
직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.

select *
from emp2;

select name, position, pay
from emp2
where pay > (select min(pay)
            from emp2
            where position = 'Section head')
order by pay;

2.
Student 테이블.
전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적네 나가는 학생보다
몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
select * from student;

select name, grade, weight
from student
where weight < (select min(weight)
                from student
                where grade = 2)
order by weight;
                
3.
emp2, dept2 활용
각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
부서명, 직원명, 연봉 출력

select * from emp2;
select * from dept2;

select dname, name, pay
from emp2 e, dept2 d
where pay < all (select avg(pay)
                    from emp2
                    group by deptno)
and e.deptno = d.dcode
order by pay;


select deptno, avg(pay)
from emp2
group by deptno;


--pay컬럼들의 평균값
select MIN(avg_pay)  --컬럼명 AVG(pay) XX 
from (select deptno, AVG(pay) avg_pay    --컬럼명 AVG(pay)
          from emp2
          group by deptno);
          
select 1+2+3 result from dual;

