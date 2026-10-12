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

🏢 Business Scenario
The store manager wants to generate every possible combination of customers and products for a recommendation campaign, 
applying customer and product filters.
Display
- Customer Name
- Customer City
- Product Name
- Brand
- Price
- Rating
Tables
Customer
Inventory


Requirements
1. Show every qualifying customer with every qualifying product using CROSS JOIN.
2. Include customers from BENGALURU, MUMBAI, or HYDERABAD.
3. Exclude customers whose gender is Male.
4. Product price must be between ₹5,000 and ₹80,000.
5. Product rating must be at least 4.
6. Product name must contain e but must not end with s.
7. Brand must not contain x.
8. Exclude products with status DISCONTINUED or OUT OF STOCK.
9. Sort by:
   - Rating descending
   - Price descending
   - Customer Name ascending