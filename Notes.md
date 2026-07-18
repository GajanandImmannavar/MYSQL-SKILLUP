| Pattern      | Meaning                                                     | Example Matches               |
| ------------ | ----------------------------------------------------------- | ----------------------------- |
| `'A%'`       | Starts with **A**                                           | Anjali, Apple, Amazon         |
| `'%A'`       | Ends with **A**                                             | Pooja, Suma                   |
| `'%A%'`      | Contains **A** anywhere                                     | Gajanand, Raj, Harsh          |
| `'A_'`        | Starts with **A** and has **exactly 2 characters**          | AB, A1                        |
| `'A__'`      | Starts with **A** and has **exactly 3 characters**          | ABC, A12                      |
| `'____'`     | Exactly **4 characters**                                    | Ravi, Amit                    |
| `'______'`   | Exactly **6 characters**                                    | Sanjay, Kiran1                |
| `'_A%'`      | **Second character is A**                                   | Raj, Manoj, Harsh             |
| `'%A_'`      | **Second last character is A**                              | Ram, Raj, Man                 |
| `'__A%'`     | **Third character is A**                                    | Prakash, Shashi               |
| `'%A__'`     | **Third character from the end is A**                       | Prakash, Sagar                |
| `'_A_'`      | Exactly **3 characters**, and the **middle character is A** | Ram, Raj                      |
| `'R__'`      | Starts with **R** and has **exactly 3 characters**          | Ram, Raj                      |
| `'R____'`    | Starts with **R** and has **exactly 5 characters**          | Rahul, Rohit                  |
| `'%Laptop%'` | Contains the word **Laptop**                                | Dell Laptop, HP Gaming Laptop |
| `'Laptop%'`  | Starts with **Laptop**                                      | Laptop Bag, Laptop Stand      |
| `'%Laptop'`  | Ends with **Laptop**                                        | Dell Laptop, HP Laptop        |



🧠 Easy Way to Remember:

%  → 0, 1, or Many Characters

_  → Exactly One Character


Examples
'A%'

A Anything

↓

A
AB
ABC
APPLE
AMAZON
'%A'

Anything A

↓

Pooja
Suma
'%A%'

Anything A Anything

↓

Raj
Gajanand
Harsh
'_A%'

□ A Anything

↓

Raj
Manoj
Harsh
'%A_'

Anything A □

↓

Ram
Raj
Man
'_A_'

□ A □

↓

Ram
Raj
'R____'

R □ □ □ □

↓

Rahul
Rohit

⭐ Interview Tip: Instead of memorizing patterns, imagine each _ as an empty box (□) and % as "anything can come here". Once you visualize it that way, even complex patterns become easy to understand.




Topic 6: NOT LIKE

1️⃣ What is NOT LIKE?

NOT LIKE is the opposite of LIKE.

LIKE → Return rows that match a pattern.
NOT LIKE → Return rows that do not match a pattern.

Think of it like this:

LIKE
↓

Keep Matching Rows
NOT LIKE
↓

Remove Matching Rows
Keep Everything Else
2️⃣ Why do we need NOT LIKE?

Suppose your company has 10,000 products.

The manager says:

Show me all products except those containing the word "Samsung".

Using LIKE:

SELECT *
FROM Orders
WHERE PRODUCT_NAME LIKE '%Samsung%';

This returns only Samsung products.

But the manager wants everything except Samsung.

That's where NOT LIKE comes in.

SELECT *
FROM Orders
WHERE PRODUCT_NAME NOT LIKE '%Samsung%';

Simple and readable.

3️⃣ How does NOT LIKE work?

Suppose your table contains:

PRODUCT_NAME
Samsung S25
iPhone 16
Samsung TV
Dell Laptop
OnePlus 13

Query:

SELECT *
FROM Orders
WHERE PRODUCT_NAME NOT LIKE '%Samsung%';

SQL checks each row.

Row 1
Samsung S25

Contains Samsung?

