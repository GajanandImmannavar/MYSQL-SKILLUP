-- use Joins;

-- show tables;

-- The inventory manager wants to review all suppliers and their products.

-- Prepare a report showing:

-- Supplier Name
-- Supplier City
-- Product Name
-- Product Price
-- Product Status
-- Requirements
-- Show every supplier, even if they have no products.
-- If a supplier has products, show only products that are currently AVAILABLE.
-- Sort by:
-- Supplier Name (A → Z)
-- Product Price (Highest → Lowest)
-- ⚠️ Important

-- The phrase:

-- "Show every supplier, even if they have no products."

-- means you must preserve all suppliers.

-- And:

-- "Only products that are AVAILABLE."

-- select  Inventory.Product_Name, 
--         Inventory.Price, 
--         Inventory.Product_Status, 
--         Supplier.Supplier_City, 
--         Supplier.Supplier_Name
-- from Supplier

-- LEFT JOIN Inventory
--     on Supplier.Supplier_Id = Inventory.Supplier_Id
--     and Inventory.Product_Status = "AVAILABLE"
--     ORDER BY Supplier.Supplier_Name asc, 
--     Inventory.Price desc;


-- The customer support manager wants to see all customers and their orders.

-- Display:

-- Customer Name
-- Order ID
-- Payment Status
-- Order Date

-- Requirements:

-- Show every customer.
-- Show only PAID orders.
-- Customers without PAID orders must still appear.
-- Sort by Customer Name A → Z.


-- select Customer.Customer_Name, Orders.Order_Id,
--        Orders.Payment_Status,
--        Orders.Order_Date
-- from Customer 
-- left join Orders
--         on Customer.Customer_Id = Orders.Customer_Id
--         and Orders.Payment_Status = "PAID"
-- order by Customer.Customer_Name asc;

-- inside the ON condition.

-- Customer
--    │
--    │ LEFT JOIN
--    ▼
-- Orders
--    │
--    ├── PAID     → MATCH ✅
--    ├── PENDING  → NULL
--    ├── FAILED   → NULL
--    └── No order → NULL


-- The category manager wants a report containing:

-- Category Name
-- Product Name
-- Brand
-- Price

-- Requirements:

-- Show every category.
-- Show only products with:
-- Rating ≥ 4
-- Price > ₹20,000
-- Product Status = AVAILABLE
-- Categories without matching products must still appear.

-- Sort by:

-- Category Name A → Z
-- Price highest → lowest

select Categories.Category_Name,
       Inventory.Product_Name, 
       Inventory.Brand,
       Inventory.Price
from Categories
left join Inventory
    on Categories.Category_ID = Inventory.Category_Id
    and Inventory.Rating >=4
    and Inventory.Price > 20000
    and Inventory.Product_Status = 'AVAILABLE'
order by Categories.Category_Name asc,
         Inventory.Price desc;


-- Think:

-- Categories
--     │
--     │ LEFT JOIN
--     ▼
-- Inventory
--     │
--     ├── Rating ≥ 4
--     │
--     ├── Price > 20,000
--     │
--     └── AVAILABLE
--            ↓
--         MATCH ✅

-- If a category has no product satisfying all three conditions:

-- Category
--    │
--    └── No matching product
--             ↓
--      Product_Name → NULL
--      Brand        → NULL
--      Price        → NULL

-- The category still appears. ✅