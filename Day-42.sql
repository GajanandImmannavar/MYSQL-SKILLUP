-- show databases;


-- use Joins;


-- SELF JOIN — Problem 22: Customers Who Joined on Different Dates but Live in the Same City
-- Business scenario: A company wants to compare customers from the same city and identify who registered earlier and who registered later.

-- Table: Customer
-- Your task
-- Display these columns:
-- - Customer_1
-- - Customer_2
-- - City
-- - Join_Date_1
-- - Join_Date_2
-- Conditions
-- 1. Both customers must live in the same city.
-- 2. They must have different Customer_ID values.
-- 3. Their Join_Date values must be different.
-- 4. Show each customer pair only once.
-- 5. Display the earlier-joining customer first.
-- 6. Sort by city, then by the earlier join date.


-- select C1.Customer_Name as Custome_1,
--        C2.Customer_Name as Customer_2,
--        C1.City as City,
--        C1.Join_Date as Join_Date_1,
--        C2.Join_Date as Join_Date_2

-- from Customer as C1

-- join Customer as C2

-- on C1.City = C2.City

-- and C1.Join_Date < C2.Join_Date

-- and C1.Customer_ID <> C2.Customer_ID

-- order by City asc, Join_Date_1 asc, Join_Date_2 asc; 




-- SELF JOIN — Problem 23: Products with Ratings Differing by at Least 1 Points
-- Business scenario: An online store wants to identify products from the same category whose customer ratings differ significantly.

-- Table: Inventory

-- Display:
-- - Product_1
-- - Product_2
-- - Category_ID
-- - Rating_1
-- - Rating_2
-- - Rating_Difference
-- Conditions
-- 1. Both products must belong to the same category.
-- 2. Their ratings must differ by at least 1 points.
-- 3. Do not compare a product with itself.
-- 4. Show each pair only once.
-- 5. Ignore products with NULL ratings.
-- 6. Sort by rating difference in descending order.


-- select I1.Product_Name as Product_1,
--        I2.Product_name as Product_2,
--        I1.Category_Id as Category_Id,
--        I1.Rating as Rating_1,
--        I2.Rating as Rating_2,
--        I1.Rating - I2.Rating as Rating_Difference

-- from Inventory as I1

-- join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I1.Rating > I2.Rating

-- and   I1.Rating - I2.Rating < 2

-- and I1.Product_Id < I2.Product_Id

-- where I1.Rating is not Null

-- and I2.Rating is not Null


-- order by Rating_Difference desc;








-- SELF JOIN — Problem 24: Products from the Same Category with Different Prices
-- Business scenario: An online store wants to compare products within the same category to identify price differences.

-- Table: Inventory
-- Your task
-- Display these columns:
-- - Product_1
-- - Price_1
-- - Product_2
-- - Price_2
-- - Category_ID
-- - Price_Difference
-- Conditions
-- 1. Both products must belong to the same category.
-- 2. Their prices must be different.
-- 3. Show each product pair only once.
-- 4. Display the more expensive product first.
-- 5. Sort by Price_Difference in descending order.


-- select I1.Product_Name as Product_1,
--        I1.Price as Price_1,
--        I2.Product_Name as Product_2,
--        I2.Price as Price_2,
--        I1.Category_Id as Category_Id,
--        I1.Price - I2.Price as Price_Difference

-- from Inventory as I1

-- Inner join Inventory as I2

-- on I1.Category_Id = I2.Category_Id

-- and I1.Price > I2.Price 

-- order by Price_Difference desc;



SELF JOIN — Problem 25: Products with a Price Difference of at Least ₹10,000
Business scenario: The store wants to identify products in the same category where the more expensive product costs at least ₹10,000 more than the cheaper product.

Table: Inventory

Display:
- Product_1
- Price_1
- Product_2
- Price_2
- Category_ID
- Price_Difference
Conditions:
1. Both products belong to the same category.
2. The prices must differ by at least ₹10,000.
3. Show the more expensive product first.
4. Show each pair once.
5. Sort by price difference descending.











