-- use Day8;

-- 🟠 HAVING – Level 5 | Problem 11 (Real Business Scenario)
-- 🏢 Business Scenario

-- An electronics retail company is planning to expand into new cities.

-- Before opening new stores, the operations manager wants to identify product categories that have strong customer demand.

-- He is interested only in products that are currently being sold and have received good customer feedback.

-- Products supplied by brands whose names end with the letter 'y' should be excluded because those brands are ending their partnership with the company.

-- The manager also wants to ignore products that are too inexpensive, since they do not represent the premium market segment.

-- Finally, he wants to consider only those categories whose total inventory is sufficient to support a new store launch.

-- 📝 Main Problem

-- Write an SQL query to display:

-- Category
-- Total Stock

-- Alias:

-- TOTAL_STOCK

-- Sort the result:

-- Highest total stock first.
-- If two categories have the same stock, display the category name alphabetically.

-- Important: I have intentionally not given any SQL conditions. You must translate the business scenario into SQL.




-- select  Category , sum(Stock) as Total_Stock 
-- from Product 
-- where Brand not like "%y" 
--       and Price >= 50000  and Product_Status = "Available" 
--       and Rating >=4 
--       group by Category 
--       having Sum(Stock) >40
--       order by Total_stock desc , Category asc;



-- 🔄 Revision Challenge (No GROUP BY)
-- 🏢 Business Scenario

-- The purchasing manager wants a list of unique supplier cities from which the company buys sports and furniture products.

-- He is interested only in products that:

-- cost between ₹10,000 and ₹60,000
-- have received good customer feedback

-- Display only the city names.

-- Sort alphabetically.



-- select distinct Supplier_City 
-- from Product 
-- where Category in ('Sports','Furniture')
--       and Price between 10000 and 60000
--       and Rating >=4
--       order by Supplier_City asc;


-- ⭐ Bonus Problem
-- 🏢 Business Scenario

-- The CEO wants to know the average selling price of products in each category that are currently available for sale.

-- Display:

-- Category
-- Average Price

-- Sort by:

-- Highest average price
-- Category name






-- select Category ,avg(Price)as Average_Price
-- from Product 
-- where Product_Status = "Available"
-- group by Category
-- order by Average_Price desc, Category asc;






-- 🟠 HAVING – Level 5 | Problem 12
-- 🏢 Business Scenario

-- A retail company wants to identify supplier cities that can support a new premium product campaign.

-- The warehouse manager is interested only in products that:

-- are currently being sold
-- have received good customer feedback (Rating 4 or above)
-- are not Grocery products
-- belong to brands whose names do not start with 'P'
-- are not inexpensive (Assume premium products cost ₹40,000 or more)

-- The manager wants to consider only those supplier cities whose combined stock is greater than 60 units.

-- 📝 Main Problem

-- Write an SQL query to display:

-- Supplier City
-- Total Stock

-- Alias:

-- TOTAL_STOCK

-- Sort the result:

-- Highest total stock first.
-- If two cities have the same total stock, display the city name alphabetically.


-- select supplier_city , sum(Stock) as Total_Stock 
-- from Product 
-- where Product_status = "Available" 
--       and Category not in ('Grocery')
--       and brand not like 'P%'
--       and Price >=40000
--       and Rating >=4
-- group by Supplier_City
-- having Sum(Stock) > 40
-- order BY Total_Stock desc, supplier_City asc;




-- SQL Execution Flow (This is the order SQL actually follows)

-- FROM Product
--         │
--         ▼
-- WHERE Product_Status='AVAILABLE'
--         │
--         ▼
-- Category NOT IN('GROCERY')
--         │
--         ▼
-- Brand NOT LIKE 'P%'
--         │
--         ▼
-- Price >=40000
--         │
--         ▼
-- Rating >=4
--         │
--         ▼
-- GROUP BY Supplier_City
--         │
--         ▼
-- SUM(Stock)
--         │
--         ▼
-- HAVING SUM(Stock)>40
--         │
--         ▼
-- SELECT Supplier_City, SUM(Stock)
--         │
--         ▼
-- ORDER BY Total_Stock DESC,
--          Supplier_City ASC
--         │
--         ▼
-- FINAL OUTPUT


-- select * from Product;






-- 🔄 Revision Challenge (No GROUP BY)
-- 🏢 Business Scenario

-- The purchasing manager wants the unique brands that:

-- belong to Electronics or Sports
-- have a price between ₹20,000 and ₹80,000
-- contain the letter 'o' anywhere in the product name
-- have a rating of 4 or 5

-- Display only the brand names.

-- Sort alphabetically.


-- select distinct Brand
-- from Product 
-- where price between 20000 and 80000
--       and Category in ('Electronics', 'Sports')
--       and Product_Name like '%o%'
--       and Rating >=4
--       order by Brand asc;




-- ⭐ Bonus Problem
-- 🏢 Business Scenario

-- The CEO wants to know the lowest available product price in each category.

-- Display:

-- Category
-- Lowest Price

-- Sort by:

-- Lowest price first.
-- Category alphabetically.




 

select Category, min(Price) as Lowest_Price
from Product
where Product_Status = "AVAILABLE"
group by category
order by min(Price) asc, category asc;




