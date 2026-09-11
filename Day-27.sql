-- show databases;

-- use Joins;



-- 💼 Business Scenario

-- The sales manager wants a report showing every order along with the customer who placed it.

-- Display:

-- Order ID
-- Order Date
-- Customer Name
-- Customer City
-- Payment Status
-- Requirement

-- Every order must appear in the report, even if matching customer information is unavailable.

-- Sort by:

-- Customer City — A → Z
-- Order Date — newest to oldest
-- Tables

-- Customer → Orders

-- 👉 Write the SQL query using RIGHT JOIN.


-- select Orders.Order_Id, Orders.Order_Date,
--        Customer.Customer_Name,
--        Customer.City,
--        Orders.Payment_Status
-- from Customer

-- right join Orders 
-- on Customer.Customer_Id = Orders.Customer_Id


-- order by Customer.City asc,
--          Orders.Order_Date desc;

-- 🧠 Your key decision was correct
-- FROM Customer
-- RIGHT JOIN Orders

-- So:

-- Customer = LEFT table
-- Orders   = RIGHT table
--                       ↑
--                 PRESERVED

-- The requirement says every order must appear, so Orders correctly goes on the right side.


