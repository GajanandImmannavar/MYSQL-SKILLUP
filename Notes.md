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


📘 SQL GROUP BY (Complete Theory)
📖 1. What is GROUP BY?

GROUP BY is an SQL clause that groups rows having the same value in one or more columns.

Once the groups are created, SQL can perform aggregate calculations on each group.

Examples of aggregate functions:

COUNT()
SUM()
AVG()
MIN()
MAX()
Simple Definition

GROUP BY combines rows with the same value into one group so aggregate functions can calculate results for each group.

🤔 2. Why Do We Need GROUP BY?

Suppose your Product table contains:

| PRODUCT_NAME  | CATEGORY    | STOCK |
| ------------- | ----------- | ----: |
| iPhone 16     | ELECTRONICS |    25 |
| Galaxy S25    | ELECTRONICS |    40 |
| Dell Inspiron | ELECTRONICS |    18 |
| Wooden Sofa   | FURNITURE   |    15 |
| Office Chair  | FURNITURE   |    50 |
| Rice Bag      | GROCERY     |   120 |


Now imagine your manager asks:

"How much stock do we have in each category?"

Without GROUP BY, SQL only sees individual rows.

It cannot automatically know:

Electronics = ?

Furniture = ?

Grocery = ?

It must first create groups.

That's exactly why GROUP BY exists.


🏢 3. Real Business Scenario

Imagine you work at Amazon.

The warehouse manager asks:

"Tell me the total stock available for every category."

He doesn't want:

iPhone → 25

Galaxy → 40

Dell → 18

He wants:

Electronics → 83

Furniture → 65

Grocery → 120

To answer this question, SQL must:

Group all Electronics together.
Group all Furniture together.
Group all Grocery together.
Calculate the total stock inside each group.

This is the purpose of GROUP BY.

🧠 4. How GROUP BY Thinks

Suppose SQL reads this table.

| PRODUCT_NAME | CATEGORY    | STOCK |
| ------------ | ----------- | ----: |
| iPhone       | ELECTRONICS |    25 |
| Galaxy       | ELECTRONICS |    40 |
| Dell         | ELECTRONICS |    18 |
| Sofa         | FURNITURE   |    15 |
| Chair        | FURNITURE   |    50 |
| Rice         | GROCERY     |   120 |

SQL first sees:

Electronics
Electronics
Electronics
Furniture
Furniture
Grocery

Now SQL creates groups.

ELECTRONICS
-------------
25
40
18
FURNITURE
-------------
15
50
GROCERY
-------------
120

Notice:

❗ Nothing has been calculated yet.

GROUP BY only creates groups.

🧮 5. Aggregate Function Starts

Now SQL sees:

SUM(STOCK)

It calculates:

Electronics

25
40
18

=

83

Furniture

15
50

=

65

Grocery

120

Now SQL creates a temporary (virtual) result table.

| CATEGORY    | TOTAL_STOCK |
| ----------- | ----------: |
| ELECTRONICS |          83 |
| FURNITURE   |          65 |
| GROCERY     |         120 |

This table exists only while the query is running.

📌 6. Syntax

General syntax:

SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;

Example:

SELECT CATEGORY,
       SUM(STOCK) AS TOTAL_STOCK
FROM Product
GROUP BY CATEGORY;
⚙️ 7. SQL Execution Order

When SQL executes a query with GROUP BY, it thinks like this:

FROM
↓
WHERE
↓
GROUP BY
↓
Aggregate Function
(COUNT, SUM, AVG, MIN, MAX)
↓
SELECT
↓
ORDER BY
↓
Final Output

This execution order is extremely important for interviews.

🚫 8. Common Mistakes
❌ Mistake 1
SELECT PRODUCT_NAME,
       COUNT(*)
FROM Product
GROUP BY CATEGORY;

Why is it wrong?

Because each category contains many product names.

SQL doesn't know which PRODUCT_NAME to display.

❌ Mistake 2
GROUP BY CATEGORY DESC;

Wrong.

GROUP BY never sorts data.

Sorting belongs to:

ORDER BY
❌ Mistake 3

Thinking GROUP BY removes duplicates.

It doesn't.

Compare:

DISTINCT
Apple
Apple
Samsung
Samsung

↓

Apple
Samsung

Duplicates disappear.

GROUP BY
Apple
Apple
Samsung
Samsung

↓

Apple Group

Samsung Group

Duplicates become groups, not removed.



🎯 9. GROUP BY vs DISTIN📌 6. Syntax

General syntax:

SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
GROUP BY column_name;

Example:

SELECT CATEGORY,
       SUM(STOCK) AS TOTAL_STOCK
