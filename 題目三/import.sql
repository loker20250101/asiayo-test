create database student;
use student;
create table class(name varchar(10), class varchar(1), primary key (name));
insert into class values ('John', 'A'), ('David', 'C'), ('Sara', 'B'), ('Mary', 'A');
create table score(name varchar(10), score int, foreign key (name) references class(name));
insert into score values ('John', 97), ('Mary', 100), ('David', 83), ('Sara', 89);