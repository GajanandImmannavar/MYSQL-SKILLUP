-- use Joins;

-- 🏢 Main Problem
-- Business Scenario

-- The customer support manager wants a list of all customers, including those who have never placed an order.

-- Prepare a report showing:

-- Customer Name
-- Order ID
-- Order Date

-- Requirements:

-- Show every customer, even if they don't have an order.
-- If a customer has no order, the Order_ID and Order_Date should appear as NULL.
-- Sort by:
-- Customer Name (A → Z)
-- Order Date (Oldest → Newest)
-- 📚 Concepts Covered
-- ✅ LEFT JOIN
-- ✅ ON
-- ✅ ORDER BY
-- ✅ NULL values in the result


select Customer.Customer_Name, Orders.Order_ID, Orders.Order_Date
from Customer
LEFT JOIN Orders
on Customer.Customer_Id = Orders.Customer_ID
ORDER BY Customer.Customer_Name asc, Orders.Order_Date asc;






-- 🏢 Business Scenario
-- 
-- The HR manager wants to see all suppliers, including suppliers who have not supplied any products.
-- 
-- Display:
-- 
-- Supplier Name
-- Product Name
-- 
-- Sort by:
-- 
-- Supplier Name


select Supplier.Supplier_Name, Inventory.Product_Name
from Supplier
LEFT JOIN Inventory
on Supplier.Supplier_Id = Inventory.Supplier_Id
ORDER BY Supplier.Supplier_Name;


-- If a supplier has a product:

-- Dell Supplier → Laptop

-- If a supplier has no product:

-- XYZ Supplier → NULL
-- Key rule to remember
-- LEFT JOIN
--    ↓
-- ALL rows from LEFT table
--    +
-- Matching rows from RIGHT table
--    +
-- NULL when no match exists

-- 🏢 Business Scenario

-- The sales manager wants a report showing all categories, including categories that currently have no products.

-- Display:

-- Category Name
-- Product Name
-- Brand

-- Sort by:

-- Category Name
-- Product Name


select Categories.Category_Name, Inventory.Product_Name, Inventory.Brand
from  Categories
LEFT JOIN Inventory
on Inventory.Category_Id = Categories.Category_ID
ORDER BY Categories.Category_Name asc, Inventory.Product_Name ASC;


-- ⭐ Rule to remember

-- Whenever the question says:

-- Show all X, including X with no Y

-- Ask yourself:

-- "Which table contains X?"

-- That table must usually be on the LEFT side.

-- Here:

-- All Categories
--      ↓
-- FROM Categories
--      ↓
-- LEFT JOIN Inventory
