DATABASE HOSPITAL

1. Show first name, last name, and gender of patients whose gender is 'M'

SELECT first_name, last_name,gender FROM patients where gender = 'M';

2. Show first name and last name of patients who does not have allergies. (null)

select first_name, last_name from patients where allergies is null;

3. Show first name of patients that start with the letter 'C'

select first_name from patients where first_name LIKE 'C%';

4. Show first name and last name of patients that weight within the range of 100 to 120 (inclusive)

select first_name, last_name from patients where weight between 100 and 120;

5. Update the patients table for the allergies column. 
If the patients allergies is null then replace it with 'NKA'

update patients SET allergies = 'NKA' where allergies is null;

6. Show first name and last name concatinated into one column to show their full name

select concat(first_name,' ', last_name) as full_name from patients;

7. Show first name, last name, and the full province name of each patient.
Example: 'Ontario' instead of 'ON'

select first_name, last_name, province_name from patients join province_names on patients.province_id = province_names.province_id;

8. Show how many patients have a birth_date with 2010 as the birth year.

select count(*) as from patients where year(birth_date) = 2010;

9. Show the first_name, last_name, and height of the patient with the greatest height.

select first_name, last_name, max(height) from patients;

10. Show all columns for patients who have one of the following patient_ids:1,45,534,879,1000

select * from patients where patient_id IN(1,45,534,879,1000);

11. Show the total number of admissions

select count(*) from admissions;

12. Show all the columns from admissions where the patient was admitted and discharged on the same day.

select * from admissions where admission_date = discharge_date;

13. Show the patient id and the total number of admissions for patient_id 579.

select patient_id, count(admission_date) from admissions where patient_id = 579;

14. Based on the cities that our patients live in, show unique cities that are in province_id 'NS'.

select distinct(city) as unique_cities from patients where province_id = 'NS';

15. Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70

select first_name, last_name, birth_date from patients where height > 160 and weight > 70;

16. Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton'

select first_name, last_name, allergies from patients where allergies is not null and city = 'Hamilton';

17. Show unique birth years from patients and order them by ascending.

select distinct(year(birth_date)) as birth_year from patients order by birth_year asc;

18. Show unique first names from the patients table which only occurs once in the list.

For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output'.

select first_name from patients group by first_name having count(first_name) = 1;

19. Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

select patient_id, first_name from patients where first_name like 's%s' and len(first_name) >= 6;

20. Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

Primary diagnosis is stored in the admissions table.

select patients.patient_id, first_name, last_name from patients JOIn admissions On patients.patient_id = admissions.patient_id where admissions.diagnosis = 'Dementia' ;

SELECT
  patient_id,
  first_name,
  last_name
FROM patients
WHERE patient_id IN (
    SELECT patient_id
    FROM admissions
    WHERE diagnosis = 'Dementia'
  );
  
21. Display every patient's first_name.
Order the list by the length of each name and then by alphabetically.'

select first_name from patients order by len(first_name), first_name asc;

22. Show the total amount of male patients and the total amount of female patients in the patients table.
Display the two results in the same row.

select (SELECT count(*) from patients where gender='M') as male_count, (SELECT count(*) from patients where gender='F') as female_count;

23. Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name.

select first_name, last_name, allergies from patients where allergies in('Penicillin', 'Morphine') order by allergies asc, first_name ASC, last_name ASC;

24. Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis.

select patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*) >1;

25. 
Show the city and the total number of patients in the city.
Order from most to least patients and then by city name ascending.

select city, count(*) as total_patient from patients group by city order by total_patient DESC, city asc;

26. Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor"

select first_name, last_name, 'Patient' as role from patients 
union ALL 
select first_name, last_name,'Doctor' as role From doctors;

27. show all allergies ordered by popularity. Remove NULL values from query.

select allergies, count(*) total_diagnosis from patients where allergies IS NOT NULL group by allergies order by total_diagnosis desc ;

28. Show all patient's first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date.'

select first_name, last_name, birth_date from patients where year(birth_date) between 1970 and 1979 order by birth_date asc;

29. We want to display each patient's full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order
EX: SMITH,jane'

select concat(upper(last_name),',',lower(first_name)) as new_name_format from patients order by first_name desc;

30. Show the province_id(s), sum of height; where the total sum of its patient's height is greater than or equal to 7,000.'

select province_id, sum(height) as sum_height from patients group by province_id having sum_height > 7000;

31. Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni'

select (max(weight) - min(weight)) as weight_delta from patients where last_name = 'Maroni';

32. Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.

select day(admission_date) as day_number, count(admission_date) as number_of_admissions from admissions group by day_number order by number_of_admissions desc;

33. Show all columns for patient_id 542's most recent admission_date'.

select * from admissions where patient_id = 542 group by patient_id having max(admission_date);

34. Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria:
	1. patient_id is an odd number and attending_doctor_id is either 1, 5, or 19.
	2. attending_doctor_id contains a 2 and the length of patient_id is 3 characters.

select patient_id, attending_doctor_id, diagnosis from admissions where (patient_id%2 <> 0 AND attending_doctor_id in(1,5,19)) OR (attending_doctor_id like '%2%' and len(patient_id) = 3); 

