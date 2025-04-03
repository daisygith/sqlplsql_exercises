--1.
SELECT first_name, last_name,salary, salary - (
    SELECT avg(salary) from hr.EMPLOYEES) as salary_diff
from hr.EMPLOYEES;

--2.
SELECT e.first_name, e.last_name, d.department_name
from hr.EMPLOYEES e
join hr.DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.salary - (
    SELECT avg(salary) from hr.EMPLOYEES) > 0 ;

--3. 
SELECT max(salary) - min(salary) as salary_diff FROM hr.EMPLOYEES 
where DEPARTMENT_ID =(
    SELECT DEPARTMENT_ID from hr.DEPARTMENTS where department_name = 'Finance');

--4.
SELECT first_name, last_name, salary, salary/12 - (
    SELECT avg(salary)/12 from hr.EMPLOYEES WHERE department_id = employees.department_id) as salary_diff
from hr.EMPLOYEES;

--5.
SELECT e.last_name,(SELECT COUNT(*) FROM hr.employees WHERE department_id = e.department_id) as num_employee, (SELECT AVG(salary) FROM hr.employees WHERE department_id = e.department_id) as avg_salary from hr.EMPLOYEES e;

--6.
select first_name, last_name from hr.EMPLOYEES
where salary > ALL (select salary from hr.EMPLOYEES e
join hr.DEPARTMENTS d ON e.DEPARTMENT_ID=d.DEPARTMENT_ID where d.department_name = 'Finance');

--7.
SELECT first_name, last_name from hr.EMPLOYEES e
where (SELECT COUNT(*) FROM hr.employees e2 WHERE e2.department_id = e.department_id) > 1;

--8. 
SELECT first_name, last_name, salary/12 as month_salary from hr.EMPLOYEES e
where salary/12 > (select avg(salary)/12 from hr.employees e2 where e2.DEPARTMENT_ID = e.DEPARTMENT_ID);

--9.
select first_name, last_name from hr.EMPLOYEES e where EXISTS (select 1 from hr.EMPLOYEES e2 where e2.MANAGER_ID = e.EMPLOYEE_ID);

--10.
--Find employees working in the same departments as 'Neena Yang'
select * from hr.EMPLOYEES where DEPARTMENT_ID = (select DEPARTMENT_ID from hr.EMPLOYEES where FIRST_NAME = 'Neena' and LAST_NAME = 'Yang');

--11.
--Display the names of managers who manage more than 5 employees
select first_name, last_name from hr.EMPLOYEES e where 5 <(select count(*) from hr.EMPLOYEES e2 where e2.MANAGER_ID = e.EMPLOYEE_ID);

--12.
--View employees who are not managers
select first_name, last_name from hr.EMPLOYEES e where NOT EXISTS (select 1 from hr.EMPLOYEES e2 where e2.MANAGER_ID = e.EMPLOYEE_ID);

--13.
--Find the department where the most people work
SELECT department_name, count(*) from hr.EMPLOYEES e
JOIN hr.DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME
HAVING COUNT(*) = (
    SELECT MAX(count_per_dept)
    FROM (
        SELECT COUNT(*) AS count_per_dept
        FROM hr.employees e2
        GROUP BY e2.department_id
    )
);