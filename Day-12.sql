-- use Day8;


-- select * from Product;

-- 🟢 GROUP BY Multiple Columns – Level 1 | Problem 1
-- 🏢 Business Scenario

-- The inventory manager wants to know how many products each brand has in every category.

-- For example:

-- Apple products in Electronics
-- IKEA products in Furniture
-- Nike products in Clothing

-- He doesn't want the total per category or per brand. He wants the combination of Category and Brand.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Total number of products in each Category–Brand combination.

-- Display the count with the alias:

-- TOTAL_PRODUCTS

-- Sort the result by:

-- CATEGORY in ascending order.
-- If the category is the same, sort by BRAND in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY (Multiple Columns)
-- ✅ COUNT(*)
-- ✅ ORDER BY
-- ✅ ASC
-- ✅ Aggregate Function
-- ✅ Combined Grouping Keys






-- select Category, Brand , count(*) as Total_Products
-- from product
-- Group by Category, brand
-- order by CATEGORY asc, Brand asc;

-- -- FROM Product
-- --         ↓
-- -- No WHERE clause
-- --         ↓
-- -- Create groups using
-- -- (Category, Brand)
-- --         ↓
-- -- COUNT(*) counts rows inside each group
-- --         ↓
-- -- Create temporary (virtual) table
-- --         ↓
-- -- Sort by Category ASC
-- --         ↓
-- -- If Category is the same,
-- -- sort by Brand ASC
-- --         ↓
-- -- Display final result



-- 🧠 SQL Execution Trace (Theory Revision)

-- Complete these steps without writing SQL.

-- Step 1:
-- SQL reads the __________ table.

-- ↓

-- Step 2:
-- There is no __________ clause, so all rows remain.

-- ↓

-- Step 3:
-- SQL creates groups based on __________ and __________ together.

-- ↓

-- Step 4:
-- COUNT(*) calculates __________.

-- ↓

-- Step 5:
-- SQL creates a __________ table.

-- ↓

-- Step 6:
-- ORDER BY first sorts by __________ ASC.

-- ↓

-- Step 7:
-- If CATEGORY is the same,
-- SQL sorts by __________ ASC.

-- ↓

-- Step 8:
-- SQL displays the __________.





-- The warehouse manager wants to know how many AVAILABLE products each brand has in every category.

-- He is not interested in OUT_OF_STOCK or DISCONTINUED products.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Number of AVAILABLE products.

-- Display the count with the alias:

-- AVAILABLE_PRODUCTS

-- Sort the results by:

-- CATEGORY in ascending order.
-- If the category is the same, sort by AVAILABLE_PRODUCTS in descending order.
-- If both are the same, sort by BRAND in ascending order.
-- 📚 Topics Covered
-- ✅ WHERE
-- ✅ GROUP BY (Multiple Columns)
-- ✅ COUNT(*)
-- ✅ ORDER BY (Multiple Columns)
-- ✅ ASC
-- ✅ DESC
-- ✅ Aggregate Functions




select Category, Brand , count(Brand) as Available_Products 
from Product
where PRODUCT_STATUS = "Available"
Group by Category, Brand 
order by Category asc, Available_Products desc, Brand asc;

