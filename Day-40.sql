-- show databases;


-- use Joins;


-- SELF JOIN — Problem 17: Find customers who share a phone number
-- Business scenario: The shopping company wants to detect customer accounts that use the same phone number, 
-- which may indicate duplicate registrations.

-- Use your Customer table.
-- Requirements
-- 1. Use INNER JOIN on Customer with itself.
-- 2. Match customers with the same phone number.
-- 3. Exclude self-matches and reversed duplicate pairs.
-- 4. Ignore NULL phone numbers.
-- 5. Display both customer names, both customer IDs, and the shared phone number.


-- select C1.Customer_Id as CUstomer_Id_1,
--        C1.Customer_Name as Customer_Name_1,
--        C2.Customer_Id as Customer_Id_2,
--        C2.Customer_Name as Customer_Name_2,
--        C1.Phone as Phone


-- from Customer as C1

-- inner join Customer as C2

-- on C1.Phone =  C2.Phone

-- and C1.Customer_Id < C2.Customer_Id

-- and C1.Phone is not Null;


-- Next: Problem 18 — Find products in the middle of their category's price range
-- Business scenario: The store wants to find products that have at least one cheaper product and 
-- at least one costlier product in the same category.

-- Use your Inventory table.
-- Requirements
-- 1. Use SELF JOIN.
-- 2. Match products in the same category.
-- 3. Identify products that have both a cheaper and a costlier product in their category.
-- 4. Display each qualifying product only once.
-- 5. Show the product name, price, and category ID.
-- 6. Sort by category ID, then price ascending.


-- SELECT DISTINCT
--     I1.Product_Name AS Product_Name,
--     I1.Price AS Price,
--     I1.Category_ID AS Category_ID
-- FROM Inventory AS I1
-- INNER JOIN Inventory AS I2
--     ON I1.Category_ID = I2.Category_ID
--     AND I2.Price < I1.Price
-- INNER JOIN Inventory AS I3
--     ON I1.Category_ID = I3.Category_ID
--     AND I3.Price > I1.Price
-- ORDER BY Category_ID ASC, Price ASC;














-- MySQL SELF JOIN — Notes from Problem 18
-- 1. What did we learn?
-- In this problem, we learned how to find products that have at least one cheaper product and at least one costlier product in the same category.

-- The important new concept is that sometimes one SELF JOIN is not enough. We can join the same table multiple times to check different conditions.
-- 2. The problem scenario
-- Suppose the Inventory table contains these products:
-- Product_Name	Price	Category_ID
-- Mouse	₹500	1
-- Keyboard	₹1,000	1
-- Monitor	₹5,000	1
-- Laptop	₹30,000	1

-- We want to find products that have both a cheaper and a costlier product in their category.

-- Expected output:
-- Product_Name	Price	Category_ID
-- Keyboard	₹1,000	1
-- Monitor	₹5,000	1

-- - Mouse is excluded because nothing in its category is cheaper.
-- - Laptop is excluded because nothing in its category is costlier.
-- - Keyboard and Monitor qualify because each has at least one cheaper and one costlier product.
-- 3. The complete query
-- SELECT DISTINCT
--     I1.Product_Name AS Product_Name,
--     I1.Price AS Price,
--     I1.Category_ID AS Category_ID
-- FROM Inventory AS I1
-- INNER JOIN Inventory AS I2
--     ON I1.Category_ID = I2.Category_ID
--     AND I2.Price < I1.Price
-- INNER JOIN Inventory AS I3
--     ON I1.Category_ID = I3.Category_ID
--     AND I3.Price > I1.Price
-- ORDER BY Category_ID ASC, Price ASC;


-- 4. Understand the three table references
-- I1 — Main product

-- The product we want to check.


-- I2 — Cheaper product
-- I2.Price < I1.Price


-- Must be in the same category as I1.


-- I3 — Costlier product
-- I3.Price > I1.Price


-- Must also be in the same category as I1.


-- Both are INNER JOIN operations. Therefore, I1 must have at least one matching cheaper product and at least one matching costlier product to appear in the final result.
-- 5. Why did we use DISTINCT?
-- Suppose Keyboard has:
-- - One cheaper product.
-- - Two costlier products.
-- The joins can generate multiple rows for Keyboard. But the task asks us to display each qualifying product only once.
-- SELECT DISTINCT


