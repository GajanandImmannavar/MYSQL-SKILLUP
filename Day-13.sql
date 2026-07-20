-- use Day8;

-- select * from Product;

-- 🏢 Business Scenario

-- The inventory manager wants to identify categories that have more than 5 products.

-- He doesn't want to see every category. He only wants categories whose total number of products is greater than 5.

-- 📝 Problem Statement

-- Write an SQL query to display:

-- CATEGORY
-- Total number of products in each category.

-- Display the count with the alias:

-- TOTAL_PRODUCTS

-- Show only those categories where the total number of products is greater than 5.

-- Sort the results by:

-- TOTAL_PRODUCTS in descending order.
-- If two categories have the same number of products, sort by CATEGORY in ascending order.
-- 📚 Topics Covered
-- ✅ GROUP BY
-- ✅ COUNT(*)
-- ✅ HAVING
-- ✅ ORDER BY
-- ✅ DESC
-- ✅ ASC
-- ✅ Aggregate Functions



select Category, count(PRODUCT_NAME) as Total_Products
from Product
Group by Category
having count(PRODUCT_NAME) > 5
order by Total_Products desc, Category asc;

-- Execution Order

-- This query runs in this order:

-- FROM Product
--       ↓
-- GROUP BY Category
--       ↓
-- COUNT(Product_Name)
--       ↓
-- HAVING COUNT(Product_Name) > 5
--       ↓
-- SELECT Category, COUNT(...)
--       ↓
-- ORDER BY Total_Products DESC, Category ASC



-- ✅ Interview Tip

-- Both of these are correct:

-- ORDER BY Total_Products DESC;
-- ORDER BY COUNT(Product_Name) DESC;

-- But interviewers generally prefer:

-- ORDER BY Total_Products DESC;

-- because it's easier to read.


