--1.
-- DECLARE
--     v_emp_record hr.employees%ROWTYPE;
--     v_department_name VARCHAR2(100);

-- CURSOR c_employees IS
-- SELECT e.first_name, e.last_name, e.salary, d.department_name from hr.employees e 
-- JOIN hr.DEPARTMENTS d on e.department_id = d.DEPARTMENT_ID
-- order by e.EMPLOYEE_ID;

-- BEGIN
--       DBMS_OUTPUT.PUT_LINE('ID | NAME | SALARY | DEPARTMENT NAME');
--     DBMS_OUTPUT.PUT_LINE('--------------------------------------');
--     OPEN c_employees;

-- LOOP
--     FETCH c_employees INTO v_emp_record.first_name, v_emp_record.last_name, v_emp_record.salary, v_department_name;
--     EXIT WHEN c_employees%NOTFOUND;
--      DBMS_OUTPUT.PUT_LINE(v_emp_record.first_name || ' | ' || v_emp_record.last_name || ' | ' || v_emp_record.salary || ' | ' || v_department_name);
--          END LOOP;

--     -- Zamknięcie kursora
--     CLOSE c_employees;
-- END;
-- /

--2.
DECLARE
    v_emp_record hr.employees%ROWTYPE;
    v_department_name VARCHAR2(100);
    v_department_id hr.DEPARTMENTS.department_id%type;

CURSOR c_employees IS
SELECT e.first_name, e.last_name, e.salary, d.department_name from hr.employees e 
JOIN hr.DEPARTMENTS d on e.department_id = d.DEPARTMENT_ID
where d.DEPARTMENT_ID = v_department_id;

BEGIN
    v_department_id := 20;
      DBMS_OUTPUT.PUT_LINE('ID | NAME | SALARY | DEPARTMENT NAME');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    OPEN c_employees;

LOOP
    FETCH c_employees INTO v_emp_record.first_name, v_emp_record.last_name, v_emp_record.salary, v_department_name;
    EXIT WHEN c_employees%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(v_emp_record.first_name || ' | ' || v_emp_record.last_name || ' | ' || v_emp_record.salary || ' | ' || v_department_name);
         END LOOP;

    -- Zamknięcie kursora
    CLOSE c_employees;
END;
/

--3.
DECLARE
    v_emp_record hr.employees%ROWTYPE;

CURSOR c_employees (p_manager_id NUMBER) IS
SELECT e.first_name, e.last_name from hr.employees e 
where e.MANAGER_ID = p_manager_id;

BEGIN
    DBMS_OUTPUT.PUT_LINE('ID | NAME');
    DBMS_OUTPUT.PUT_LINE('---------------');
    OPEN c_employees(101);

LOOP
    FETCH c_employees INTO v_emp_record.first_name, v_emp_record.last_name;
    EXIT WHEN c_employees%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(v_emp_record.first_name || ' | ' || v_emp_record.last_name);
         END LOOP;

    -- Zamknięcie kursora
    CLOSE c_employees;
END;
/