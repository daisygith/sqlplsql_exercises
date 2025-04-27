--1.
CREATE OR REPLACE PROCEDURE add_rows(
    p_region_id NUMBER,
    p_region_name VARCHAR2
) AS
    v_region_count NUMBER;
    -- v_region_name VARCHAR(50);
BEGIN 
    select count(*) INTO v_region_count FROM MY_REGIONS where REGION_ID = p_region_id;

    if v_region_count > 0 then 
        dbms_output.put_line('ten region istnieje');
     end if;

     insert into MY_REGIONS(REGION_ID, REGION_NAME) values (p_region_id, p_region_name);

     commit;
END;

EXECUTE add_rows(99, 'test');

select * from MY_REGIONS;

--2.
create or replace function avg_salary 
RETURN NUMBER
IS
    v_avg_salary NUMBER;
BEGIN 
    select avg(salary) INTO v_avg_salary from MY_EMPLOYEES;
    return v_avg_salary;
END;
/

select avg_salary from dual;

--3.
select * from MY_EMPLOYEES;

create or replace function count_employees(
    count_dept_id NUMBER
)
RETURN NUMBER
IS
    v_count_employees NUMBER;
BEGIN 
    select count(*) INTO v_count_employees from MY_EMPLOYEES 
    where DEPARTMENT_ID = count_dept_id;
    return v_count_employees;
END;
/

select count_employees(50) from dual;

--4.
create SEQUENCE increment_regions
MINVALUE 1
MAXVALUE 999
START with 1
INCREMENT by 1
NOCACHE;
/

create or replace procedure new_region(
    p_region_name VARCHAR2
)AS
    v_region_name_count NUMBER;
BEGIN
    select count(*) into v_region_name_count from MY_REGIONS where region_name = p_region_name;

    if v_region_name_count > 0 then 
        raise_application_error(-1, 'Exist this region' || ' '|| p_region_name);
    end if;

    INSERT into MY_REGIONS values(increment_regions.NEXTVAL, p_region_name);

    COMMIT;
END;
/

-- EXECUTE NEW_REGION('Oceania');

--5.
create or replace procedure diff_salary (
    p_avg_salary OUT NUMBER,
    p_max_salary OUT NUMBER,
    p_min_salary OUT NUMBER
) AS
BEGIN 
    select avg(salary), max(salary), min(salary) into p_avg_salary, p_max_salary, p_min_salary from MY_EMPLOYEES;
END;
/

DECLARE
    v_avg_salary NUMBER;
    v_max_salary NUMBER;
    v_min_salary NUMBER;
BEGIN
    DIFF_SALARY(v_avg_salary, v_max_salary, v_min_salary);
    dbms_output.put_line('sr wynagrodzenie: ' || v_avg_salary);
    dbms_output.put_line('max wynagrodzenie: ' || v_max_salary);
    dbms_output.put_line('min wynagrodzenie: ' || v_min_salary);
END;
/

--6.
create or replace FUNCTION check_empployee(
    f_employee_id NUMBER
) return my_employees%rowtype
IS
v_employee my_employees%rowtype;
BEGIN 
    select * into v_employee from my_employees where employee_id = f_employee_id;
    return v_employee;
END;
/

DECLARE
v_employee my_employees%rowtype;
begin
    v_employee := CHECK_EMPPLOYEE(108);

    DBMS_OUTPUT.PUT_LINE('Imię: ' || v_employee.first_name);
    DBMS_OUTPUT.PUT_LINE('Nazwisko: ' || v_employee.last_name);
    DBMS_OUTPUT.PUT_LINE('Zarobki: ' || v_employee.salary);

end;
/


-- select * from MY_REGIONS;

-- INSERT INTO my_employees
-- SELECT * FROM hr.EMPLOYEES;