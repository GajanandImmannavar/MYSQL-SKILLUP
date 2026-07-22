-- use Day8;

-- select * from Product;



-- 🏢 Business Scenario

-- The warehouse manager wants to identify supplier cities where the average price of AVAILABLE products is greater than ₹20,000.

-- However, he wants to analyze only products that satisfy the following conditions:

-- Product is AVAILABLE
-- Rating is 4 or 5
-- Category is not GROCERY
-- Brand name does not end with 'a'
-- 📝 Main Problem

-- Write an SQL query to display:

-- SUPPLIER_CITY
-- Average Price

-- Display the average price with the alias:

-- AVERAGE_PRICE

-- Show only those supplier cities where:

-- PRODUCT_STATUS = 'AVAILABLE'
-- RATING >= 4
-- CATEGORY NOT IN ('GROCERY')
-- BRAND NOT LIKE '%a'
-- AVERAGE_PRICE > 20000

-- Sort the result by:

-- AVERAGE_PRICE DESC
-- SUPPLIER_CITY ASC


-- select SUPPLIER_CITY, avg(price) as  AVERAGE_PRICE
-- from Product
-- where  PRODUCT_STATUS = 'AVAILABLE' AND
-- RATING >= 4        AND
-- CATEGORY NOT IN ('GROCERY')  AND
-- BRAND NOT LIKE '%a' 

-- group by SUPPLIER_CITY 
-- having AVERAGE_PRICE > 20000
-- order by  AVERAGE_PRICE DESC ,
-- SUPPLIER_CITY ASC;





-- 🔄 Revision Challenge (Old Topics)

-- No GROUP BY in this question.

-- The marketing team wants to display all unique brands that:

-- Belong to ELECTRONICS or FURNITURE
-- Price is between ₹15,000 and ₹80,000
-- Supplier city starts with 'B'

-- Display only the brand names.

-- Sort them alphabetically.

-- 📚 Topics Revised
-- ✅ DISTINCT
-- ✅ WHERE
-- ✅ IN
-- ✅ BETWEEN
-- ✅ LIKE
-- ✅ ORDER BY


-- select DISTINCT Brand
-- from Product 
-- where Category in ('ELECTRONICS', 'FURNITURE') AND
-- price BETWEEN 15000 and 80000 and supplier_city like 'B%'
-- order by  Brand asc;


-- ⭐ Bonus Problem

-- The finance manager wants to know the lowest-priced AVAILABLE product in each category.

-- Display:

-- CATEGORY
-- Lowest Price

-- Alias:

-- LOWEST_PRICE

-- Sort by:

-- LOWEST_PRICE ASC
-- CATEGORY ASC


-- select Category , min(Price) as LOWEST_PRICE
-- from Product
-- where Product_Status = "AVAILABLE"
-- group by CATEGORY
-- order by Lowest_Price asc , CATEGORY asc;

-- IMP :

-- If a question says:

-- in each category → GROUP BY Category
-- for each brand → GROUP BY Brand
-- per supplier city → GROUP BY Supplier_City
-- for every department → GROUP BY Department




-- 🏢 Business Scenario

-- An e-commerce company is preparing for its annual shopping festival.

-- The operations manager wants to identify supplier cities that consistently provide high-quality premium products.

-- Only products that are currently being sold should be considered.

-- Products from the daily essentials department are managed by another team and should not be included in this report.

-- The manager also wants to ignore brands whose names begin with the letter 'N', because those brands are temporarily under contract review.

-- Finally, he wants to identify only those supplier cities where the combined inventory is strong enough to support the sale campaign.

-- 📝 Main Problem

-- Write an SQL query to display:

-- Supplier City
-- Total Stock

-- Name the total stock column:

-- TOTAL_STOCK

-- Display only those cities that satisfy the manager's requirement.

-- Sort the result:

-- Highest total stock first.
-- If two cities have the same stock, display the city name alphabetically.


-- SELECT SUPPLIER_CITY,
--        SUM(STOCK) AS TOTAL_STOCK
-- FROM Product
-- WHERE PRODUCT_STATUS = 'AVAILABLE'
--   AND RATING >= 4
--   AND CATEGORY NOT IN ('GROCERY')
--   AND BRAND NOT LIKE 'N%'
-- GROUP BY SUPPLIER_CITY
-- HAVING SUM(STOCK) > 50
-- ORDER BY TOTAL_STOCK DESC,
--          SUPPLIER_CITY ASC;



-- ✅ SQL Execution Trace
-- FROM Product

-- ↓

-- WHERE
-- (Product_Status='AVAILABLE'
--  Rating>=4
--  Category NOT IN('GROCERY')
--  Brand NOT LIKE 'N%')

-- ↓

-- GROUP BY Supplier_City

-- ↓

-- SUM(STOCK)

-- ↓

-- HAVING SUM(STOCK)>50

-- ↓

-- Virtual Table

-- ↓

-- ORDER BY
-- TOTAL_STOCK DESC,
-- SUPPLIER_CITY ASC

-- ↓

-- Final Output





-- 🔄 Revision Challenge (Old Topics)
-- 🏢 Business Scenario

-- The marketing department wants to prepare a list of premium brands for a promotional banner.

-- They don't want duplicate brand names.

-- Only brands whose products:

-- belong to technology or sports departments,
-- cost more than ₹40,000,
-- and whose product name contains the word "o"

-- should be included.

-- Display the list alphabetically.

-- Note: This question does not require GROUP BY.




-- SELECT DISTINCT BRAND
-- FROM Product
-- WHERE CATEGORY IN ('ELECTRONICS','SPORTS')
--   AND PRICE > 40000
--   AND PRODUCT_NAME LIKE '%o%'
-- ORDER BY BRAND ASC;






-- ⭐ Bonus Problem (Different Aggregate)
-- 🏢 Business Scenario

-- The finance department wants to know which product category has the most expensive AVAILABLE product.

-- Display:

-- Category
-- Highest Price

-- Sort from highest price to lowest.

-- (Notice: This is not asking for total or average.)




-- SELECT CATEGORY,
--        MAX(PRICE) AS HIGHEST_PRICE
-- FROM Product
-- WHERE PRODUCT_STATUS='AVAILABLE'
-- GROUP BY CATEGORY
-- ORDER BY HIGHEST_PRICE DESC;



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


-- SELECT Category, SUM(Stock) AS TOTAL_STOCK
-- FROM Product
-- WHERE Product_Status = 'AVAILABLE'
--   AND Rating >= 5
--   AND Brand NOT LIKE '%Y'
--   AND Price > 20000
-- GROUP BY Category
-- HAVING SUM(Stock) > 30
-- ORDER BY TOTAL_STOCK DESC, Category ASC;





