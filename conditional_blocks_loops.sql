--1.
DECLARE
    i NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
/

--2.
DECLARE
    pow NUMBER :=0;
    result_p NUMBER :=0;
BEGIN
    FOR pow IN 2..32 LOOP
        result_p := power(2,pow);
        dbms_output.put_line('pow:' || ' ' || pow || '=' || result_p);
    END LOOP;
END;
    /

--3.
DECLARE
    i NUMBER := 0;
BEGIN
    FOR i IN -100..100 LOOP
        IF MOD(i,2) = 0 then 
            dbms_output.put_line(i || 'jest parzysta');
        ELSE
            dbms_output.put_line(i || 'jest nieparzysta');
        END IF;
    END LOOP;

END;
/

--4. 
DECLARE
    v_height number := 1.72;
    v_weight number :=73;
    v_bmi number;
begin
     v_bmi := round((v_weight/power(v_height,2)),2);

    CASE
        WHEN v_bmi < 16 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' wygłodzenie' );
        WHEN v_bmi <= 16.99 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' wychudzenie' );
        WHEN v_bmi <=18.49 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' niedowaga' );
        WHEN v_bmi <=24.99 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' wartość prawidłowa' );
        WHEN v_bmi <=29.99 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' nadwaga' );
        WHEN v_bmi <=34.99 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' I stopień otyłości' );
        WHEN v_bmi <=39.99 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' II stopień otyłości' );
        WHEN v_bmi >=40 then dbms_output.put_line('twoje bmi: '|| ' ' || v_bmi || ' '|| ' III stopień otyłości' );
    else
        dbms_output.put_line('coś poszło nie tak' );
    end case;
end;
/