35. Show first_name, last_name, and the total number of admissions attended for each doctor.

Every admission has been attended by a doctor.

select first_name, last_name, count(admissions.admission_date) as admissions_total from doctors join admissions on admissions.attending_doctor_id = doctors.doctor_id group by attending_doctor_id;

36. For each doctor, display their id, full name, and the first and last admission date they attended.

select 
	doctor_id, 
    concat(first_name,' ',last_name) as full_name, 
    min(admissions.admission_date) as first_admission_date,
    MAX(admissions.admission_date) AS last_admission_date
from doctors 
    join admissions on admissions.attending_doctor_id = doctors.doctor_id 
group by doctor_id;

37. Display the total amount of patients for each province. Order by descending.

select 
	province_names.province_name,
	count(*) as patient_count
from patients
    join province_names on patients.province_id = province_names.province_id
group by province_names.province_name
order by patient_count DESC;

38. For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.

SELECT 
	concat(patients.first_name, ' ',patients.last_name) as patient_name, 
    diagnosis,
    concat(doctors.first_name, ' ',doctors.last_name) as doctor_name
FROM patients
    JOIN admissions ON patients.patient_id = admissions.patient_id
    JOIN doctors ON admissions.attending_doctor_id = doctors.doctor_id;
	
39. display the first name, last name and number of duplicate patients based on their first name and last name.

Ex: A patient with an identical name can be considered a duplicate.

SELECT 
	first_name, last_name,
    count(*) as num_off_duplicates
from patients
	group by first_name, last_name
    having count(*)>1;
	
40. Display patient's full name, height in the units feet rounded to 1 decimal, weight in the unit pounds rounded to 0 decimals,
birth_date, gender non abbreviated.

Convert CM to feet by dividing by 30.48.
Convert KG to pounds by multiplying by 2.205'.

SELECT 
	concat(first_name, ' ',last_name),
    round(height/30.48,1) as height,
    round(weight*2.205,0) as weight, birth_date,
    CASE 
    	when gender = 'M' then 'MALE'
        ELSE 'FEMALE'
    END AS gender_type
from patients;
    
	
	
41. Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)

SELECT 
	patient_id,
    first_name,
    last_name
from patients 
    where patients.patient_id not IN
    (select admissions.patient_id from admissions);
	
42. Display a single row with max_visits, min_visits, average_visits where the maximum, minimum and average number of admissions per day is calculated. Average is rounded to 2 decimal places.

SELECT 
	max(number_of_visits) as max_visits,
    min(number_of_visits) as min_visits,
    round(avg(number_of_visits),2) as avearage_visits
from ( 
   Select admission_date, count(*) as number_of_visits
   From admissions
   Group by admission_date
   );
   
43. Show all of the patients grouped into weight groups.
Show the total amount of patients in each weight group.
Order the list by the weight group decending.

For example, if they weight 100 to 109 they are placed in the 100 weight group, 110-119 = 110 weight group, etc.

select count(*) as patients_in_ggroup, 10*floor(weight/10) as weight_group
from patients 
group by weight_group
order by weight_group DESC;

44. Show patient_id, weight, height, isObese from the patients table.

Display isObese as a boolean 0 or 1.

Obese is defined as weight(kg)/(height(m)2) >= 30.

weight is in units kg.

height is in units cm.


select patient_id, weight, height, 
	case
    	when weight/(power(height/100.0,2)) >= 30 then 1
        else 0
        end as isObese
FROM patients;

45. Show patient_id, first_name, last_name, and attending doctor's specialty.
Show only the patients who has a diagnosis as 'Epilepsy' and the doctor's first name is 'Lisa'

Check patients, admissions, and doctors tables for required information.

select patients.patient_id, patients.first_name, patients.last_name, doctors.specialty
from patients join admissions on patients.patient_id = admissions.patient_id
join doctors on admissions.attending_doctor_id = doctors.doctor_id
where admissions.diagnosis = 'Epilepsy' and doctors.first_name = 'Lisa';

46. All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password.

The password must be the following, in order:
1. patient_id
2. the numerical length of patient's last_name
3. year of patient's birth_date

select distinct admissions.patient_id, concat(admissions.patient_id, len(patients.last_name),year(birth_date)) as temp_password from admissions join patients on admissions.patient_id = patients.patient_id;

47. Each admission costs $50 for patients without insurance, and $10 for patients with insurance. All patients with an even patient_id have insurance.

Give each patient a 'Yes' if they have insurance, and a 'No' if they don't have insurance.' Add up the admission_total cost for each has_insurance group.

select 
case 
	when patient_id %2 = 0 then 'YES'
    ELSE 'NO'
    END AS has_insurance,
SUM(case 
	when patient_id %2 = 0  then 10
    else 50
    end) as cost_after_insurance
from admissions
group by has_insurance;

48. 
Show the provinces that has more patients identified as 'M' than 'F'. Must only show full province_name

select province_names.province_name from province_names join patients on province_names.province_id = patients.province_id 
group by province_names.province_name
having count(
  case when gender = 'M' then 1 end) > count(
    case when gender = 'F' then 1 end);
	
