use Joins;

show tables;


🏢 Main Problem
Business Scenario

The customer support manager wants a list of all customers, including those who have never placed an order.

Prepare a report showing:

Customer Name
Order ID
Order Date

Requirements:

Show every customer, even if they don't have an order.
If a customer has no order, the Order_ID and Order_Date should appear as NULL.
Sort by:
Customer Name (A → Z)
Order Date (Oldest → Newest)



select Customer.Customer_Name , Orders.order_id, Orders.Order_date
from Customer 
left JOIN  Orders
on Customer.customer_id = Orders.Customer_ID
order by Customer.Customer_Name  asc, Orders.Order_date asc;

 📝 Step-by-Step Explanation
Step 1
SELECT Customer.Customer_Name,
       Orders.Order_ID,
       Orders.Order_Date

Display:

Customer Name
Order ID
Order Date
Step 2
FROM Customer

Start with the Customer table.

This is called the Left Table.

Customer
Step 3
LEFT JOIN Orders

Attach the Orders table.

Customer  ← LEFT TABLE

Orders    ← RIGHT TABLE

A LEFT JOIN means:

Keep all rows from the left table, whether or not there is a matching row in the right table.

Step 4
ON Customer.Customer_ID = Orders.Customer_ID

Match each customer with their orders.

Customer.Customer_ID
        │
        ▼
Orders.Customer_ID
Step 5

If a customer has an order:

Customer

Gajanand

↓

Orders

101

2025-01-05

Result

Gajanand
101
2025-01-05
Step 6

If a customer has no order:

Customer

Rahul

↓

Orders

No Match

↓

Result

Rahul
NULL
NULL

This is the biggest difference between INNER JOIN and LEFT JOIN.

Step 7
ORDER BY Customer.Customer_Name ASC,
         Orders.Order_Date ASC;

Sort by:

Customer Name (A → Z)
Order Date (Oldest → Newest)
🔗 Table Relationship
Customer
    │
    │ Customer_ID
    ▼
Orders
🧠 SQL Execution Flow
Customer
    │
    ▼
LEFT JOIN Orders
    │
    ▼
Match Customer_ID
    │
    ▼
No Match?
    │
 ┌──┴──┐
 │     │
 ▼     ▼
Yes    No
 │      │
NULL   Show Order
 │      │
 └──┬───┘
    ▼
SELECT
    ▼
ORDER BY
    ▼
Final Output



💡 Interview Tip

A common interview question is:

Why are Order_ID and Order_Date NULL?

Answer:

Because the customer exists in the left table (Customer), but there is no matching row in the right table (Orders).
LEFT JOIN still returns the customer and fills the missing columns from the right table with NULL.
