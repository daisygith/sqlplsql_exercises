--created copy hr.employees
CREATE TABLE my_employees AS 
SELECT * FROM hr.employees WHERE 1=0;
--1.
SELECT * from hr.EMPLOYEES e where EXISTS(
    select 1 
    from hr.DEPARTMENTS d
    where d.department_id = e.department_id
);

SELECT * from hr.EMPLOYEES where department_id IN(
    select department_id from hr.DEPARTMENTS
);

--2.
-- insert new rows
INSERT INTO MY_EMPLOYEES VALUES(1, 'ALICE', 'KEYS','test@test.com','',SYSDATE,1,'','','','');
INSERT INTO MY_EMPLOYEES VALUES(2, 'Doley', 'Abby','test@test.com','',SYSDATE,1,'','','','');
INSERT INTO MY_EMPLOYEES VALUES(3, 'Anette', 'Smartley','test@test.com','',SYSDATE,1,'','','','');

-- save changes
COMMIT;

INSERT INTO MY_EMPLOYEES VALUES(35, 'Axe', 'Smamle','test@test.com','',SYSDATE,1,'','','','');

-- add savepoint
SAVEPOINT p1;

-- delete changes 
DELETE FROM MY_EMPLOYEES WHERE EMPLOYEE_ID = 34;

ROLLBACK to p1;

COMMIT;

--3. 
SELECT * FROM HR.EMPLOYEES e
WHERE NOT EXISTS( SELECT * FROM HR.DEPARTMENTS d WHERE e.department_id = d.department_id ); 
-- Execution time: 0.005 seconds

SELECT * from hr.EMPLOYEES where department_id NOT IN(
    select department_id from hr.DEPARTMENTS
);
 --"No items to display" - NOT IN does not work correctly if there is NULL in the subquery.
-- for example :
--This NOT IN (10, 20, NULL, 30) makes the whole expression UNKNOWN → Oracle can't clearly tell which values ​​to discard → returns an empty result! 

--SOLUTION FOR NOT IN - delete NULL from subquery

SELECT * 
FROM hr.EMPLOYEES 
WHERE department_id IS NULL 
   OR department_id NOT IN (
       SELECT department_id 
       FROM hr.DEPARTMENTS
       WHERE department_id IS NOT NULL
   );


--4. 
SELECT * from hr.employees where salary > any (select salary from hr.EMPLOYEES where department_id = 10);

select * from hr.EMPLOYEES where salary > all(select salary from hr.employees where department_id = 20);

--5. 
-- insert new rows
INSERT INTO MY_EMPLOYEES VALUES(10, 'ALICE', 'KEYS','test@test.com','',SYSDATE,1,'','','','');
INSERT INTO MY_EMPLOYEES VALUES(11, 'Doley', 'Abby','test@test.com','',SYSDATE,1,'','','','');
INSERT INTO MY_EMPLOYEES VALUES(12, 'Anette', 'Smartley','test@test.com','',SYSDATE,1,'','','','');

-- add savepoint 1
SAVEPOINT p1;

-- update
UPDATE MY_EMPLOYEES
SET email = 'alice.keys@test.com'
WHERE employee_id = 10;

-- add savepoint 2
SAVEPOINT p2;

-- delete changes 
DELETE FROM MY_EMPLOYEES WHERE EMPLOYEE_ID = 10;

ROLLBACK TO p2;

COMMIT;