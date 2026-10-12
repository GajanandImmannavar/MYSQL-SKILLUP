-- show databases;

-- use Joins;


-- 🏢 Business Scenario
-- The marketing team wants to explore every possible combination of customers and suppliers for a future promotional campaign.
-- Display
-- - Customer Name
-- - Customer City
-- - Supplier Name
-- - Supplier City
-- Tables
-- Customer

-- Supplier


-- Requirements
-- 1. Show every customer with every supplier using CROSS JOIN.
-- 2. Consider only customers from:
--    - MUMBAI
--    - PUNE
--    - BENGALURU
-- 3. Consider only suppliers from:
--    - HYDERABAD
--    - MUMBAI
-- 4. Exclude customers whose Gender is Male.
-- 5. Sort by:
--    - Customer City A → Z
--    - Supplier Name A → Z



-- select Customer.Customer_name,  Customer.City, 
--        Supplier.Supplier_Name,  Supplier.Supplier_City
-- from Customer

-- cross join Supplier

-- where Customer.City in ('MUMBAI','PUNE','BENGALURU')

-- and Supplier.Supplier_City in ('HYDERABAD','MUMBAI')

-- and Customer.Gender not in ('Male')

-- order by Customer.City asc,
--          Supplier.Supplier_Name asc;










-- 🏢 Business Scenario

-- The sales team wants to generate every possible combination of customers and product categories for a targeted marketing campaign.
-- Display
-- - Customer Name
-- - Customer City
-- - Category Name
-- Tables
-- Customer
-- Categories


-- Requirements
-- 1. Show every customer with every category using CROSS JOIN.
-- 2. Consider only customers whose city is BENGALURU, HYDERABAD, or PUNE.
-- 3. Exclude customers whose gender is Female.
-- 4. Include only category names containing the letter o.
-- 5. Exclude category names starting with G.

-- 6. Sort by:
--    - Category Name A → Z
--    - Customer Name Z → A

-- select Customer.Customer_Name, Customer.City,
--        Categories.Category_Name

-- from Customer

-- Cross join Categories


-- where Customer.City in ('BENGALURU','HYDERABAD','PUNE')

-- and Customer.Gender <> 'Female'

-- and Categories.Category_Name like '%o%'

-- and Categories.Category_Name not like 'G%'

-- order by Categories.Category_Name asc,
--          Customer.Customer_Name desc;

-- 🏢 Business Scenario
-- The store manager wants to generate every possible combination of customers and products for a recommendation campaign, 
-- applying customer and product filters.
-- Display
-- - Customer Name
-- - Customer City
-- - Product Name
-- - Brand
-- - Price
-- - Rating
-- Tables
-- Customer
-- Inventory


-- Requirements
-- 1. Show every qualifying customer with every qualifying product using CROSS JOIN.
-- 2. Include customers from BENGALURU, MUMBAI, or HYDERABAD.
-- 3. Exclude customers whose gender is Male.
-- 4. Product price must be between ₹5,000 and ₹80,000.
-- 5. Product rating must be at least 4.
-- 6. Product name must contain e but must not end with s.
-- 7. Brand must not contain x.
-- 8. Exclude products with status DISCONTINUED or OUT OF STOCK.

-- 9. Sort by:
--    - Rating descending
--    - Price descending
--    - Customer Name ascending


-- select Customer.Customer_Name, 
--        Customer.City, 
--        Inventory.Product_Name,
--        Inventory.Brand, 
--        Inventory.Price, 
--        Inventory.Rating

-- from Customer

-- cross Join Inventory

-- where Customer.City in ('BENGALURU','MUMBAI','HYDERABAD')

-- AND Customer.Gender not in ('Male')

-- and Inventory.Price between 5000 and 80000

-- and Inventory.Rating >= 4

-- AND Inventory.Product_Name LIKE '%e%'
-- AND Inventory.Product_Name NOT LIKE '%s'
-- AND Inventory.Brand NOT LIKE '%x%'

-- and Inventory.Product_Status not in ('DISCONTINUED', 'OUT OF STOCK')

-- order by Inventory.Rating desc,
--          Inventory.Price desc,
--          Customer.Customer_Name asc;
       


-- 🏢 Business Scenario
-- The sales team wants to create every possible combination of suppliers and product categories for a future business expansion plan.
-- Display
-- - Supplier Name
-- - Supplier City
-- - Category Name
-- Tables
-- Supplier
-- Categories


-- Requirements
-- 1. Use CROSS JOIN.
-- 2. Include suppliers from BENGALURU, MUMBAI, or HYDERABAD.
-- 3. Exclude suppliers whose names start with S.
-- 4. Include category names containing a.
-- 5. Exclude category names ending with s.
-- 6. Sort by supplier city ascending, then category name descending.



-- Select Supplier.Supplier_name,
--        Supplier.Supplier_City,
--        Categories.Category_Name
    
-- from Supplier

-- cross Join Categories

-- where Supplier.Supplier_City in ('BENGALURU','MUMBAI','HYDERABAD')

-- and Supplier.Supplier_Name not like 'S%'

-- and Categories.Category_Name like '%a%'

-- and Categories.Category_Name not like '%s'

-- order by Supplier.Supplier_City asc,
--           Categories.Category_Name desc;

-- 🏢 Business Scenario
-- The sales manager wants to analyse customer purchases and identify which customers have placed multiple paid orders.
-- Display
-- Customer Name, Customer City, Total Orders, Total Quantity Purchased, and Total Purchase Value.
-- Tables
-- Customer
-- Orders
-- Inventory


-- Requirements
-- 1. Join the three tables correctly.
-- 2. Consider only orders with Payment_Status = 'PAID'.
-- 3. Consider orders placed between 2025-01-01 and 2026-12-31.
-- 4. Include customers from BENGALURU, MUMBAI, or HYDERABAD.
-- 5. Calculate the total number of orders using COUNT(*).
-- 6. Calculate total quantity purchased using SUM(Orders.Quantity).
-- 7. Calculate total purchase value using SUM(Orders.Quantity * Inventory.Price).
-- 8. Group the results by customer name and customer city.
-- 9. Show only customers with at least 2 paid orders, using HAVING.
-- 10. Sort by total purchase value from highest to lowest.


select Customer.Customer_Name, Customer.City, 
    count(Orders.Order_Id) as  Total_Orders, 
    sum(Orders.Quantity) as Total_Quantity,
    SUM(Orders.Quantity * Inventory.Price) AS Total_Purchase_Value
    
FROM Customer
INNER JOIN Orders
    ON Customer.Customer_ID = Orders.Customer_ID
INNER JOIN Inventory
    ON Orders.Product_ID = Inventory.Product_ID

where Orders.Payment_Status = 'PAID'

and Orders.Order_Date between '2025-01-01' and '2026-12-31'

and Customer.City in ('BENGALURU','MUMBAI','HYDERABAD')

group by Customer.Customer_Name, Customer.city

having count(Orders.Order_Id)>=2

order by SUM(Orders.Quantity * Inventory.Price) desc;




