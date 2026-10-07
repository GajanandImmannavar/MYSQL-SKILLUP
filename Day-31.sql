-- use Joins;


-- 🏢 Business Scenario
-- The sales director wants to identify customers who are actively purchasing products.
-- Display
-- - Customer Name
-- - Customer City
-- - Number of Orders
-- - Total Quantity Purchased

-- Requirements
-- - Consider only orders with Payment_Status = 'Success'.
-- - Consider products with a rating of 4 or higher.
-- - Exclude products from the Grocery category.
-- - Consider products priced between ₹5,000 and ₹80,000.
-- - Customer names should contain the letter a.
-- - Show only customers having more than 2 successful orders.
-- - Sort by:
--   1. Total Quantity Purchased (high → low)
--   2. Customer Name (A → Z)

-- Tables
-- Customer
--    ↓
-- Orders
--    ↓
-- Inventory
--    ↓
-- Categories

-- 🎯 Your Task
-- Write the SQL query.
-- Concepts Hidden Inside
-- You decide what to use. The business requirement may require:
-- - JOINs
-- - WHERE
-- - LIKE
-- - BETWEEN
-- - COUNT()
-- - SUM()
-- - GROUP BY
-- - HAVING
-- - ORDER BY




-- select Customer.customer_Name,
--        Customer.City,
--        count(Orders.Order_Id) as No_Of_Orders,
--        sum(Orders.Quantity) as Total_Quantity_Purchased

-- from Customer

-- inner join Orders

-- on Customer.Customer_Id = Orders.Customer_Id

-- join Inventory

-- on Inventory.Product_Id = Orders.Product_Id


-- join Categories

-- on Categories.Category_Id = Inventory.Category_Id


-- where Orders.Payment_Status = "Success"

-- and Inventory.Rating >=4 

-- and Categories.Category_Name not in ("Grocery")

-- and Inventory.Price between 5000 and 80000

-- and Customer.Customer_Name like '%a%'

-- group by Customer.Customer_Id,
--         Customer.Customer_Name,
--         Customer.City

-- having count(Orders.Order_Id)>2

-- order by Total_Quantity_Purchased desc,
--          Customer.Customer_Name asc;    



-- # SQL Query Flow & Filtering Notes

-- ## 1. SQL Execution Flow

-- Even though we write SQL like this:

-- ```sql
-- SELECT ...
-- FROM ...
-- JOIN ...
-- ON ...
-- WHERE ...
-- GROUP BY ...
-- HAVING ...
-- ORDER BY ...
-- ```

-- SQL processes it roughly in this order:

-- ```text
-- 1. FROM
-- 2. JOIN
-- 3. ON
-- 4. WHERE
-- 5. GROUP BY
-- 6. HAVING
-- 7. SELECT
-- 8. ORDER BY
-- ```

-- Flow:

-- ```text
-- Get tables
-- ↓
-- Connect tables
-- ↓
-- Filter rows
-- ↓
-- Create groups
-- ↓
-- Filter groups
-- ↓
-- Show columns
-- ↓
-- Sort results
-- ```

-- ---

-- # 2. WHEN TO USE WHERE

-- Use WHERE when filtering individual rows.

-- Examples:

-- ```sql
-- WHERE Orders.Payment_Status = 'Success'
-- ```

-- ```sql
-- WHERE Inventory.Price > 5000
-- ```

-- ```sql
-- WHERE Customer.City = 'Bengaluru'
-- ```

-- ```sql
-- WHERE Inventory.Product_Name LIKE '%a%'
-- ```

-- Rule:

-- ```text
-- WHERE filters rows before GROUP BY.
-- ```

-- ---

-- # 3. WHEN TO USE HAVING

-- Use HAVING when filtering groups created by GROUP BY.

-- Examples:

-- ```sql
-- HAVING COUNT(Order_ID) > 2
-- ```

-- ```sql
-- HAVING SUM(Quantity) > 100
-- ```

-- ```sql
-- HAVING AVG(Price) > 5000
-- ```

-- Rule:

-- ```text
-- HAVING filters groups after GROUP BY.
-- ```

-- ---

-- # 4. WHERE vs HAVING

-- Wrong:

-- ```sql
-- WHERE COUNT(Order_ID) > 2
-- ```

-- Correct:

-- ```sql
-- HAVING COUNT(Order_ID) > 2
-- ```

-- Easy Rule:

-- ```text
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()

-- → Use HAVING
-- ```

-- ---

-- # 5. INNER JOIN Filtering

-- Example:

-- ```sql
-- SELECT *
-- FROM Customer
-- INNER JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID
-- WHERE Orders.Payment_Status = 'Success';
-- ```

-- Flow:

-- ```text
-- Customer
-- +
-- Orders
-- ↓
-- Match records
-- ↓
-- Apply WHERE
-- ↓
-- Show result
-- ```

