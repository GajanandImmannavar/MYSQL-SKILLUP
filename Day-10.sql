-- use Day8;


-- select *from product;


-- 📝 Problem Statement

-- Write an SQL query to calculate the total stock from the Product table.

-- Display the result with the alias:

-- TOTAL_STOCK

-- 📚 Topics Covered
-- ✅ SUM()
-- ✅ Alias (AS)

-- select sum(Stock) as TOTAL_STOCK
-- from Product;




-- ⭐ Interview Bonus 1
-- 🏢 Business Scenario

-- The finance team wants to know the total value of all AVAILABLE products.

-- Write an SQL query to calculate the sum of:

-- PRICE

-- where

-- PRODUCT_STATUS = 'AVAILABLE'

-- Display the result as

-- TOTAL_AVAILABLE_PRICE

-- 📚 Topics Covered
-- ✅ SUM()
-- ✅ WHERE



-- select sum(Price) as TOTAL_AVAILABLE_PRICE
-- from Product
-- where PRODUCT_STATUS = 'AVAILABLE';




-- ⭐ Interview Bonus 2 (Revision)

-- The electronics manager wants to know the total stock of products where:

-- CATEGORY = 'ELECTRONICS'
-- RATING >= 4

-- Display the result as

-- ELECTRONICS_STOCK

-- 📚 Topics Covered
-- ✅ SUM()
-- ✅ WHERE
-- ✅ AND
-- ✅ >=

-- select sum(Stock) as ELECTRONICS_STOCK
-- from Product
-- where category = "ELECTRONICS" and Rating >= 4;


-- 💡 Interview Tip

-- A very common interview mistake is confusing:

-- SUM(STOCK)

-- with

-- COUNT(STOCK)

-- Remember:

-- COUNT(STOCK) ➜ How many stock values exist?
-- SUM(STOCK) ➜ What is the total stock quantity?


-- ⭐ Interview Question

-- Which query calculates the total stock?

-- A)

-- SELECT SUM(STOCK)
-- FROM Product;

-- B)

-- SELECT COUNT(STOCK)
-- FROM Product;

-- Your answer:

-- A

-- ✅ Correct.

-- A better interview explanation would be:

-- SUM(STOCK) adds all stock quantities together and returns the total inventory.
-- COUNT(STOCK) counts how many non-NULL stock values exist; it does not add them.




-- 🏢 Business Scenario

-- The finance manager wants to know the average price of all products in the inventory.

-- 📝 Problem Statement

-- Write an SQL query to calculate the average price of all products.

-- Display the result with the alias:

-- AVERAGE_PRICE

-- 📚 Topics Covered
-- ✅ AVG()
-- ✅ Alias (AS)


-- select avg(price) as AVERAGE_PRICE 
-- from Product;




-- 🏢 Business Scenario

-- The quality manager wants to know the average rating of all available products.

-- Write an SQL query to calculate the average:

-- RATING

-- where

-- PRODUCT_STATUS = 'AVAILABLE'

-- Display the result as:

-- AVERAGE_RATING


-- 📚 Topics Covered
-- ✅ AVG()
-- ✅ WHERE

-- select avg(Rating) as AVERAGE_RATING 
-- from Product  
-- where PRODUCT_STATUS = "AVAILABLE";




-- ⭐ Interview Bonus 2 (Revision)

-- The electronics manager wants to know the average price of products where:

-- CATEGORY = 'ELECTRONICS'
-- RATING >= 4

-- Display the result as:

-- AVERAGE_ELECTRONICS_PRICE


-- select avg(Price) as AVERAGE_ELECTRONIC_PRICE
-- from Product 
-- where CATEGORY = 'ELECTRONICS'
--       and  RATING >= 4


-- 🧠 Interview Tip

-- Many beginners think:

-- AVG(column)

-- is the same as:

-- SUM(column) / COUNT(*)

-- This is not always true because AVG() ignores NULL, while COUNT(*) counts every row.