FROM Product
GROUP BY CATEGORY;
⚙️ 7. SQL Execution Order

When SQL executes a query with GROUP BY, it thinks like this:

FROM
↓
WHERE
↓
GROUP BY
↓
Aggregate Function
(COUNT, SUM, AVG, MIN, MAX)
↓
SELECT
↓
ORDER BY
↓
Final Output

This execution order is extremely important for interviews.

🚫 8. Common Mistakes
❌ Mistake 1
SELECT PRODUCT_NAME,
       COUNT(*)
FROM Product
GROUP BY CATEGORY;

Why is it wrong?

Because each category contains many product names.

SQL doesn't know which PRODUCT_NAME to display.

❌ Mistake 2
GROUP BY CATEGORY DESC;

Wrong.

GROUP BY never sorts data.

Sorting belongs to:

ORDER BY
❌ Mistake 3

Thinking GROUP BY removes duplicates.

It doesn't.

Compare:

DISTINCT
Apple
Apple
Samsung
Samsung

↓

Apple
Samsung

Duplicates disappear.

GROUP BY
Apple
Apple
Samsung
Samsung

↓

Apple Group

Samsung Group

Duplicates become groups, not removed.

🎯 9. GROUP BY vs DISTINCT

| DISTINCT                 | GROUP BY                      |
| ------------------------ | ----------------------------- |
| Removes duplicate values | Creates groups                |
| No calculations required | Used with aggregate functions |
| Returns unique values    | Returns one row per group     |
| Used for unique lists    | Used for summaries            |


| DISTINCT                 | GROUP BY                      |
| ------------------------ | ----------------------------- |
| Removes duplicate values | Creates groups                |
| No calculations required | Used with aggregate functions |
| Returns unique values    | Returns one row per group     |
| Used for unique lists    | Used for summaries            |

📖 GROUP BY Multiple Columns
What is it?

When we write:

GROUP BY CATEGORY, BRAND;

SQL does not create groups using only CATEGORY.

Instead, it creates groups using the combination of both columns.

Think of it like this:

GROUP BY CATEGORY
↓

Group using ONE key

vs

GROUP BY CATEGORY, BRAND
↓

Group using TWO keys together
Let's Use Your Product Table

Suppose we have these rows:

| PRODUCT_NAME | CATEGORY    | BRAND   | STOCK |
| ------------ | ----------- | ------- | ----: |
| iPhone 16    | ELECTRONICS | Apple   |    25 |
| Smart Watch  | ELECTRONICS | Apple   |     0 |
| Galaxy S25   | ELECTRONICS | Samsung |    40 |
| Sony TV      | ELECTRONICS | Sony    |    10 |
| Wooden Sofa  | FURNITURE   | IKEA    |    15 |
| Bookshelf    | FURNITURE   | IKEA    |    18 |
| Office Chair | FURNITURE   | Godrej  |    50 |

Case 1 : GROUP BY CATEGORY

Query

SELECT CATEGORY,
COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY;
SQL Thinking

Step 1

Read table

↓

Step 2

Look only at CATEGORY

Electronics
Electronics
Electronics
Electronics
Furniture
Furniture
Furniture

↓

Step 3

Create groups

Electronics Group

contains

Apple

Apple

Samsung

Sony

Furniture Group

contains

IKEA

IKEA

Godrej

COUNT(*)

Output

| CATEGORY    | TOTAL_PRODUCTS |
| ----------- | -------------: |
| Electronics |              4 |
| Furniture   |              3 |

Notice something.

Apple and Samsung are mixed together because SQL only cares about CATEGORY.

Case 2 : GROUP BY BRAND

Query

SELECT BRAND,
COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY BRAND;

Now SQL ignores CATEGORY.

It only looks at BRAND.

Groups become

Apple

iPhone

Watch

Samsung

Galaxy

Sony

TV

IKEA

Sofa

Bookshelf

Godrej

Chair

Output

BRAND	TOTAL_PRODUCTS
Apple	2
Samsung	1
Sony	1
IKEA	2
Godrej	1
Case 3 : GROUP BY CATEGORY, BRAND

Now comes the important part.

Query

SELECT CATEGORY,
BRAND,
COUNT(*) AS TOTAL_PRODUCTS
FROM Product
GROUP BY CATEGORY, BRAND;
How SQL Thinks

SQL says

I won't group only by CATEGORY.

AND

I won't group only by BRAND.

Instead,

I will group by BOTH columns together.

SQL creates groups like

Electronics + Apple

contains

iPhone

Watch

Second group

Electronics + Samsung

contains

Galaxy

Third group

Electronics + Sony

contains

TV