↓

YES

Because it matches the pattern, NOT LIKE removes it.

❌ Not returned.

Row 2
iPhone 16

Contains Samsung?

↓

NO

Doesn't match the pattern.

NOT LIKE keeps it.

✅ Returned.

Row 3
Samsung TV

Contains Samsung?

↓

YES

❌ Not returned.

Row 4
Dell Laptop

Contains Samsung?

↓

NO

✅ Returned.

4️⃣ Internal Logic

Suppose you write:

WHERE PRODUCT_NAME NOT LIKE '%Samsung%';

SQL thinks:

Does PRODUCT_NAME match '%Samsung%'?

YES → Reject row ❌

NO → Return row ✅

It's simply the opposite of LIKE.

5️⃣ Syntax

General syntax:

SELECT columns
FROM table_name
WHERE column_name NOT LIKE 'pattern';
6️⃣ Real-World Examples
🛒 E-commerce

Show all products except Apple.

SELECT *
FROM Orders
WHERE BRAND NOT LIKE 'Apple';
📦 Orders

Show customers whose names do not start with A.

SELECT *
FROM Orders
WHERE CUSTOMER_NAME NOT LIKE 'A%';
🏥 Hospital

Patients whose disease does not contain "Diabetes".

SELECT *
FROM Patients
WHERE DECEASE NOT LIKE '%Diabetes%';
🏦 Banking

Customers whose city does not end with "pur".

SELECT *
FROM Customers
WHERE CITY NOT LIKE '%pur';
7️⃣ Common Patterns

Starts with A:

LIKE 'A%'

Not starting with A:

NOT LIKE 'A%'

Ends with n:

LIKE '%n'

Not ending with n:

NOT LIKE '%n'

Contains Phone:

LIKE '%Phone%'

Doesn't contain Phone:

NOT LIKE '%Phone%'

Exactly 5 characters starting with R:

LIKE 'R____'

Everything except that pattern:

NOT LIKE 'R____'
8️⃣ Common Mistakes
❌ Mistake 1

Thinking NOT LIKE means "not equal".

Wrong.

WHERE BRAND NOT LIKE 'Apple'

Since there is no wildcard, it behaves similarly to "not Apple".

But if you write:

WHERE BRAND NOT LIKE 'App%'

Now it excludes:

Apple
Appario
Application Inc.

because they all start with App.

❌ Mistake 2

Forgetting quotes.

Wrong:

NOT LIKE %Samsung%

Correct:

NOT LIKE '%Samsung%'
❌ Mistake 3

Thinking % and _ change meaning with NOT LIKE.

They don't.

% still means "any number of characters."

_ still means "exactly one character."

Only the final result is reversed.

9️⃣ Interview Questions
Q1

Difference between:

LIKE 'A%'

and

NOT LIKE 'A%'

Answer:

LIKE 'A%' → Returns names starting with A.
NOT LIKE 'A%' → Returns names not starting with A.
Q2

Difference between:

LIKE '%Phone%'

and

NOT LIKE '%Phone%'
LIKE → Products containing "Phone".
NOT LIKE → Products not containing "Phone".
Q3

Can NOT LIKE use _?

✅ Yes.

Example:

WHERE CUSTOMER_NAME NOT LIKE 'R____';

Returns all customers except those whose names start with R and have exactly 5 characters.

🧠 Easy Way to Remember
LIKE

↓

Keep Matching Rows
NOT LIKE

↓

Remove Matching Rows
Keep Everything Else


📘 Topic 7: IS NULL & IS NOT NULL


1️⃣ What is NULL?

Many beginners think NULL means:

0
Empty string ('')
Space (' ')

❌ Wrong.

NULL means:

The value is unknown or missing.

SQL stores NULL when there is no value.

Example
CUSTOMER_NAME	REVIEW
Gajanand	Excellent
Rahul	NULL
Arjun	Good

Rahul's review is not:

Empty
Zero
"NULL"

