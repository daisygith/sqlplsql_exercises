--1.
SELECT LOWER(FIRST_NAME) AS FIRST_NAME, UPPER(LAST_NAME) AS LAST_NAME FROM HR.EMPLOYEES;

--2.
SELECT SYSDATE FROM dual;

SELECT TO_CHAR(SYSDATE, 'MM-DD-YYYY HH24:MI:SS') as NOW
FROM DUAL;

--3.
SELECT first_name, last_name, TO_CHAR(start_date, 'DD-MM-YYYY') as START_DATE from hr.EMPLOYEES e
JOIN hr.JOB_HISTORY jh ON e.employee_id = jh.EMPLOYEE_ID; 

--4. 
SELECT TO_CHAR(salary/12, '9999D00') as SALARY from hr.employees;

--5.
SELECT first_name, last_name, TO_CHAR(start_date, 'DD-MM-YYYY') as START_DATE, 
trunc(sysdate - start_date) as days, 
to_char(MONTHS_BETWEEN(sysdate, start_date), '9999') as months,
floor(months_between(sysdate ,start_date) /12) as years
from hr.EMPLOYEES e
JOIN hr.JOB_HISTORY jh ON e.employee_id = jh.EMPLOYEE_ID
order by years desc;

--6.
SELECT TO_CHAR(date '1982-10-10', 'DAY') as day FROM dual;

--7.
SELECT LAST_DAY(TO_DATE('01-02-2098', 'DD-MM-YYYY')) AS ostatni_dzien
FROM dual;

SELECT CASE 
         WHEN MOD(2098, 4) = 0 AND (MOD(2098, 100) <> 0 OR MOD(2098, 400) = 0) 
         THEN 'leap year (29 dni)' 
         ELSE 'non-leap year (28 dni)' 
       END AS wynik
FROM dual;

--8. 
SELECT SYSDATE AS today, 
       TO_DATE('31-12-2100', 'DD-MM-YYYY') AS end, 
       SYSDATE + ((TO_DATE('31-12-2100', 'DD-MM-YYYY') - SYSDATE) / 2) AS half_period
FROM dual;

------

select * from hr.JOB_HISTORY;

select * from hr.jobs;
select * from hr.EMPLOYEES;


select trunc(sysdate - start_date) as days from hr.job_history;

select to_char(MONTHS_BETWEEN(sysdate, start_date), '9999') as months from hr.job_history;

select floor(months_between(sysdate ,start_date) /12) as years from hr.job_history;
