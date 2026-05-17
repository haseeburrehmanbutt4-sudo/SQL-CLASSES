-- CREATE DATABASE Database_Name --

 create database BikeStores;

 -- TOPIC #01 SELECTION --

 select * from sales.customers;

 select * from production.products; 

select product_id,product_name from production.products; 

select first_name, last_name from sales.customers; 

-- TOPIC #02 USE OF WHERE --

select * from sales.customers
where customer_id =94;

-- is ma both Column and Row Base filtration use ki ha --
select first_name,last_name from sales.customers
where customer_id =94;

-- Order Of Execution of this querry --
select * from sales.customers;
-- From than Select --

 select * from sales.customers
 where city = 'New York';

 select * from sales.customers
 where state = 'NY';

 -- TOPIC #03 ORDER BY AND SYNTAX --

 -- How To Write It?
 /*
 select
     select_list
From 
     table_name
Order By
     Column_name | Expression [ASC|DESC]
*/

select 
     first_name,last_name from sales.customers
order by first_name;

select 
     first_name,last_name from sales.customers
order by state;

-- Sort Result By Multiple Columns --

select city,first_name,last_name from sales.customers
order by city, first_name;

-- aur agar ak ko ASC aur dosre ko DESC ma karna ho to kasa kare gae --

select city,first_name,last_name from sales.customers
order by city ASC, first_name DESC;

select * from production.products
order by model_year Asc, list_price Desc;

-- database diagram me ORDER DATE pe Order By lagana ha --

select * from sales.orders
order by order_date Asc;

select * from sales.orders
order by order_date Desc;

-- is sa hame pata ye chal raha ha ke 
-- sab sa latest order date kon si ha aur kis year ki ha

-- ORDER BY mujhe state pe karna ha to kasa kare gae --

select * from sales.customers;
select city, first_name, last_name from sales.customers
order by state;
-- is ma hum ne ye nahi batya ke ASC ma chahiye ya DESC ma --
-- to jab hum nahi bata te to wo By Default "Asc" ma ho jata ha --
-- run ho gaya but state nahi aya --

select state, city, first_name, last_name from sales.customers
order by state;
-- state wise ordy by agya ha --

-- Agar is ma hum WHERE ki condition ko use kare to kia ho ga --

select state, city, first_name, last_name from sales.customers
where state = 'NY'
order by city;

-- TOPIC #04 LIMITING ROWS,TOP N,TOP PERCENTAGE --

-- top limit lagata ha ke suppose mare pass 100 rows han
-- iun me sa mujhe top 10 rows chahiye, waha pe ma TOP ki 
-- condition use karu ga

select * from production.products;

select top 10 * from production.products
order by list_price Asc;

select top 10 * from production.products
order by list_price Desc;

-- TOP PERCENTAGE --
-- total rows 321 ius ka 1% 3.21
-- sql ne ius ka round-off upto 4 kia, kuy ke
-- 3 ke baad ki adi value to nahi likh sakte is liye 
-- sql ne ius ko round-off upto 4 kia ha 

select * from production.products;

select top 1 percent * from production.products
order by list_price Desc;

-- TOPIC #05 OFFSET AND FETCH --

-- use in pagination --
-- offset starting rows ko skip karta ha
-- fetch take the NEXT N numbers of rows leta ha
-- ye condition ORDER BY ka saath hi lage gi ius ke bagar nahi lag sakti --

select * from production.products
order by list_price Desc
offset 5 rows;

select * from production.products
order by list_price Desc
offset 2 rows
fetch next 5 rows only;

select * from production.products
order by list_price Desc
offset 0 rows
fetch next 5 rows only;

-- TOPIC #6 DISTINCT --
-- Querry will return unique values --
-- koi ak jasi chiz repeat na ho distinct use kare ga --

/*
syntax
select DISTINCT Column_Name 
From Table_Name
*/

select city from sales.customers
order by city; 
-- is ma cities repeat ho rahi han total city 1445 --

select distinct city from sales.customers
order by city; 
-- distinct use kia to ius ne sari cities --
-- jo repeat ho rahi thi iun ko ak bar likh dia --
-- is ma total city 195 --

select distinct state from sales.customers
order by state; 

select distinct model_year from production.products;

select distinct city,state from sales.customers;

select distinct state,city from sales.customers;

-- distinct ma jitne bhi col likh rahe ho gae iun ka 
-- combination unique hona chaiye aur agar ak ha to ak hi
-- value unique ho gi col ma aur agar ak sa zaida col ha 
-- to iun ka combination unique hona chahiye --

select distinct phone from sales.customers
order by phone;

select distinct phone from sales.customers
where phone is not null
order by phone;

-- TOPIC #07 LOGICAL OPERATORS --
-- AND | OR

-- Agar dono condition True han to AND true ho ga
-- aur agar Ak bhi False hui to AND bhi False ho jaye ga 
-- Dono False han to And Bhi False ho ga

-- Agar ak condition True ha aur dusri False ha to OR kia da ga True
-- Agar dono condition True han tab bhi OR kia de ga True de ga
-- False kab return karta ha jab dono False hu

select * from production.products
where category_id = 1 and list_price > 400
order by list_price Desc;

-- is querry ma condition 1 category id 1 bhi puri ho rahi ha aur
-- condition 2 list price 400 sa greater bhi ha to ye condition
-- bhi puri ho rahi ha to AND true ha

select * from production.products
where category_id = 1 OR list_price > 400
order by list_price Desc;

select * from production.products
order by category_id;

select * from production.products
where list_price > 300 And model_year = 2018
order by list_price Desc;

-- querry list price > 1000 | brand id 1,2

select * from production.products
where list_price > 1000 And (brand_id = 1 Or brand_id = 2)
order by list_price Desc;

select * from production.products
where list_price > 1000 And brand_id = 1
order by list_price Desc;