It means:

The review has not been provided.

2️⃣ Why do we need IS NULL?

Suppose your manager asks:

Show all orders where customers have not written a review.

Some beginners write:

SELECT *
FROM Orders
WHERE REVIEW = NULL;

❌ Wrong.

It returns 0 rows, even if many reviews are NULL.

Why?

Let's understand.

3️⃣ Why doesn't = NULL work?

This is the biggest interview question.

Suppose:

REVIEW = NULL

Now SQL asks:

Is an unknown value equal to another unknown value?

It cannot answer.

Example:

You ask your friend:

"What is your future salary?"

Friend:

"I don't know."

Now ask:

"Is your future salary ₹50,000?"

Can they answer?

❌ No.

Because they don't know their future salary.

That's exactly how SQL treats NULL.

NULL means unknown, not a real value.

4️⃣ SQL Uses Three-Valued Logic

Normally we think:

TRUE

FALSE

SQL actually has:

TRUE

FALSE

UNKNOWN

Example:

NULL = 10

Result:

UNKNOWN
NULL > 10

Result:

UNKNOWN
NULL < 100

Result:

UNKNOWN

Since the WHERE clause only returns rows when the condition is TRUE, these comparisons never return rows.

5️⃣ Correct Way

SQL introduced:

IS NULL

Instead of:

= NULL

Correct:

SELECT *
FROM Orders
WHERE REVIEW IS NULL;

This means:

Return rows where the REVIEW column has no value.

6️⃣ IS NOT NULL

The opposite is:

SELECT *
FROM Orders
WHERE REVIEW IS NOT NULL;

Meaning:

Return rows where REVIEW contains a value.

7️⃣ Syntax
Check for missing values
SELECT columns
FROM table_name
WHERE column_name IS NULL;
Check for existing values
SELECT columns
FROM table_name
WHERE column_name IS NOT NULL;


8️⃣ Real-World Examples
🛒 E-commerce

Products without reviews.

SELECT *
FROM Orders
WHERE REVIEW IS NULL;
📦 Delivery

Orders not yet delivered.

SELECT *
FROM Orders
WHERE DELIVERED_DATE IS NULL;


💳 Payments

Orders where the delivery partner has not been assigned.

SELECT *
FROM Orders
WHERE DELIVERY_PARTNER IS NULL;
🏥 Hospital

Patients not yet discharged.

SELECT *
FROM Patients
WHERE DATE_OF_DISCHARGE IS NULL;


9️⃣ Common Mistakes
❌ Mistake 1
WHERE REVIEW = NULL;

Wrong.

Correct:

WHERE REVIEW IS NULL;
❌ Mistake 2
WHERE REVIEW != NULL;

Wrong.

Correct:

WHERE REVIEW IS NOT NULL;
❌ Mistake 3

Thinking NULL means zero.

Example:

VALUE
NULL
0

These are different.

NULL

↓

Unknown
0

↓

Known value


🔟 Interview Traps
Trap 1

Will this work?

WHERE REVIEW = NULL;

❌ No.

Trap 2

Will this work?

WHERE REVIEW <> NULL;

❌ No.

Trap 3

Correct answer?

WHERE REVIEW IS NULL;

✅ Yes.

Trap 4

Correct answer?

WHERE REVIEW IS NOT NULL;

✅ Yes.

🧠 Easy Way to Remember
NULL

↓

Unknown

↓

Use

IS NULL
Has Value

↓

Use

IS NOT NULL


📊 Quick Revision
Wrong	    Correct
= NULL	    IS NULL
!= NULL	    IS NOT NULL
<> NULL	    IS NOT NULL


ORDER BY (Multiple Columns)


📖 What is Multiple Column Sorting?

It means sorting by more than one column.

SQL sorts using the first column.

If two rows have the same value, SQL moves to the second column.

If the second column is also the same, SQL checks the third column, and so on.

🧠 Real-Life Example

Imagine your class results.

