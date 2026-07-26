-- use Joins;

-- show tables;

-- ⭐ Bonus Problem

-- This introduces a slightly harder JOIN.

-- Business Scenario

-- The inventory manager wants to know:

-- Product Name
-- Customer Name
-- Order Date

-- for all available products that have been ordered.

-- Sort by:

-- Product Name
-- Order Date             


-- select Inventory.Product_Name, Customer.Customer_Name, Orders.Order_Date
-- from Customer
-- join  Orders
-- on  Customer.Customer_Id = Orders.Customer_Id
-- join Inventory
-- on Orders.Product_Id = Inventory.Product_Id
-- where Inventory.Product_Status = 'AVAILABLE'
-- order by Inventory.Product_Name asc, Orders.Order_Date;

-- ⚙ SQL Execution Trace

-- This is how SQL thinks internally.

-- Step 1

-- Read Customer table.

-- Customer

-- ↓

-- Step 2

-- Join Orders.

-- Customer
--       +
-- Orders

-- ↓

-- Step 3

-- Match using

-- Customer.Customer_ID = Orders.Customer_ID

-- ↓

-- Create Virtual Table 1

-- Customer + Orders

-- ↓

-- Step 4

-- Join Inventory

-- Virtual Table 1
--         +
-- Inventory

-- ↓

-- Step 5

-- Match using

-- Orders.Product_ID = Inventory.Product_ID

-- ↓

-- Create Virtual Table 2

-- Customer + Orders + Inventory

-- ↓

-- Step 6

-- Apply WHERE

-- Product_Status = 'AVAILABLE'

-- Remove all unavailable products.

-- ↓

-- Step 7

-- SELECT

-- Product_Name
-- Customer_Name
-- Order_Date

-- ↓

-- Step 8

-- ORDER BY

-- Product Name (A → Z)
-- Order Date (Oldest → Newest)

-- ↓

-- Final Output
-- ⭐ Interview Tip

-- If an interviewer asks:

-- Why did you use two JOINs?

-- A strong answer is:

-- "The required information is stored across three related tables. Customer_Name is in the Customer table, 
-- Order_Date is in the Orders table, and Product_Name with Product_Status is in the Inventory table.
--  Since three tables are involved, I used two JOINs to connect them through their Primary Key–Foreign Key relationships."


-- 🏢 Main Problem
-- Business Scenario

-- The sales manager wants to prepare a report of all successful purchases.

-- He wants to know:

-- Customer Name
-- Product Name
-- Payment Method

-- Only include orders that:

-- have Payment Status = 'PAID'
-- belong to Available products

-- Sort the report by:

-- Customer Name (A → Z)
-- Product Name (A → Z)


-- select Customer.Customer_name, Inventory.Product_name, Orders.Payment_Method
-- from Customer
-- join  Orders
-- on Customer.Customer_Id = Orders.Customer_Id
-- join Inventory
-- on Inventory.Product_Id = Orders.Product_Id
-- where Orders.Payment_Status = 'Paid'
--      and Inventory.Product_Status = 'Available'
--      order by Customer.Customer_Name asc, Inventory.Product_Name asc;

-- ⚙ SQL Execution Trace

-- Customer

-- ↓

-- JOIN Orders

-- ↓

-- ON Customer.Customer_ID = Orders.Customer_ID

-- ↓

-- Virtual Table 1

-- ↓

-- JOIN Inventory

-- ↓

-- ON Orders.Product_ID = Inventory.Product_ID

-- ↓

-- Virtual Table 2

-- ↓

-- WHERE
-- Payment_Status='PAID'
-- Product_Status='AVAILABLE'

-- ↓

-- SELECT
-- Customer_Name
-- Product_Name
-- Payment_Method

-- ↓

-- ORDER BY
-- Customer_Name ASC
-- Product_Name ASC

-- ↓

-- Final Output
