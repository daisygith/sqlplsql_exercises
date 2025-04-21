--1.
DECLARE 
    v_first_name VARCHAR2(50) := 'Alex';
    v_last_name VARCHAR2(50) := 'Denworal';
begin 
        dbms_output.put_line('Witaj, ' ||v_first_name || ' '|| v_last_name);
end;
/

--2. 
CREATE or replace PROCEDURE ex_2
AS
    v_c_text constant VARCHAR2(50) := 'aaa';
    v_number number := 0;
    v_text VARCHAR2(50);
begin
    dbms_output.put_line(v_c_text);
    dbms_output.put_line(v_number);
    dbms_output.put_line(nvl(v_text,'null'));
END;
/

-- EXECUTE ex_2;

--3.
DECLARE
    v_date DATE := TO_DATE('1410-07-15', 'YYYY-MM-DD');
    v_years NUMBER;
    v_months NUMBER;
    v_remaining_days NUMBER;
    v_end_date DATE;

begin 
    v_years := TRUNC(MONTHS_BETWEEN(sysdate,v_date)/12);
    v_months := trunc(mod(MONTHS_BETWEEN(sysdate,v_date),12));
    v_end_date := ADD_MONTHS(v_date, (v_years * 12) + v_months);
    v_remaining_days :=trunc(SYSDATE - v_end_date);

    dbms_output.put_line('dni' || ' '|| v_remaining_days);
    dbms_output.put_line('miesiecy'|| ' ' ||v_months);
    -- MOD(months_between, 12) 
    dbms_output.put_line('lat'|| ' ' ||v_years);
    end;
    /

--4. 
DECLARE
    v_height number := 1.72;
    v_weight number :=73;
    v_bmi number;
begin
     v_bmi := round((v_weight/power(v_height,2)),2);

     IF v_bmi >= 30 then 
        dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' musisz schudnąć' );
     elsif v_bmi >= 25 then
        dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' nadwaga' );
    elsif v_bmi >= 18.5 then
    dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' prawidłowa masa ciała' );
    else 
        dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' niedowaga' );
     end if;

end;
/