Name	Marks
Rahul	95
Akash	95
Zoya	90

If you sort only by Marks:

95
95
90

Who comes first?

Rahul or Akash?

👉 SQL doesn't know.

So we tell SQL:

If marks are the same, sort by Name.

Now:

Name	Marks
Akash	95
Rahul	95
Zoya	90
SQL Syntax
ORDER BY column1, column2;

Example:

ORDER BY PRICE DESC,
         PRODUCT_NAME ASC;

Meaning:

Sort by PRICE from highest to lowest.
If two products have the same price, sort them alphabetically by PRODUCT_NAME.

Rule to Remember

SQL thinks like this:

First Column
      ↓
Same value?
      ↓
Check Second Column
      ↓
Still same?
      ↓
Check Third Column

🎯 Interview Question

If I write:

ORDER BY PRICE DESC,
         PRODUCT_NAME ASC;

Which column has higher priority?

✅ Answer: PRICE.

PRODUCT_NAME is only used when two rows have the same price.



🧠 Interview Tip of the Day

Many beginners think:

ORDER BY PRICE DESC, PRODUCT_NAME ASC;

means:

"Sort both columns at the same time."

❌ That's not how SQL works.

SQL sorts hierarchically:

Step 1:
PRICE

65000
65000
65000
50000
50000
10000

Now only the rows with the same PRICE are compared:

65000
---------
Laptop
Monitor
Phone

Those are then sorted by:

PRODUCT_NAME ASC

Laptop
Monitor
Phone

So the final result is:

PRICE DESC
        ↓
PRODUCT_NAME ASC

This "hierarchical sorting" explanation is something interviewers love because it shows you understand the logic, not just the syntax.

📘 Day 6 – DISTINCT
📖 What is DISTINCT?

DISTINCT is used to remove duplicate values from the result.

It returns only unique values.

Think of it as saying:

"Don't show me repeated values. Show each value only once."

🏢 Real-World Example

Suppose your Orders table has:

ORDER_ID	BRAND
1	Samsung
2	Apple
3	Samsung
4	Dell
5	Apple
6	HP

Now imagine your manager asks:

"Which brands do we sell?"

If you write:

SELECT BRAND
FROM Orders;

Result:

Samsung
Apple
Samsung
Dell
Apple
HP

❌ Samsung and Apple appear multiple times.

Now use:

SELECT DISTINCT BRAND
FROM Orders;

Result:

Samsung
Apple
Dell
HP

✅ Each brand appears only once.

💡 Why Do We Need DISTINCT?

Imagine your table has 1 million orders.

Your manager asks:

"How many different payment methods do customers use?"

You don't want:

UPI
UPI
UPI
UPI
UPI
COD
COD
COD
CARD
CARD

You want:

UPI
COD
CARD

That's exactly what DISTINCT does.

🧠 Syntax
SELECT DISTINCT column_name
FROM table_name;

Example:

SELECT DISTINCT CATEGORY
FROM Orders;
DISTINCT with Multiple Columns

Many beginners get confused here.

Suppose:

BRAND	CATEGORY
Samsung	Electronics
Samsung	Electronics
Samsung	Mobile
Apple	Electronics

Query:

SELECT DISTINCT BRAND, CATEGORY
FROM Orders;

Result:

BRAND	CATEGORY
Samsung	Electronics
Samsung	Mobile
Apple	Electronics

Notice something important:

❌ SQL is not making BRAND unique.

It is making the combination of:

BRAND + CATEGORY

unique.

This is a very common interview question.

DISTINCT Does NOT Change the Table

Many beginners think:

SELECT DISTINCT BRAND
FROM Orders;

removes duplicate rows from the database.

❌ Wrong.

It only removes duplicates from the output.

Your original table remains exactly the same.

DISTINCT and NULL

Another interview favorite.

Suppose:

REVIEW
Excellent
NULL
Good
NULL
Excellent

Query:

SELECT DISTINCT REVIEW
FROM Orders;

