

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