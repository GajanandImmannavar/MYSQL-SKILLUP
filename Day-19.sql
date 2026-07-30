-- use Joins;

-- show Tables;

-- select * from Orders;

-- 🏢 Main Problem
-- Business Scenario

-- The sales director wants to identify valuable customers who purchased premium products.

-- Prepare a report showing:

-- Customer Name
-- Product Name
-- Price
-- Payment Method

-- Include only those orders where:

-- Product is AVAILABLE
-- Payment Status is PAID
-- Product price is greater than ₹30,000
-- Customer belongs to BENGALURU or MYSURU
-- Brand name does not start with 'A'

-- Sort the report by:

-- Customer Name (A → Z)
-- Price (Highest → Lowest)
-- 📚 Concepts Covered
-- ✅ INNER JOIN (3 Tables)
-- ✅ WHERE
-- ✅ IN
-- ✅ NOT LIKE
-- ✅ ORDER BY

-- select Customer.Customer_Name, Inventory.Product_Name,
--  Inventory.Price, Orders.Payment_Method
-- from customer  
-- join Orders 
-- on Orders.Customer_ID = Customer.Customer_ID  
-- join inventory
-- on Orders.Product_ID = Inventory.Product_ID
-- where Inventory.Product_Status = 'AVAILABLE'
--     and Orders.Payment_Status = 'PAID'
--     and Inventory.Price > 30000
--     and Customer.City in ('BENGALURU','MYSURU')
--     and Inventory.Brand not like 'A%'
--     order by Customer.Customer_Name asc, Inventory.Price desc;


-- 🏢 Business Scenario

-- The warehouse manager wants to know the unique supplier names that supply products which:

-- belong to Electronics or Home Appliances
-- have Rating = 5
-- cost between ₹15,000 and ₹90,000
-- are AVAILABLE

-- Display only:

-- Supplier Name

-- Remove duplicates.

-- Sort alphabetically.

-- 📚 Revision Concepts
-- ✅ INNER JOIN
-- ✅ DISTINCT
-- ✅ WHERE
-- ✅ IN
-- ✅ BETWEEN
-- ✅ ORDER BY


-- select Distinct Supplier.Supplier_Name
-- from Supplier
-- join Inventory
-- on Supplier.Supplier_ID = Inventory.Supplier_ID
-- join Categories
-- on Inventory.Category_ID = Categories.Category_ID
-- where Categories.Category_Name in ('ELECTRONICS','HOME_APPLIANCES')
--        and Inventory.Rating = 5
--        and Inventory.price Between 15000 and 90000
--        and Inventory.Product_Status = 'AVAILABLE'
-- order by Supplier.Supplier_Name asc;


-- ⚙ SQL Execution Trace
-- Supplier

-- ↓

-- JOIN Inventory

-- ↓

-- ON Supplier.Supplier_ID = Inventory.Supplier_ID

-- ↓

-- Virtual Table 1

-- ↓

-- JOIN Categories

-- ↓

-- ON Inventory.Category_ID = Categories.Category_ID

-- ↓

-- Virtual Table 2

-- ↓

-- WHERE

-- Category_Name IN (...)

-- Rating = 5

-- Price BETWEEN ...

-- Product_Status = 'AVAILABLE'

-- ↓

-- SELECT DISTINCT Supplier_Name

-- ↓

-- ORDER BY Supplier_Name ASC

-- ↓

-- Final Output




-- 🏢 Business Scenario

-- The finance manager wants a report containing:

-- Customer Name
-- Supplier Name
-- Product Name
-- Payment Method
-- Price

-- Include only:

-- Paid orders
-- Available products
-- Products with Rating 4 or 5
-- Products supplied from BENGALURU or MUMBAI

-- Sort by:

-- Supplier Name
-- Customer Name
-- Product Name
-- 📚 Concepts Covered
-- ✅ 4-table INNER JOIN
-- ✅ Multiple WHERE conditions
-- ✅ ORDER BY (3 columns)



select Customer.Customer_Name, Supplier.Supplier_Name,
       Inventory.Product_Name, Orders.Payment_Method, 
       Inventory.Price
from customer   
join Orders
on Orders.Customer_ID = Customer.Customer_ID
join Inventory 
ON Orders.Product_Id = Inventory.Product_Id
join supplier
on Inventory.Supplier_ID = Supplier.Supplier_ID 
where Orders.Payment_Status ='PAID'
      and  Inventory.Product_Status = 'AVAILABLE'
      and Inventory.Rating >= 4
      and Supplier.Supplier_City in ('BENGALURU','MUMBAI')
order by Supplier.Supplier_Name asc, Customer.Customer_Name asc, Inventory.Product_Name ASC;

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

-- JOIN Supplier

-- ↓

-- ON Inventory.Supplier_ID = Supplier.Supplier_ID

-- ↓

-- Virtual Table 3

-- ↓

-- WHERE

-- Payment_Status='PAID'

-- Product_Status='AVAILABLE'

-- Rating >=4

-- Supplier_City IN (...)

-- ↓

-- SELECT

-- Customer_Name

-- Supplier_Name

-- Product_Name

-- Payment_Method

-- Price

-- ↓

-- ORDER BY

-- Supplier_Name

-- Customer_Name

-- Product_Name

-- ↓

-- Final Output

-- ⭐ Interview Tip
-- Interviewer asks:

-- Why did you join Supplier through Inventory instead of Orders?

-- ⭐ Professional Answer

-- Because Orders does not contain Supplier_ID. The Supplier information is stored in the Inventory table, 
-- so I first joined Orders with Inventory using Product_ID, and then joined Inventory with Supplier using Supplier_ID. 
-- I always follow the actual relationships defined in the database schema.