Result:

Excellent
Good
NULL

Even if there are many NULL values, DISTINCT shows only one NULL.

Aggregate Functions (Part 1)
⭐ Topic: COUNT() and COUNT(DISTINCT ...)

Difficulty: ⭐⭐⭐⭐☆ (4.5/10)

📖 What is an Aggregate Function?

An aggregate function performs a calculation on multiple rows and returns one single value.

For example:

Suppose the Employee table contains:

EMPLOYEE_NAME
Gajanand
Mallu
Akash
Chandru
Darshan

Instead of returning all rows, SQL can return:

5

using:

SELECT COUNT(*)
FROM Employee;

One value.

That's why it's called an aggregate function.

📚 Common Aggregate Functions
Function	Purpose
COUNT()	Counts rows
SUM()	Adds values
AVG()	Average
MAX()	Largest value
MIN()	Smallest value

Today we'll learn only COUNT().

COUNT(*)

Counts all rows.

Example:

SELECT COUNT(*)
FROM Employee;

Suppose the table has 40 employees.

Output:

40

It counts every row.

Even if some columns contain NULL, the row is still counted.

COUNT(column_name)

Now look carefully.

Suppose:

EMPLOYEE_NAME	REVIEW
Gajanand	    Excellent
Mallu	             NULL
Akash	             Good
Chandru	       NULL

Query:

SELECT COUNT(REVIEW)
FROM Employee;

Output:

2

Why?

Because

NULL

is not counted.

Interview question!

COUNT(DISTINCT column)

Now combine what you learned yesterday.

Suppose:

DEPARTMENT
AIML
AIML
AIML
CSE
IS
IS

Query:

SELECT COUNT(DISTINCT DEPARTMENT)
FROM Employee;

Result:

3

Because unique departments are:

AIML
CSE
IS
Difference

Suppose:

DEPARTMENT
AIML
AIML
AIML
CSE
IS
Query 1
SELECT COUNT(DEPARTMENT)
FROM Employee;

Result

5
Query 2
SELECT COUNT(DISTINCT DEPARTMENT)
FROM Employee;

Result

3

Huge interview question.

Common Mistakes
❌ Wrong
COUNT DISTINCT(DEPARTMENT)
✅ Correct
COUNT(DISTINCT DEPARTMENT)
❌ Wrong
SELECT DISTINCT COUNT(DEPARTMENT)

Different meaning.

We'll learn that later.

Interview Tip

Remember this:

COUNT(*)

↓

Counts Rows
COUNT(Column)

↓

Counts NON-NULL values
COUNT(DISTINCT Column)

↓

Counts Unique NON-NULL values

This is one of the most frequently asked SQL interview questions.

##########################################################################################
# Aggregate Functions (Part 2)
⭐ Topic: MAX()

Difficulty: ⭐⭐⭐⭐☆ (5/10)

📖 What is MAX()?

MAX() returns the largest (maximum) value from a column.

It works on:

✅ Numbers
✅ Dates
✅ Text (alphabetically)


select max()

Aggregate Functions (Part 4)
⭐ Topic: SUM()

Difficulty: ⭐⭐⭐⭐⭐⭐ (6/10)

📖 What is SUM()?

SUM() returns the total (addition) of all values in a numeric column.

Think of it like using a calculator to add all numbers together.

It only works with numeric columns such as:

✅ INT
✅ DECIMAL
✅ FLOAT

It cannot be used on:

❌ VARCHAR
❌ ENUM
❌ DATE
Why do companies use SUM()?

Imagine you're an inventory manager.

You don't want to see every product's stock.

Instead, you want to know:

"How many products do we have in total?"

or

"What is the total value of all products?"

That's where SUM() is used.

Syntax
SELECT SUM(column_name)
FROM table_name;

With alias

SELECT SUM(STOCK) AS TOTAL_STOCK
FROM Product;
Example 1

Suppose STOCK contains

STOCK
10
20
30
40

