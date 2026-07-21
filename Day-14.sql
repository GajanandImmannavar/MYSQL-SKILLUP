-- use Day8;

-- select * from Product;

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

select  Category , brand, sum(Stock) as Total_Stock
from  Product
where Product_Status = "AVAILABLE"
       AND Category in ('Electronics','Sports') 
                   and  brand not like 'P%'
                   group by Category , Brand
                   having Total_Stock > 30
                   order by  Category asc, Total_Stock desc, Brand asc;