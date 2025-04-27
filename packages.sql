--1. 
CREATE or replace package hrmanager IS
FUNCTION isMaxSalary return NUMBER;
PROCEDURE avg_salary(dept_id in NUMBER);
PROCEDURE avg_salary_manager(dept_id in NUMBER, manag_id IN NUMBER);
PROCEDURE avg_salary_name(dept_name in VARCHAR2, manag_name IN VARCHAR2);
    TYPE t_person IS RECORD (
        first_name VARCHAR2(100),
        last_name  VARCHAR2(100)
    );

    PROCEDURE say_hello(p_person IN t_person);
END hrmanager;
/
CREATE OR REPLACE package BODY hrmanager IS

FUNCTION isMaxSalary RETURN NUMBER IS
v_salary_max NUMBER;
BEGIN
    select max(salary) into v_salary_max from my_employees;
    return v_salary_max;
end isMaxSalary;

PROCEDURE avg_salary(dept_id IN NUMBER) IS
v_avg_salary NUMBER;
BEGIN 
    select avg(salary) into v_avg_salary from my_employees where department_id = dept_id;
    dbms_output.put_line('srednia zarobków w dziale '|| dept_id|| ' = ' || v_avg_salary );
END avg_salary;

PROCEDURE avg_salary_manager(dept_id IN NUMBER, manag_id IN NUMBER) IS
v_avg_Salary_manager NUMBER;
BEGIN
    select avg(salary) into v_avg_Salary_manager from MY_EMPLOYEES where DEPARTMENT_ID = dept_id and MANAGER_ID = manag_id;
    dbms_output.put_line('srednia zarobków w dziale '|| dept_id|| ' = ' || v_avg_Salary_manager );
END avg_salary_manager;

PROCEDURE avg_salary_name(dept_name in VARCHAR2, manag_name IN VARCHAR2) IS
v_avg_Salary_manager NUMBER;
BEGIN
    select avg(e.salary) into v_avg_Salary_manager from MY_EMPLOYEES e join my_departments md on e.department_id = md.department_id
    JOIN my_employees m ON e.manager_id = m.employee_id
    where md.department_name  = dept_name and m.last_name = manag_name;

    dbms_output.put_line('srednia zarobków w dziale '|| dept_name|| ' = ' || v_avg_Salary_manager );

IF v_avg_Salary_manager IS NULL THEN
    dbms_output.put_line('Brak danych dla podanych kryteriów.');
ELSE
    dbms_output.put_line('srednia zarobków w dziale '|| dept_name || ' = ' || v_avg_Salary_manager );
END IF;
END avg_salary_name;

PROCEDURE say_hello(p_person IN t_person) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Cześć, ' || p_person.first_name || ' ' || p_person.last_name || '!');
    END say_hello;

    
END hrmanager;
/

-- INSERT INTO table2
-- SELECT * FROM table1;

-- select * from MY_DEPARTMENTS;

BEGIN
    hrmanager.avg_salary(30);
END;
/

BEGIN
    hrmanager.avg_salary_manager(50, 101);
END;
/

BEGIN
    hrmanager.avg_salary_name('IT', 'King');
END;
/

DECLARE
    v_max_salary NUMBER;
BEGIN
    v_max_salary := hrmanager.isMaxSalary;
    DBMS_OUTPUT.PUT_LINE('Największe wynagrodzenie: ' || v_max_salary);
END;
/

DECLARE
    osoba hrmanager.t_person;
BEGIN
    osoba.first_name := 'Anna';
    osoba.last_name := 'Kowalska';

    hrmanager.say_hello(osoba);
END;
/