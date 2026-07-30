-- use Joins;

-- show Tables;

-- select * from Orders;

-- 🏢 Main Problem
-- Business Scenario

-- The sales director wants to identify valuable customers who purchased premium products.

-- Prepare a report showing:

-- Customer Name
-- Product Name
-- Price
-- Payment Method

-- Include only those orders where:

-- Product is AVAILABLE
-- Payment Status is PAID
-- Product price is greater than ₹30,000
-- Customer belongs to BENGALURU or MYSURU
-- Brand name does not start with 'A'

-- Sort the report by:

-- Customer Name (A → Z)
-- Price (Highest → Lowest)
-- 📚 Concepts Covered
-- ✅ INNER JOIN (3 Tables)
-- ✅ WHERE
-- ✅ IN
-- ✅ NOT LIKE
-- ✅ ORDER BY

select Customer.Customer_Name, Inventory.Product_Name,
 Inventory.Price, Orders.Payment_Method
from customer  
join Orders 
on Orders.Customer_ID = Customer.Customer_ID  
join inventory
on Orders.Product_ID = Inventory.Product_ID
where Inventory.Product_Status = 'AVAILABLE'
    and Orders.Payment_Status = 'PAID'
    and Inventory.Price > 30000
    and Customer.City in ('BENGALURU','MYSURU')
    and Inventory.Brand not like 'A%'
    order by Customer.Customer_Name asc, Inventory.Price desc;
