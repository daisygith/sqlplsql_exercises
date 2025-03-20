--1.
SELECT LAST_NAME, FIRST_NAME, SALARY FROM HR.EMPLOYEES WHERE SALARY > 5000 ORDER BY SALARY;

--2.
SELECT * FROM HR.EMPLOYEES WHERE LAST_NAME LIKE '%a%' AND SALARY > 8000;

--3. 
SELECT * FROM HR.EMPLOYEES WHERE MANAGER_ID = 100 OR MANAGER_ID = 123;

--4.
SELECT * FROM HR.EMPLOYEES WHERE MANAGER_ID = 123;

--5.
SELECT FIRST_NAME, LAST_NAME, ROUND(SALARY/12) AS SALARY FROM HR.EMPLOYEES WHERE ROUND(SALARY/12) > 1000 AND MANAGER_ID IS NOT NULL;

--6. 
SELECT FIRST_NAME, LAST_NAME, ROUND(SALARY/12) AS SALARY FROM HR.EMPLOYEES WHERE ROUND(SALARY/12) BETWEEN 1000 AND 4000 AND MANAGER_ID IS NOT NULL;

--7. 
SELECT FIRST_NAME, LAST_NAME, ROUND(SALARY/12) AS SALARY FROM HR.EMPLOYEES WHERE ROUND(SALARY/12) BETWEEN 800 AND 1200 AND MANAGER_ID IS NOT NULL;

--8. 
SELECT * FROM HR.EMPLOYEES WHERE DEPARTMENT_ID IN(40,60,90) AND (LAST_NAME LIKE '%e%' OR LAST_NAME LIKE '%E%');


SELECT * FROM HR.EMPLOYEES;