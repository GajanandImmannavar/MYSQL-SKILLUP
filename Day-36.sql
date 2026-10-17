-- show databases;

-- use Joins;

-- show tables;

-- 🏢 Business Scenario
-- The store manager wants to explore every possible combination of customers and products to estimate potential sales opportunities.
-- Display
-- - Customer Name
-- - Customer City
-- - Product Name
-- - Product Price
-- - Product Rating
-- - Total Combinations

-- Tables
-- Customer
-- Inventory


-- Requirements
-- 1. Use CROSS JOIN to generate every possible customer-product combination.
-- 2. Include customers from BENGALURU, MUMBAI, or PUNE.
-- 3. Customer gender must not be Male.
-- 4. Product price must be between ₹3,000 and ₹70,000.
-- 5. Product rating must be between 3 and 5.
-- 6. Product name must start with a letter S or contain the letter e.
-- 7. Exclude products with status DISCONTINUED or OUT OF STOCK.
-- 8. Use COUNT(*) OVER () to display the total qualifying combinations beside every row.
-- 9. Sort by product rating descending, product price descending, and customer name ascending.



select Customer.Customer_Name, Customer.City, Inventory.Product_name, Inventory.Price, Inventory.Rating, count(*)  over() as Total_Combanation

from Customer

cross join Inventory

where Customer.City in ('BENGALURU','MUMBAI','PUNE')
and Customer.gender <> 'Male'
and Inventory.Rating between 3 and 5
AND Inventory.Price BETWEEN 3000 AND 70000
AND (
    Inventory.Product_Name LIKE 'S%'
    OR Inventory.Product_Name LIKE '%e%'
)
and Inventory.Product_Status not in ('DISCONTINUED','OUT OF STOCK')


order by Inventory.Rating desc,
         Inventory.Price desc,
         Customer.Customer_Name asc;

         