Query

SELECT SUM(STOCK)
FROM Product;

Output

SUM(STOCK)
100

Because

10+20+30+40=100
Example 2

Suppose PRICE contains

PRICE
1000
2500
5000
SELECT SUM(PRICE)
FROM Product;

Output

SUM(PRICE)
8500
SUM() ignores NULL

Suppose

STOCK
20
NULL
15
10
SELECT SUM(STOCK)
FROM Product;

Output

45

Because

20+15+10

NULL is ignored.


# Difference

| Function | Purpose         |
| -------- | --------------- |
| COUNT()  | Counts rows     |
| MAX()    | Largest value   |
| MIN()    | Smallest value  |
| SUM()    | Adds all values |


Aggregate Functions (Part 5)
⭐ Topic: AVG()

Difficulty: ⭐⭐⭐⭐⭐⭐☆ (6.5/10)

📖 What is AVG()?

AVG() returns the average (mean) value of a numeric column.

Formula:

Average = Sum of all values / Number of values

SQL does this calculation automatically.

Example 1

Suppose the PRICE column contains:

PRICE
100
200
300
400

Query:

SELECT AVG(PRICE)
FROM Product;
Calculation
100 + 200 + 300 + 400 = 1000

1000 / 4 = 250
Output
AVG(PRICE)
250.00
Example 2

Suppose RATING contains:

RATING
5
4
3
4
SELECT AVG(RATING)
FROM Product;

Calculation

5+4+3+4=16

16/4=4

Output

AVG(RATING)
4.00
AVG() ignores NULL

Suppose STOCK contains

STOCK
20
30
NULL
50

Query

SELECT AVG(STOCK)
FROM Product;

Calculation

20+30+50=100

100/3=33.33

NOT

100/4

Because NULL is ignored.

# Difference

| Function | Purpose           |
| -------- | ----------------- |
| COUNT()  | Counts values     |
| MAX()    | Largest value     |
| MIN()    | Smallest value    |
| SUM()    | Total of values   |
| AVG()    | Average of values |


#############################################################################################


# GROUP BY

📖 What is GROUP BY?

GROUP BY is used to group rows that have the same value in one or more columns.

Suppose your Product table has:

| PRODUCT_NAME | CATEGORY    | PRICE |
| ------------ | ----------- | ----: |
| iPhone 16    | ELECTRONICS | 85000 |
| Galaxy S25   | ELECTRONICS | 72000 |
| Wooden Sofa  | FURNITURE   | 35000 |
| Office Chair | FURNITURE   |  8500 |
| Rice Bag     | GROCERY     |  2500 |

If you ask:

"How many products are there in each category?"

SQL first creates groups.

ELECTRONICS
-------------
iPhone 16
Galaxy S25

FURNITURE
-------------
Wooden Sofa
Office Chair

GROCERY
-------------
Rice Bag

Then it performs COUNT(*) inside each group.

Result:

| CATEGORY    | TOTAL_PRODUCTS |
| ----------- | -------------: |
| ELECTRONICS |              2 |
| FURNITURE   |              2 |
| GROCERY     |              1 |

Why do we need GROUP BY?

Without GROUP BY, aggregate functions return one value.

Example:

SELECT COUNT(*)
FROM Product;

Output:

COUNT(*)
30

This tells us there are 30 products in total.

But suppose the manager asks:

"How many products are in each category?"

COUNT() alone cannot answer that.

That's why we use GROUP BY.

Syntax
SELECT column_name, AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;

Example:

SELECT CATEGORY, COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY;
How SQL Executes This Query

This is very important for interviews.

Suppose you write:

SELECT CATEGORY, COUNT(*)
FROM Product
GROUP BY CATEGORY;

SQL works like this:

Step 1

Read all rows.

↓

Step 2

Create groups based on CATEGORY.

↓

Step 3

Count rows inside each group.

↓

Step 4

Display the result.

Visual Example

Original Table

