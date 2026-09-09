-- show databases;

-- use Joins;

-- show tables;




-- 💼 Business Scenario

-- The inventory manager wants a report containing every product and the supplier information associated with it.

-- Display:

-- Product Name
-- Product Price
-- Supplier Name
-- Supplier City
-- Requirement

-- Every product must appear in the report, even if there is no matching supplier information.

-- Sort by:

-- Supplier City — A → Z
-- Product Name — A → Z
-- Tables

-- Supplier → Inventory



-- select Inventory.Product_Name,
--        Inventory.Price,
--        Supplier.Supplier_Name,
--        Supplier.Supplier_CIty

-- from Supplier

-- right join Inventory

-- on Supplier.Supplier_Id = Inventory.Supplier_ID

-- order by Supplier.Supplier_City asc,
--          Inventory.Product_Name asc;




-- 💼 Business Scenario

-- The supplier manager wants to review supplier coverage across the inventory.

-- Display:

-- Supplier Name
-- Supplier City
-- Product Name
-- Product Status

-- The report must include every product, even if supplier information is missing.

-- Sort by:

-- Supplier City — A → Z
-- Supplier Name — A → Z
-- Tables

-- Supplier → Inventory

-- select Inventory.Product_Name,
--        Supplier.Supplier_Name,
--        Supplier.Supplier_City,
--        Inventory.Product_Status

-- from Supplier

-- right join Inventory

-- on Supplier.Supplier_Id = Inventory.Supplier_Id

-- order by Supplier.Supplier_City,
--          Supplier.Supplier_Name;

-- 🧠 Key understanding

-- You correctly recognized:

-- FROM Supplier
-- RIGHT JOIN Inventory

-- means:

-- Supplier  = LEFT table
-- Inventory = RIGHT table
--                     ↑
--               ALL PRODUCTS
--               ARE PRESERVED


-- 💼 Business Scenario

-- The category manager wants to see product coverage across categories.

-- Display:

-- Category Name
-- Product Name
-- Product Price
-- Product Status

-- The report must show every product, including products whose category information is unavailable.

-- Sort by:

-- Category Name — A → Z
-- Product Price — highest to lowest
-- Tables

-- Categories → Inventory



Select Categories.Category_Name,
       Inventory.Product_Name,
       Inventory.Price,
       Inventory.Product_Status

from Categories

right join Inventory

on Categories.Category_Id = Inventory.Category_Id

order by Categories.Category_Name asc,
         Inventory.Price desc;

🧠 Most important part
FROM Categories
RIGHT JOIN Inventory

Therefore:

Categories = LEFT table
Inventory  = RIGHT table
                         ↑
                  ALL PRODUCTS
                  ARE PRESERVED

So even if a product has no matching category, that product still appears:

Category_Name | Product_Name
--------------|------------
ELECTRONICS   | iPhone 16
NULL          | Some Product

That's exactly what the business requirement asked for.

⭐ Interview question

Why is Inventory on the right side?

Your answer should be:

Because the requirement is to display every product. In a RIGHT JOIN, the table on the right side is preserved, 
so Inventory must be placed after RIGHT JOIN.