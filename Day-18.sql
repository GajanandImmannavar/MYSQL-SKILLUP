-- use Joins;

-- show tables;

-- ⭐ Bonus Problem

-- This introduces a slightly harder JOIN.

-- Business Scenario

-- The inventory manager wants to know:

-- Product Name
-- Customer Name
-- Order Date

-- for all available products that have been ordered.

-- Sort by:

-- Product Name
-- Order Date             


select Inventory.Product_Name, Customer.Customer_Name, Orders.Order_Date
from Customer
join  Orders
on  Customer.Customer_Id = Orders.Customer_Id
join Inventory
on Orders.Product_Id = Inventory.Product_Id
where Inventory.Product_Status = 'AVAILABLE'
order by Inventory.Product_Name asc, Orders.Order_Date;