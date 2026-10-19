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


-- SELF JOIN — Problem 3 (Basic to Intermediate)
-- Scenario: Your shopping company wants to compare product prices to find which products are cheaper than other products.
-- Write a query using Inventory that:
-- 1. Uses SELF JOIN.
-- 2. Displays the cheaper product and its price.
-- 3. Displays the costlier product and its price.
-- 4. Only returns pairs where the first product costs less than the second.
-- 5. Sorts by the cheaper product's price in ascending order.


-- select I1.Product_Name as Cheaper_Product,
--        I1.Price as Cheaper_Price,
--        I2.Product_Name as Costlear_Product,
--        I2.Price as Costly_Price

-- from Inventory as I1

-- inner join Inventory as I2

-- on I1.Price < I2.Price

-- and I1.Product_Id < I2.Product_Id

-- order by Cheaper_Price asc;



-- Business scenario: The shopping company wants to compare products in the same category and find products with different prices.

-- Write a query using your Inventory table that:
-- 1. Uses SELF JOIN.
-- 2. Matches products with the same Category_ID.
-- 3. Shows only pairs where the first product is cheaper than the second.
-- 4. Displays both product names, both prices, and the category ID.
-- 5. Sorts by category ID and then cheaper price, both ascending.



-- select I1.Product_Name as Product1,
--        I2.Product_Name as Product2,
--        I1.Price as P1_Price,
--        I2.Price as P2_Price,
--        I1.Category_ID as Category_Id

-- from Inventory as I1

-- inner join Inventory as I2

-- on I1.Price < I2.Price

-- and I1.Category_ID = I2.Category_Id
    
-- order by I1.Category_Id asc, I1.Price asc;





-- Problem 5 — Apply what you learned
-- Business scenario: The store wants to find products in the same category where the price difference is at least ₹5,000.

-- Write a query using Inventory that:
-- 1. Uses SELF JOIN.
-- 2. Matches products in the same category.
-- 3. Ensures the first product is cheaper than the second.
-- 4. Calculates the price difference.
-- 5. Keeps only pairs with a difference of at least ₹5,000.
-- 6. Displays both product names, both prices, the category ID, and the price difference.
-- 7. Sorts by price difference from highest to lowest.




select I1.Product_Name as PRoduct_1,
       I1.Price as I1_Price,
       I2.Product_Name as Product_2,
       I2.Price as I2_Price,
       I1.Category_Id as Category_Id,
       I2.Price - I1.Price as Price_Deference

from Inventory as I1

Inner Join Inventory as I2

on I1.Category_Id = I2.Category_Id

and I1.Price < I2.Price

and I2.Price - I1.Price >=5000

order by Price_Deference desc;