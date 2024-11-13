--11/12

1. Dept2 테이블에 아래와 같은내용으로 새로운 부서정보를 입력하세요.
* 부서번호 : 9010
* 부서명 : temp_10
* 상위부서 : 1006
* 지역 : temp area

select * from dept2;

INSERT INTO Dept2
VALUES (9010, 'temp_10', 1006, 'temp area');

2. Dept2 테이블에 아래와 같은 내용으로 특정컬럼에만 정보를 입력하세요
* 부서번호 : 9020
* 부서명 : temp_20
* 상위부서 : Business Department ( 1006 번 부서 )

insert into dept2
values (9020, 'temp_20', 1006, null);

3. professor 테이블에서 profno 가 3000 번 이하의 교수들의 profno , name , pay 를 가져와서
professor4 테이블에 한꺼번에 입력하는 쿼리를 쓰세요. ( ITAS 방법을 사용하세요 )
select * from professor;

select profno, name, pay
from professor
where profno < 3000;

create table professor4
(   profno number(4) primary key,
    name VARCHAR2(30),
    pay number(5)
);

insert into professor4
select profno, name, pay
from professor
where profno < 3000;

select * from professor4;

4. Professor 테이블에서 'Sharon Stone' 교수의 BONUS 를 100 만원으로 인상하세요.

select *
from professor
where name = 'Sharon Stone';

UPDATE professor
SET bonus = 100
where name = 'Sharon Stone';

select * from professor;


