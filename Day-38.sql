-- show databases;


use Joins;

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


select P1.product_Name as Product1_Name, P2.Price as Price1
       P2.product_Name as Product2_Name, P2.Price as Price2, c2.Category_Id as categoryId2, P1.Price - P2.Price as Price_Difference
from 