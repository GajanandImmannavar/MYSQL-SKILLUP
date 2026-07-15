use Day8;

select * from Product;

📖 What is an Aggregate Function?

An aggregate function performs a calculation on multiple rows and returns one single value.

📚 Common Aggregate Functions

| Function  | Purpose        |
| --------- | -------------- |
| `COUNT()` | Counts rows    |
| `SUM()`   | Adds values    |
| `AVG()`   | Average        |
| `MAX()`   | Largest value  |
| `MIN()`   | Smallest value |

Count Total ROW 

select count(*) from Product;

Count Values of that Column and nulls will not be included if column has

select count(Product_Name) from Product;

COUNT(DISTINCT column) it helps to count unique value of column 

select count (DISTINCT Category)

from product;

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

🏢 Business Scenario

The inventory manager wants to know how many products are available in the company database.

They need only the total number of products, regardless of category or status.

📝 Problem Statement

Write an SQL query to count all products from the Product table.

Display the result with the alias:

TOTAL_PRODUCTS
📚 Topics Covered
✅ COUNT(*)
✅ Alias (AS)

select count(Product_Name) as Total_Product 
from Product;


⭐ Interview Bonus 1

The sales manager wants to know how many different brands are available in the company.

Write an SQL query to display the total number of unique brands.

Display the result as:

TOTAL_BRANDS
📚 Topics Covered
✅ COUNT(DISTINCT column)
✅ Alias (AS)


select count(DISTINCT Brand) 
from Product;



⭐ Interview Bonus 2 (Revision)

The manager wants to know how many products are currently available for sale.

Count only products where:

PRODUCT_STATUS = 'AVAILABLE'

Display the result as:

AVAILABLE_PRODUCTS
📚 Topics Covered
✅ COUNT(*)
✅ WHERE
✅ String Comparison (=)
✅ Alias (AS)



select count(Product_Name) as AVAILABLE_PRODUCT
from Product
where Product_Status = "AVAILABLE"

🧠 Interview Tip of the Day

Many students think these are always the same:

COUNT(*)
COUNT(PRODUCT_NAME)

❌ Not always.

Example:

PRODUCT_ID	PRODUCT_NAME
1	iPhone
2	NULL
3	Samsung

Now:

SELECT COUNT(*)
FROM Product;

Result:

3

But:

SELECT COUNT(PRODUCT_NAME)
FROM Product;

Result:

2

Because COUNT(column) ignores NULL.

This is one of the most common SQL interview questions.

🏢 Business Scenario

The inventory manager wants to know how many electronic products are currently available for sale.

📝 Problem Statement

Write an SQL query to count the total number of products where:

CATEGORY = 'ELECTRONICS'
PRODUCT_STATUS = 'AVAILABLE'

Display the result as:

AVAILABLE_ELECTRONICS

select count(*) as AVAILABLE_ELECTRONICS 
from Product 
where CATEGORY = 'Electronics' 
      and Product_Status = "Available"



⭐ Interview Bonus 1

The manager wants to know how many unique supplier cities provide products that are currently AVAILABLE.

Display the result as:

AVAILABLE_SUPPLIER_CITIES
📚 Topics Covered
COUNT(DISTINCT ...)
WHERE


select count(DISTINCT SUPPLIER_CITY) as AVAILABLE_SUPPLIER_CITIES
from product
where Product_Status = "Available";




⭐ Interview Bonus 2 (Revision)

Count the total number of products where:

PRICE BETWEEN 5000 AND 50000
RATING >= 4

Display the result as:

QUALITY_PRODUCTS
📚 Topics Covered
COUNT(*)
BETWEEN
AND
>=

select count(*) as QUALITY_PRODUCTS
from Product
where Price between 5000 and 50000
            and Rating >= 4

Difficulty: ⭐⭐⭐⭐⭐ (5.5/10)

Level 2

🏢 Business Scenario

The inventory manager wants to know how many high-rated electronic products are currently available for sale.

📝 Problem Statement

Write an SQL query to count the total number of products where:

CATEGORY = 'ELECTRONICS'

PRODUCT_STATUS = 'AVAILABLE'

