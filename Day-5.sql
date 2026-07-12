create database Day4;

use Day4;

CREATE TABLE Orders (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_NAME VARCHAR(100) NOT NULL,
    CATEGORY VARCHAR(50) NOT NULL,
    BRAND VARCHAR(50) NOT NULL,
    CUSTOMER_NAME VARCHAR(100) NOT NULL,
    CUSTOMER_CITY VARCHAR(50) NOT NULL,
    PRICE DECIMAL(10,2) NOT NULL CHECK (PRICE >= 0),
    QUANTITY INT NOT NULL CHECK (QUANTITY > 0),
    DISCOUNT_PERCENT DECIMAL(5,2) DEFAULT 0.00 CHECK (DISCOUNT_PERCENT >= 0),
    FINAL_AMOUNT DECIMAL(10,2) NOT NULL CHECK (FINAL_AMOUNT >= 0),
    PAYMENT_METHOD ENUM(
        'UPI',
        'CREDIT_CARD',
        'DEBIT_CARD',
        'NET_BANKING',
        'COD'
    ) NOT NULL,
    PAYMENT_STATUS ENUM(
        'PAID',
        'UNPAID',
        'PENDING',
        'FAILED',
        'REFUNDED'
    ) DEFAULT 'UNPAID',
    PACK_STATUS ENUM(
        'PACKED',
        'NOT PACKED'
    ) DEFAULT 'NOT PACKED',
    DELIVERY_STATUS ENUM(
        'ORDERED',
        'PACKED',
        'SHIPPED',
        'OUT FOR DELIVERY',
        'DELIVERED',
        'CANCELLED',
        'RETURNED'
    ) DEFAULT 'ORDERED',
    DELIVERY_PARTNER VARCHAR(50),
    RATING INT CHECK (RATING BETWEEN 1 AND 5),
    REVIEW TEXT,
    ORDER_DATE DATE NOT NULL,
    PACKED_DATE DATE,
    SHIPPED_DATE DATE,
    DELIVERED_DATE DATE,
    CANCELLED_DATE DATE,
    RETURNED_DATE DATE
);


INSERT INTO Orders
(PRODUCT_NAME, CATEGORY, BRAND, CUSTOMER_NAME, CUSTOMER_CITY, PRICE, QUANTITY, DISCOUNT_PERCENT, FINAL_AMOUNT, PAYMENT_METHOD, PAYMENT_STATUS, PACK_STATUS, DELIVERY_STATUS, DELIVERY_PARTNER, RATING, REVIEW, ORDER_DATE, PACKED_DATE, SHIPPED_DATE, DELIVERED_DATE, CANCELLED_DATE, RETURNED_DATE)
VALUES
('iPhone 16','Mobile','Apple','Rahul','Bangalore',85000,1,5,80750,'UPI','PAID','PACKED','DELIVERED','BlueDart',5,'Excellent','2026-01-02','2026-01-03','2026-01-04','2026-01-06',NULL,NULL),

('Galaxy S25','Mobile','Samsung','Sneha','Mysore',72000,1,10,64800,'CREDIT_CARD','PAID','PACKED','DELIVERED','Delhivery',4,'Very Good','2026-01-05','2026-01-06','2026-01-07','2026-01-10',NULL,NULL),

('MacBook Air M4','Laptop','Apple','Amit','Mumbai',120000,1,8,110400,'NET_BANKING','PAID','PACKED','DELIVERED','BlueDart',5,'Awesome','2026-01-06','2026-01-07','2026-01-08','2026-01-11',NULL,NULL),

('Inspiron 15','Laptop','Dell','Kiran','Hyderabad',65000,1,12,57200,'DEBIT_CARD','PAID','PACKED','SHIPPED','DTDC',NULL,NULL,'2026-01-07','2026-01-08','2026-01-09',NULL,NULL,NULL),

('Bravia 55','TV','Sony','Pooja','Pune',78000,1,15,66300,'COD','UNPAID','NOT PACKED','ORDERED',NULL,NULL,NULL,'2026-01-08',NULL,NULL,NULL,NULL,NULL),

('AirPods Pro','Accessories','Apple','Nikhil','Delhi',24000,2,5,45600,'UPI','PAID','PACKED','DELIVERED','BlueDart',5,'Worth it','2026-01-10','2026-01-11','2026-01-12','2026-01-14',NULL,NULL),

('Boat Rockerz','Accessories','Boat','Ramesh','Bangalore',2500,3,20,6000,'UPI','PAID','PACKED','DELIVERED','Ekart',4,'Nice','2026-01-12','2026-01-13','2026-01-14','2026-01-16',NULL,NULL),

