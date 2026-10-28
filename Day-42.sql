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




SELF JOIN — Problem 23: Products with Ratings Differing by at Least 2 Points
Business scenario: An online store wants to identify products from the same category whose customer ratings differ significantly.

Table: Inventory

Display:
- Product_1
- Product_2
- Category_ID
- Rating_1
- Rating_2
- Rating_Difference
Conditions
1. Both products must belong to the same category.
2. Their ratings must differ by at least 2 points.
3. Do not compare a product with itself.
4. Show each pair only once.
5. Ignore products with NULL ratings.
6. Sort by rating difference in descending order.