RATING >= 4

Display the result with the alias
HIGH_RATED_ELECTRONICS

📚 Topics Covered
COUNT(*)
WHERE
AND
Comparison Operators
Alias (AS)

select count(*) as HIGH_RATED_ELECTRONICS
from Product 
where Category = "Electronics" and Product_Status = "Available" and Rating >= 4


⭐ Interview Bonus 1

Count the number of unique brands that currently have AVAILABLE products.
Display the result as:

ACTIVE_BRANDS


select count(distinct brand) as ACTIVITY_BRANDS
from Product 
where Product_Status = "AVAILABLE"



⭐ Interview Bonus 2 (Revision)

Count the number of products where:

CATEGORY IN ('ELECTRONICS', 'SPORTS')

PRICE > 10000

RATING = 5

Display the result as:

PREMIUM_PRODUCTS

select count(*) as PREMIUM_PRODUCT
from Product 
where Category in ('Electronics','Sports')
and price > 10000 and Rating = 5;


⭐ Topic: MAX()

Difficulty: ⭐⭐⭐⭐☆ (5/10)

📖 What is MAX()?

MAX() returns the largest (maximum) value from a column.

It works on:

✅ Numbers
✅ Dates
✅ Text (alphabetically)
Example 1 (Numbers)

Suppose PRICE contains:

PRICE
1000
5000
8000
2500

Query:

SELECT MAX(PRICE)
FROM Product;

Output:

MAX(PRICE)
8000

Example 2 (Rating)
RATING
2
5
4
3
SELECT MAX(RATING)
FROM Product;

Output

5
Example 3 (Date)
LAUNCH_DATE
2025-01-10
2026-03-15
2024-05-12
SELECT MAX(LAUNCH_DATE)
FROM Product;

Output

2026-03-15

Because it is the latest date.

Example 4 (Text)

Suppose BRAND contains

Apple
Dell
HP
Samsung
Sony
SELECT MAX(BRAND)
FROM Product;

Output

Sony

Why?

Because SQL compares text alphabetically.

Apple

↓

Dell

↓

HP

↓

Samsung

↓

Sony

"Sony" comes last alphabetically.

Syntax
SELECT MAX(column_name)
FROM table_name;

With alias

SELECT MAX(PRICE) AS HIGHEST_PRICE
FROM Product;
MAX() ignores NULL

Suppose PRICE contains

1000

NULL

8000

5000
SELECT MAX(PRICE)
FROM Product;

Output

8000

NULL is ignored.

Difference
COUNT()

Counts rows.

MAX()

Returns the largest value.

🟢 Level 1 – Problem 1

Difficulty: ⭐⭐⭐⭐☆ (5/10)

🏢 Business Scenario

The inventory manager wants to know the highest-priced product in the inventory for budgeting purposes.

📝 Problem Statement

Write an SQL query to display the highest product price from the Product table.

Display the result with the alias:

HIGHEST_PRICE
✅ Expected Output
HIGHEST_PRICE
95000.00

📚 Topics Covered
✅ MAX()
✅ Alias (AS)

select max(Price) as HIGHEST_PRICE 
from Product

⭐ Interview Bonus 1

The quality manager wants to know the highest rating given to any product.

Write an SQL query.

Display the result as:

BEST_RATING
✅ Expected Output
BEST_RATING
5

select max(Rating) as BEST_RATING
from  Product  

⭐ Interview Bonus 2 (Revision)

Find the highest price among products where:

CATEGORY = 'ELECTRONICS'
PRODUCT_STATUS = 'AVAILABLE'

Display the result as:

MOST_EXPENSIVE_ELECTRONIC
✅ Expected Output
MOST_EXPENSIVE_ELECTRONIC
95000.00

select max(Price) as MOST_EXPENSIVE_ELECTRONIC
from Product


🧠 Interview Rule (Remember Forever)

| Function        | NULL Values     |
| --------------- | --------------- |
| `COUNT(column)` | Ignores NULL    |
| `COUNT(*)`      | Counts all rows |
| `MAX(column)`   | Ignores NULL    |
| `MIN(column)`   | Ignores NULL    |
| `SUM(column)`   | Ignores NULL    |
| `AVG(column)`   | Ignores NULL    |






 📘 Day 6 – Aggregate Functions (Part 3)

 ⭐ Topic: `MIN()`




 📖 What is MIN()?