Fourth group

Furniture + IKEA

contains

Sofa

Bookshelf

Fifth group

Furniture + Godrej

contains

Chair

Output

| CATEGORY    | BRAND   | TOTAL_PRODUCTS |
| ----------- | ------- | -------------: |
| Electronics | Apple   |              2 |
| Electronics | Samsung |              1 |
| Electronics | Sony    |              1 |
| Furniture   | IKEA    |              2 |
| Furniture   | Godrej  |              1 |

Notice

SQL treats

Electronics + Apple

as one key.

It is not

Electronics

and

Apple

separately.

Think Like an Address

Imagine an address.

Country
State
City

If someone asks

Find everyone in India

You check only

Country

If someone asks

Find everyone in Karnataka

You check only

State

If someone asks

Find everyone in India AND Karnataka

You check

Country + State

Both together.

GROUP BY CATEGORY, BRAND works exactly the same way.

SQL Execution Trace

Suppose query is

SELECT CATEGORY,
BRAND,
SUM(STOCK) AS TOTAL_STOCK
FROM Product
GROUP BY CATEGORY, BRAND
ORDER BY TOTAL_STOCK DESC;

Step 1

Read Product table

↓

Step 2

No WHERE clause

↓

Step 3

Create groups using

CATEGORY + BRAND

Groups become

Electronics + Apple
Electronics + Samsung
Electronics + Sony
Furniture + IKEA
Furniture + Godrej

↓

Step 4

Calculate

SUM(STOCK)

inside each group

↓

Temporary Table

| CATEGORY    | BRAND   | TOTAL_STOCK |
| ----------- | ------- | ----------: |
| Electronics | Apple   |          25 |
| Electronics | Samsung |          40 |
| Electronics | Sony    |          10 |
| Furniture   | IKEA    |          33 |
| Furniture   | Godrej  |          50 |


↓

ORDER BY

Sort

TOTAL_STOCK DESC

↓

Final Output

Interview Trap 1

Is this valid?

SELECT CATEGORY,
BRAND,
PRODUCT_NAME,
COUNT(*)
FROM Product
GROUP BY CATEGORY, BRAND;

❌ No.

Why?

Each (CATEGORY, BRAND) group can contain many product names.

Example:

Electronics + Apple

iPhone 16
Smart Watch

SQL asks:

Which PRODUCT_NAME should I display?

It doesn't know.

So the query is invalid (in standard SQL, and in MySQL when ONLY_FULL_GROUP_BY is enabled).

Interview Trap 2

Suppose we have:

| CATEGORY    | BRAND |
| ----------- | ----- |
| Electronics | Apple |
| Electronics | Apple |
| Furniture   | Apple |

How many groups?

Many beginners answer:

Apple = 1

Wrong.

Correct groups are:

Electronics + Apple

Furniture + Apple

Because SQL compares the entire combination.

Rule to Remember Forever

When you write:

GROUP BY A, B, C

SQL creates groups using:

(A, B, C)

as one combined key.

Not

A

then

B

then

C

but the combination:

A + B + C
🎯 Visualization

Think of GROUP BY keys as a lock.

GROUP BY CATEGORY 🔑 = One-key lock.
GROUP BY CATEGORY, BRAND 🔑🔑 = Two-key lock.
GROUP BY CATEGORY, BRAND, SUPPLIER_CITY 🔑🔑🔑 = Three-key lock.

Example 1: COUNT()


Suppose we have this table.

| PRODUCT_NAME | STOCK |
| ------------ | ----: |
| iPhone       |    25 |
| Watch        |     0 |
| Galaxy       |    40 |
| Dell         |    18 |

Now write:

SELECT COUNT(STOCK)
FROM Product;
How SQL thinks

SQL looks only at the STOCK column.

25
0
40
18

Now SQL asks:

"How many STOCK values exist?"

It does not care whether the value is 25, 0, or 1000.

It simply counts rows.

25  ✔  = 1
0   ✔  = 2
40  ✔  = 3
18  ✔  = 4
Output

| COUNT(STOCK) |
| -----------: |
|            4 |


Example 2: SUM()

Same table.

| PRODUCT_NAME | STOCK |
| ------------ | ----: |
| iPhone       |    25 |
| Watch        |     0 |
| Galaxy       |    40 |
| Dell         |    18 |

Now write

SELECT SUM(STOCK)
FROM Product;

SQL again looks at

25
0
40
18

But now SQL asks

"What is the total?"

25

+

0

+

40

+

18

=

83
Output
SUM(STOCK)
83
Visual Difference
COUNT()
25

0

40

18

SQL says

How many rows?

↓

1

2

3

4

