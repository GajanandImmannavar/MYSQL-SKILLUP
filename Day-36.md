Here are complete, copy-friendly learning notes for the concepts you made mistakes with. I'll explain what each concept means, why we use it, when to use it, its syntax, examples, common mistakes, and practice questions using your MySQL tables.

SQL Learning Notes · CROSS JOIN, WHERE, AND, OR, LIKE, COUNT, Window Functions

# 1. AND vs OR in SQL

## What is AND?

`AND` is used when all conditions must be true for a row to appear in the result.

### Syntax

```
SELECT column_name
FROM table_name
WHERE condition1
AND condition2;
```

### Example

```
SELECT Inventory.Product_Name,
       Inventory.Price,
       Inventory.Rating
FROM Inventory
WHERE Inventory.Price BETWEEN 3000 AND 70000
AND Inventory.Rating >= 3;
```

This returns products that satisfy both conditions:

- Price is between ₹3,000 and ₹70,000.
- Rating is at least 3.

If a product costs ₹2,000 and has a rating of 5, it is excluded because the price condition is false.

## What is OR?

`OR` is used when at least one condition must be true.

### Syntax

```
SELECT column_name
FROM table_name
WHERE condition1
OR condition2;
```

### Example

```
SELECT Inventory.Product_Name,
       Inventory.Price
FROM Inventory
WHERE Inventory.Product_Name LIKE 'S%'
OR Inventory.Product_Name LIKE '%e%';
```

This returns products whose names:

- Start with `S`, or
- Contain the letter `e`.

A product can satisfy either condition or both.

## AND vs OR: Truth table

| Condition 1 | Condition 2 | `AND` | `OR`  |
| ----------- | ----------- | ----- | ----- |
| True        | True        | True  | True  |
| True        | False       | False | True  |
| False       | True        | False | True  |
| False       | False       | False | False |

Easy memory trick:

- `AND` = all conditions must pass.
- `OR` = at least one condition must pass.

# 2. Why do we use parentheses with AND and OR?

Parentheses help control which conditions are evaluated together.

Consider this query:

```
SELECT Customer.Customer_Name,
       Inventory.Product_Name
FROM Customer
CROSS JOIN Inventory
WHERE Customer.City = 'BENGALURU'
AND Inventory.Product_Name LIKE 'S%'
OR Inventory.Product_Name LIKE '%e%';
```

This query can return rows that match the last condition even when the customer is not from Bengaluru.

Why? SQL evaluates `AND` before `OR`.

The query is interpreted like this:

```
WHERE
    (Customer.City = 'BENGALURU'
     AND Inventory.Product_Name LIKE 'S%')
    OR Inventory.Product_Name LIKE '%e%'
```

That is probably not what we want.

### Correct version

```
SELECT Customer.Customer_Name,
       Inventory.Product_Name
FROM Customer
CROSS JOIN Inventory
WHERE Customer.City = 'BENGALURU'
AND (
    Inventory.Product_Name LIKE 'S%'
    OR Inventory.Product_Name LIKE '%e%'
);
```

Now the customer must be from Bengaluru, and the product name must satisfy at least one of the two name conditions.

### General rule

Whenever you mix `AND` and `OR`, ask yourself:

Which conditions must always be true, and which conditions are alternatives?

Use parentheses to make that logic explicit.

# 3. LIKE in MySQL

`LIKE` is used to search for a text pattern.

It is especially useful when you don't know the exact product name, brand, or city value.

## The two wildcard symbols

- `%` matches zero or more characters.
- `_` matches exactly one character.

## Common LIKE patterns

| Pattern     | Meaning                       | Example match |
| ----------- | ----------------------------- | ------------- |
| `'S%'`      | Starts with S                 | Samsung       |
| `'%e'`      | Ends with e                   | Apple         |
| `'%a%'`     | Contains a                    | Camera        |
| `'A%e'`     | Starts with A and ends with e | Apple         |
| `'_a%'`     | Second character is a         | Camera        |
| `'%phone%'` | Contains phone                | Smartphone    |

