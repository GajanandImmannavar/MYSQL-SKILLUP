-- show databases;

-- Business scenario: Successful UPI Sales Analysis
-- The sales manager wants to analyse customers who made successful payments using UPI.

-- He needs a report showing the total number of orders and total quantity purchased by each customer.

-- Tables required
-- - Customer
-- - Orders

-- Display these columns
-- 1. Customer_Name
-- 2. City
-- 3. Total_Orders
-- 4. Total_Quantity


-- Conditions
-- 1. Consider only orders where Payment_Method = 'UPI'.
-- 2. Consider only orders where Payment_Status = 'PAID'.
-- 3. Display each customer only once.
-- 4. Show only customers who have at least one qualifying order.
-- 5. Sort by Total_Orders in descending order.


select Customer.Customer_Name, Customer.City,
       count(Orders.Order_Id) as Total_Orders, 
       sum(Orders.Quantity) as Total_Quantity

from Customer

Inner join Orders 

on Customer.Customer_Id = Orders.Customer_ID

WHERE Orders.Payment_Method = "UPI"

and Orders.Payment_Status = "PAID"

GROUP BY Customer.Customer_Id, 
         Customer.Customer_Name,
         Customer.City


HAVING Total_Orders >= 1

order by Total_Orders desc;
