--1. 
select first_name, last_name, salary, department_name from hr.EMPLOYEES join hr.DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

--2.
select region_name, country_name from hr.REGIONS join hr.COUNTRIES on regions.region_id = countries.region_id order by region_name;

--3. 
select city, department_name from hr.locations left join hr.DEPARTMENTS on locations.location_id = departments.location_id 
order by 
case
    WHEN department_name is null then 1
    else 0
    end,
    city;

--4. 
select first_name, last_name, department_name, city from hr.EMPLOYEES
join hr.departments on EMPLOYEES.DEPARTMENT_ID = departments.DEPARTMENT_ID
join hr.LOCATIONS on departments.location_id = locations.location_id
order by city;

--5.
select first_name, last_name, department_name, city, country_name from hr.EMPLOYEES
left join hr.departments on EMPLOYEES.DEPARTMENT_ID = departments.DEPARTMENT_ID
left join hr.LOCATIONS on departments.location_id = locations.location_id
left join hr.COUNTRIES on locations.country_id = countries.country_id
where employees.salary > 5000;

--6.
select department_name, avg(salary) as average_salary from hr.departments join hr.EMPLOYEES on departments.department_id = employees.department_id group by department_name;

--7.
select department_name, avg(salary/12) as average_salary from hr.departments join hr.EMPLOYEES on departments.department_id = employees.department_id group by department_name HAVING COUNT(EMPLOYEE_ID) > 1;

--8.
select city, COUNT(*) as employees from hr.LOCATIONS
join hr.DEPARTMENTS on locations.location_id = departments.location_id
join hr.EMPLOYEES on departments.department_id = employees.department_id
group by city HAVING COUNT(*) > 1;

--9.
select emp.first_name || ' ' ||emp.last_name AS employee,dept_emp.department_name as department_employee, manager.FIRST_NAME || ' ' ||manager.LAST_NAME as manager, dept_mgr.department_name as department_manager from hr.EMPLOYEES emp
LEFT JOIN hr.EMPLOYEES manager ON emp.MANAGER_ID = manager.EMPLOYEE_ID
LEFT JOIN hr.DEPARTMENTS dept_emp ON emp.DEPARTMENT_ID = dept_emp.department_id
LEFT JOIN hr.DEPARTMENTS dept_mgr ON manager.DEPARTMENT_ID = dept_mgr.department_id;