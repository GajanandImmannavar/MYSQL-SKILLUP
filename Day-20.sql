-- use Joins;


-- Business Scenario

-- A retail company is planning a Premium Customer Reward Program.

-- The marketing manager wants a report of customers who have purchased high-value products from trusted suppliers.

-- Only consider products that:

-- are currently available
-- have a rating of 4 or higher
-- cost more than ₹40,000
-- are not from brands starting with 'N'

-- Only consider suppliers located in:

-- BENGALURU
-- HYDERABAD
-- MUMBAI

-- Display:

-- Customer Name
-- Product Name
-- Brand
-- Supplier Name
-- Price
-- Payment Method

-- Sort by:

-- Customer Name (A → Z)
-- Price (Highest → Lowest)


-- select Customer.Customer_Name, Inventory.Product_Name, Inventory.Brand,
--  Supplier.Supplier_Name, Inventory.Price, Orders.Payment_Method
-- from Customer
-- join Orders
-- on Customer.Customer_ID = Orders.Customer_ID
-- join Inventory
-- on Orders.Product_ID = Inventory.Product_ID
-- join Supplier
-- on Inventory.Supplier_ID = Supplier.Supplier_ID
-- where Inventory.Product_Status = 'AVAILABLE'
--     and Inventory.Rating >= 4
--     and Inventory.Price > 40000
--     and Inventory.Brand not like 'N%'
--     and Supplier.Supplier_City in ('BENGALURU', 'HYDERABAD', 'MUMBAI')
--     order by Customer.Customer_Name asc, Inventory.Price desc;


-- ⭐ Interview Tip

-- Interviewers love this question:

-- How do you know which table should be joined next?

-- Professional Answer

-- I follow the relationship defined by the Primary Key and Foreign Key. I don't guess the JOIN order.
-- I first identify which table contains the required column and then connect it through the related foreign key.

--     🔗 Table Relationship
-- Customer
--     │
--     │ Customer_ID
--     ▼
-- Orders
--     │
--     │ Product_ID
--     ▼
-- Inventory
--     │
--     │ Supplier_ID
--     ▼
-- Supplier
-- 🧠 SQL Execution Order
-- 1. FROM Customer

--         │
--         ▼

-- 2. JOIN Orders

--         │
--         ▼

-- 3. JOIN Inventory

--         │
--         ▼

-- 4. JOIN Supplier

--         │
--         ▼

-- 5. WHERE
--    • Product_Status = AVAILABLE
--    • Rating >= 4
--    • Price > 40000
--    • Brand NOT LIKE 'N%'
--    • Supplier_City IN (...)

--         │
--         ▼

-- 6. SELECT
--    • Customer Name
--    • Product Name
--    • Brand
--    • Supplier Name
--    • Price
--    • Payment Method

--         │
--         ▼

-- 7. ORDER BY
--    Customer Name ASC
--    Price DESC

--         │
--         ▼

-- 8. Final Result
-- 💡 Concepts Practiced

-- ✅ INNER JOIN (4 Tables)

-- ✅ Multiple JOINs

-- ✅ WHERE

-- ✅ AND

-- ✅ NOT LIKE

-- ✅ IN

-- ✅ ORDER BY (Multiple Columns)

-- ⭐ Interview Tip

-- Notice how each table contributes specific information:

-- Table	Information Used
-- Customer	Customer_Name
-- Orders	Payment_Method
-- Inventory	Product_Name, Brand, Price, Rating, Product_Status
-- Supplier	Supplier_Name, Supplier_City

-- This is a common interview pattern. Before writing a JOIN query, ask yourself:

-- Which columns do I need?
-- Which table contains each column?
-- How are those tables related?

-- Once you answer those three questions, the JOIN conditions become much easier to write.



-- 🔄 Revision Problem (Don't Solve Yet)
-- 🏢 Business Scenario

-- The warehouse manager wants to identify the unique customer cities from which orders have been placed.

-- Consider only orders where:

-- the product belongs to Electronics or Sports
-- the product is Available
-- the payment was Paid
-- the product price is between ₹20,000 and ₹90,000

-- Display only:

-- Customer City

-- Remove duplicate cities.

-- Sort alphabetically.

-- 📚 Revision Concepts
-- ✅ INNER JOIN
-- ✅ DISTINCT
-- ✅ WHERE
-- ✅ BETWEEN
-- ✅ IN
-- ✅ ORDER BY


-- select distinct Customer.City
-- from customer 
-- join Orders
-- on Orders.Customer_ID = Customer.Customer_ID
-- join Inventory
-- on Orders.Product_ID = Inventory.Product_ID
-- join Categories
-- on Inventory.Category_ID = Categories.Category_ID
-- where Categories.Category_Name in ('Electronics', 'Sports')
--     and Inventory.Product_Status = 'AVAILABLE'
--     and Orders.Payment_Status = 'PAID'
--     and Inventory.Price between 20000 and 90000
--     order by Customer.City asc;


--     ⭐ Interview Tip

-- A common interview question is:

-- How do you know whether you need another JOIN?

-- Professional Answer

-- I check where the required column is stored.
-- If the required column is not available in the currently joined tables, 
-- I join the related table using its Primary Key–Foreign Key relationship.

-- 🔗 Table Relationship

-- Customer
--     │
--     │ Customer_ID
--     ▼
-- Orders
--     │
--     │ Product_ID
--     ▼
-- Inventory
--     │
--     │ Category_ID
--     ▼
-- Categories

-- 🧠 SQL Execution Flow

-- Customer
--     │
--     ▼
-- JOIN Orders
--     │
--     ▼
-- JOIN Inventory
--     │
--     ▼
-- JOIN Categories
--     │
--     ▼
-- WHERE
--  • Category IN ('Electronics', 'Sports')
--  • Product_Status = AVAILABLE
--  • Payment_Status = PAID
--  • Price BETWEEN 20000 AND 90000
--     │
--     ▼
-- SELECT DISTINCT Customer.City
--     │
--     ▼
-- ORDER BY Customer.City ASC
--     │
--     ▼
-- Final Output
        






