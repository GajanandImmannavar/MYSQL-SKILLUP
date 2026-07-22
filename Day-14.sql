-- use Day8;

select * from Product;

-- 🏢 Business Scenario

-- The inventory manager wants to identify brands within each category that have a total stock greater than 30.

-- However, he wants to analyze only AVAILABLE products from the following categories:

-- ELECTRONICS
-- SPORTS

-- Also, he is interested only in brands whose name does not start with 'P'.

-- 📝 Main Problem

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Total stock

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Show only those Category–Brand combinations where:

-- PRODUCT_STATUS = 'AVAILABLE'
-- CATEGORY IN ('ELECTRONICS','SPORTS')
-- BRAND NOT LIKE 'P%'
-- TOTAL_STOCK > 30

-- Sort the result by:

-- CATEGORY ASC
-- TOTAL_STOCK DESC
-- BRAND ASC
-- 📚 Topics Covered (Revision)

-- This single problem revises:

-- ✅ WHERE
-- ✅ IN
-- ✅ NOT LIKE
-- ✅ GROUP BY (Multiple Columns)
-- ✅ SUM()
-- ✅ HAVING
-- ✅ ORDER BY (Multiple Columns)

-- select  Category , brand, sum(Stock) as Total_Stock
-- from  Product
-- where Product_Status = "AVAILABLE"
--        AND Category in ('Electronics','Sports') 
--                    and  brand not like 'P%'
--                    group by Category , Brand
--                    having Total_Stock > 30
--                    order by  Category asc, Total_Stock desc, Brand asc;


-- 📝 Main Problem

-- Write an SQL query to display:

-- CATEGORY
-- BRAND
-- Total stock

-- Display the total stock with the alias:

-- TOTAL_STOCK

-- Show only those Category–Brand combinations where:

-- PRODUCT_STATUS = 'AVAILABLE'
-- CATEGORY IN ('ELECTRONICS','FURNITURE')
-- BRAND NOT LIKE 'I%'
-- PRICE BETWEEN 10000 AND 90000
-- TOTAL_STOCK > 15

-- Sort the result by:

-- CATEGORY ASC
-- TOTAL_STOCK DESC
-- BRAND ASC
-- 📚 Topics Covered (Revision)

-- This single problem revises:

-- ✅ WHERE
-- ✅ AND
-- ✅ IN
-- ✅ NOT LIKE
-- ✅ BETWEEN
-- ✅ GROUP BY (Multiple Columns)
-- ✅ SUM()
-- ✅ HAVING
-- ✅ ORDER BY (Multiple Columns)

-- select category , Brand , sum(Stock) as Total_Stock
-- from Product 
-- where  Product_Status = 'AVAILABLE'
--        and Category in ('ELECTRONICS','FURNITURE')
--        and brand not like 'I%'
--        and Price BETWEEN  10000 and 90000

-- group by  Category , Brand
-- having sum(Stock)>15
-- order by Category asc, 
-- Total_Stock desc,
-- Brand asc;




-- 🏢 Business Scenario

-- The inventory manager wants to identify categories that have more than one high-rated product.

-- However, he wants to analyze only products that:

-- Are AVAILABLE
-- Have a rating of 4 or 5
-- Cost between ₹2,000 and ₹80,000

-- He is not interested in individual brands—only category-wise analysis.

-- 📝 Main Problem

-- Write an SQL query to display:

-- CATEGORY
-- Total number of products

-- Display the count with the alias:

-- HIGH_RATED_PRODUCTS

-- Show only those categories where:

-- PRODUCT_STATUS = 'AVAILABLE'
-- RATING >= 4
-- PRICE BETWEEN 2000 AND 80000
-- Total number of products is greater than 1

-- Sort the result by:

-- HIGH_RATED_PRODUCTS DESC
-- CATEGORY ASC



-- select category ,  count(*) as High_Rated_Products
-- from Product
-- where rating >=4 and Price between 2000 and 80000 
--                      and Product_Status = "Available"
-- group by Category
-- having Count(*)> 1
-- order by High_Rated_Products desc ,  Category asc;