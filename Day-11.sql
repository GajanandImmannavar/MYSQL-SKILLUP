-- use Day11;

-- select * from Product;

-- 🏢 Business Scenario

-- The warehouse manager wants to know the total stock available in each category.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- Total stock in each category.

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Sort the results by:

-- TOTAL_STOCK in descending order.
-- If two categories have the same stock, sort by CATEGORY in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ SUM()
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC

-- select Category, sum(Stock) as Total_Stock
-- from Product
-- group by Category
-- order by Total_Stock desc, Category asc;

-- 🏢 Business Scenario

-- The inventory manager wants to know how many products are available in each category.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- Number of AVAILABLE products in each category.

-- Display the count with the alias:

-- AVAILABLE_PRODUCTS

-- Sort the results by:

-- CATEGORY in ascending order.
-- 📚 Topics Covered
-- ✅ WHERE
-- ✅ GROUP BY
-- ✅ COUNT(*)
-- ✅ ORDER BY
-- ✅ ASC


-- select Category, count(*) as Available_Products
-- from Product
-- where Product_status = "Available"
-- group by Category 
-- order by Category asc;

-- Execution Order

-- FROM
--  ↓
-- WHERE
--  ↓
-- GROUP BY
--  ↓
-- COUNT()
--  ↓
-- SELECT
--  ↓
-- ORDER BY


-- 🏢 Business Scenario

-- The purchasing manager wants to know how many products each supplier city provides.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- SUPPLIER_CITY
-- Number of products supplied by each city.

-- Display the count with alias:

-- TOTAL_PRODUCTS

-- Sort the result by:

-- TOTAL_PRODUCTS in descending order.
-- If two cities have the same number of products, sort by SUPPLIER_CITY in ascending order.
-- 📚 Topics Covered

-- ✅ GROUP BY

-- ✅ COUNT(*)

-- ✅ ORDER BY

-- ✅ DESC

-- ✅ ASC

-- 🏢 Business Scenario

-- The purchasing manager wants to know how many products each supplier city provides.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- SUPPLIER_CITY
-- Number of products supplied by each city.

-- Display the count with alias:

-- TOTAL_PRODUCTS

-- Sort the result by:

-- TOTAL_PRODUCTS in descending order.
-- If two cities have the same number of products, sort by SUPPLIER_CITY in ascending order.
-- 📚 Topics Covered

-- ✅ GROUP BY

-- ✅ COUNT(*)

-- ✅ ORDER BY

-- ✅ DESC

-- ✅ ASC

-- select Supplier_city ,  count(*) as Total_Product 
-- from  Product 
-- group by SUPPLIER_CITY
-- order by Total_Product desc, Supplier_City asc;


-- 🏢 Business Scenario

-- The quality assurance team wants to know how many products have each rating.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- RATING
-- Number of products having each rating.

-- Display the count with alias:

-- TOTAL_PRODUCTS

-- Sort the result by:

-- RATING in descending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ COUNT(*)
-- ✅ ORDER BY
-- ✅ DESC

-- select Rating , count(*) as Total_Product
-- from Product 
-- group by Rating
-- order by RATING desc;

-- 🏢 Business Scenario

-- The inventory manager wants to know the total stock available in each supplier city.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- SUPPLIER_CITY
-- Total stock supplied by each city.

-- Display the total stock with alias:

-- TOTAL_STOCK

-- Sort the result by:

-- TOTAL_STOCK in descending order.
-- If two cities have the same stock, sort by SUPPLIER_CITY in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ SUM()
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC


-- select SUPPLIER_CITY, sum(Stock) as Total_Stock 
-- from Product 
-- group by  SUPPLIER_CITY
-- order by Total_STOCK desc, SUPPLIER_CITY asc;


-- ⭐ Think Like SQL

-- Whenever you see:

-- ORDER BY A DESC,
--          B ASC

-- SQL always thinks:

-- Step 1

-- Sort by A.

-- ↓

-- Any ties?

-- ↓

-- Yes

-- ↓

-- Sort those tied rows by B.

-- ↓

-- Done.

-- It does not sort both columns together at the same time.

-- It always follows the order you wrote.

-- 📌 Rule to Remember Forever
-- GROUP BY
-- ↓
-- Creates groups

-- SUM(), COUNT(), AVG(), MAX(), MIN()
-- ↓
-- Calculates one value for each group

-- ORDER BY First Column
-- ↓
-- Sorts all groups

-- If two groups have the same first value
-- ↓
-- ORDER BY Second Column
-- ↓
-- Breaks the tie

-- If still tied
-- ↓
-- Third ORDER BY column (if any)


-- 🏢 Business Scenario

-- The sales manager wants to know how many AVAILABLE products each brand has.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- BRAND
-- Number of AVAILABLE products.

-- Display the count with the alias:

-- AVAILABLE_PRODUCTS

-- Sort the result by:

-- AVAILABLE_PRODUCTS in descending order.
-- If two brands have the same number of available products, sort by BRAND in ascending order.

-- select BRAND , count(*) as AVAILABLE_PRODUCTS 
-- from Product 
-- where PRODUCT_STATUS = "AVAILABLE"
-- group by BRAND 
-- order by AVAILABLE_PRODUCTS desc , BRAND asc;


-- SELECT BRAND, COUNT(*) AS AVAILABLE_PRODUCTS
-- FROM Product
-- WHERE PRODUCT_STATUS = 'AVAILABLE'
-- GROUP BY BRAND
-- ORDER BY AVAILABLE_PRODUCTS DESC, BRAND ASC;
-- ✔️ Result

-- 100% Correct ✅

-- This is exactly how an experienced SQL developer would write it.

-- ✅ SQL Execution Trace
-- Step 1

-- SQL reads the

-- Your answer:

-- Product

-- ✅ Correct

-- Step 2

-- WHERE keeps only

-- Your answer:

-- AVAILABLE

-- ✅ Better answer:

-- PRODUCT_STATUS = 'AVAILABLE'
-- Step 3

-- GROUP BY creates groups based on

-- Your answer:

-- BRAND

-- ✅ Correct

-- Step 4

-- COUNT(*) calculates

-- Your answer:

-- No of BRANDS uniquely if 2 brand same sql show once and count as 2

-- ⚠️ Small correction.

-- This is the biggest misunderstanding beginners have.

-- Let's take an example.

-- BRAND	PRODUCT
-- Apple	iPhone
-- Apple	Watch
-- Samsung	TV
-- Samsung	Phone
-- Samsung	Tablet

-- After

-- GROUP BY BRAND

-- SQL creates

-- Apple Group

-- iPhone
-- Watch
-- Samsung Group

-- TV
-- Phone
-- Tablet

-- Then

-- COUNT(*)

-- counts rows inside each group.

-- Output

-- BRAND	AVAILABLE_PRODUCTS
-- Apple	2
-- Samsung	3

-- It is not counting unique brands.

-- It is counting how many rows belong to each brand.

-- Remember this sentence:

-- GROUP BY creates groups. COUNT(*) counts rows inside each group.