-- Rule:

-- ```text
-- For INNER JOIN, most filters are written in WHERE.
-- ```

-- ---

-- # 6. LEFT JOIN Filtering

-- Requirement:


-- Show all customers
-- Attach only PAID orders


-- Wrong:


-- SELECT *
-- FROM Customer
-- LEFT JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID
-- WHERE Orders.Payment_Status = 'PAID';


-- Problem:


-- LEFT JOIN creates NULL values
-- ↓
-- WHERE removes NULL rows
-- ↓
-- LEFT JOIN becomes INNER JOIN


-- Correct:


-- SELECT *
-- FROM Customer
-- LEFT JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID
-- AND Orders.Payment_Status = 'PAID';


-- Rule:


-- If you want to preserve the LEFT table,
-- put joined-table conditions inside ON.


-- ---

--  7. RIGHT JOIN Filtering

-- Requirement:


-- Every product must appear
-- Attach supplier only if supplier city is Bengaluru
-- ```

-- Correct:


-- SELECT *
-- FROM Supplier
-- RIGHT JOIN Inventory
-- ON Supplier.Supplier_ID = Inventory.Supplier_ID
-- AND Supplier.Supplier_City = 'Bengaluru';
-- ```

-- Rule:


-- If you want to preserve the RIGHT table,
-- put joined-table conditions inside ON.


-- ---

-- # 8. ON vs WHERE

-- Use ON for:


-- Matching tables
-- Controlling what gets attached during JOIN
-- Preserving rows in LEFT JOIN and RIGHT JOIN


-- Use WHERE for:


-- Filtering final rows after JOIN
-- INNER JOIN filtering
-- Normal row conditions


-- ---

--  9. Biggest JOIN Rule

-- Before writing a JOIN, ask:

-- 1. Which table must never disappear?
-- 2. Which table is being attached?
-- 3. Is this row filtering (WHERE)?
-- 4. Is this group filtering (HAVING)?
-- 5. Will WHERE accidentally turn my LEFT JOIN into an INNER JOIN?



--  10. Quick Cheat Sheet

-- INNER JOIN


-- FROM A
-- INNER JOIN B
-- ON ...
-- WHERE ...


-- Use WHERE for filtering.

-- ---

-- LEFT JOIN


-- FROM A
-- LEFT JOIN B
-- ON ...
-- AND condition_on_B


-- Preserves table A.

-- ---

-- RIGHT JOIN


-- FROM A
-- RIGHT JOIN B
-- ON ...
-- AND condition_on_A


-- Preserves table B.

-- ---

-- Aggregation Flow


-- WHERE
-- ↓
-- GROUP BY
-- ↓
-- HAVING
-- ↓
-- ORDER BY


-- Remember:


-- WHERE  = Filter Rows
-- HAVING = Filter Groups
-- ON     = Control JOIN Matching
-- 

-- Golden Rule:


-- INNER JOIN → Filter in WHERE

-- LEFT JOIN → If preserving LEFT table,
-- put joined-table filters in ON

-- RIGHT JOIN → If preserving RIGHT table,
-- put joined-table filters in ON

-- COUNT/SUM/AVG/MIN/MAX → Use HAVING


-- 🏢 Business Scenario
-- The management team wants to identify top-performing suppliers based on successful product sales.
-- Display
-- - Supplier Name
-- - Supplier City
-- - Category Name
-- - Number of Orders
-- - Total Quantity Sold

-- 📋 Requirements
-- - Consider only orders with Payment_Status = 'Success'.
-- - Include only products with Rating >= 4.
-- - Product price should be between ₹3,000 and ₹75,000.
-- - Exclude products whose status is DISCONTINUED.
-- - Exclude the Grocery category.
-- - Supplier city should be either:
--   - Bengaluru
--   - Mumbai
--   - Hyderabad
-- - Product name must contain the letter e.
-- - Show only supplier-category combinations having:
--   - More than 2 orders
--   - Total quantity sold greater than 10
-- - Sort by:
--   1. Total Quantity Sold (high → low)
--   2. Number of Orders (high → low)
--   3. Supplier Name (A → Z)

-- 🗂 Tables
-- Supplier
--    ↓
-- Inventory
--    ↓
-- Categories

-- Orders
--    ↓
-- Inventory

-- 🎯 Display Format
-- Supplier_Name
-- Supplier_City
-- Category_Name
-- Number_Of_Orders
-- Total_Quantity_Sold


-- select Supplier.Supplier_Name,Supplier.Supplier_City,Categories.Category_Name,
--        count(Orders.Order_Id) as Number_Of_Orders,sum(Orders.Quantity) as Total_Quantity_Sold
-- from Supplier

-- inner join Inventory
-- on Supplier.Supplier_Id = Inventory.Supplier_Id