Output

4
SUM()
25

0

40

18

SQL says

Add them

↓

25+0+40+18

↓

83

Output

83
Example 3 (With GROUP BY)

Now suppose we have:

CATEGORY	PRODUCT	STOCK
Electronics	iPhone	25
Electronics	Watch	0
Electronics	Galaxy	40
Furniture	Sofa	15
Furniture	Chair	50
Query A
SELECT CATEGORY,
       COUNT(STOCK)
FROM Product
GROUP BY CATEGORY;
SQL creates groups

Electronics

25

0

40

Furniture

15

50

Now COUNT asks

"How many STOCK values?"

Electronics

3

Furniture

2

Output

| CATEGORY    | COUNT(STOCK) |
| ----------- | -----------: |
| Electronics |            3 |
| Furniture   |            2 |


Query B
SELECT CATEGORY,
       SUM(STOCK)
FROM Product
GROUP BY CATEGORY;

Same groups.

Electronics

25

0

40

Furniture

15

50

Now SUM asks

"Add them."

Electronics

25+0+40

=

65

Furniture

15+50

=

65

Output: 
| CATEGORY    | SUM(STOCK) |
| ----------- | ---------: |
| Electronics |         65 |
| Furniture   |         65 |


Think Like a Manager

Suppose your manager asks:

Question 1

How many products are in Electronics?

You don't add stock.

You count products.

Answer

3

SQL

COUNT(*)
Question 2

Manager asks

How much stock is available in Electronics?

Now you add

25

+

0

+

40

=

65

SQL

SUM(STOCK)
The Easiest Trick You'll Never Forget

Imagine you have ₹100, ₹200, ₹300.

COUNT()

SQL says:

"How many notes do you have?"

₹100

₹200

₹300

↓

3 Notes
SUM()

SQL says:

"How much money do you have?"

100

+

200

+

300

=

600
Interview Rule

Whenever you read a question, ask yourself:

Is the manager asking...

"How many?"

Use

COUNT()

"Total?"

Use

SUM()

"Average?"

Use

AVG()

"Highest?"

Use

MAX()

"Lowest?"

Use

MIN()


🧠 Final Memory Trick

| Manager asks...                | SQL Function |
| ------------------------------ | ------------ |
| **How many products?**         | `COUNT()`    |
| **What is the total stock?**   | `SUM()`      |
| **What is the average price?** | `AVG()`      |
| **What is the highest price?** | `MAX()`      |
| **What is the lowest price?**  | `MIN()`      |





📚 Next Topic: HAVING

We'll follow the same learning format as always.

📖 1. What is HAVING?

Before SQL introduced HAVING, developers had a problem.

Suppose the Product table contains:

| CATEGORY    | STOCK |
| ----------- | ----: |
| Electronics |    25 |
| Electronics |    40 |
| Electronics |    18 |
| Furniture   |    15 |
| Furniture   |    50 |
| Grocery     |   120 |


The warehouse manager asks:

Show only those categories whose total stock is greater than 100.

Can we use WHERE?

Many beginners try this:

SELECT Category,
       SUM(Stock)
FROM Product
WHERE SUM(Stock) > 100
GROUP BY Category;

❌ This is wrong.


🤔 Why is it wrong?

Let's see how SQL executes the query.

FROM Product
        ↓
WHERE
        ↓
GROUP BY
        ↓
SUM()
        ↓
SELECT
        ↓
ORDER BY

Notice something?

WHERE runs before GROUP BY.

At the WHERE stage:

Groups do not exist.
SUM(STOCK) has not been calculated.

So SQL says:

"You are asking me to check the sum, but I haven't created the groups yet."

That's why this query fails.


💡 Why HAVING Was Introduced

HAVING is used to filter groups after they have been created.

Think of it like this:

WHERE filters rows.
HAVING filters groups.

🧠 Visual Explanation

Imagine this table:

| CATEGORY    | STOCK |
| ----------- | ----: |
| Electronics |    25 |
| Electronics |    40 |
| Electronics |    18 |
| Furniture   |    15 |
| Furniture   |    50 |
| Grocery     |   120 |

Step 1: WHERE (if present)

Filters individual rows.

↓

Step 2: GROUP BY

Creates groups.

Electronics
25
40
18
Furniture
15
50
Grocery
120

↓

Step 3: SUM()

Calculates totals.

CATEGORY	TOTAL_STOCK
Electronics	83
Furniture	65
Grocery	120

↓

Step 4: HAVING

Now SQL can finally ask:

HAVING SUM(STOCK) > 100

Result:

CATEGORY	TOTAL_STOCK
Grocery	120
📌 Syntax
SELECT column_name,
       AGGREGATE_FUNCTION(column_name)