('Gaming Mouse','Accessories','Logitech','Divya','Chennai',3500,2,10,6300,'UPI','PAID','PACKED','DELIVERED','Delhivery',5,'Smooth','2026-01-13','2026-01-14','2026-01-15','2026-01-17',NULL,NULL),

('ThinkPad X1','Laptop','Lenovo','Arjun','Bangalore',98000,1,7,91140,'CREDIT_CARD','PAID','PACKED','OUT FOR DELIVERY','DTDC',NULL,NULL,'2026-01-15','2026-01-16','2026-01-17',NULL,NULL,NULL),

('Realme 14','Mobile','Realme','Anita','Hubli',22000,2,5,41800,'COD','UNPAID','NOT PACKED','ORDERED',NULL,NULL,NULL,'2026-01-16',NULL,NULL,NULL,NULL,NULL),

('Galaxy Watch','Accessories','Samsung','Sanjay','Pune',18000,1,5,17100,'UPI','PAID','PACKED','RETURNED','BlueDart',2,'Battery issue','2026-01-18','2026-01-19','2026-01-20','2026-01-22',NULL,'2026-01-25'),

('HP Pavilion','Laptop','HP','Priya','Mysore',70000,1,10,63000,'NET_BANKING','PAID','PACKED','DELIVERED','Delhivery',4,'Good Laptop','2026-01-19','2026-01-20','2026-01-21','2026-01-23',NULL,NULL),

('OnePlus 14','Mobile','OnePlus','Akash','Delhi',48000,1,8,44160,'UPI','PAID','PACKED','DELIVERED','Ekart',5,'Excellent Phone','2026-01-20','2026-01-21','2026-01-22','2026-01-24',NULL,NULL),

('LG OLED','TV','LG','Megha','Mumbai',98000,1,15,83300,'DEBIT_CARD','FAILED','NOT PACKED','CANCELLED',NULL,NULL,NULL,'2026-01-22',NULL,NULL,NULL,'2026-01-23',NULL),

('iPad Air','Tablet','Apple','Vijay','Bangalore',65000,2,5,123500,'CREDIT_CARD','PAID','PACKED','DELIVERED','BlueDart',5,'Perfect','2026-01-24','2026-01-25','2026-01-26','2026-01-28',NULL,NULL),

('Redmi Note 15','Mobile','Xiaomi','Neha','Hyderabad',19000,2,10,34200,'UPI','PAID','PACKED','DELIVERED','DTDC',4,'Good','2026-01-25','2026-01-26','2026-01-27','2026-01-29',NULL,NULL),

('Noise Buds','Accessories','Noise','Harish','Chennai',3000,4,15,10200,'COD','UNPAID','NOT PACKED','ORDERED',NULL,NULL,NULL,'2026-01-26',NULL,NULL,NULL,NULL,NULL),

('Acer Aspire','Laptop','Acer','Deepa','Hubli',55000,1,5,52250,'UPI','PAID','PACKED','DELIVERED','Ekart',4,'Satisfied','2026-01-27','2026-01-28','2026-01-29','2026-01-31',NULL,NULL),

('Sony Headphones','Accessories','Sony','Manoj','Mumbai',12000,2,10,21600,'NET_BANKING','PAID','PACKED','SHIPPED','Delhivery',NULL,NULL,'2026-01-28','2026-01-29','2026-01-30',NULL,NULL,NULL),

('Moto Edge','Mobile','Motorola','Kavya','Bangalore',32000,1,5,30400,'UPI','PAID','PACKED','DELIVERED','BlueDart',5,'Loved it','2026-01-29','2026-01-30','2026-01-31','2026-02-02',NULL,NULL);


select * from  Orders;


🎯 Problem 1 – ORDER BY
🏢 Business Scenario

The sales manager wants to identify the most expensive products in the inventory.

📝 Problem Statement

Write an SQL query to display all columns from the Orders table.

Sort the products by PRICE in descending order.

select * from Orders 
order by  price DESC;



⭐ Interview Bonus 2

Write a query to display only:

PRODUCT_NAME
PRICE

Sort them from lowest price to highest price.


select Product_name, price from Orders

order  by price asc;


If two products have the same PRICE, does SQL guarantee which one will appear first when you write:

ORDER BY PRICE DESC;

Why or why not?

Suppose the table contains:

| PRODUCT_NAME | PRICE |
| ------------ | ----: |
| Laptop       | 50000 |
| Monitor      | 50000 |
| Tablet       | 50000 |

Query:

SELECT *
FROM Orders
ORDER BY PRICE DESC;