### Example: names starting with S

```
SELECT Inventory.Product_Name
FROM Inventory
WHERE Inventory.Product_Name LIKE 'S%';
```

### Example: names containing e

```
SELECT Inventory.Product_Name
FROM Inventory
WHERE Inventory.Product_Name LIKE '%e%';
```

### Example: names ending with s

```
SELECT Inventory.Product_Name
FROM Inventory
WHERE Inventory.Product_Name LIKE '%s';
```

## NOT LIKE

`NOT LIKE` excludes values that match a pattern.

Example: exclude products whose names end with `s`.

```
SELECT Inventory.Product_Name
FROM Inventory
WHERE Inventory.Product_Name NOT LIKE '%s';
```

### Important distinction

| Requirement           | Correct pattern  |
| --------------------- | ---------------- |
| Does not start with S | `NOT LIKE 'S%'`  |
| Does not end with s   | `NOT LIKE '%s'`  |
| Does not contain x    | `NOT LIKE '%x%'` |

In MySQL, whether matching is case-sensitive depends on the column's collation. With a case-insensitive collation, `LIKE '%x%'` can match both `x` and `X`.

# 4. COUNT(\*) in SQL

## What is COUNT(\*)?

`COUNT(*)` counts the number of rows in a result.

### Syntax

```
SELECT COUNT(*) AS Total_Rows
FROM table_name;
```

### Example: count all products

```
SELECT COUNT(*) AS Total_Products
FROM Inventory;
```

This returns one row containing the total number of products in `Inventory`.

## COUNT(\*) with WHERE

```
SELECT COUNT(*) AS High_Rated_Products
FROM Inventory
WHERE Inventory.Rating >= 4;
```

This counts only products that satisfy the rating condition.

## COUNT(\*) with GROUP BY

```
SELECT Inventory.Category_ID,
       COUNT(*) AS Total_Products
FROM Inventory
GROUP BY Inventory.Category_ID;
```

This returns one row per category ID, with the number of products in each category.

Remember: `COUNT(*)` counts rows. It does not automatically count unique products, customers, or orders. For unique values, use `COUNT(DISTINCT column_name)`.

# 5. COUNT(\*) OVER ()

This is the concept you asked about earlier.

`COUNT(*) OVER ()` is a window function. It calculates the count across the window while keeping individual rows visible.

### Syntax

```
COUNT(*) OVER () AS Total_Combinations
```

### Example with CROSS JOIN

```
SELECT Customer.Customer_Name,
       Inventory.Product_Name,
       COUNT(*) OVER () AS Total_Combinations
FROM Customer
CROSS JOIN Inventory;
```

Suppose the cross join produces 20 rows. Each row will display `Total_Combinations = 20`.

The result keeps every customer-product combination and adds the overall count beside it.

## COUNT() vs COUNT() OVER ()

| Query                                    | Result                                             |
| ---------------------------------------- | -------------------------------------------------- |
| `COUNT(*)` without `GROUP BY`            | One row containing the total count                 |
| `COUNT(*)` with `GROUP BY Customer.City` | One row per city, with its count                   |
| `COUNT(*) OVER ()`                       | Individual rows plus the overall count on each row |

### When should you use each?

Use `COUNT(*)` when you want a total or grouped summary.

Use `COUNT(*) OVER ()` when you want to show the detailed rows and the total number of rows in that result.

# 6. OVER () vs OVER (PARTITION BY ...)

`OVER ()` calculates a value across the entire window.

`PARTITION BY` divides the rows into groups for the window calculation without collapsing the rows.

### Total count across the entire result

```
SELECT Customer.City,
       Inventory.Product_Name,
       COUNT(*) OVER () AS Total_Combinations
FROM Customer
CROSS JOIN Inventory;
```

