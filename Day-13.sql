-- use Day8;

-- select * from Product;

-- 🏢 Business Scenario

-- The inventory manager wants to identify categories that have more than 5 products.

-- He doesn't want to see every category. He only wants categories whose total number of products is greater than 5.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- Total number of products in each category.

-- Display the count with the alias:

-- TOTAL_PRODUCTS

-- Show only those categories where the total number of products is greater than 5.

-- Sort the results by:

-- TOTAL_PRODUCTS in descending order.
-- If two categories have the same number of products, sort by CATEGORY in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ COUNT(*)
-- ✅ HAVING
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC
-- ✅ Aggregate Functions



-- select Category, count(PRODUCT_NAME) as Total_Products
-- from Product
-- Group by Category
-- having count(PRODUCT_NAME) > 5
-- order by Total_Products desc, Category asc;

-- Execution Order

-- This query runs in this order:

-- FROM Product
--       ↓
-- GROUP BY Category
--       ↓
-- COUNT(Product_Name)
--       ↓
-- HAVING COUNT(Product_Name) > 5
--       ↓
-- SELECT Category, COUNT(...)
--       ↓
-- ORDER BY Total_Products DESC, Category ASC



-- ✅ Interview Tip

-- Both of these are correct:

-- ORDER BY Total_Products DESC;
-- ORDER BY COUNT(Product_Name) DESC;

-- But interviewers generally prefer:

-- ORDER BY Total_Products DESC;

-- because it's easier to read.


-- 🏢 Business Scenario

-- The sales manager wants to identify brands that have more than one product in the inventory.

-- He is not interested in brands that have only one product.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- BRAND
-- Total number of products for each brand.

-- Display the count with the alias:

-- TOTAL_PRODUCTS

-- Show only those brands whose total number of products is greater than 1.

-- Sort the result by:

-- TOTAL_PRODUCTS in descending order.
-- If two brands have the same number of products, sort by BRAND in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ COUNT(*)
-- ✅ HAVING
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC


-- select  Brand , count(Brand) as Total_Products
-- from product 
-- group BY Brand
-- Having Total_Products > 1
-- order by Total_Products desc, Brand asc;

-- SQL Execution Trace:

-- Read Product

-- ↓

-- No WHERE

-- ↓

-- GROUP BY

-- ↓

-- COUNT()

-- ↓

-- HAVING

-- ↓

-- Virtual Table

-- ↓

-- ORDER BY

-- ↓

-- TOTAL_PRODUCTS DESC

-- ↓

-- BRAND ASC

-- ↓

-- Final Output





-- 🏢 Business Scenario

-- The inventory manager wants to analyze only AVAILABLE products.

-- He wants to know which categories have more than 3 available products.

-- He doesn't want to include OUT_OF_STOCK or DISCONTINUED products.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- Total number of AVAILABLE products.

-- Display the count with the alias:

-- AVAILABLE_PRODUCTS

-- Show only those categories where the number of available products is greater than 3.

-- Sort the result by:

-- AVAILABLE_PRODUCTS in descending order.
-- If two categories have the same count, sort by CATEGORY in ascending order.
-- 📚 Topics Covered
-- ✅ WHERE
-- ✅ GROUP BY 
-- ✅ COUNT(*)
-- ✅ HAVING
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC


    -- select Category,count(Product_Name) as AVAILABLE_PRODUCTS
    -- from Product
    -- where Product_Status = "Available"
    -- group by Category
    -- having AVAILABLE_PRODUCTS > 3
    -- ORDER by AVAILABLE_PRODUCTS DESC, CATEGORY ASC;




    


-- 🏢 Business Scenario

-- The warehouse manager wants to identify brands within each category that have a total stock greater than 20.

-- However, he only wants to analyze AVAILABLE products.

-- For example:

-- Apple in Electronics
-- IKEA in Furniture
-- Nike in Clothing

-- He does not want the total stock for an entire category or an entire brand. He wants the Category + Brand combination.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Total stock.

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Show only those Category–Brand combinations where the total stock is greater than 20.

-- Sort the result by:

-- CATEGORY in ascending order.
-- If the category is the same, sort by TOTAL_STOCK in descending order.
-- If the total stock is the same, sort by BRAND in ascending order.
-- 📚 Topics Covered
-- ✅ WHERE
-- ✅ GROUP BY (Multiple Columns)
-- ✅ Aggregate Functions
-- ✅ HAVING
-- ✅ ORDER BY (Multiple Columns)
-- ✅ ASC
-- ✅ DESC

-- 🎯 Tip

-- Whenever a question says:

-- How many...? → COUNT()
-- Total...? → SUM()
-- Average...? → AVG()
-- Highest...? → MAX()
-- Lowest...? → MIN()

-- select  Category, Brand,sum(Stock) as Total_Stock
-- from Product
-- where Product_Status = "Available"
-- group by Category, Brand
-- having sum(Stock) > 20
-- order by category asc,Total_Stock desc, Brand asc;


-- Category and Brand because the manager wants results for each Category–Brand combination. 
-- GROUP BY creates one group for every unique Category–Brand pair. ORDER BY is responsible for sorting, not GROUP BY."


-- 🏢 Business Scenario

-- The sales manager wants to identify supplier cities where the total stock of AVAILABLE products is greater than 50.

-- He is not interested in cities whose available stock is 50 or less.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- SUPPLIER_CITY
-- Total stock.

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Show only those supplier cities where the total stock is greater than 50.

-- Sort the result by:

-- TOTAL_STOCK in descending order.
-- If two cities have the same total stock, sort by SUPPLIER_CITY in ascending order.
-- 📚 Topics Covered
-- ✅ WHERE
-- ✅ GROUP BY
-- ✅ SUM()
-- ✅ HAVING
-- ✅ ORDER BY (Multiple Columns)


-- select SUPPLIER_CITY, sum(Stock) as TOTAL_STOCK
-- from Product
-- where Product_Status = "Available"
-- group  by SUPPLIER_CITY
-- having Sum(Stock)>50
--  order by  Total_STOCK desc, SUPPLIER_CITY asc;



-- 🏢 Business Scenario

-- The inventory manager wants to identify brands within each category that have a total stock greater than 30.

-- However, he wants to analyze only AVAILABLE products from the following categories:

-- ELECTRONICS
-- SPORTS

-- Also, he is interested only in brands whose name does not start with 'P'.

-- 📝 Main Problem

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Total stock

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Show only those Category–Brand combinations where:

-- PRODUCT_STATUS = 'AVAILABLE'
-- CATEGORY IN ('ELECTRONICS','SPORTS')
-- BRAND NOT LIKE 'P%'
-- TOTAL_STOCK > 30

-- Sort the result by:

-- CATEGORY ASC
-- TOTAL_STOCK DESC
-- BRAND ASC
-- 📚 Topics Covered (Revision)

-- This single problem revises:

-- ✅ WHERE
-- ✅ IN
-- ✅ NOT LIKE
-- ✅ GROUP BY (Multiple Columns)
-- ✅ SUM()
-- ✅ HAVING
-- ✅ ORDER BY (Multiple Columns)


-- select Category , Brand, sum(Stock) as Total_Stock 
-- from product
-- where  Product_Status = "Available" 
-- and  Brand not like 'P%' 
-- and Category in ('Electronics','Sports')
-- group by Category, BRAND
-- having Total_Stock > 30
-- order by Category asc,Total_Stock desc, Brand asc;