Will SQL always return:

Laptop
Monitor
Tablet

❌ No.

It might return:

Monitor
Tablet
Laptop

or

Tablet
Laptop
Monitor

Why?

Because you only told SQL:

"Sort by PRICE."

You did not tell SQL how to sort rows that have the same PRICE.

So SQL is free to return them in any order.

If you want a guaranteed order, you must sort by another column too.

Example:

ORDER BY PRICE DESC,
PRODUCT_NAME ASC;


🏢 Business Scenario

The finance team is preparing a report of the least expensive products. 
They want to review low-cost products first to decide 
whether discounts or bundle offers should be introduced.

select Product_Name, price from orders
order by  price asc;


📝 Interview Note (Very Important)

From now on, whenever you use ORDER BY, ask yourself:

"What happens if two rows have the same value?"

If the order matters, sort by another column too.

Example:

ORDER BY PRICE DESC, PRODUCT_NAME ASC;

We'll cover multiple-column sorting in depth later.

🏢 Business Scenario

The customer support team wants to generate a report where customer names are listed alphabetically.
This makes it easier to quickly locate a customer's order while handling support calls.

select Customer_Name, Product_Name, Order_Date 

 from Orders

 order by Customer_Name asc;

⭐ Interview Bonus 3 (Revision)

Without using ORDER BY, write a query to display:

CUSTOMER_NAME
PRODUCT_NAME

only for customers whose **PAYMENT_STATUS = 'PAID'`.


select Customer_Name, Product_Name, Payment_Status
from Orders 
where Payment_Status = 'Paid';

💡 Interview Tip

Many beginners think:

ASC
DESC

are functions.

They are not.

They are sorting keywords used with the ORDER BY clause.


🏢 Business Scenario

The warehouse team wants to process the most recently placed PAID orders first.
This helps them prioritize packing and shipping for customers who have already completed payment.


📝 Problem Statement

Write an SQL query to display all columns from the Orders table where:

PAYMENT_STATUS = 'PAID'

Sort the results by ORDER_DATE from newest to oldest.



-- select * from Orders 

-- where Payment_Status = 'Paid'

-- order by Order_date DESC;

⭐ Interview Bonus 2 (Revision)

Write a query to display:

PRODUCT_NAME
PRICE

where:

PRICE > 30000

Sort the result from highest price to lowest price.

📚 Topics Covered
WHERE
>
ORDER BY
DESC


select  Product_Name, Price 
from Orders
where Price > 30000
order by price DESC;



⭐ Interview Bonus 3 (Thinking)

Which clause is executed first by SQL?

SELECT *
FROM Orders
WHERE PAYMENT_STATUS = 'PAID'
ORDER BY ORDER_DATE DESC;

Choose one:

A. ORDER BY
B. WHERE

Then explain why in your own words.

⭐ Bonus 3

Question:

Which executes first?

You answered:

WHERE because WHERE is before ORDER BY.

🟡 Half Correct (8/10)

It's true that WHERE executes first, but not because it's written first.

This is a very common interview question.

SQL Execution Order

When SQL processes your query:

SELECT *
FROM Orders
WHERE PAYMENT_STATUS = 'PAID'
ORDER BY ORDER_DATE DESC;

Internally, SQL thinks like this:

1️⃣ FROM
      ↓
2️⃣ WHERE
      ↓
3️⃣ SELECT
      ↓
4️⃣ ORDER BY

So:

First, SQL reads the table.
Then it filters only the PAID rows.
Then it selects the requested columns.
Finally, it sorts the remaining rows.
🧠 Easy Way to Remember

Imagine you have 1,000 orders.

You ask:

Show only PAID orders, sorted by newest first.

Does SQL:

Sort all 1,000 rows and then filter?

❌ No (that would waste work).

Instead, it:

Filters to only the PAID rows.
Sorts those rows.

That's why WHERE logically comes before ORDER BY.


🎯 Interview Tip

Don't answer:

"WHERE executes first because it is written first."

Instead say:

"WHERE executes before ORDER BY because SQL first filters the required rows,
then sorts only the filtered result. This is SQL's logical execution order."

🏢 Business Scenario

The warehouse manager wants to prioritize high-value electronics orders that have already been paid. The most expensive products should be packed first.

📝 Problem Statement

Write an SQL query to display all columns from the Orders table where:

CATEGORY = 'Electronics'
PAYMENT_STATUS = 'PAID'

Sort the results by PRICE from highest to lowest.

select * from Orders 
where  Category =' Electronics' and Payment_status = 'Paid'
order by Price desc;



