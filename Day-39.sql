-- show databases;

-- use Joins;



-- SELF JOIN — Problem 13: Find products from the same brand
-- Business scenario: Your shopping company wants to identify different products belonging to the same brand for cross-selling campaigns.

-- Use your existing Inventory table.
-- Requirements
-- 1. Use SELF JOIN with INNER JOIN.
-- 2. Match products with the same Brand.
-- 3. Exclude a product matching itself.
-- 4. Display each product pair only once.
-- 5. Show both product names and the common brand.
-- 6. Ignore records where Brand is NULL.
-- 7. Sort by brand name alphabetically.


-- select I1.Product_Name as Product1,
--        I2.Product_Name as Product2,
--        I1.Brand as Brand_Name

-- from Inventory as I1

-- join Inventory as I2

-- on I1.Brand = I2.Brand

-- and I1.Brand is not null

-- AND I1.Product_ID < I2.Product_ID

-- order by  Brand_Name asc;


-- Remember the difference

-- Condition	                    What it compares
-- I1.Brand = I2.Brand	            Finds products from the same brand
-- I1.Product_ID < I2.Product_ID	Keeps each product pair only once
-- I1.Brand IS NOT NULL	            Excludes products without a brand

-- Key lesson: Match using the column relevant to the task (Brand), 
-- but prevent duplicate pairs using a unique identifier (Product_ID).













-- SELF JOIN — Problem 14: Find customers from the same city and gender
-- Business scenario: An online shopping company wants to identify customers who live in the same city and 
-- have the same gender for targeted marketing campaigns.

-- Use your existing Customer table.
-- Requirements
-- 1. Use SELF JOIN with INNER JOIN.
-- 2. Match customers who have the same City.
-- 3. Match customers who have the same Gender.
-- 4. Exclude a customer matching themselves.
-- 5. Show each pair only once.
-- 6. Display both customer names, their city, and gender.
-- 7. Sort by city alphabetically.









-- select C1.Customer_Name as CUstomer_Name1,
--        C2.Customer_Name as Customer_Name2,
--        C1.Gender as Gender,
--        C1.City as City

-- from Customer as C1

-- Inner join Customer as C2

-- on C1.City = C2.City

-- and C1.Gender = C2.Gender

-- and C1.Customer_Id < C2.Customer_Id

-- order by City asc;




-- SELF JOIN — Problem 15: Find products rated higher than other products of the same brand
-- Business scenario: An online shopping company wants to compare products from the same brand to 
-- identify which products have better customer ratings.

-- Use your existing Inventory table.
-- Requirements
-- 1. Use SELF JOIN with INNER JOIN.
-- 2. Match products with the same Brand.
-- 3. The first product must have a higher Rating than the second product.
-- 4. Exclude products matching themselves.
-- 5. Display both product names, both ratings, and the brand.
-- 6. Ignore records where Brand or Rating is NULL.
-- 7. Sort by the rating difference from highest to lowest.




-- select I1.Product_Name as Low_Rated_Product,
--        I1.Rating as Rating_1,
--        I2.Product_Name as High_Rated_Product,
--        I2.Rating as Rating_2,
--        I1.Brand as Brand,
--        I2.Rating - I1.Rating as Rating_Difference

-- from Inventory as I1

-- Inner join Inventory as I2

-- on I1.Brand = I2.Brand

-- and I1.Rating < I2.Rating


-- and I1.Brand is not Null

-- and I1.Rating is not Null

-- order by Rating_Difference desc;


-- Key lesson: A correct SQL query can return zero rows when the data does not satisfy the conditions. 
-- Zero rows do not automatically mean your query is wrong.



-- SELF JOIN — Problem 16: Find customers who joined before another customer from the same city
-- Business scenario: Your shopping company wants to identify pairs of customers from the same city where one customer registered
-- earlier than the other. This can help analyse customer acquisition over time.

-- Use your existing Customer table.
-- Requirements
-- 1. Use INNER JOIN to join Customer with itself.
-- 2. Match customers from the same city.
-- 3. The first customer must have an earlier Join_Date than the second.
-- 4. Ignore records where Join_Date is NULL.
-- 5. Display both customer names, both join dates, and the city.
-- 6. Sort by the earlier join date, oldest first.