FROM table_name
WHERE condition
GROUP BY column_name
HAVING aggregate_condition
ORDER BY column_name;
⚙️ SQL Execution Order

This is one of the most asked interview questions.

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
        ↓
Final Output


🎯 Difference Between WHERE and HAVING

| WHERE                                                           | HAVING                      |
| --------------------------------------------------------------- | --------------------------- |
| Filters rows                                                    | Filters groups              |
| Executes before GROUP BY                                        | Executes after GROUP BY     |
| Cannot use aggregate functions like `SUM()`, `COUNT()`, `AVG()` | Can use aggregate functions |
| Example: `PRICE > 5000`                                         | Example: `SUM(STOCK) > 100` |


🏢 Real Business Examples
WHERE

Show products where price is greater than ₹50,000.

SQL checks each row.

HAVING

Show categories where total stock is greater than 100.

SQL checks each group.

❌ Common Mistakes
Mistake 1
WHERE SUM(STOCK) > 100

❌ Wrong.

Mistake 2
HAVING PRICE > 50000

Usually wrong for this type of query because PRICE is a row-level value. Row-level filtering should normally be done in WHERE.

Mistake 3

Thinking WHERE and HAVING are interchangeable.

They are not.

WHERE → rows.
HAVING → groups.
🧠 Memory Trick

Think of a school.

WHERE

Teacher says:

Only students with marks above 40 may enter the classroom.

She checks each student.

That's WHERE.

HAVING

Now students are divided into classes.

Teacher says:

Show only classes whose average marks are above 80.

She checks the whole class, not individual students.

That's HAVING.

Which clause filters groups?

The answer is:

HAVING

Remember:

GROUP BY → creates groups.
HAVING → filters groups.

Think of it this way:

GROUP BY
↓

Electronics

Furniture

Sports

↓

HAVING

Keep Electronics ✅

Remove Furniture ❌

Keep Sports ✅
✅ Question 5

Your execution order:

FROM
↓

WHERE
↓

GROUP BY
↓

Aggregation
↓

HAVING
↓

SELECT
↓

ORDER BY
↓

OUTPUT

WHERE filters rows before grouping. HAVING filters groups after aggregate functions are calculated.

⭐ Your real confusion

You said:

I am not able to understand why WHERE COUNT(...) > 5 is wrong but HAVING COUNT(...) > 5 is correct.

This is the biggest confusion for almost every SQL beginner.

Forget SQL for 5 minutes.

Let's use a classroom example.


Imagine a School

There are 10 students.

| Student | Class |
| ------- | ----- |
| Ram     | A     |
| Ravi    | A     |
| Amit    | A     |
| Neha    | B     |
| Pooja   | B     |
| Kiran   | C     |
| Raj     | C     |
| Manu    | C     |
| Ajay    | C     |
| Arjun   | C     |


Teacher asks

Show classes having more than 3 students.

First SQL Reads Table

Ram   A

Ravi  A

Amit  A

Neha  B

Pooja B

Kiran C

Raj   C

Manu  C

Ajay  C

Arjun C


Nothing is grouped.

Just rows.

Step 1

SQL executes

FROM Student

Reads table.

Step 2

Now SQL reaches

WHERE

Question

Can SQL know

Class A has 3 students?

❌ NO

Can SQL know

Class C has 5 students?

❌ NO

Why?

Because SQL hasn't created groups yet.

SQL only sees

Ram

Ravi

Amit

Neha

Pooja

One row at a time.

Imagine SQL Saying
I only have one row.

How can I know
Class A has 3 students?

I haven't counted anything yet.

Exactly.

Therefore

WHERE COUNT(*) > 3

is impossible.

Now GROUP BY Starts

SQL creates

Class A

Ram

Ravi

Amit

Second group

Class B

Neha

Pooja

Third group

Class C

Kiran

Raj

Manu

Ajay

Arjun

Now groups exist.

COUNT() Starts

SQL counts.

Class A

↓

3
Class B

↓

2
Class C

↓

5

Now SQL creates

| Class | Students |
| ----- | -------: |
| A     |        3 |
| B     |        2 |
| C     |        5 |

NOW HAVING Executes

HAVING sees

| Class | Students |
| ----- | -------: |
| A     |        3 |
| B     |        2 |
| C     |        5 |

Now SQL asks

Students > 3 ?

A

3 > 3

NO

Remove.

B

2 > 3

NO

Remove.

C

5 > 3

YES

Keep.

Output

| Class | Students |
| ----- | -------: |
| C     |        5 |

WHERE → removes rows

HAVING → removes groups