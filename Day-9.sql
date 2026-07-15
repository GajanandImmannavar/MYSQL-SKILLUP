-- use Day8;

-- select * from Product;

-- 📖 What is an Aggregate Function?

-- An aggregate function performs a calculation on multiple rows and returns one single value.

-- 📚 Common Aggregate Functions

-- | Function  | Purpose        |
-- | --------- | -------------- |
-- | `COUNT()` | Counts rows    |
-- | `SUM()`   | Adds values    |
-- | `AVG()`   | Average        |
-- | `MAX()`   | Largest value  |
-- | `MIN()`   | Smallest value |

-- Count Total ROW 

-- select count(*) from Product;

-- Count Values of that Column and nulls will not be included if column has

-- select count(Product_Name) from Product;

-- COUNT(DISTINCT column) it helps to count unique value of column 

-- select count (DISTINCT Category)

-- from product;

-- Interview Tip

-- Remember this:

-- COUNT(*)

-- ↓

-- Counts Rows
-- COUNT(Column)

-- ↓

-- Counts NON-NULL values
-- COUNT(DISTINCT Column)

-- ↓

-- Counts Unique NON-NULL values

-- This is one of the most frequently asked SQL interview questions.

-- 🏢 Business Scenario

-- The inventory manager wants to know how many products are available in the company database.

-- They need only the total number of products, regardless of category or status.

-- 📝 Problem Statement

-- Write an SQL query to count all products from the Product table.

-- Display the result with the alias:

-- TOTAL_PRODUCTS
-- 📚 Topics Covered
-- ✅ COUNT(*)
-- ✅ Alias (AS)

-- select count(Product_Name) as Total_Product 
-- from Product;


-- ⭐ Interview Bonus 1

-- The sales manager wants to know how many different brands are available in the company.

-- Write an SQL query to display the total number of unique brands.

-- Display the result as:

-- TOTAL_BRANDS
-- 📚 Topics Covered
-- ✅ COUNT(DISTINCT column)
-- ✅ Alias (AS)


-- select count(DISTINCT Brand) 
-- from Product;



-- ⭐ Interview Bonus 2 (Revision)

-- The manager wants to know how many products are currently available for sale.

-- Count only products where:

-- PRODUCT_STATUS = 'AVAILABLE'

-- Display the result as:

-- AVAILABLE_PRODUCTS
-- 📚 Topics Covered
-- ✅ COUNT(*)
-- ✅ WHERE
-- ✅ String Comparison (=)
-- ✅ Alias (AS)



-- select count(Product_Name) as AVAILABLE_PRODUCT
-- from Product
-- where Product_Status = "AVAILABLE"

-- 🧠 Interview Tip of the Day

-- Many students think these are always the same:

-- COUNT(*)
-- COUNT(PRODUCT_NAME)

-- ❌ Not always.

-- Example:

-- PRODUCT_ID	PRODUCT_NAME
-- 1	iPhone
-- 2	NULL
-- 3	Samsung

-- Now:

-- SELECT COUNT(*)
-- FROM Product;

-- Result:

-- 3

-- But:

-- SELECT COUNT(PRODUCT_NAME)
-- FROM Product;

-- Result:

-- 2

-- Because COUNT(column) ignores NULL.

-- This is one of the most common SQL interview questions.

🏢 Business Scenario

The inventory manager wants to know how many electronic products are currently available for sale.

📝 Problem Statement

Write an SQL query to count the total number of products where:

CATEGORY = 'ELECTRONICS'
PRODUCT_STATUS = 'AVAILABLE'

Display the result as:

AVAILABLE_ELECTRONICS









