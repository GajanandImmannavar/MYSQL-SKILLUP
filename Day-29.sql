-- show databases;


-- use Joins;


-- 💼 Business Scenario

-- The inventory manager wants to see every product with its supplier information.

-- Display:

-- Product Name
-- Supplier Name
-- Supplier City
-- Product Status

-- Requirements:

-- Every product must appear.
-- Supplier information should be shown when a matching supplier exists.
-- Sort by Supplier City A→Z, then Product Name A→Z.

-- Tables: Supplier, Inventory


-- select Inventory.Product_Name, Supplier.Supplier_Name,
--        Supplier.Supplier_City, Inventory.Product_Status
-- from Supplier

-- right join Inventory
-- on Supplier.Supplier_Id = Inventory.Supplier_Id

-- order by Supplier.Supplier_City asc,
--          Inventory.Product_Name asc;



-- 💼 Business Scenario

-- The category manager wants a report containing every product and its category.

-- Display:

-- Product Name
-- Product Price
-- Category Name
-- Rating

-- Requirements:

-- Every product must appear.
-- Only categories Electronics, Furniture, and Sports should be attached.
-- Products from other categories must still appear with NULL category information.
-- Sort by Product Price high→low.

-- Tables: Categories, Inventory


-- select Inventory.Product_Name, Inventory.Price,
--        Categories.Category_Name, Inventory.Rating
    
-- from Categories

-- right join Inventory

-- on Categories.Category_Id = Inventory.Category_Id

-- and Categories.Category_Name in ('Electronics','Furniture','Sports')

-- order by Inventory.Price desc;


-- 💼 Business Scenario

-- The sales manager wants to review every order along with customer information.

-- Display:

-- Order ID
-- Order Date
-- Customer Name
-- Customer City
-- Payment Method

-- Requirements:

-- Every order must appear.
-- Customer information should be attached only when the customer belongs to Bengaluru or Mysuru.
-- Orders from customers in other cities must still appear with NULL customer information.
-- Sort by Order Date newest→oldest.

-- Tables: Customer, Orders


-- select Orders.Order_Id, Orders.Order_Date,
--        Customer.Customer_Name, Customer.City, Orders.Payment_Method

-- from Customer

-- right join Orders

-- on Customer.Customer_Id = Orders.Customer_Id

-- and Customer.City in ('Bengaluru','Mysuru')

-- order by Orders.Order_Date desc;



-- 💼 Business Scenario

-- The product manager wants a report of every product with supplier and category information.

-- Display:

-- Product Name
-- Product Price
-- Supplier Name
-- Category Name
-- Rating

-- Requirements:

-- Every product must appear.
-- Attach supplier information only for suppliers from Bengaluru or Mumbai.
-- Attach category information only for Electronics or Sports.
-- Products without qualifying supplier/category information must remain in the report.
-- Sort by Rating high→low, then Product Price high→low.

-- Tables: Supplier, Inventory, Categories



-- Select Inventory.Product_Name,
--        Inventory.Price,
--        Supplier.Supplier_Name,
--        Categories.Category_Name,
--        Inventory.Rating

-- from Supplier

-- right join Inventory

-- on Supplier.Supplier_Id = Inventory.Supplier_Id

-- and Supplier.Supplier_City in ('Bengaluru','Mumbai')

-- left join Categories

-- on Inventory.Category_Id = Inventory.Category_Id

-- and Categories.Category_Name in ('Electronoics','Sports')

-- order by Inventory.Rating desc,
--          Inventory.Price desc;


💼 Business Scenario

The sales team wants to analyze every order, even when some related information is unavailable.

Display:

Order ID
Order Date
Customer Name
Product Name
Supplier Name
Product Price

Requirements:

Every order must appear.
Customer information should be attached only when the customer is from Bengaluru, Mysuru, or Pune.
Product information should be attached only for products that are AVAILABLE and have a rating of 4 or higher.
Supplier information should be attached only when the supplier is from Bengaluru or Mumbai.
An order must never disappear just because one of these conditions isn't satisfied.
Sort by Order Date newest→oldest, then Product Price high→low.

Tables:

Customer → Orders → Inventory → Supplier