| Product | Category    |
| ------- | ----------- |
| iPhone  | Electronics |
| Galaxy  | Electronics |
| Sofa    | Furniture   |
| Chair   | Furniture   |
| Rice    | Grocery     |

Electronics
------------
iPhone
Galaxy

Furniture
------------
Sofa
Chair

Grocery
------------
Rice

Now SQL calculates:

Electronics → 2

Furniture → 2

Grocery → 1


Output:

| CATEGORY    | COUNT |
| ----------- | ----: |
| Electronics |     2 |
| Furniture   |     2 |
| Grocery     |     1 |

GROUP BY with SUM()
SELECT CATEGORY,
       SUM(STOCK) AS TOTAL_STOCK
FROM Product
GROUP BY CATEGORY;

Now SQL adds stock inside each category.

GROUP BY with AVG()
SELECT CATEGORY,
       AVG(PRICE) AS AVERAGE_PRICE
FROM Product
GROUP BY CATEGORY;

Each category gets its own average.

GROUP BY with MAX()
SELECT CATEGORY,
       MAX(PRICE) AS HIGHEST_PRICE
FROM Product
GROUP BY CATEGORY;

Each category gets its most expensive product price.


GROUP BY with MIN()
SELECT CATEGORY,
       MIN(PRICE) AS CHEAPEST_PRICE
FROM Product
GROUP BY CATEGORY;

Very Important Rule (Interview Question ⭐)

Suppose you write:

SELECT PRODUCT_NAME, COUNT(*)
FROM Product;

❌ This is wrong because SQL doesn't know which product name to display.

Now look at this:

SELECT CATEGORY, COUNT(*)
FROM Product
GROUP BY CATEGORY;

✅ Correct.

Because every output row represents one category.

Rule to Remember Forever

When using GROUP BY:

✅ Every selected column must be:

Included in the GROUP BY clause, or
Used inside an aggregate function (COUNT, SUM, AVG, MAX, MIN).

This is one of the most common SQL interview questions.

Difference Between DISTINCT and GROUP BY

Many beginners confuse these.

DISTINCT
SELECT DISTINCT CATEGORY
FROM Product;

Output:

CATEGORY
ELECTRONICS
FURNITURE
CLOTHING
GROCERY
SPORTS

It only removes duplicates.

GROUP BY
SELECT CATEGORY,
       COUNT(*)
FROM Product
GROUP BY CATEGORY;

Output:

| CATEGORY    | COUNT |
| ----------- | ----: |
| ELECTRONICS |    10 |
| FURNITURE   |     7 |
| CLOTHING    |     5 |
| GROCERY     |     4 |
| SPORTS      |     4 |

It creates groups and performs calculations.

Execution Order (Interview Level)

Remember this order:

FROM

↓

WHERE

↓

GROUP BY

↓

Aggregate Functions

↓

