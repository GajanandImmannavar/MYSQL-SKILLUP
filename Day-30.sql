-- use Joins;

-- 🏢 Business Scenario

-- The sales manager wants to identify customers who have successfully completed purchases.

-- Display:

-- Customer Name
-- Customer City
-- Order ID
-- Product Name
-- Product Price
-- Payment Method

-- Requirements
-- Only successfully paid orders should be included.
-- Products priced between ₹2,000 and ₹90,000 should be considered.
-- Products whose names contain the letter o should be included.
-- Products from the Grocery category should not be included.
-- Show each customer/order combination only once.

-- Sort the report by:
-- Customer City — A → Z
-- Product Price — highest to lowest
-- Customer Name — A → Z

-- Tables
-- Customer
--    ↓
-- Orders
--    ↓
-- Inventory
--    ↓
-- Categories





-- Select Distinct Customer.Customer_Name, 
--                Customer.City, Orders.Order_Id, 
--                Inventory.Product_Name, Inventory.Price, 
--                Orders.Payment_Method

-- from Customer

-- right join Orders 

-- on Customer.Customer_Id = Orders.Customer_Id

--  join Inventory

-- on Orders.Product_Id = Inventory.Product_Id

-- join Categories

-- on Inventory.Category_Id = Categories.Category_Id

-- where Orders.Payment_Status = "Paid"
--       and Inventory.Price between 2000 and 90000
--       and Inventory.Product_Name like "%o%"
--       and Categories.Category_Name not in ("Grocery")

-- order by Customer.City asc,
--          Inventory.Price desc,
--          Customer.Customer_Name asc;





-- 🏢 Business Scenario

-- The inventory manager wants a report of products and their supplier information.

-- Display
-- Product Name
-- Product Price
-- Supplier Name
-- Supplier City
-- Product Status


-- Requirements

-- Every product must appear.
-- Consider products priced from ₹1,000 to ₹50,000.
-- Product names containing a should be included.
-- Suppliers should be from Bengaluru or Mumbai.
-- Discontinued products should not be included.
-- Show each product only once.

-- Sort by Supplier City A→Z, Price high→low, Product Name A→Z.

-- Tables: Supplier, Inventory



