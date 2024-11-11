--ddl02 제약조건

create table tt01
(
    no number(3) unique,
    name varchar2(10) not null,
    hiredate date
);

insert into tt01
values (1, '이름', sysdate);

insert into tt01
values (2, '이름2', sysdate);

select * from tt01;

insert into tt01
values (3, null, sysdate);

create table tt03
(
        no number(3)
            constraint tt03_no_uk unique,
        name varchar2(10)
            constraint tt03_name_nn not null,
        --score number(3) check(score between 0 and 100)
        score number(3)
            constraint tt03_score_ck check( score between 0 and 100),
        pass varchar2(2)
            constraint tt03_pass_ch check (pass in ('Y', 'N'))
);

--oracle DB 숫자/문자/날짜    boolean X   true/false

1:true 0:false
Y:true N:false
T:true F:false
true:true false:false


INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y');

select * from tt03;

INSERT INTO tt03
VALUES (1, '이름1', 50, 'Y'); --중복 unique

INSERT INTO tt03
VALUES (2, null, 50, 'Y'); --이름 not null

INSERT INTO tt03
VALUES (2, '이름2', 500, 'Y'); --score 범위 0~100

INSERT INTO tt03
VALUES (2, '이름2', 50, 'T'); --pass 'Y' 'N' 

select * from emp;
select * from dept;



