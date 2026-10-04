-- use Joins;

-- 🏢 Business Scenario

-- The sales manager wants to identify customers who have successfully completed purchases.

-- Display:

-- Customer Name
-- Customer City
-- Order ID
-- Product Name
-- Product Price
-- Payment Method

-- Requirements
-- Only successfully paid orders should be included.
-- Products priced between ₹2,000 and ₹90,000 should be considered.
-- Products whose names contain the letter o should be included.
-- Products from the Grocery category should not be included.
-- Show each customer/order combination only once.

-- Sort the report by:
-- Customer City — A → Z
-- Product Price — highest to lowest
-- Customer Name — A → Z

-- Tables
-- Customer
--    ↓
-- Orders
--    ↓
-- Inventory
--    ↓
-- Categories





-- Select Distinct Customer.Customer_Name, 
--                Customer.City, Orders.Order_Id, 
--                Inventory.Product_Name, Inventory.Price, 
--                Orders.Payment_Method

-- from Customer

-- right join Orders 

-- on Customer.Customer_Id = Orders.Customer_Id

--  join Inventory

-- on Orders.Product_Id = Inventory.Product_Id

-- join Categories

-- on Inventory.Category_Id = Categories.Category_Id

-- where Orders.Payment_Status = "Paid"
--       and Inventory.Price between 2000 and 90000
--       and Inventory.Product_Name like "%o%"
--       and Categories.Category_Name not in ("Grocery")

-- order by Customer.City asc,
--          Inventory.Price desc,
--          Customer.Customer_Name asc;





-- 🏢 Business Scenario

-- The inventory manager wants a report of products and their supplier information.

-- Display
-- Product Name
-- Product Price
-- Supplier Name
-- Supplier City
-- Product Status


-- Requirements

-- Every product must appear.
-- Consider products priced from ₹1,000 to ₹50,000.
-- Product names containing a should be included.
-- Suppliers should be from Bengaluru or Mumbai.
-- Discontinued products should not be included.
-- Show each product only once.

-- Sort by Supplier City A→Z, Price high→low, Product Name A→Z.

-- Tables: Supplier, Inventory



-- select distinct Inventory.Product_Name,  
--                 Inventory.Price, 
--                 Supplier.Supplier_Name, 
--                 Supplier.Supplier_city, 
--                 Inventory.Product_Status

-- from Supplier

-- right join Inventory

-- on Supplier.Supplier_Id = Inventory.Supplier_Id

-- where Inventory.Price between 1000 and 50000

-- and Inventory.Product_Name like '%a%'

-- and Supplier.Supplier_City in ('Bengaluru','Mumbai')

-- AND Inventory.Product_Status <> 'DISCONTINUED'

-- order by Supplier.Supplier_city asc,
--           Inventory.Price desc,
--           Inventory.Product_Name asc;



-- 🏢 Business Scenario

-- The sales manager wants to see customers and their successful orders.

-- Display
-- Customer Name
-- Customer City
-- Order ID
-- Order Date
-- Payment Method
-- Payment Status

-- Requirements
-- Every customer should appear, even if they have no successful order.
-- Only PAID orders should be attached to customers.
-- Customers from Bengaluru, Mysuru, or Pune should be considered.
-- Order dates should be shown from newest to oldest.

-- Sort customers by City A→Z, then Customer Name A→Z.

-- Tables: Customer, Orders




-- SELECT Customer.Customer_Name,
--        Customer.City,
--        Orders.Order_ID,
--        Orders.Order_Date,
--        Orders.Payment_Method,
--        Orders.Payment_Status
-- FROM Customer
-- LEFT JOIN Orders
-- ON Customer.Customer_ID = Orders.Customer_ID
-- AND Orders.Payment_Status = 'PAID'
-- AND Customer.City IN ('Bengaluru', 'Mysuru', 'Pune')
-- ORDER BY Customer.City ASC,
--          Customer.Customer_Name ASC,
--          Orders.Order_Date DESC;



-- 🏢 Business Scenario

-- The business analyst wants to identify categories that have strong sales performance.

-- Display
-- Category Name
-- Number of Orders
-- Total Product Quantity
-- Requirements
-- Consider only successfully paid orders.
-- Exclude the Grocery category.
-- Consider products with a rating of 4 or higher.
-- Consider products priced between ₹1,000 and ₹50,000.
-- Show only categories having more than 1 order.
-- Sort by Total Product Quantity high→low, then Category Name A→Z.

-- Tables: Categories, Inventory, Orders

-- SELECT Categories.Category_Name,
--        COUNT(Orders.Order_ID) AS Number_of_Orders,
--        SUM(Orders.Quantity) AS Total_Product_Quantity
-- FROM Categories
-- INNER JOIN Inventory
--     ON Categories.Category_ID = Inventory.Category_ID
-- INNER JOIN Orders
--     ON Inventory.Product_ID = Orders.Product_ID
-- WHERE Orders.Payment_Status = 'Success'
--   AND Categories.Category_Name <> 'Grocery'
--   AND Inventory.Rating >= 4
--   AND Inventory.Price BETWEEN 1000 AND 50000
-- GROUP BY Categories.Category_ID, Categories.Category_Name
-- HAVING COUNT(Orders.Order_ID) > 1
-- ORDER BY Total_Product_Quantity DESC,
--          Categories.Category_Name ASC;



-- 🏢 Business Scenario

-- The management team wants to identify suppliers whose products are being purchased successfully.

-- Display
-- Supplier Name
-- Supplier City
-- Number of Orders
-- Total Sales Quantity
-- Requirements
-- Only successful payments should be considered.
-- Consider products with a rating of 4 or higher.
-- Products from Bengaluru, Mumbai, or Hyderabad suppliers should be considered.
-- Product names should not start with F.
-- Consider products priced above ₹2,000.
-- Show only suppliers having more than 1 successful order.
-- Sort by Total Sales Quantity high→low, then Supplier Name A→Z.

-- Tables: Supplier, Inventory, Orders




-- SELECT Supplier.Supplier_Name,
--        Supplier.Supplier_City,
--        COUNT(Orders.Order_ID) AS Number_of_Orders,
--        SUM(Orders.Quantity) AS Total_Sales_Quantity
-- FROM Supplier
-- INNER JOIN Inventory
--     ON Supplier.Supplier_ID = Inventory.Supplier_ID
-- INNER JOIN Orders
--     ON Inventory.Product_ID = Orders.Product_ID
-- WHERE Orders.Payment_Status = 'Success'
--   AND Inventory.Rating >= 4
--   AND Supplier.Supplier_City IN ('Bengaluru', 'Mumbai', 'Hyderabad')
--   AND Inventory.Product_Name NOT LIKE 'F%'
--   AND Inventory.Price > 2000
-- GROUP BY Supplier.Supplier_ID,
--          Supplier.Supplier_Name,
--          Supplier.Supplier_City
-- HAVING COUNT(Orders.Order_ID) > 1
-- ORDER BY Total_Sales_Quantity DESC,
--          Supplier.Supplier_Name ASC;