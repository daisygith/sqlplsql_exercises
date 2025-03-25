--1. 
SELECT avg(salary) as avg_salary, count(*) as n_employees from hr.employees;

--2.
SELECT avg(salary) FROM hr.EMPLOYEES WHERE DEPARTMENT_ID = 90;

--3.
SELECT MAX(salary) - MIN(salary) FROM hr.employees;

--4.
SELECT avg(salary)/12 as avg_m_salary from hr.EMPLOYEES;

--5.
SELECT TO_CHAR(MIN(start_date),'dd-MM-YYYY') from hr.JOB_HISTORY;

--6.
SELECT TRUNC(MAX(start_date) - MIN(START_date)) AS days from hr.JOB_HISTORY; 





SELECT first_name,SALARY FROM hr.EMPLOYEES WHERE DEPARTMENT_ID = 90;

SELECT max(salary), min(salary) from hr.EMPLOYEES;

select start_date from hr.JOB_HISTORY;