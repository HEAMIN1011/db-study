--ddl

create table new_table
(
    no number(3),
    name varchar2(10),
    birth date
);

select *
from new_table;

desc new_table;

select sysdate from dual;



create table tt02
(
    no number(3,1) default 0,
    name varchar2(10) default 'NO Name',
    hiredate date default sysdate
);

select *
from tt02;


--테이블 복사
create table dept3
as
select * from dept2;   --구조 + 데이터 전체 복사

select * from dept3;

create table dept4
as
select dcode, area from dept2;  --컬럼 2개 + 데이터 복사

select * from dept4;

create table dept5    --컬럼 구조만 복사 (데이터 X )
as
select * from dept2
where 1=2; --거짓 조건

select * from dept5;

--테이블 변경

--컬럼 추가
ALTER TABLE dept4
ADD (location VARCHAR2(10));

ALTER TABLE dept4
ADD (location VARCHAR2(10) DEFAULT 'Cheonan');

INSERT INTO dept4
VALUES (2000, 'Cheonan Office');

--임시부서 여부를 체크   컬럼명 temp_code   'Y' 임시부서 , 'N' 정식부서
ALTER TABLE dept4
ADD (temp_code VARCHAR2(2) DEFAULT 'N');

select * from dept4;

--컬럼 삭제
ALTER TABLE dept4
DROP COLUMN location;


CREATE TABLE dept6
AS
select * from dept4;

select * from dept5;
select * from dept6;

--테이블 삭제 (rollback 불가 / 자동 commit)
DROP TABLE dept5;

TRUNCATE TABLE dept6;