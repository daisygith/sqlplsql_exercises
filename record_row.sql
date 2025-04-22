--1.
DECLARE
 v_emp_id NUMBER := 105;
 v_emp_row hr.employees%ROWTYPE;

BEGIN
    select * INTO v_emp_row FROM hr.EMPLOYEES where employee_id = v_emp_id; 
    -- dbms_output.put_line(v_emp_row.first_name);
    EXCEPTION 
        when NO_DATA_FOUND THEN
        dbms_output.put_line('brak danych');
END;
/

--2.
DECLARE
    v_emp_record hr.employees%ROWTYPE;
    v_department_name VARCHAR2(100);
    v_emp_id NUMBER := 100;  
BEGIN
    SELECT first_name, last_name, department_name
    INTO v_emp_record.first_name, v_emp_record.last_name, v_department_name
    FROM hr.employees e
    JOIN hr.departments d ON e.department_id = d.department_id
    WHERE e.employee_id = v_emp_id;

    dbms_output.put_line('Imię: ' || v_emp_record.first_name);
    dbms_output.put_line('Nazwisko: ' || v_emp_record.last_name);
    dbms_output.put_line('Departament: ' || v_department_name);
END;
/

--3.
DECLARE
TYPE t_salary_info IS RECORD (
    avg_salary NUMBER,
    count_employees NUMBER,
    max_salary NUMBER
);
    v_salary t_salary_info;

BEGIN
    SELECT AVG(salary), COUNT(employee_id), MAX(salary)
    INTO v_salary.avg_salary, v_salary.count_employees, v_salary.max_salary
    from hr.employees;

        dbms_output.put_line('Średnia zarobków: ' || v_salary.avg_salary);
    dbms_output.put_line('Liczba pracowników: ' || v_salary.count_employees);
    dbms_output.put_line('Najwyższe zarobki: ' || v_salary.max_salary);
END;
/

--4.
DECLARE 
    v_emp_record NUMBER;
    v_employee NUMBER := 105;
BEGIN
    select count(*) INTO v_emp_record from hr.employees where manager_id = v_employee;

    IF v_emp_record > 0 then
        dbms_output.put_line('pracownik o id: ' || v_employee || ' '|| 'jest menadżerem');
    else 
    dbms_output.put_line('pracownik o id: ' || v_employee || ' '|| 'nie jest menadżerem');
    end if;
END;
/

--5. 
DECLARE
    TYPE t_regions_info IS RECORD (
    t_region_id NUMBER,
    t_region_name VARCHAR2(100)
);
 v_region t_regions_info;
 v_type_region hr.regions%ROWTYPE;
BEGIN
    select * into v_type_region from hr.regions where REGION_ID = 20;
    v_region := v_type_region;
    dbms_output.put_line(v_region.t_region_id);
    dbms_output.put_line(v_region.t_region_name);
END;
/
-- select * from hr.employees;
select * from hr.regions;