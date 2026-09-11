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



-- 💼 Business Scenario

-- The product manager wants to review every product along with its category information.

-- Display:

-- Product Name
-- Product Price
-- Category Name

-- Category Name should only be attached when the category is Electronics or Sports

-- Requirement

-- Every product must appear, even if it doesn't belong to Electronics or Sports.
-- Products from other categories should still appear, but their Category_Name should be NULL.
-- Sort by Product Price — highest to lowest.

-- Tables

-- Categories → Inventory


select Inventory.Product_Name,
       Inventory.Price,
       Categories.Category_Name

from Categories

right join Inventory
on Categories.Category_Id = Inventory.Category_Id

and Categories.Category_Name in ("Electronics", "Sports")

order by Inventory.Price desc;



       