Every row displays the same overall count.

### Count separately for each city

```
SELECT Customer.City,
       Inventory.Product_Name,
       COUNT(*) OVER (
           PARTITION BY Customer.City
       ) AS City_Combinations
FROM Customer
CROSS JOIN Inventory;
```

Now each row displays the count for its own city.

For example, if Bengaluru has 10 combinations and Mumbai has 15, Bengaluru rows show 10 and Mumbai rows show 15.

# 7. CROSS JOIN with filters and COUNT(\*) OVER ()

Let's combine the concepts from your latest problem.

```
SELECT Customer.Customer_Name,
       Customer.City,
       Inventory.Product_Name,
       Inventory.Price,
       Inventory.Rating,
       COUNT(*) OVER () AS Total_Combinations
FROM Customer
CROSS JOIN Inventory
WHERE Customer.City IN ('BENGALURU', 'MUMBAI', 'PUNE')
AND Customer.Gender <> 'Male'
AND Inventory.Price BETWEEN 3000 AND 70000
AND Inventory.Rating BETWEEN 3 AND 5
AND (
    Inventory.Product_Name LIKE 'S%'
    OR Inventory.Product_Name LIKE '%e%'
)
AND Inventory.Product_Status NOT IN (
    'DISCONTINUED',
    'OUT OF STOCK'
)
ORDER BY Inventory.Rating DESC,
         Inventory.Price DESC,
         Customer.Customer_Name ASC;
```

### How to read this query

1. `CROSS JOIN` generates every possible customer-product combination.
2. `WHERE` filters those combinations.
3. `AND` requires the general conditions to be satisfied.
4. Parentheses and `OR` allow either product-name condition to pass.
5. `COUNT(*) OVER ()` counts the combinations remaining after filtering and repeats the count on every result row.
6. `ORDER BY` sorts the output.

Note that `Customer.Gender <> 'Male'` also excludes rows where gender is `NULL`. If you intend to include unknown gender values, you would need to handle `NULL` explicitly.

# 8. Common mistakes to avoid

| Incorrect                                                   | Correct                                                        | Reason                                            |
| ----------------------------------------------------------- | -------------------------------------------------------------- | ------------------------------------------------- |
| `COUNT(*) OVER Total`                                       | `COUNT(*) OVER () AS Total`                                    | `OVER` requires parentheses                       |
| `LIKE %e%`                                                  | `LIKE '%e%'`                                                   | Text patterns need quotes                         |
| `LIKE 'S%' AND LIKE '%e%'`                                  | Repeat the column and use `OR` if either pattern is acceptable | `AND` requires both conditions                    |
| `NOT LIKE '%s'` when you want to exclude names containing s | `NOT LIKE '%s%'`                                               | The first pattern excludes only names ending in s |
| Mixing `AND` and `OR` without thinking about precedence     | Use parentheses                                                | Prevents unintended rows from passing             |
| `COUNT(*) OVER ()` when you want one summary row per city   | `COUNT(*)` with `GROUP BY Customer.City`                       | These produce different result shapes             |

# 9. Practice questions

Try these without looking at the examples above.

1\. Products starting with S OR priced above ₹50,000

Display product name and price from Inventory.

2\. Products containing a AND rated at least 4

Display product name and rating from Inventory.

3\. Customer-product combinations with a total count

Use Customer CROSS JOIN Inventory. Filter customers to Bengaluru and products priced between ₹5,000 and ₹30,000. Display customer name, product name, and COUNT(\*) OVER ().

4\. Count products per category

Use Inventory. Display Category_ID and COUNT(\*), grouped by Category_ID. Show only categories with more than 3 products using HAVING.

Check my answers

The most important skill is not memorizing syntax. It is understanding whether the question needs all conditions (`AND`), alternative conditions (`OR`), an overall count (`COUNT(*) OVER ()`), or grouped counts (`GROUP BY`).