-- show Databases;

-- use Day6;


-- select * from  Orders;


🏢 Business Scenario

The customer service team has received complaints about delayed deliveries. They want to review all delivered orders that received a low rating so they can identify products or services that need improvement.

📝 Problem Statement

Write an SQL query to display the following columns:

PRODUCT_NAME
CUSTOMER_NAME
RATING
DELIVERED_DATE

Display only the orders where:

DELIVERY_STATUS = 'DELIVERED'
RATING <= 2

-- Sort the results by DELIVERED_DATE from newest to oldest.

select  Product_name , Customer_name, Rating, Delivered_Date  
from Orders 
where Delivery_Status = 'Delivered' and Rating <= 2
order by  Delivered_Date  desc;



