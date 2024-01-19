/*
Divya Dattatray Sakhare
18 Jan 2024
*/

-- Basic Data Exploration
--1. Count of countries
SELECT count(distinct country_name) as Total_number_of_countries
from international_debt


--2. Total Names of countries
SELECT distinct country_name as Countries
FROM international_debt

--3. Count of indicator_code
SELECT count(distinct indicator_code) as Total_number_indicators
from international_debt

--4. Total Names indicator_code
SELECT distinct indicator_code as Indicators
FROM international_debt

--5. Highest debt country
SELECT country_name, round(max(Debt_Amount),2) as Highest_Debt 
FROM
(SELECT country_name, round(sum(debt),2) as Debt_Amount
FROM international_debt
GROUP by country_code)

--6. Lowest debt country
SELECT country_name, round(min(Debt_Amount),2) as Highest_Debt 
FROM
(SELECT country_name, round(sum(debt),2) as Debt_Amount
FROM international_debt
GROUP by country_code)

--7. Top 10 Highest Debt countries
-- some databases also use Top function get first some records but sqlite doesnt use top function
SELECT country_name, round(sum(debt),2) as Debt_Amount
FROM international_debt
GROUP by country_code
ORDER by Debt_Amount DESC
LIMIT 10

--8. Indicator wise highest debt for every country_code
SELECT indicator_code,indicator_name,country_name, round(max(debt),2) as Debt
FROM international_debt
GROUP by indicator_code

--9.Most common indicator
select indicator_name, count(indicator_name) as count
from international_debt
group by indicator_code
ORDER by count desc

--10.Average debt of each country V/s avg debt of all countries
SELECT country_name, round(avg(debt),2) as Local_Avg_Debt,(select round(avg(debt),2) from international_debt) as Avg_debt
FROM international_debt
GROUP by country_name
ORDER by country_name asc

--11. find the debt for indicator =DT.INT.OFFT.CD and countries are india, china, fiji
SELECT country_name, round(debt,2) as debt
FROM international_debt
WHERE indicator_code='DT.INT.OFFT.CD' AND
country_name in ('India','China','Fiji')





















