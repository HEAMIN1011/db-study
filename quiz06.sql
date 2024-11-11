--11/11(월)
--모닝퀴즈

--emp2 dept2 테이블을 참고하여,
--'AL Pacino'와 "같은 지역"에서
--근무하는 직원들의 평균 연봉보다
--많이 받는 직원들의 사번, 이름, 부서번호, 부서이름, 근무지역, 급여 를 출력하세요.
            
select * from emp2;

select * from dept2;


 select empno, name, deptno,
    (select dname from dept2 where dcode = deptno) dname,
    (select area from dept2 where dcode = deptno) area,
    pay
 from emp2
 where pay > ( select avg(pay)
                 from emp2
                 where deptno in ( select dcode
                                    from dept2
                                    where area = (select area
                                        from dept2
                                        where dcode = (select deptno
                                                        from emp2
                                                        where name = 'AL Pacino'))));