-- inner join Categories
-- on Inventory.Category_Id = Categories.Category_Id

-- inner join Orders
-- on Inventory.Product_Id = Orders.Product_Id

-- where Orders.Payment_Status = "Paid"

-- and Inventory.Rating>=4
-- and Inventory.Price between 3000 and 75000
-- and Inventory.Product_Status <> "DISCONTINUED"
-- and Categories.Category_Name not in ("Grocery")
-- and Supplier.Supplier_City in ("BEngaluru","Mumbai", "Hyderabad")
-- and Inventory.Product_Name like "%e%"

-- group by Supplier.Supplier_Name,
--          Supplier.Supplier_City,
--          Categories.Category_Name

-- having COUNT(Orders.Order_ID) > 2
--       and  SUM(Orders.Quantity) > 10

-- order by  Total_Quantity_Sold desc,
--            Number_Of_Orders desc,
--            Supplier.Supplier_Name asc; 

-- this won't give Output that doesn't  mean query is not correct because

-- check debuing notes







-- 🏢 Business Scenario
-- The sales director wants to identify valuable customers who are actively purchasing high-rated products.
-- 📋 Display
-- - Customer Name
-- - Customer City
-- - Number of Successful Orders
-- - Total Quantity Purchased
-- - Total Amount Spent
-- 📋 Requirements
-- - Consider only orders with Payment_Status = 'PAID'
-- - Include only products with Rating >= 4
-- - Product price should be between ₹2,000 and ₹90,000
-- - Exclude products from the GROCERY category
-- - Product name must contain the letter a
-- - Customer city should be either:
--   - BENGALURU
--   - MUMBAI
--   - HYDERABAD
--   - PUNE
-- - Show only customers having:
--   - More than 1 successful order
--   - Total Quantity Purchased greater than 3
-- - Sort by:
--   1. Total Amount Spent (High → Low)
--   2. Total Quantity Purchased (High → Low)
--   3. Customer Name (A → Z)

-- select Customer.Customer_Name, Customer.City,  count(Orders.Order_Id) as Total_Numbers_Of_Orders,
--        sum(Orders.Quantity) as Total_Quantity_Purchased, sum(Inventory.Price*Orders.Quantity) as Total_Amount_Spent

-- from Customer

-- inner join Orders
-- on Customer.Customer_Id = Orders.Customer_Id

-- inner join Inventory
-- on Inventory.Product_Id = Orders.Product_Id

-- inner join Categories
-- on Inventory.Category_Id = Categories.Category_Id

-- where Orders.Payment_Status = "PAID"
-- and Inventory.Price between 2000 and 90000
-- and Inventory.Rating >=4
-- and Categories.Category_Name <> "GROCERY"
-- and Inventory.Product_Name like "%a%"
-- and Customer.City in ("BENGALURU","MUMBAI","HYDERABAD","PUNE")

-- group by Customer.Customer_Id,
--          Customer.Customer_Name,
--          Customer.City
--  HAVING COUNT(Orders.Order_ID) > 1
--    AND SUM(Orders.Quantity) > 3

-- order by Total_Amount_Spent desc,
--           Total_Quantity_Purchased desc,
--           Customer.Customer_Name asc;



🏢 Business Scenario
The sales manager wants to identify customers who are actively purchasing products from premium categories.
Display
- Customer Name
- City
- Number Of Orders
- Total Quantity Purchased
Requirements
- Consider only PAID orders.
- Include only products from:
  - ELECTRONICS
  - FURNITURE
- Product rating should be 4 or higher.
- Product price should be greater than ₹5,000.
- Customer name should contain the letter a.
- Show only customers having:
  - At least 1 order
  - Total Quantity Purchased greater than 1
- Sort by:
  1. Total Quantity Purchased (High → Low)
  2. Number Of Orders (High → Low)
  3. Customer Name (A → Z)
Tables
Customer
   ↓
Orders
   ↓
Inventory
   ↓
Categories




select Customer.Customer_Name, Customer.city,
       count(Orders.Order_Id) as Number_Of_Orders,
       sum(Orders.Quantity) as Total_Quantity_Purchased

from Customer

inner join Orders
on Customer.Customer_Id = Orders.Customer_Id

inner join Inventory
on Orders.Product_Id = Inventory.Product_Id

inner join Categories
on Inventory.Category_Id = Categories.Category_id

where Orders.Payment_Status = "PAID"

and Categories.Category_Name in ("ELECTRONICS","FURNITURE")
and Inventory.Rating >=4
and Inventory.Price > 5000
and Customer.Customer_Name like '%a%'

group by Customer.Customer_Id,
         Customer.Customer_Name,
         Customer.City

having count(Orders.order_Id)>=1 and
        sum(Orders.Quantity)>1

order by sum(Orders.Quantity)desc, 
         count(Orders.Order_Id)desc,
         Customer.Customer_Name asc;