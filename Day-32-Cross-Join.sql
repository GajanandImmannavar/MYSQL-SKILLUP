-- show databases;


-- use Joins;


-- 🏢 Business Scenario
-- The marketing team wants to create every possible marketing campaign combination.
-- Display
-- - Customer Name
-- - Category Name
-- Tables
-- Customer

-- Categories

-- Requirements
-- - Show every customer with every category.
-- - Sort by Customer Name A→Z, then Category Name A→Z.

-- select Customer.Customer_Name, Categories.Category_Name

-- from Customer

-- cross join Categories

-- order by Customer.Customer_Name asc,
--          Categories.Category_Name asc;

-- 🏢 Business Scenario

-- The marketing team wants to prepare a campaign where every customer can potentially receive information about every supplier.

-- Display

-- - Customer Name
-- - Customer City
-- - Supplier Name
-- - Supplier City

-- Tables

-- Customer
-- Supplier

-- Requirements
-- - Show every possible customer-supplier combination.
-- - Consider only customers from:
--   - BENGALURU
--   - MUMBAI
--   - PUNE
-- - Consider only suppliers from:
--   - BENGALURU
--   - HYDERABAD
-- - Customer name should contain the letter a.

-- - Sort by:
--   1. Customer Name A → Z
--   2. Supplier Name A → Z


-- select Customer.Customer_Name, 
--        Customer.City, 
--        Supplier.Supplier_Name, 
--        Supplier.Supplier_City
-- from Customer
-- cross join Supplier

-- where Customer.City in('BENGALURU','PUNE','MUMBAI')

-- AND Supplier.Supplier_City in('BENGALURU','HYDERABAD')

-- and Customer.Customer_Name like '%a%'

-- order by Customer.Customer_Name asc,
--          Supplier.Supplier_Name asc;


-- 🏢 Business Scenario
-- The training department wants to check every possible combination of customers and products for a future recommendation system.
-- Display
-- - Customer Name
-- - Customer City
-- - Product Name
-- - Price
-- - Rating
-- Tables
-- Customer

-- Inventory

-- Requirements
-- - Show every customer with every product.
-- - Consider only customers from:
--   - BENGALURU
--   - HYDERABAD
-- - Product rating should be 4 or higher.
-- - Product price should be between ₹5,000 and ₹80,000.
-- - Product name should contain the letter e.
-- - Exclude DISCONTINUED products.
-- - Sort by:
--   1. Product Price high → low
--   2. Customer Name A → Z

-- select Customer.Customer_Name, Customer.City, 
--        Inventory.Product_Name, Inventory.Price, 
--        Inventory.Rating

-- from Customer

-- cross join Inventory

-- where Customer.City in ('BENGALURU','HYDERBAD')
-- AND Inventory.Price between 5000 and 80000
-- AND Inventory.Rating >= 4
-- AND Inventory.Product_Name like '%e%'
-- AND Inventory.Product_Status not in ('DISCONTINUED')

-- order by Inventory.Price desc,
--          Customer.Customer_Name asc;




-- 🏢 Business Scenario
-- The management team wants to evaluate every possible combination of:
-- Supplier
-- ×
-- Category

-- for future expansion plans.
-- Display
-- - Supplier Name
-- - Supplier City
-- - Category Name
-- Tables
-- Supplier

-- Categories

-- Requirements
-- - Show every supplier with every category.
-- - Consider suppliers only from:
--   - BENGALURU
--   - MUMBAI
--   - HYDERABAD
-- - Exclude category:
--   - GROCERY
-- - Supplier name must contain the letter a.
-- - Sort by:
--   1. Supplier City A → Z
--   2. Supplier Name A → Z
--   3. Category Name A → Z

-- select Supplier.Supplier_Name, 
--        Supplier.Supplier_City, 
--        Categories.Category_Name

-- from Supplier

-- cross join Categories

-- where Supplier.Supplier_City in ('BENGALURU','MUMBAI','HYDERABAD')

-- AND Categories.Category_Name <> 'GROCERY'

-- and Supplier.Supplier_Name like '%a%'

-- order by Supplier.Supplier_City asc,
--          Supplier.Supplier_Name asc,
--          Categories.Category_Name asc;


-- Mixed SQL Revision Challenge
-- The inventory manager wants to identify products that meet specific quality and sales criteria.
-- Display
-- - Product Name
-- - Brand
-- - Price
-- - Rating
-- - Product Status
-- Table
-- Inventory

-- Requirements
-- - Product price should be between ₹5,000 and ₹80,000.
-- - Product rating should be 4 or higher.
-- - Product name should contain the letter e.
-- - Product brand should not start with the letter S.
-- - Product status should not be:
--   - DISCONTINUED
--   - OUT OF STOCK
-- - Category ID should be one of:
--   - 1
--   - 2
--   - 3
-- - Supplier ID should not be:
--   - 5
--   - 8
-- - Sort by:
--   1. Rating High → Low
--   2. Price High → Low
--   3. Product Name A → Z



SELECT Inventory.Product_Name,
       Inventory.Brand,
       Inventory.Price,
       Inventory.Rating,
       Inventory.Product_Status
FROM Inventory
WHERE Inventory.Price BETWEEN 5000 AND 80000
  AND Inventory.Rating >= 4
  AND Inventory.Product_Name LIKE '%e%'
  AND Inventory.Brand NOT LIKE 'S%'
  AND Inventory.Product_Status NOT IN ('DISCONTINUED','OUT OF STOCK')
  AND Inventory.Category_ID IN (1,2,3)
  AND Inventory.Supplier_ID NOT IN (5,8)
ORDER BY Inventory.Rating DESC,
         Inventory.Price DESC,
         Inventory.Product_Name ASC;