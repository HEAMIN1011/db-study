--1.
--Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 아래와 같이 출력하세요.
--단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.
select profno, name, pay, bonus, to_char(pay*12+NVL(bonus,0), '99,999') TOTAL
from professor
where deptno=201;

--2.
--아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 comm 값이 있을 경우 'Exist' 을 출력하고
--comm 값이 null 일 경우 'NULL' 을 출력하세요.
select empno, ename, comm, NVL2(comm, 'Exist', 'null') NVL2
from emp
where deptno=30;



select deptno, name,
    decode(deptno, 101, 'Computer Engineering', 102, 'Multimedia Engineering', 103, 'Software Engineering', 'ETC')
from professor;


--1.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고
--101 번 부서 중에서 이름이 "Audie Murphy" 교수에게 "BEST!" 라고 출력하고
--101번 부서 중에서 이름이 "Audie Murphy" 교수가 아닌 나머지에는 NULL 값을 출력하세요.
--만약 101 번 외 다른 학과에 "Audie Murphy" 교수가 있어도 "BEST!" 가 출력되면 안됩니다.

select *
from professor;

select deptno, name,
    decode(deptno, 101, decode(name, 'Audie Murphy',  'BEST!' )) DECODE
from professor;


--2.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서 이름이 "Audie Murphy" 교수에게
--비고란에 “BEST!”라고 출력하고 101번 학과의 "Audie Murphy" 교수 외에는 비고란에
--“GOOD!”을 출력하고 101번 교수가 아닐 경우는 비고란이 공란이 되도록 출력하세요.

select deptno, name,
    decode(deptno, 101,  decode(name, 'Audie Murphy',  'BEST!', 'GOOD!' ) ) "비고"
from professor;

--3.
--professor 테이블에서 교수의 이름과 부서번호를 출력하고 101 번 부서 중에서
--이름이 "Audie Murphy" 교수에게 비고란에 “BEST!” 이라고 출력하고
--101번 학과의 "Audie Murphy" 교수 외에는 비고란에 “GOOD!”을 출력하고
--101번 교수가 아닐 경우는 비고란에 "N/A" 을 출력하세요.
select deptno, name,
    decode(deptno, 101,  decode(name, 'Audie Murphy',  'BEST!', 'GOOD!') , 'N/A') "비고"
from professor;

--4.
--Student 테이블을 사용하여 제 1 전공 (deptno1) 이 101 번인 학과 학생들의 이름과 주민번호, 성별을 출력하되
--성별은 주민번호(jumin) 컬럼을 이용하여 7번째 숫자가 1일 경우 '남자' , 2일 경우 '여자' 로 출력하세요.

select *
from student;

select name, jumin,
    decode(substr(jumin, 7, 1), 1, '남자',2, '여자' ) 성별
from student;
--5.
--Student 테이블에서 1 전공이 (deptno1) 101번인 학생의 이름과 연락처와 지역을 출력하세요.
--단,지역번호가 02 는 "SEOUL" , 031 은 "GYEONGGI" , 051 은 "BUSAN" , 052 는 "ULSAN" , 055 는 "GYEONGNAM"입니다.

select name, tel,
    decode(substr(tel, 1, instr(tel, ')')-1), 02, 'SEOUL', 031, 'GYEONGGI', 052, 'ULSAN', 055, 'GYEONGNAM', '기타지역') 지역
from student;


--1. student 테이블을 참고해서 진행하세요.
--학생들의 이름과 주민번호, 생일 그리고  jumin, birthday 참고해서 태어난 날짜별로 분기를 표시하는 쿼리를 작성하세요.
--태어난 월에 따라서 각 분기로 표시
1~3 1분기
4~6 2분기
7~9 3분기
10~12 4분기

select *
from student;

select name, jumin, birthday,
    case
        when substr(jumin,3,2) between 1 And 3 then '1분기'
        when substr(jumin,3,2) in(4,5,6) then '2분기'
        when substr(jumin,3,2) in(7,8,9) then '3분기'
        else '4분기'
    END 분기,
    case
        when to_char(birthday, 'MM') between 1 And 3 then '1분기'
        when to_char(birthday, 'MM') in(4,5,6) then '2분기'
        when to_char(birthday, 'MM') in(7,8,9) then '3분기'
        else '4분기'
    END 분기
from student;


--2.2.
--emp 테이블을 조회하여 empno , ename , sal , LEVEL(급여등급)을 출력하세요.
--단 급여등급은 sal 을 기준으로
1 - 1000 이면 Level 1,
1001 - 2000 이면 Level 2,
2001 - 3000 이면 Level 3,
3001 - 4000 이면 Level 4 ,
4001 보다 많으면 Level 5 로 출력하세요.

select empno, ename, sal,
    case
        when sal between 1 and 1000 then 'Level 1'
        when sal between 1001 and 2000 then 'Level 2'
        when sal between 2001 and 3000 then 'Level 3'
        when sal between 3001 and 4000 then 'Level 4'
        when sal > 400 then 'Level 5'
    end 급여등급
from emp;
















