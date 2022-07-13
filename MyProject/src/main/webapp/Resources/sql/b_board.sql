create table b_Board(
b_Num int not null primary key,
b_Id varchar(20) not null,
b_Name varchar(20) not null,
b_Subject varchar(200) not null,
b_Content varchar(3000) not null,
b_regist_day varchar(40),
b_hit int,
b_ip varchar(20)
);

select * from b_Board;

drop table b_Board;
select * from b_Board ORDER BY num DESC;