HAVING (We'll learn next)

↓

ORDER BY

Never forget this order.



# 📘 GROUP BY Syntax

## 1️⃣ Basic Syntax

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;
```

### Example

```sql
SELECT CATEGORY,
       COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY;
```

---

## 2️⃣ GROUP BY + WHERE

`WHERE` filters rows **before** SQL creates groups.

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition
GROUP BY column_name;
```

### Example

```sql
SELECT CATEGORY,
       COUNT(*) AS AVAILABLE_PRODUCTS
FROM Product
WHERE PRODUCT_STATUS = 'AVAILABLE'
GROUP BY CATEGORY;
```

---

## 3️⃣ GROUP BY + ORDER BY

Sort the grouped result.

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
ORDER BY column_name ASC;
```

### Example

```sql
SELECT CATEGORY,
       COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY
ORDER BY CATEGORY ASC;
```

---

## 4️⃣ GROUP BY + WHERE + ORDER BY

This is one of the most common formats.

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition
GROUP BY column_name
ORDER BY column_name ASC;
```

### Example

```sql
SELECT BRAND,
       COUNT(*) AS TOTAL_PRODUCTS
FROM Product
WHERE PRODUCT_STATUS = 'AVAILABLE'
GROUP BY BRAND
ORDER BY BRAND ASC;
```

---

## 5️⃣ GROUP BY Multiple Columns

SQL creates groups based on the **combination** of columns.

```sql
SELECT column1,
       column2,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column1, column2;
```

### Example

```sql
SELECT CATEGORY,
       BRAND,
       COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY, BRAND;
```

---

## 6️⃣ GROUP BY + HAVING

We'll learn `HAVING` next, but this is the syntax.

```sql
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```

Example:

```sql
SELECT CATEGORY,
       COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY
HAVING COUNT(*) > 5;
```

---

# ⭐ General Syntax (Remember This)

```sql
SELECT column1,
       column2,
       AGGREGATE_FUNCTION(column3)
FROM table_name
WHERE condition
GROUP BY column1, column2
HAVING condition
ORDER BY column1 ASC;
```

---

# 🧠 Execution Order (Very Important)

Even though we **write** the query like this:

```sql
SELECT ...
FROM ...
WHERE ...
GROUP BY ...
HAVING ...
ORDER BY ...
```

SQL **executes** it in this order:

```text
FROM
   ↓
WHERE
   ↓
GROUP BY
   ↓
Aggregate Function
   ↓
HAVING
   ↓
SELECT
   ↓
ORDER BY
```

> 💡 **Interview Tip:**
> `WHERE` filters **individual rows**, while `HAVING` filters **groups** after `GROUP BY`.

---

## 📌 Shortcut to Remember

Whenever you need to write a `GROUP BY` query, think of this template:

```sql
SELECT group_column,
       AGGREGATE_FUNCTION(column) AS alias
FROM table_name
WHERE condition
GROUP BY group_column
ORDER BY group_column;
```

This template will work for most of the `GROUP BY` problems you'll encounter. Next, we'll start solving business scenario problems using this syntax, one level at a time.



Interview Rule
DISTINCT → Removes duplicate values.
GROUP BY → Creates groups.

Question

Which executes first?

A. GROUP BY

B. WHERE

FROM
   ↓
WHERE
   ↓
GROUP BY
   ↓
Aggregate Functions
   ↓
HAVING
   ↓
SELECT
   ↓
ORDER BY


Why?

Imagine you write:

SELECT CATEGORY,
COUNT(*)
FROM Product
WHERE PRODUCT_STATUS = 'AVAILABLE'
GROUP BY CATEGORY;

SQL first removes all rows that are not AVAILABLE.

Only then does it create groups.

So:

Filter first → Group later.


🧠 6. SQL Execution Trace (NEW)

This is the part I think you'll enjoy most.

We'll trace exactly how SQL executes the query.

For example:

SELECT CATEGORY,
       SUM(STOCK) AS TOTAL_STOCK
FROM Product
WHERE PRODUCT_STATUS = 'AVAILABLE'
GROUP BY CATEGORY
ORDER BY TOTAL_STOCK DESC,
         CATEGORY ASC;

Then we'll walk through it.

Step 1 — Original Table
30 rows

↓

Step 2 — FROM
SQL reads the Product table.

↓

Step 3 — WHERE
Remove OUT_OF_STOCK

Remove DISCONTINUED

Remaining rows = 25

↓

Step 4 — GROUP BY
Create groups

Electronics
Furniture
Clothing
Grocery
Sports

↓

Step 5 — SUM()
Electronics = 148

Furniture = 110

...

↓

Step 6 — Temporary Table
CATEGORY	TOTAL_STOCK
Electronics	148
Furniture	110
Clothing	285
Grocery	490
Sports	130

↓

Step 7 — ORDER BY

Sort by TOTAL_STOCK DESC.

If two totals are equal, sort by CATEGORY ASC.

↓

Final Output
🎯 7. Interview Trap

