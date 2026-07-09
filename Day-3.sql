show databases;

use Products;

SELECT * from orders;

Topic 1 — IN Operator
🤔 Why do we need IN?

Suppose your manager says:

Show me all orders where the payment status is PAID or REFUNDED.

You already know how to write it:

SELECT *
FROM Orders
WHERE PAYMENT_STATUS = 'PAID'
OR PAYMENT_STATUS = 'REFUNDED';

✅ This works.

But imagine the manager says:

Show orders whose payment status is:

PAID
REFUNDED
PENDING
FAILED
UNPAID

Using OR, the query becomes long:

WHERE PAYMENT_STATUS = 'PAID'
OR PAYMENT_STATUS = 'REFUNDED'
OR PAYMENT_STATUS = 'PENDING'
OR PAYMENT_STATUS = 'FAILED'
OR PAYMENT_STATUS = 'UNPAID';

😓 It works, but it's difficult to read.

✅ Solution — IN

The same query becomes:

SELECT *
FROM Orders
WHERE PAYMENT_STATUS IN (
'PAID',
'REFUNDED',
'PENDING',
'FAILED',
'UNPAID'
);

Much cleaner.

Think of IN Like This

Instead of asking:

Is the payment status equal to PAID?

You're asking:

Is the payment status one of these values?

PAYMENT_STATUS

↓

Is it in this list?

PAID
REFUNDED
PENDING
FAILED

YES → Return row
NO  → Ignore row
Syntax
SELECT columns
FROM table_name
WHERE column_name IN (value1, value2, value3);

Small Example

Table:

| PRODUCT | CATEGORY    |
| ------- | ----------- |
| iPhone  | Electronics |
| Shoes   | Fashion     |
| TV      | Electronics |
| Watch   | Accessories |

Query:

SELECT *
FROM Orders
WHERE CATEGORY IN ('Electronics', 'Fashion');

Result:

✅ Electronics

✅ Fashion

❌ Accessories

Real-Life Example

Suppose Flipkart wants products only from:

Apple
Samsung
OnePlus

Instead of writing:

WHERE BRAND='Apple'
OR BRAND='Samsung'
OR BRAND='OnePlus';

Write:

WHERE BRAND IN ('Apple','Samsung','OnePlus');

Exactly the same result.

📝 Problem 1 (Day 3)
🏢 Business Scenario

The finance department is preparing a report.

They only want orders whose payment status is:

PAID
REFUNDED


🎯 Problem Statement

Write an SQL query to display all columns for orders where the payment status is either:

PAID
REFUNDED

⚠️ Use the IN operator.


select * from orders
where PAYMENT_STATUS in ('paid', 'Refund');


📘 Day 3 – Problem 2 (NOT IN)
🏢 Business Scenario

The finance team has already completed work on PAID and REFUNDED orders.

Now they want to see all remaining orders.

📝 Problem Statement

Write an SQL query to display all details of orders where the payment status is not:

PAID
REFUNDED

⚠️ Use the NOT IN operator.

select * from Orders 
where  PAYMENT_STATUS not in ('paid', 'Refunded');


Note: 

Because NULL introduces SQL's three-valued logic. In many cases,
 NOT IN combined with NULL can cause no rows to be returned, 
even when you expect matches.

📘 Day 3 – Problem 3 (BETWEEN)


1️⃣ What is BETWEEN?

BETWEEN is a SQL operator used to find values within a range.

Instead of checking:

Is this value greater than or equal to X and less than or equal to Y?

SQL lets us write it in a simpler way.

Think of it as asking:

"Is this value inside this range?"

2️⃣ Why do we need BETWEEN?

Before BETWEEN, we would write:

SELECT *
FROM Orders
WHERE PRICE >= 20000
AND PRICE <= 50000;

This works perfectly.

But SQL developers noticed this pattern is very common.

So SQL introduced:

SELECT *
FROM Orders
WHERE PRICE BETWEEN 20000 AND 50000;

Same meaning.

Cleaner.

More readable.

3️⃣ How does BETWEEN work?

Suppose your table has:
| PRODUCT | PRICE |
| ------- | ----: |
| Mouse   |   999 |
| Shoes   |  2500 |
| Mobile  | 25000 |
| Laptop  | 50000 |
| TV      | 70000 |

Now SQL checks each row.

Query:

WHERE PRICE BETWEEN 20000 AND 50000;

SQL internally thinks like this:

Mouse
999 >= 20000 ❌
999 <= 50000 ✅

Final:

FALSE AND TRUE = FALSE

Not returned.

Mobile
25000 >= 20000 ✅
25000 <= 50000 ✅

Final:

TRUE AND TRUE = TRUE

Returned.

Laptop
50000 >= 20000 ✅
50000 <= 50000 ✅

Returned.

TV
70000 >= 20000 ✅
70000 <= 50000 ❌

Not returned.

⭐ Important

BETWEEN is inclusive.

That means it includes both boundary values.

If you write:

BETWEEN 20000 AND 50000

SQL includes:

✅ 20000

✅ 50000

This is one of the most common interview questions.

4️⃣ Internal Logic

Many beginners think BETWEEN is something magical.

It isn't.

SQL converts:

WHERE PRICE BETWEEN 20000 AND 50000;

into:

WHERE PRICE >= 20000
AND PRICE <= 50000;

Exactly the same logic.

So whenever you see BETWEEN, imagine:

>= Lower Value

AND

<= Upper Value

This is another operator that's very common in interviews.

Where is BETWEEN used?

Companies use it everywhere.

💰 E-commerce

Find products priced between ₹20,000 and ₹50,000.

WHERE PRICE BETWEEN 20000 AND 50000;
🏥 Hospital

Patients aged between 30 and 60.

WHERE AGE BETWEEN 30 AND 60;
🏦 Banking

Transactions between ₹10,000 and ₹50,000.

WHERE AMOUNT BETWEEN 10000 AND 50000;
📚 School

Students whose marks are between 80 and 100.

WHERE MARKS BETWEEN 80 AND 100;
📅 Dates

Orders placed during January.

WHERE ORDER_DATE
BETWEEN '2025-01-01'
AND '2025-01-31';

🏢 Business Scenario

The sales manager wants to identify mid-range products.

Products priced between ₹20,000 and ₹50,000 are considered mid-range.

📝 Problem Statement

Write an SQL query to display all details of orders where:

PRICE is between ₹20,000 and ₹50,000 (inclusive).

⚠️ Use the BETWEEN operator.

Select * from orders
where Price BETWEEN 20000 and 50000;








