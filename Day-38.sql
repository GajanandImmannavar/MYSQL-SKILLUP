-- show databases;


-- use Joins;

-- SELF JOIN — Problem 9 (Advanced)
-- Business scenario: Your shopping store wants to compare products within the same category and identify products where the cheaper product costs between ₹5,000 and ₹25,000, and the costlier product is at least twice as expensive.

-- Use your existing Inventory table.
-- Requirements
-- 1. Use SELF JOIN with INNER JOIN.
-- 2. Match products with the same Category_ID.
-- 3. Ensure the first product is cheaper than the second.
-- 4. Filter the cheaper product's price between ₹5,000 and ₹25,000, inclusive.
-- 5. Require the costlier product's price to be at least twice the cheaper product's price.
-- 6. Display both product names, both prices, the category ID, and the price difference.
-- 7. Sort by price difference in descending order.


-- select I1.product_Name as Product1_Name, 
--        I1.Price as CheaperPrice,
--        I2.product_Name as Product2_Name, 
--        I2.Price as CostlyierPrice, 
--        I2.Category_Id as categoryId2, 
-- I2.Price - I1.Price as Price_Difference
-- from Inventory as I1

-- join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I1.Price < I2.Price

-- and I1.Price between 5000 and 25000

-- and I2.price >= I1.Price*2

-- order by I2.Price - I1.Price desc;



-- SELF JOIN — New Problem 11: Find duplicate customer emails
-- Business scenario: The shopping company wants to identify whether multiple customer records use the same email address.

-- Use your Customer table.
-- Requirements
-- 1. Use SELF JOIN.
-- 2. Match customers with the same email address.
-- 3. Exclude a customer matching themselves.
-- 4. Show each pair only once.
-- 5. Display both customer IDs, both names, and the common email.
-- 6. Ignore records where the email is NULL.


select C1.Customer_Id as CustomerID,
       C1.Customer_Name as Customer_Name,
       C2.Customer_Id as CustomerId,
       C2.Customer_Name as Customer_Name,
       C1.Email as Email

from Customer as C1

join Customer as C2

on C1.Email = C2.Email

and C1.Customer_Id < C2.Customer_Id

and C1.Email is not null;
       