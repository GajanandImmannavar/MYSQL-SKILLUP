-- show databases;


-- use Joins;


-- Problem 21: Customers Who Ordered Different Products from the Same Category
-- Business scenario: An online store wants to find pairs of customers who purchased different products belonging to the same category. This helps identify customers with similar shopping interests.

-- Use the Customer, Orders, Inventory, and Categories tables.
-- Your task
-- Display these columns:
-- 1. Customer_1
-- 2. Customer_2
-- 3. Product_1
-- 4. Product_2
-- 5. Category_Name
-- Conditions
-- - Both customers must be different.
-- - Both products must belong to the same category.
-- - The products must be different.
-- - Each customer pair should appear only once for each product combination.
-- - Sort by Category_Name in ascending order.


-- SELECT
--     C1.Customer_Name AS Name_1,
--     C2.Customer_Name AS Name_2,
--     I1.Product_Name AS Product_1,
--     I2.Product_Name AS Product_2,
--     Cat.Category_Name AS Category
-- FROM Orders AS O1
-- INNER JOIN Orders AS O2
--     ON O1.Customer_ID < O2.Customer_ID
-- INNER JOIN Customer AS C1
--     ON O1.Customer_ID = C1.Customer_ID
-- INNER JOIN Customer AS C2
--     ON O2.Customer_ID = C2.Customer_ID
-- INNER JOIN Inventory AS I1
--     ON O1.Product_ID = I1.Product_ID
-- INNER JOIN Inventory AS I2
--     ON O2.Product_ID = I2.Product_ID
-- INNER JOIN Categories AS Cat
--     ON I1.Category_ID = Cat.Category_ID
--     AND I2.Category_ID = Cat.Category_ID
-- WHERE I1.Product_ID <> I2.Product_ID
-- ORDER BY Category ASC;



-- SELF JOIN — Problem 21: Products from the Same Brand with Different Ratings
-- Table: Inventory

-- Business scenario: An online store wants to compare products from the same brand to identify which products have different customer ratings.

-- Your task: Display:
-- - Product_1
-- - Product_2
-- - Brand
-- - Rating_1
-- - Rating_2
-- Conditions:
-- 1. Both products must have the same brand.
-- 2. Their ratings must be different.
-- 3. Do not compare a product with itself.
-- 4. Show each product pair only once.
-- 5. Ignore products with NULL ratings.
-- 6. Sort by brand.


SELECT
    I1.Product_Name AS Product_1,
    I2.Product_Name AS Product_2,
    I1.Brand AS Brand,
    I1.Rating AS Rating_1,
    I2.Rating AS Rating_2
FROM Inventory AS I1
INNER JOIN Inventory AS I2
    ON I1.Brand = I2.Brand
    AND I1.Product_ID < I2.Product_ID
WHERE I1.Rating <> I2.Rating
  AND I1.Rating IS NOT NULL
  AND I2.Rating IS NOT NULL
ORDER BY Brand ASC;