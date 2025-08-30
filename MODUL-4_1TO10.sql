/*1.INTRODUCTION TO SQL:-
 Lab 1: Create a new database named school_db 
and a table called students with the following */


create database if not exists school_db; -- database create
use school_db; -- use database

create table if not exists student(student_id int primary key auto_increment,student_name varchar(20),age int,
class varchar(20),address varchar(20));

-- Lab 2: Insert five records into the students table and retrieve all records using the SELECT statement. --

insert into student(student_name,age,class,address) values("manhar",20,"graduate","dhandhuka,gujarat"),
("jaydip",20,"graduate","dhandhuka,gujarat"),
("mahaveer",20,"graduate","rajkot,gujarat"),
("jayraj",20,"graduate","ahemdabad,gujarat"),
("jinal",20,"graduate","banas,gujarat");

select * from student;

/*--------------------------------------------------------------------------------------------------------------------------------------------*/

/* 2.SQL SYNTAX-
Lab 1: Write SQL queries to retrieve specific columns (student_name and age) from the students table. */

select student_name,age from student;

/*Lab 2: Write SQL queries to retrieve all students whose age is greater than 10.*/

select * from student where age>10;
/*-------------------------------------------------------------------------------------------------------------------------------------------------*/

/*Que-3. SQL CONSTRAINTS:-
Lab 1: Create a table teachers with the following columns: teacher_id (Primary Key), teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE). 
*/

create table if not exists teachers(teachers_id int primary key auto_increment,
teachers_name varchar(20) not null,subject varchar(20) not null,email varchar(30) unique);

-- Lab 2: Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table
-- First add teacher_id field in student table:

alter table student add column teachers_id int; -- add 

-- foreign key add in column:-
 alter table student add constraint foreign key(teacher_id) references teachers(teacher_id);
 
 -- select * from student;
 
 /*------------------------------------------------------------------------------------------------------------------*/
 
 -- 	4.  Main SQL Commands and Sub-commands(DDL):-
-- Lab 1: Create a table courses with columns: course_id, course_name, and course_credits. Set the course_id as the primary key.

create table if not exists course(course_id int primary key auto_increment,course_name varchar(20),course_credits varchar(20));
 
 -- Lab 2: Use the CREATE command to create a database university_db.
 
 create database university_db; -- database create 
 
 /*----------------------------------------------------------------------------------------------------------------*/
 -- 5. ALTER COMMAND:-
-- Lab 1: Modify the courses table by adding a column course_duration using the ALTER command. 

alter table course add course_duration varchar(20); -- colum add 

-- Lab 2: Drop the course_credits column from the courses table.

alter table corse drop column course_credits; -- column drop

 -- select * from course;
/*------------------------------------------------------------------------------------------------------------------*/
-- 	 6. DROP COMMAND:-
-- Lab 1: Drop the teachers table from the school_db database. 
 
 drop table teachers;
 
 -- Lab 2: Drop the students table from the school_db database and verify that the table has been removed.
 
 drop table student;	
 /*-------------------------------------------------------------------------------------------------------------------*/
 -- 	7. Data Manipulation Language (DML):-
-- Lab 1: Insert three records into the courses table using the INSERT command. 

insert into course(course_name,course_duration)values("full stack","10-12 Month"),
("graphicd Designer","9-10 Month"),("ui/ux","8-12 Month");

-- Lab 2: Update the course duration of a specific course using the UPDATE command. 

update course set course_duration="1 year" where course_id=101;
update course set course_duration="less than 1 year" where course_id=102;
update course set course_duration="more than 1 year" where course_id=103;

-- Lab 3: Delete a course with a specific course_id from the courses table using the DELETE command.

delete from course where course_id=102;
/*---------------------------------------------------------------------------------------------------------------------------*/
-- 8. Data Query Language (DQL):-
-- Lab 1: Retrieve all courses from the courses table using the SELECT statement. 
select * from course;
-- Lab 2: Sort the courses based on course_duration in descending order using ORDER BY.
select * from course order by course_duration desc;
-- Lab 3: Limit the results of the SELECT query to show only the top two courses using LIMIT.
select * from course order by course_duration desc limit 1;

/*---------------------------------------------------------------------------------------------------------------------------*/

-- 9. Data Control Language (DCL):-
-- Lab 1: Create two new users user1 and user2 and grant user1 permission to SELECT from the courses table. 

create user 'user1'@'localhost'identified by 'my sql';
create user 'user1'@'localhost'identified by 'my sql';
grant select on course to user1@localhost;

-- Lab 2: Revoke the INSERT permission from user1 and give it to user2.

revoke insert on course from user1@localhost;
grant insert on course to user2@localhost;

/*---------------------------------------------------------------------------------------------------------------------------*/
-- 10. Transaction Control Language (TCL):-
-- Lab 1: Insert a few rows into the courses table and use COMMIT to save the changes. 

insert into course(course_name,course_duration) values('c++ programing','1 month'),
('python programing','6 month'),
('web devlopment','3 month'),
('java programing','10 month'),
('data management','13 month');

commit;
-- Lab 2: Insert additional rows, then use ROLLBACK to undo the last insert operation. 

start transaction;
insert into course(course_name,course_duration)values
('Advance python','3 month'),
('Advance java','4 month');
rollback;

select * from course;

-- Lab 3: Create a SAVEPOINT before updating the courses table, and use it to roll back specific changes.

start transaction;
savepoint sp2;
update course set course_duration='1 month'
where course_id=103;
rollback to sp2;

 -- select * from course;