-- removes duplicate rows from the selected output.

-- Remember: Multiple matching rows can arise when a product has multiple cheaper and costlier products.
-- 6. Important concepts to remember
-- Concept	                    What you learned
-- SELF JOIN	                Joining a table with itself
-- Multiple SELF JOINs	        Using the same table more than twice
-- Aliases	I1, I2, and I3      distinguish each reference
-- INNER JOIN	                Requires matching rows for each join
-- < and >	                    Identify cheaper and costlier products
-- DISTINCT	                Removes duplicate output rows
-- ORDER BY	                Sorts the final output

-- 7. The biggest lesson
-- Previously, you mostly used one SELF JOIN to compare two records. In this problem, you learned to use two separate joins to verify two different relationships.
-- - One join checks for a cheaper product.
-- - Another join checks for a costlier product.
-- This pattern is useful whenever a problem requires a record to satisfy multiple relationships with other records in the same table.

-- SELF JOIN — Problem 19: Find products with the same rating but different prices
-- Business scenario: Your shopping company wants to compare products that have the same customer rating but different prices, to help customers find better-value alternatives.

-- Use your existing Inventory table.
-- Requirements
-- 1. Use INNER JOIN to join Inventory with itself.
-- 2. Match products with the same Rating.
-- 3. Only include pairs where the prices are different.
-- 4. Show each product pair only once.
-- 5. Ignore records where Rating is NULL.
-- 6. Display both product names, both prices, their common rating, and the price difference.
-- 7. Sort by the price difference from largest to smallest.





-- select I1.Product_Name as Product_1,
--        I1.Price as Price_1,
--        I2.Product_Name as Product_2,
--        I2.Price as Price_2,
--        I1.Rating as Rating,
--        I2.Price - I1.Price as Price_Difference

-- from Inventory as I1

-- inner join Inventory as I2

-- on I1.Price <> I2.Price

-- and I1.Rating = I2.Rating

-- and I1.Product_Id < I2.Product_Id

-- where I1.Rating is not null

-- order by Price_Difference desc;



-- Problem 20: Customers Who Ordered the Same Product

-- Business scenario: An online store wants to identify customers who purchased the same product. 
-- This helps the business understand which customers share similar buying interests.

-- Use the Customer, Orders, and Inventory tables.
-- Your task
-- Write an SQL query to display:
-- 1. First customer's name
-- 2. Second customer's name
-- 3. Product name
-- 4. First customer's order date
-- 5. Second customer's order date
-- Conditions
-- - Both customers must have ordered the same product.
-- - They must be different customers.
-- - Show each customer pair only once for each product.
-- - Display only pairs where both customers ordered the product on different dates.
-- - Sort by product name.






SELECT
    C1.Customer_Name AS Customer_1,
    C2.Customer_Name AS Customer_2,
    I.Product_Name AS Product_Name,
    O1.Order_Date AS Order_Date1,
    O2.Order_Date AS Order_Date2
FROM Orders AS O1
INNER JOIN Orders AS O2
    ON O1.Product_ID = O2.Product_ID
    AND O1.Customer_ID < O2.Customer_ID
    AND O1.Order_Date <> O2.Order_Date
INNER JOIN Customer AS C1
    ON O1.Customer_ID = C1.Customer_ID
INNER JOIN Customer AS C2
    ON O2.Customer_ID = C2.Customer_ID
INNER JOIN Inventory AS I
    ON O1.Product_ID = I.Product_ID
ORDER BY Product_Name ASC;






-- select C1.Customer_Name as Customer_1,
--        C2.Customer_Name as Customer_2,
--        I1.Product_Name as Product_Name,
--        O1.Order_Date as Order_Date1,
--        O2.Order_Date as Order_Date2

-- from Customer as C1 

-- inner join Orders as O1

-- on C1.Customer_Id = O1.Customer_Id

-- from Orders as O1

-- inner join Inventory as I1

-- on O1.Product_Id = I1.Product_Id

-- and C1.Customer_Id < C2.Customer_Id

-- and I1.Product_Name = I2.Product_Name

-- order by Product_Name asc;