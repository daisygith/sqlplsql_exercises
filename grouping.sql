--1.
SELECT avg(salary) as avg_salary, count(*) as n_employees from hr.EMPLOYEES GROUP BY DEPARTMENT_ID;

--2.
SELECT MAX(salary) as max_salary from hr.employees GROUP by DEPARTMENT_ID ORDER by max(salary);

--3.
SELECT MAX(salary) as max_salary, DEPARTMENT_ID from hr.employees WHERE DEPARTMENT_ID in (50,80,60) GROUP by DEPARTMENT_ID ;

--4.
SELECT DEPARTMENT_ID, MANAGER_ID, AVG(salary) AS avg_salary
FROM hr.EMPLOYEES GROUP BY DEPARTMENT_ID, MANAGER_ID;

--5. 
SELECT department_id,max(salary) - min(salary) as salary_difference FROM hr.EMPLOYEES GROUP by department_id;

--6.
SELECT department_id, TRUNC(MAX(start_date) - MIN(START_date)) AS days from hr.JOB_HISTORY GROUP by department_id HAVING COUNT(EMPLOYEE_ID) > 1;

--7.
SELECT DEPARTMENT_ID,MANAGER_ID, AVG(Salary) as AVG_SALARY from hr.EMPLOYEES 
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID from hr.EMPLOYEES
    GROUP BY DEPARTMENT_ID HAVING COUNT(*) > 1
)
GROUP BY DEPARTMENT_ID, MANAGER_ID;

--8.
WITH AvgSalaries AS (
    SELECT DEPARTMENT_ID, MANAGER_ID, AVG(SALARY) AS AVG_SALARY_BY_MANAGER
    FROM hr.EMPLOYEES
    GROUP BY DEPARTMENT_ID, MANAGER_ID
),
DeptAvgSalaries AS (
    SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY_BY_DEPT
    FROM hr.EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
SELECT e.DEPARTMENT_ID, 
       e.MANAGER_ID, 
       a.AVG_SALARY_BY_MANAGER, 
       d.AVG_SALARY_BY_DEPT
FROM AvgSalaries a
JOIN DeptAvgSalaries d ON a.DEPARTMENT_ID = d.DEPARTMENT_ID
JOIN hr.EMPLOYEES e ON a.MANAGER_ID = e.MANAGER_ID AND a.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY e.DEPARTMENT_ID, e.MANAGER_ID, a.AVG_SALARY_BY_MANAGER, d.AVG_SALARY_BY_DEPT;

-- additional
--9. Calculate the average salary for each job position (JOB_ID) within a department (DEPARTMENT_ID).
select DEPARTMENT_ID,JOB_ID, avg(salary) as avg_salary from hr.EMPLOYEES GROUP by DEPARTMENT_ID, JOB_ID;

--10.Count how many employees each manager has in each department, but only include managers who manage more than one employee.
SELECT COUNT(*) as summary_employees, MANAGER_ID FROM hr.EMPLOYEES GROUP by MANAGER_ID HAVING COUNT(*) >1;

--11.  For each department (DEPARTMENT_ID), display the highest (MAX(SALARY)) and lowest (MIN(SALARY)) salary.

--12. Find all managers (MANAGER_ID) who manage more than one department (DEPARTMENT_ID).

--13. For each manager in a given department, calculate the difference between the average salary in the department and the average salary of their subordinates.



SELECT TRUNC(MAX(start_date) - MIN(START_date)) AS days from hr.JOB_HISTORY;