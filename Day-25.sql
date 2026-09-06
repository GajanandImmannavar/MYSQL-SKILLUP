-- show databases;

-- use Joins;

-- show tables;


-- 🏢 Business Scenario

-- The sales manager wants to analyze all customers and their purchasing activity.

-- Display:

-- Customer Name
-- Customer City
-- Product Name
-- Product Price
-- Order Date
-- Requirements
-- Show every customer, even customers who have never placed an order.
-- If a customer has orders, show only orders for AVAILABLE products.
-- Only include products with a rating of 4 or higher.
-- Customers without a matching product must still appear.
-- Sort by:
-- Customer City — A → Z
-- Customer Name — A → Z
-- Product Price — Highest → Lowest




-- select Customer.Customer_Name, 
--        Customer.City, Orders.Order_Date, 
--        Inventory.Product_Name, Inventory.Price

-- from Customer

-- left join Orders
-- on Customer.Customer_Id = Orders.Customer_Id

-- left join Inventory
-- on Orders.Product_Id = Inventory.Product_Id

-- and Inventory.Product_Status = 'AVAILABLE'
-- and Inventory.Rating >=4

-- order by Customer.City asc,
--          Customer.Customer_Name asc, 
--          Inventory.Price desc;






-- FROM Customer
--      ↓
-- Start with ALL customers
--      ↓
-- LEFT JOIN Orders
--      ↓
-- Because ALL customers must remain,
-- even customers with NO orders
--      ↓
-- LEFT JOIN Inventory
--      ↓
-- Attach the product belonging to the order
--      ↓
-- BUT only when:
--     Product is AVAILABLE
--     AND Rating >= 4
--      ↓
-- Because customers without a qualifying
-- product must STILL remain
--      ↓
-- ORDER BY
--     City A-Z
--     Customer Name A-Z
--     Price High → Low




-- 🧠 The important part

-- You correctly used two LEFT JOINs:

-- Customer
--    │
--    │ LEFT JOIN
--    ▼
-- Orders
--    │
--    │ LEFT JOIN
--    ▼
-- Inventory

-- And you correctly put the Inventory conditions inside the second ON:

-- AND Inventory.Product_Status = 'AVAILABLE'
-- AND Inventory.Rating >= 4

-- That means:

-- Customer with no order
--         ↓
-- Customer remains ✅

-- Customer with order but
-- no matching AVAILABLE + Rating >= 4 product
--         ↓
-- Customer remains ✅
-- Product columns → NULL
-- ⭐ Key pattern you've learned
-- LEFT JOIN Orders
-- ON customer relationship

-- LEFT JOIN Inventory
-- ON product relationship
-- AND right_table_condition

-- This is exactly the correct use of LEFT JOIN with filtered right-side tables. 🔥


-- 🔄 Revision Problem

-- The purchasing manager wants all suppliers, including suppliers that currently have no products.

-- Display:

-- Supplier Name
-- Supplier City
-- Product Name
-- Brand

-- Only attach products that:

-- belong to Electronics or Furniture
-- are AVAILABLE

-- Sort by Supplier Name.



select Supplier.Supplier_Name, 
       Supplier.Supplier_City,
       Inventory.Product_Name, 
       Inventory.Brand
from Supplier

left join Inventory
on Supplier.Supplier_Id = Inventory.Supplier_Id
And Inventory.Product_Status ='AVAILABLE'

left join Categories
on Inventory.Category_Id = Categories.Category_Id
And Categories.Category_Name in('Electronics','Furniture')


order by Supplier.Supplier_Name asc; 


-- 🧠 What you learned today

-- 1. Decide the LEFT table from the requirement

-- If the requirement says:

-- Show all suppliers, including suppliers with no products

-- Then:

-- FROM Supplier
-- LEFT JOIN Inventory

-- Because Supplier must be preserved.

-- 2. LEFT JOIN preserves the left table
-- FROM Supplier
-- LEFT JOIN Inventory

-- Means:

-- Keep every Supplier, even when there is no matching Inventory row.

-- 3. "Only attach..." → condition goes in ON

-- Requirement:

-- Only attach products that are AVAILABLE.

-- So:

-- LEFT JOIN Inventory
-- ON Supplier.Supplier_Id = Inventory.Supplier_Id
-- AND Inventory.Product_Status = 'AVAILABLE'

-- You're telling SQL:

-- Match the supplier to Inventory only when the product is AVAILABLE.

-- 4. Multiple conditions for one JOIN use AND

-- For example:

-- LEFT JOIN Inventory
-- ON Supplier.Supplier_Id = Inventory.Supplier_Id
-- AND Inventory.Product_Status = 'AVAILABLE'
-- AND Inventory.Price > 10000

-- That's one JOIN with one ON clause containing multiple conditions.

-- Think:

-- JOIN
--  ↓
-- ONE ON
--  ↓
-- condition 1
-- AND condition 2
-- AND condition 3
-- 5. You can have multiple JOINs, and each gets its own ON

-- Your query has:

-- LEFT JOIN Inventory
-- ON ...

-- LEFT JOIN Categories
-- ON ...



-- That's perfectly correct.

-- Think:

-- Supplier
--    ↓
-- LEFT JOIN Inventory
--    ↓
--    ON condition(s)

--    ↓
-- LEFT JOIN Categories
--    ↓
--    ON condition(s)

-- So:

-- Multiple JOINs → multiple ON clauses.
-- Same JOIN → one ON clause + multiple conditions using AND.

-- 6. ON vs WHERE

-- This was probably the biggest lesson today.

-- ON
-- ↓
-- Which rows should MATCH / ATTACH?

-- WHERE
-- ↓
-- Which rows should remain in the FINAL result?

-- Because the requirement said:

-- All suppliers must remain, but only qualifying products should attach

-- you used:

-- AND Inventory.Product_Status = 'AVAILABLE'

-- inside ON, rather than WHERE.

-- 🔥 Your complete mental model
-- Requirement
--     ↓
-- Who must NEVER disappear?
--     ↓
-- Put that table on LEFT
--     ↓
-- LEFT JOIN
--     ↓
-- What should be ATTACHED?
--     ↓
-- Put those conditions in ON
--     ↓
-- Multiple conditions?
--     ↓
-- Use AND
--     ↓
-- Need to filter the FINAL result?
--     ↓
-- Use WHERE
-- Today's key interview rule ⭐

-- One JOIN = one ON. Multiple JOINs = multiple ON clauses. Multiple conditions for the same JOIN = one ON + AND.

-- That's an important concept you've now added to your JOIN fundamentals.