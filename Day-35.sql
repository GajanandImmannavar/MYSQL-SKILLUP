-- show databases;

-- use Joins;

-- show tables;

-- 🏢 Business Scenario
-- The marketing team wants to generate every possible combination of customers and products, then identify how many qualifying combinations belong to each customer city.
-- Display


-- - Customer City
-- - Total Combinations
-- - Average Product Price
-- - Maximum Product Rating

-- Tables
-- Customer
-- Inventory


-- Requirements
-- 1. Use CROSS JOIN to generate every possible customer-product combination.
-- 2. Include customers from BENGALURU, MUMBAI, PUNE, or HYDERABAD.
-- 3. Exclude customers whose gender is Female.
-- 4. Product price must be between ₹2,000 and ₹60,000.
-- 5. Product rating must be at least 3.
-- 6. Exclude products with status DISCONTINUED or OUT OF STOCK.
-- 7. Count qualifying combinations using COUNT(*).
-- 8. Calculate average product price using AVG().
-- 9. Calculate maximum rating using MAX().
-- 10. Group results by customer city.
-- 11. Show only cities with more than 5 qualifying combinations using HAVING.
-- 12. Sort by total combinations from highest to lowest.
-- Concepts tested
-- CROSS JOIN, WHERE, IN, NOT IN, BETWEEN, COUNT(*), AVG(), MAX(), GROUP BY, HAVING, and ORDER BY.


SELECT Customer.City,
       COUNT(*) AS Total_Combinations,
       AVG(Inventory.Price) AS Average_Product_Price,
       MAX(Inventory.Rating) AS Maximum_Rating

FROM Customer
CROSS JOIN Inventory

WHERE Customer.City IN ('BENGALURU', 'MUMBAI', 'PUNE', 'HYDERABAD')
AND Customer.Gender NOT IN ('Female')
AND Inventory.Price BETWEEN 2000 AND 60000
AND Inventory.Rating >= 3
AND Inventory.Product_Status NOT IN ('DISCONTINUED', 'OUT OF STOCK')

GROUP BY Customer.City

HAVING COUNT(*) > 5

ORDER BY COUNT(*) DESC;