-- show databases;


-- use Joins;

-- show tables;

-- The supplier manager wants to see every product and the supplier responsible for it.

-- Display:

-- Product Name
-- Product Price
-- Supplier Name
-- Supplier City
-- Requirements
-- Every product must appear.
-- Only suppliers from Bengaluru or Mumbai should be attached.
-- Products supplied from other cities must still appear, but supplier information should be NULL.
-- Sort by:
-- Product Price — highest to lowest
-- Product Name — A → Z
-- Tables
-- Supplier → Inventory


-- select Inventory.Product_Name, Inventory.Price,
--        Supplier.Supplier_Name, Supplier.Supplier_City
-- from Supplier
-- right join Inventory
-- on Inventory.Supplier_Id = Supplier.Supplier_Id

-- and Supplier.Supplier_city in ('Bengaluru','Mumbai')

-- order by Inventory.Price desc,
--          Inventory.Product_Name asc;




-- 🧠 Why this is correct
-- FROM Supplier
-- RIGHT JOIN Inventory

-- means:

-- Supplier  = LEFT table
-- Inventory = RIGHT table
--                        ↑
--                  ALL PRODUCTS
--                   PRESERVED

-- Then:

-- AND Supplier.Supplier_City IN ('Bengaluru','Mumbai')

-- is inside ON, so it only controls which supplier rows are attached.

-- For example:

-- Product        Supplier City
-- --------------------------------
-- iPhone 16      Bengaluru  → Supplier shown
-- Cricket Bat    Mumbai     → Supplier shown
-- Sofa           Mysuru     → NULL
-- Java Book      Hyderabad  → NULL

-- The Mysuru and Hyderabad products still remain because Inventory is preserved.

-- ⭐ The key lesson

-- You correctly applied both rules:

-- Every product → Inventory must be RIGHT table.

-- Only Bengaluru/Mumbai suppliers → condition belongs in ON.




-- 💼 Business Scenario

-- The sales manager wants a report showing every product, along with its supplier and category information.

-- Display:

-- Product Name
-- Product Price
-- Supplier Name
-- Category Name
-- Requirements
-- Every product must appear.
-- Supplier information should be attached only for suppliers from Bengaluru or Mumbai.
-- Category information should be attached only for Electronics or Sports.
-- Products without matching supplier/category information must still appear.
-- Sort by:
-- Product Price — highest to lowest
-- Product Name — A → Z
-- Tables

-- Supplier → Inventory ← 



select Inventory.Product_Name, Inventory.Price,
       Supplier.Supplier_Name, Categories.Category_Name

from Supplier

right join Inventory

on Supplier.Supplier_Id = Inventory.Supplier_Id

and Supplier.Supplier_City in ('Bengaluru','Mumbai')

left join Categories

on Inventory.Category_Id = Categories.Category_Id


and Categories.Category_Name in ('Electronics', 'Sports')

order by Inventory.Price desc,
         Inventory.Product_Name asc;



-- 🧠 Why LEFT JOIN here?

-- We already established:

-- Supplier RIGHT JOIN Inventory
--                   ↑
--             ALL PRODUCTS

-- Now we must continue preserving Inventory.

-- So:

-- Inventory
--     ↓
-- LEFT JOIN Categories
--     ↓
-- Inventory remains preserved

-- This gives us:

-- ALL PRODUCTS
--     +
-- Bengaluru/Mumbai supplier when available
--     +
-- Electronics/Sports category when available
-- ⭐ Your main learning 

-- When doing multiple joins, don't simply use RIGHT JOIN for every table.

-- Ask after every JOIN:

-- Which table must continue to be preserved?

-- Here the answer is always:

-- Inventory