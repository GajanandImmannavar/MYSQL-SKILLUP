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




-- select I1.Product_Name as PRoduct_1,
--        I1.Price as I1_Price,
--        I2.Product_Name as Product_2,
--        I2.Price as I2_Price,
--        I1.Category_Id as Category_Id,
--        I2.Price - I1.Price as Price_Deference

-- from Inventory as I1

-- Inner Join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I1.Price < I2.Price

-- and I2.Price - I1.Price >=5000

-- order by Price_Deference desc;


-- One small point: the next problem asks for a price ratio, not a price difference. These are different calculations:

-- Calculation	        Formula	                           Example
-- Price difference	I2.Price - I1.Price	        ₹8,000 − ₹2,000 = ₹6,000
-- Price ratio	        I2.Price / I1.Price	        ₹8,000 / ₹2,000 = 4.0


-- Problem 6 — SELF JOIN: Price Ratio
-- Business scenario: The store wants to find products in the same category where the costlier product costs at least twice as much as the cheaper product.

-- Write a query that:
-- 1. Uses SELF JOIN on Inventory.
-- 2. Matches products in the same category.
-- 3. Ensures the first product is cheaper.
-- 4. Displays both product names and prices.
-- 5. Calculates the price ratio.
-- 6. Includes only pairs where the ratio is at least 2.
-- 7. Sorts by ratio in descending order.

-- select I1.Product_Name as Product_P1,
--        I1.Price as P1_Price,
--        I2.Product_Name as Product_P2,
--        I2.Price as P2_Price,
--        I2.Price / I1.Price as Price_Ratio

-- from Inventory as I1

-- inner join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I1.Price < I2.Price

-- and I2.Price / I1.Price >=2


-- order by Price_Ratio desc;



-- Problem 7 — SELF JOIN (Intermediate to Advanced)

-- Business scenario: The store wants to find products in the same category where the costlier product costs 
-- at least twice as much as the cheaper product, 
-- but the price difference must also be at least ₹10,000.

-- Write a query that:
-- 1. Uses SELF JOIN on Inventory.
-- 2. Matches products in the same category.
-- 3. Ensures the first product is cheaper.
-- 4. Calculates the price difference and price ratio.
-- 5. Filters for a ratio of at least 2.
-- 6. Filters for a price difference of at least ₹10,000.
-- 7. Sorts by price difference from highest to lowest.




-- select I1.Product_Name as Cheaper_Product,
--        I1.Price as Cheaper_Price,
--        I2.Product_Name as Costlier_Product,
--        I2.Price as  Costlier_Price,
--        I2.Price - I1.Price as Price_Difference,
--        I2.Price / I1.Price as Price_Ratio

-- from Inventory as I1

-- inner join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I2.Price / I1.Price >=2

-- and I2.Price > I1.Price

-- and I2.Price - I1.Price >=10000

-- order by Price_difference desc;

-- Small improvement
-- You can write the cheaper-product condition as:
-- I1.Price < I2.Price

-- Problem 8 — SELF JOIN (Advanced)

-- Business scenario: The store wants to compare products in the same category and 
-- identify pairs where the cheaper product costs between ₹2,000 and ₹20,000, inclusive, and 
-- the costlier product is at least three times its price.

-- Write a query that:
-- 1. Uses SELF JOIN on Inventory.
-- 2. Matches products in the same category.
-- 3. Ensures the first product is cheaper.
-- 4. Filters the cheaper product's price using BETWEEN.
-- 5. Requires a price ratio of at least 3.
-- 6. Displays both product names, both prices, and the price ratio.
-- 7. Sorts by price ratio in descending order.




















select I1.Product_Name as Cheaper_Product,
       I1.Price as Cheaper_Price,
       I2.Product_Name as Costlier_Product,
       I2.Price as Costlier_Price,
       I2.Price / I1.Price as Price_Ratio

from Inventory as I1

Inner Join Inventory as I2

on I1.Category_Id = I2.Category_Id

and I1.Price < I2.Price

and I1.Price between 2000 and 20000

AND I2.Price / I1.Price >= 3


order by Price_Ratio desc;


-- Query review
-- Requirement	Your condition	Status
-- Match products in the same category	I1.Category_Id = I2.Category_Id	Correct
-- Ensure the first product is cheaper	I1.Price < I2.Price	Correct
-- Filter cheaper prices from ₹2,000 to ₹20,000	I1.Price BETWEEN 2000 AND 20000	Correct
-- Costlier product is at least 3 times as expensive	I2.Price / I1.Price >= 3	Correct
-- Display the price ratio	I2.Price / I1.Price AS Price_Ratio	Correct
-- Sort highest ratio first	ORDER BY Price_Ratio DESC	Correct