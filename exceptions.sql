--1.
DECLARE 
    v_a NUMBER :=10;
    v_b NUMBER :=10;
    v_result NUMBER;
BEGIN
v_result := v_a /v_b;

dbms_output.put_line('wynik: ' || v_result);

EXCEPTION 
when zero_divide then 
dbms_output.put_line('dzielnie przez zero');
when no_data_found then 
dbms_output.put_line('nie znaleziono zmiennych');
end;
/

--2. 
DECLARE
    v_emp_record hr.employees%ROWTYPE;
    v_emp_id NUMBER := 99;  
BEGIN
    SELECT first_name, last_name
    INTO v_emp_record.first_name, v_emp_record.last_name
    FROM hr.employees e
    WHERE e.employee_id = v_emp_id;

    dbms_output.put_line('Imię: ' || v_emp_record.first_name);
    dbms_output.put_line('Nazwisko: ' || v_emp_record.last_name);
EXCEPTION
    when no_data_found then 
dbms_output.put_line('nie znaleziono zmiennych');
END;
/