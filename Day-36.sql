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



-- select Customer.Customer_Name, Customer.City, 
--        Inventory.Product_name, Inventory.Price, Inventory.Rating, 
--        count(*)  over() as Total_Combanation

-- from Customer

-- cross join Inventory

-- where Customer.City in ('BENGALURU','MUMBAI','PUNE')
-- and Customer.gender <> 'Male'
-- and Inventory.Rating between 3 and 5
-- AND Inventory.Price BETWEEN 3000 AND 70000
-- AND (
--     Inventory.Product_Name LIKE 'S%'
--     OR Inventory.Product_Name LIKE '%e%'
-- )
-- and Inventory.Product_Status not in ('DISCONTINUED','OUT OF STOCK')


-- order by Inventory.Rating desc,
--          Inventory.Price desc,
--          Customer.Customer_Name asc;

         


-- 🏢 Business Scenario
-- The marketing team wants to analyse customer-product combinations and find which customer cities have the most qualifying combinations.
-- Display
-- - Customer City
-- - Total Combinations
-- - Average Product Price
-- - Maximum Product Rating

-- Tables
-- Customer
-- Inventory


-- Requirements
-- 1. Use CROSS JOIN to generate all possible customer-product combinations.
-- 2. Include customers from BENGALURU, MUMBAI, or PUNE.
-- 3. Exclude customers whose gender is Female.
-- 4. Product price must be between ₹2,000 and ₹60,000.
-- 5. Product rating must be at least 3.
-- 6. Product name must contain the letter a.
-- 7. Exclude products with status DISCONTINUED or OUT OF STOCK.
-- 8. Count combinations using COUNT(*).
-- 9. Calculate average product price using AVG().
-- 10. Calculate maximum product rating using MAX().
-- 11. Group by customer city.
-- 12. Show only cities with more than 5 combinations using HAVING.
-- 13. Sort by total combinations descending.


-- select Customer.City,
--        count(*) as Total_Combation,
--         AVG(Inventory.Price) AS Average_Product_Price,
--         MAX(Inventory.Rating) AS Maximum_Rating

-- from Customer

-- cross join Inventory

-- where Customer.City in ('BENGALURU','MUMBAI','PUNE')

-- and Customer.Gender <> 'Female'
-- and Inventory.Price between 2000 and 60000
-- and Inventory.Rating >= 3
-- and Inventory.Product_Name like '%a%'
-- and Inventory.Product_Status not in ('DISCONTINUED','OUT OF STOCK')

-- group by Customer.City
-- having Total_Combation > 5

-- order by Total_Combation desc;



-- 🏢 Business Scenario
-- The business team wants to compare customer cities based on the possible combinations with available products.
-- Display
-- - Customer City
-- - Total Combinations
-- - Average Product Price
-- - Minimum Product Price
-- - Maximum Product Rating
-- Tables
-- Customer
-- Inventory


-- Requirements
-- 1. Use CROSS JOIN.
-- 2. Include customers from BENGALURU, HYDERABAD, MUMBAI, or PUNE.
-- 3. Exclude customers whose gender is Male.
-- 4. Product price must be between ₹1,000 and ₹50,000.
-- 5. Product rating must be at least 4.
-- 6. Product name must contain e or brand must start with S.
-- 7. Exclude products with status DISCONTINUED or OUT OF STOCK.
-- 8. Use COUNT(*) to count combinations.
-- 9. Calculate average price using AVG().
-- 10. Calculate minimum price using MIN().
-- 11. Calculate maximum rating using MAX().
-- 12. Group by customer city.
-- 13. Keep only cities with more than 10 combinations using HAVING.
-- 14. Sort by average product price from highest to lowest.


-- select Customer.City,
--        count(*) as Total_Combination,
--        avg(Inventory.Price) as average_Product_Price,
--        min(Inventory.Price) as Minimum_Product_Price,
--        max(Inventory.Rating) as Maximum_Product_Rating

-- from Customer
-- cross join Inventory

-- where Customer.City in ('BENGALURU','HYDERABAD','MUMBAI','PUNE')

-- AND Customer.Gender <> 'Male'
-- and Inventory.Price between 1000 and 50000
-- and Inventory.Rating >= 4
-- and (Inventory.Product_Name like '%e%' or Inventory.Brand like 'S%')
-- and Inventory.Product_Status not in ('DISCONTINUED','OUT OF STOCK')

-- group by Customer.City 
-- having Total_Combination > 10

-- order by average_Product_Price desc;



-- 🏢 Business scenario

-- The marketing team wants to compare customer cities based on possible combinations with products.

-- Tables: Customer, Inventory

-- Requirements

-- 1. Use CROSS JOIN.
-- 2. Include customers from BENGALURU, MUMBAI, and PUNE.
-- 3. Exclude customers whose gender is Female.
-- 4. Product price must be between ₹2,000 and ₹80,000.
-- 5. Product rating must be at least 4.
-- 6. Exclude products with status DISCONTINUED or OUT OF STOCK.
-- 7. Display customer city, total combinations, average product price, and maximum product rating.
-- 8. Group by customer city.
-- 9. Show only cities with more than 5 combinations using HAVING.
-- 10. Sort by total combinations descending


-- select Customer.City,
--        count(*) Total_Combination,
--        avg(Inventory.Price),
--        max(Inventory.Rating)

-- from Customer

-- cross join Inventory

-- where Customer.City in ('BENGALURU','MUMBAI','PUNE')
-- AND   Customer.Gender <> 'Female'
-- and   Inventory.Price between 2000 and 80000
-- and   Inventory.Rating >=4
-- and   Inventory.Product_Status not in ('DISCONTINUED','OUT OF STOCK')

-- group by Customer.City

-- having Total_Combination > 5

-- order by Total_Combination desc;


-- Problem — Count products by customer city
-- Scenario: A marketing manager wants to know how many qualifying customer-product combinations exist in each city.

-- Tables: Customer, Inventory

-- Requirements:

-- 1. Use CROSS JOIN.
-- 2. Include customers from BENGALURU, MUMBAI, and PUNE.
-- 3. Exclude customers whose gender is Female.
-- 4. Include products priced between ₹2,000 and ₹80,000.
-- 5. Display customer city and total combinations.
-- 6. Group by customer city.
-- 7. Show only cities with more than five combinations using HAVING.
-- 8. Sort by total combinations descending.


select Customer.City,
       count(*) as Total_Combination

from Customer

cross join Inventory

where Customer.City in ('BENGALURU','MUMBAI','PUNE')
and Customer.Gender not in ('Female')
and Inventory.Price between 2000 and 80000

group by Customer.City

having Count(*) > 5

order by Total_Combination desc;