`MIN()` returns the **smallest (minimum)** value from a column.

Think of it as the opposite of `MAX()`.

It works on:

 ✅ Numbers
✅ Dates
 ✅ Text (Alphabetically)

---

## Example 1 (Numbers)

Suppose the `PRICE` column contains:

| PRICE |
| ----: |
|  5000 |
| 15000 |
|  2500 |
|  8000 |

Query:

```sql
SELECT MIN(PRICE)
FROM Product;
```

Output:

| MIN(PRICE) |
| ---------: |
|       2500 |

Because **2500** is the smallest value.

---

## Example 2 (Rating)

| RATING |
| -----: |
|      5 |
|      3 |
|      4 |
|      2 |

```sql
SELECT MIN(RATING)
FROM Product;
```

Output

| MIN(RATING) |
| ----------: |
|           2 |

---

## Example 3 (Date)

| LAUNCH_DATE |
| ----------- |
| 2026-01-10  |
| 2025-02-15  |
| 2024-09-05  |

```sql
SELECT MIN(LAUNCH_DATE)
FROM Product;
```

Output

| MIN(LAUNCH_DATE) |
| ---------------- |
| 2024-09-05       |

Because it is the **earliest** date.

---

## Example 4 (Text)

Suppose BRAND contains

```text
Apple
Dell
HP
Samsung
Sony
```

```sql
SELECT MIN(BRAND)
FROM Product;
```

Output

```text
Apple
```

Because **Apple** comes first alphabetically.

---

# Syntax

```sql
SELECT MIN(column_name)
FROM table_name;
```

With alias

```sql
SELECT MIN(PRICE) AS LOWEST_PRICE
FROM Product;
```

---

# MIN() ignores NULL

Suppose PRICE contains

```text
5000
NULL
10000
2500
```

```sql
SELECT MIN(PRICE)
FROM Product;
```

Output

```text
2500
```

`NULL` is ignored.

---

# Difference

```text
MAX()

↓

Largest value
```

```text
MIN()

↓

Smallest value



🟢 Level 1 – Problem 1

 🏢 Business Scenario

The inventory manager wants to know the **cheapest product price** available in the inventory.

---

 📝 Problem Statement

Write an SQL query to display the **lowest product price** from the `Product` table.

Display the result with the alias:

   text
LOWEST_PRICE

✅ Expected Output

| LOWEST_PRICE |
| -----------: |
|   600.00|

 📚 Topics Covered

 ✅ `MIN()`
 ✅ Alias (`AS`)

select min(price)
from  Product as LOWEST_PRICE ;


⭐ Interview Bonus 1

The quality team wants to know the **lowest product rating** in the inventory.

Write an SQL query.

Display the result as:

LOWEST_RATING

select min(Rating) as Lowest_Rating
from Product 


 ✅ Expected Output

| LOWEST_RATING |
| ------------: |
|         **3** |

💡 Why not 1?

Because your current `Product` table contains ratings **3, 4, and 5** only.

 ⭐ Interview Bonus 2 (Revision)

Find the **lowest price** among products where:

 `CATEGORY = 'ELECTRONICS'`
 `PRODUCT_STATUS = 'AVAILABLE'`

Display the result as:

CHEAPEST_ELECTRONIC


select min(Price) as CHEAPEST_ELECTRONICS
from Product
where CATEGORY = "ELECTRONICS" and PRODUCT_STATUS = "AVAILABLE";


✅ Expected Output

Let's check your data:

| Product         |     Price |
| --------------- | --------: |
| iPhone 16       |     85000 |
| Galaxy S25      |     72000 |
| OnePlus 14      |     56000 |
| Dell Inspiron   |     68000 |
| HP Pavilion     |     64000 |
| Sony TV         |     95000 |
| LG Refrigerator | **42000** |

Output:

| CHEAPEST_ELECTRONIC |
| ------------------: |
|        **42000.00** |





