show Databases;

use Day6;


select * from  Orders;


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



select Product_name , Customer_name, Rating , delivered_date

from orders
where Delivery_status = "Delivered" and Rating >=2
order BY DELIVERED_DATE desc;


⭐ Interview Bonus 2 (Revision)

Write a query to display all columns where:

RATING IS NULL

Sort the result by ORDER_DATE in ascending order.

📚 Topics Covered
IS NULL
ORDER BY
ASC


select * from  Orders 
where rating is null
order by Order_date asc;

🏢 Business Scenario

The marketing team is launching a special promotion for Samsung products. They only want to target products whose names start with the letter 'S' and have already been paid. To highlight premium items first, they want the most expensive products at the top of the report.

📝 Problem Statement

Write an SQL query to display the following columns:

PRODUCT_NAME
BRAND
PRICE
PAYMENT_STATUS

Display only the rows where:

PRODUCT_NAME starts with 'S'
PAYMENT_STATUS = 'PAID'

Sort the results by PRICE from highest to lowest.


select  Product_name , brand, price, payment_status 
from orders 
where Product_name like 'S%' and Payment_status = 'Paid' 
order by Price desc;


⭐ Interview Bonus 2 (Revision)

Write a query to display all columns where:

PRICE BETWEEN 5000 AND 30000
PAYMENT_STATUS = 'PAID'

Sort the results by PRICE in ascending order.

📚 Topics Covered
BETWEEN
AND
ORDER BY
ASC


select * from orders 
where price BETWEEN 5000 and 30000  and 
payment_status = 'Paid' 
order by Price asc;

🏢 Business Scenario

The logistics team wants to monitor high-value orders that are still pending delivery. They want to process the most recent orders first so they can reduce delivery delays.

📝 Problem Statement

Write an SQL query to display the following columns:

ORDER_ID
PRODUCT_NAME
PRICE
DELIVERY_STATUS
ORDER_DATE

Display only the rows where:

PRICE > 20000
DELIVERY_STATUS = 'ORDERED'

Sort the result by ORDER_DATE from newest to oldest.

📚 Topics Covered
✅ SELECT
✅ WHERE
✅ >
✅ AND
✅ String Comparison (=)
✅ ORDER BY
✅ DESC
✅ Date Sorting

select ORDER_ID , PRODUCT_NAME , PRICE
DELIVERY_STATUS , ORDER_DATE from Orders 
where Price > 20000 and Delivery_status = 'ORDERED' 
order by order_date desc; 

⭐ Interview Bonus 1 (Revision)

Write a query to display all columns where:

BRAND IN ('Samsung', 'Apple')

Sort the result by PRICE from highest to lowest.

📚 Topics Covered
IN
ORDER BY
DESC

select * from orders 
where brand in ('Samsung','Apple') 
order by price desc;

⭐ Interview Bonus 2 (Revision)

Write a query to display:

PRODUCT_NAME
PRICE

where:

PRODUCT_NAME contains the word "Phone"

Sort the result by PRICE in ascending order.

📚 Topics Covered
LIKE
%
ORDER BY
ASC

select Product_name, price 
from ORDERS
where Product_name like '%Phone%'
order by Price asc;


🧠 Interview Tip of the Day

One missing comma can cause a syntax error. Before running a query, quickly check:

✅ Are all selected columns separated by commas?
✅ Is every string inside quotes?
✅ Does every WHERE condition use the correct operator?
✅ Is ORDER BY the last clause?

This 10-second check prevents many common mistakes.


🏢 Business Scenario

The sales manager wants to review paid orders. The report should show the most expensive products first. If two products have the same price, they should be listed alphabetically by product name to make the report easier to read.

📝 Problem Statement

Write an SQL query to display the following columns:

PRODUCT_NAME
PRICE
PAYMENT_STATUS

Display only the rows where:

PAYMENT_STATUS = 'PAID'

Sort the results by:

PRICE from highest to lowest.
If two products have the same PRICE, sort by PRODUCT_NAME from A → Z.
📚 Topics Covered
✅ SELECT
✅ WHERE
✅ ORDER BY
✅ Multiple Column Sorting
✅ DESC
✅ ASC
✅ String Comparison


select Product_Name, price, payment_status 
from orders 
where Payment_status = 'PAID'
order by PRICE desc , Product_name asc;


⭐ Interview Bonus 2 (Revision)

Write a query to display:

PRODUCT_NAME
BRAND
PRICE

where:

BRAND IN ('Samsung', 'Apple')
PRICE BETWEEN 10000 AND 80000

Sort by:

BRAND (A → Z)
PRICE (Highest → Lowest)
📚 Topics Covered
IN
BETWEEN
Multiple ORDER BY
ASC
DESC

select Product_name , Brand, Price from Orders 
where Brand in ('Samsung','Apple') and price BETWEEN 10000 and 80000
order by Brand asc , price desc ;

📘 Day 6 – DISTINCT


🏢 Business Scenario

The business owner wants to know which brands are available in the store. They don't want to see the same brand listed multiple times.

📝 Problem Statement

Write an SQL query to display all unique brands from the Orders table.

📚 Topics Covered
✅ SELECT
✅ DISTINCT

select DISTINCT Brand
from Orders;

⭐ Interview Bonus 2 (Revision)

Write a query to display all unique payment statuses, sorted alphabetically (A → Z).

📚 Topics Covered
DISTINCT
ORDER BY
ASC

select distinct Payment_Status 
from  orders 
order by Payment_status asc;


🏢 Business Scenario

The operations manager wants to know which cities customers are ordering from. They don't want duplicate city names because they're preparing a city-wise delivery expansion plan.

📝 Problem Statement

Write an SQL query to display all unique customer cities from the Orders table.

Sort the cities in alphabetical order (A → Z).

📚 Topics Covered
✅ SELECT
✅ DISTINCT
✅ ORDER BY
✅ ASC

select distinct CUSTOMER_CITY 
from orders 
order by Customer_city asc;


⭐ Interview Bonus 2 (Revision)

Write a query to display all unique delivery statuses, sorted from Z → A.

📚 Topics Covered
DISTINCT
ORDER BY
DESC

select distinct DELIVERY_STATUS 
from orders
order by DELIVERY_STATUS desc;


