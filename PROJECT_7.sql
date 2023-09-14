create database projects;

USE projects;

select * from hr;

Alter table hr
change column ï»¿id emp_id varchar(20)Null;

Describe hr;

select birthdate from hr;

set sql_safe_updates = 0;
update hr

SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

describe hr;

update hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

select hire_date from hr;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

describe hr;

select termdate from hr;

update hr
set termdate = date(str_to_date(termdate,'%Y-%m-%d %h:%i:%s UTC'))
where termdate is not null and termdate !=' ';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

select termdate from hr;

describe hr;

alter table hr add column age INT;

select * from hr;

update hr
set age =timestampdiff(year,birthdate, CURDATE());

select birthdate ,age from hr;




