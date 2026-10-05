-- use Joins;


-- 🏢 Business Scenario
-- The sales director wants to identify customers who are actively purchasing products.
-- Display
-- - Customer Name
-- - Customer City
-- - Number of Orders
-- - Total Quantity Purchased

-- Requirements
-- - Consider only orders with Payment_Status = 'Success'.
-- - Consider products with a rating of 4 or higher.
-- - Exclude products from the Grocery category.
-- - Consider products priced between ₹5,000 and ₹80,000.
-- - Customer names should contain the letter a.
-- - Show only customers having more than 2 successful orders.
-- - Sort by:
--   1. Total Quantity Purchased (high → low)
--   2. Customer Name (A → Z)

-- Tables
-- Customer
--    ↓
-- Orders
--    ↓
-- Inventory
--    ↓
-- Categories

-- 🎯 Your Task
-- Write the SQL query.
-- Concepts Hidden Inside
-- You decide what to use. The business requirement may require:
-- - JOINs
-- - WHERE
-- - LIKE
-- - BETWEEN
-- - COUNT()
-- - SUM()
-- - GROUP BY
-- - HAVING
-- - ORDER BY




select Customer.customer_Name,
       Customer.City,
       count(Orders.Order_Id) as No_Of_Orders,
       sum(Orders.Quantity) as Total_Quantity_Purchased

from Customer

inner join Orders

on Customer.Customer_Id = Orders.Customer_Id

join Inventory

on Inventory.Product_Id = Orders.Product_Id


join Categories

on Categories.Category_Id = Inventory.Category_Id


where Orders.Payment_Status = "Success"

and Inventory.Rating >=4 

and Categories.Category_Name not in ("Grocery")

and Inventory.Price between 5000 and 80000

and Customer.Customer_Name like '%a%'

group by Customer.Customer_Id,
        Customer.Customer_Name,
        Customer.City

having count(Orders.Order_Id)>2

order by Total_Quantity_Purchased desc,
         Customer.Customer_Name asc;    