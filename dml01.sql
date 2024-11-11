--dml

--데이터 저장
--데이터 수정
--데이터 삭제
--데이터 병합

insert into 테이블명 (컬럼명)
values (데이터 값);

insert into new_table (no, name, birth)
values (1, '이름1', sysdate);

insert into new_table (name, birth, no)
values ('이름2', sysdate, 2);

insert into new_table (name, birth, no)
values ('이름3','2002-02-15', 3);

insert into new_table (name, birth, no)
values ('이름4', to_date('2001-10-25'), 4);

--컬럼명 생략
--전체 컬럼에 저장하는 경우 + 순서
insert into new_table
values (5, '이름5', sysdate);

insert into new_table (no, name)
values (6, '이름6');

insert into new_table
values (7, '이름7', null);


---

insert into tt02 (no)
values (1);

insert into tt02 (no, name, hiredate)
values (2, null, null);


--update 수정

update 테이블명
set 컬럼명 = 값
where 조건;

--임시부서 여부 체크 컬럼명 temp_code 'Y' : 임시부서, 'N': 정식부서
select * from dept4;

update dept4
set temp_code = 'N';

update dept4
set temp_code = 'Y'
where dcode = 2000;

select *
from dept4
where temp_cpde = 'Y';


create table professor2
as
select * from professor;

select *
from professor2
where position = 'assistant professor';

update professor2
--set bonus = 200   --200으로 저장
set bonus = bonus + 200 --200을 인상
where position = 'assistant professor';


commit;
rollback;

select *
from dept4
where dcode = 2000;

UPDATE dept4
SET location = 'Asan'
where dcode = 2000;

INSERT INTO dept4
VALUES (2001, 'Asan Office', 'Asan', 'Y');

--데이터 삭제 DELETE  (rollback 가능 /자동commit X)
select * from dept4;

DELETE FROM dept4;


SELECT *
--DELETE
FROM dept4
WHERE temp_code = 'Y';



