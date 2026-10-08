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

select Supplier.Supplier_Name, 
       Supplier.Supplier_City, 
       Categories.Category_Name

from Customer

cross join Supplier

where Supplier.City in ('BENGALURU','MUMBAI','HYDERABAD')

AND Categories.Category_Name <> 'GROCERY'

and Supplier.Supplier_Name like '%a%'

order by Supplier.Supplier_Name asc,