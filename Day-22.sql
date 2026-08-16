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


-- select Customer.Customer_Name, Orders.Order_ID, Orders.Order_Date
-- from Customer
-- LEFT JOIN Orders
-- on Customer.Customer_Id = Orders.Customer_ID
-- ORDER BY Customer.Customer_Name asc, Orders.Order_Date asc;






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


-- select Supplier.Supplier_Name, Inventory.Product_Name
-- from Supplier
-- LEFT JOIN Inventory
-- on Supplier.Supplier_Id = Inventory.Supplier_Id
-- ORDER BY Supplier.Supplier_Name;


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


-- select Categories.Category_Name, Inventory.Product_Name, Inventory.Brand
-- from  Categories
-- LEFT JOIN Inventory
-- on Inventory.Category_Id = Categories.Category_ID
-- ORDER BY Categories.Category_Name asc, Inventory.Product_Name ASC;


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

-- 
-- 💼 Professional interview answer
-- 
-- INNER JOIN returns only rows that have a matching relationship between the joined tables. LEFT JOIN returns all rows from the left table and the matching rows from the right table. If there is no match, the right-table columns contain NULL.
-- 
-- 🔑 Easy comparison
-- INNER JOIN
-- → Only matching rows
-- 
-- 
-- LEFT JOIN
-- → All LEFT rows
-- → Matching RIGHT rows
-- → No match = NULL
-- 
-- For our supplier problem:
-- 
-- Supplier
--    ↓
-- LEFT JOIN
--    ↓
-- Inventory
-- 
-- Even if a supplier has no product, the supplier must still appear.
-- 
-- Example:
-- 
-- Supplier	Product
-- Tech World	iPhone 16
-- Furniture Hub	Wooden Sofa
-- New Supplier	NULL
-- 
-- That NULL is the important difference.

# Questions
-- 
-- The query starts with:
-- 
-- FROM Categories
-- LEFT JOIN Inventory
-- 
-- Why is Categories the LEFT table instead of Inventory?


-- I kept Categories as the left table because the requirement is to display every category, including categories that don't currently have any products. LEFT JOIN guarantees that all categories remain in the result, while matching products are returned from Inventory. If a category has no product, the Inventory columns will contain NULL.

-- 🔑 Remember this pattern

-- Whenever the requirement says:

-- "Show ALL X, even if X has no Y."

-- Think:

-- X → LEFT JOIN → Y

-- Examples:

-- All Customers → LEFT JOIN → Orders


-- All Suppliers → LEFT JOIN → Inventory


-- All Categories → LEFT JOIN → Inventory

-- 🏢 Main Problem
-- 
-- The customer support manager wants a report of all customers and their orders.
-- 
-- However, the manager is specifically interested in PAID orders.
-- 
-- Display:
-- Customer Name
-- Order ID
-- Payment Status
-- Requirement
-- Show every customer, including customers who have no orders.
-- If a customer has no order, Order_ID and Payment_Status should be NULL.
-- Sort by Customer Name alphabetically.
-- ⚠️ Important
-- 
-- The manager says:
-- 
-- "Don't remove customers who don't have orders."
-- 
-- Think carefully about where the Payment_Status = 'PAID' condition should go.


-- select Customer.Customer_Name, Orders.Order_ID, Orders.Payment_Status
-- from Customer
-- left JOIN Orders
-- on Customer.Customer_ID = Orders.Customer_ID
-- and Orders.Payment_Status = 'PAID'
-- order by Customer.Customer_Name asc;

-- ⭐ Remember this rule
-- LEFT JOIN + condition on right table


-- Condition in ON
--     ↓
-- Keep ALL left-table rows


-- Condition in WHERE
--     ↓
-- Can remove unmatched left-table rows




-- 🔄 Revision Problem

-- Don't solve this yet.

-- The manager wants all suppliers, including suppliers without products.

-- Display:

-- Supplier Name
-- Product Name
-- Product Status

-- But if a supplier has products, show only AVAILABLE products.

-- Suppliers without products must still appear.



-- select Supplier.Supplier_Name, Inventory.Product_Name, Inventory.Product_Status
-- from Supplier
-- left Join Inventory
-- On Supplier.Supplier_Id = Inventory.Supplier_Id
-- and Inventory.Product_Status = 'AVAILABLE';



-- Supplier
--    │
--    │ LEFT JOIN
--    ▼
-- Inventory
--    │
--    ├── AVAILABLE     → MATCH ✅
--    ├── OUT_OF_STOCK  → NO MATCH → NULL
--    ├── DISCONTINUED  → NO MATCH → NULL
--    └── No product    → NO MATCH → NULL




-- 🧠 Most important part

-- You did this correctly:

-- ON Supplier.Supplier_ID = Inventory.Supplier_ID
-- AND Inventory.Product_Status = 'AVAILABLE'

-- Do NOT move this condition into WHERE.

-- Because the requirement says:

-- Suppliers without products must still appear.

-- With the condition in ON:

-- Supplier
--    │
--    │ LEFT JOIN
--    ▼
-- Inventory
--    │
--    ├── AVAILABLE     → MATCH → show product
--    │
--    ├── OUT_OF_STOCK  → no match → NULL
--    │
--    ├── DISCONTINUED  → no match → NULL
--    │
--    └── No products   → no match → NULL

-- So even if a supplier has no AVAILABLE product, the supplier remains in the result.

-- ⭐ Key rule you're practicing
-- LEFT JOIN
--    +
-- condition on RIGHT table
--    ↓
-- Put condition in ON
--    ↓
-- Keep ALL rows from LEFT table







-- The company wants a list of all categories, including categories without products.
-- 
-- Display:
-- 
-- Category Name
-- Product Name
-- Price
-- 
-- If a category has products, show only products costing more than ₹10,000.
-- 
-- Categories without matching products must still appear.



-- select Categories.Category_Name, Inventory.Product_Name, Inventory.Price
-- from Categories
-- left join Inventory
-- on Inventory.Category_ID = Categories.Category_Id
-- and Inventory.Price >10000;



-- Categories
--     │
--     │ LEFT JOIN
--     ▼
-- Inventory
--     │
--     ├── Price > 10000 → MATCH ✅
--     │
--     ├── Price ≤ 10000 → NULL
--     │
--     └── No products   → NULL





