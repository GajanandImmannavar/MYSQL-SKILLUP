-- show databases;


-- use Joins;

-- SELF JOIN — Problem 1 (Basic)

-- Business scenario: An online shopping company wants to find customers who live in the same city so it can plan city-based promotions.
-- Use your existing Customer table.

-- Requirements
-- 1. Use a SELF JOIN.
-- 2. Display both customer names and their city.
-- 3. Match customers who live in the same city.
-- 4. Do not match a customer with themselves.
-- 5. Do not show duplicate pairs in reverse order.



-- select C1.Customer_Name as Customer_1,
--        C2.Customer_Name as Customer_2,
--        C1.City

-- from Customer as C1

-- Inner join Customer as C2

-- on C1.City = C2.City

-- and C1.Customer_Id < C2.Customer_Id;



-- SELF JOIN — Problem 2 (Basic)
-- Business scenario: Your shopping company wants to identify different products that have the same price.

-- Use your Inventory table.

-- Requirements:
-- 1. Use a SELF JOIN on Inventory.
-- 2. Display both product names and their common price.
-- 3. Match products with equal prices.
-- 4. Do not match a product with itself.
-- 5. Show each pair only once.



-- select I1.Product_Name as Product_1,
--        I2.Product_Name as Product_2,
--        I1.Price

-- from Inventory as I1

-- Inner join Inventory as I2

-- on I1.Price = I2.Price

-- and I1.Product_ID < I2.Product_ID;


SELF JOIN — Problem 3 (Basic to Intermediate)
Scenario: Your shopping company wants to compare product prices to find which products are cheaper than other products.
Write a query using Inventory that:
1. Uses SELF JOIN.
2. Displays the cheaper product and its price.
3. Displays the costlier product and its price.
4. Only returns pairs where the first product costs less than the second.
5. Sorts by the cheaper product's price in ascending order.