49. We are looking for a specific patient. Pull all columns for the patient who matches the following criteria:
- First_name contains an 'r' after the first two letters.
- Identifies their gender as 'F'
- Born in February, May, or December
- Their weight would be between 60kg and 80kg
- Their patient_id is an odd number
- They are from the city 'Kingston'

select * from patients where 
first_name like '__r%' and 
month(birth_date) in (2, 5, 12) and
weight between 60 and 80 and
patient_id%2 <> 0 and
city = 'Kingston';

50. Show the percent of patients that have 'M' as their gender. Round the answer to the nearest hundreth number and in percent form.

select concat(round(count(
  case when gender = 'M' then 1 end) * 100.00 / count(*),2),'%')
  from patients;
  
51. For each day display the total amount of admissions on that day. Display the amount changed from the previous date.

select admission_date, count(admission_date) as admission_day,
count(admission_date) - LAG (count(admission_date)) 
OVER (ORDER BY admission_date) AS admission_count_change 
from admissions group by admission_date;

52. Sort the province names in ascending order in such a way that the province 'Ontario' is always on top.

select province_name from province_names 
order by 
(case 
	when province_name = 'Ontario' then 1
	else 2
    end),
    province_name ASC;
	
53. We need a breakdown for the total amount of admissions each doctor has started each year. Show the doctor_id, doctor_full_name, specialty, year, total_admissions for that year.

select d.doctor_id, concat(d.first_name,' ',d.last_name) as doctor_full_name, d.specialty, YEAR(a.admission_date) AS selected_year, count(a.admission_date) as total_admissions
FROM doctors as d 
INNER JOIN admissions as a ON d.doctor_id=a.attending_doctor_id 
group by d.doctor_id, YEAR(a.admission_date) 
order by doctor_id, selected_year;


Database NORTHWIND

54. Show the category_name and description from the categories table sorted by category_name.

select category_name, description from categories;

55. Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'

select contact_name, address, city from customers where country not in ('Germany', 'Mexico', 'Spain');

56. Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26

select order_date, shipped_date, customer_id, freight from orders where order_date = '2018-02-26';

57. Show the employee_id, order_id, customer_id, required_date, shipped_date from all orders shipped later than the required date

select employee_id, order_id, customer_id, required_date, shipped_date from orders where shipped_date > required_date


58. Show all the even numbered Order_id from the orders table

select order_id from orders where order_id%2=0;

59. Show the city, company_name, contact_name of all customers from cities which contains the letter 'L' in the city name, sorted by contact_name

select city, company_name, contact_name from customers where city like '%l%' order by contact_name;

60. Show the company_name, contact_name, fax number of all customers that has a fax number. (not null)

select company_name, contact_name, fax from customers where fax is not null;

61. Show the first_name, last_name. hire_date of the most recently hired employee.

select first_name, last_name, max(hire_date) from employees;

62. Show the average unit price rounded to 2 decimal places, the total units in stock, total discontinued products from the products table.

select round(avg(unit_price),2) as average_price, sum(units_in_stock) as total_stock, sum(discontinued) as total_discontinued from products

63. Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table

select p.product_name, s.company_name, cat.category_name from categories cat 
join products p on cat.category_id = p.category_id
join suppliers s on p.supplier_id = s.supplier_id

64. Show the category_name and the average product unit price for each category rounded to 2 decimal places.

select cat.category_name, round(avg(p.unit_price),2) from categories cat 
join products p on cat.category_id = p.category_id
group by cat.category_name

65. Show the city, company_name, contact_name from the customers and suppliers table merged together.
Create a column which contains 'customers' or 'suppliers' depending on the table it came from.

select City, company_name, contact_name, 'customers' as relationship 
from customers
union
select city, company_name, contact_name, 'suppliers'
from suppliers

66. Show the total amount of orders for each year/month.

select year(order_date) as order_year, month(order_date) as order_month, count(order_id) as no_of_orders from orders
group by order_year,order_month

67. Show the employee's first_name and last_name, a "num_orders" column with a count of the orders taken, and a column called "Shipped" that displays "On Time" if the order shipped_date is less or equal to the required_date, "Late" if the order shipped late, "Not Shipped" if shipped_date is null.

Order by employee last_name, then by first_name, and then descending by number of orders.'

select e.first_name, e.last_name, count(o.order_id) as num_orders, 
(
  case 
  	when o.shipped_date <= o.required_date then 'On Time'
 	when o.shipped_date > o.required_date then 'Late'
  	else 'Not Shipped'
  END) as shipped 
  FROM employees e JOIN orders o 
  On e.employee_id = o.employee_id 
  group by e.first_name, e.last_name, shipped
  order by e.last_name, e.first_name, num_orders DESC;
  
 68. Show how much money the company lost due to giving discounts each year, order the years from most recent to least recent. Round to 2 decimal places
 
select 
YEAR(o.order_date) as order_year,
round(sum(p.unit_price * od.quantity * od.discount),2) as discount_amount
from orders o 
join order_details od on o.order_id = od.order_id
join products p on od.product_id = p.product_id
group by YEAR(o.order_date)
order by order_year desc;
