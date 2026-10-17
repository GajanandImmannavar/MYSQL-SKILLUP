Let's understand `GROUP BY` from the basics using your actual `Customer` and `Inventory` tables, especially how it works with `CROSS JOIN`.

The most important idea is this:

`GROUP BY` puts rows with the same value into groups, so you can calculate a result for each group.

# 1. First, understand what GROUP BY does

Look at your `Customer` table:

| Customer_Name | City      |
| ------------- | --------- |
| Aarav Sharma  | BENGALURU |
| Ananya Rao    | MYSURU    |
| Rahul Verma   | DELHI     |
| Sneha Patil   | CHENNAI   |
| Kiran Kumar   | MUMBAI    |
| Pooja Singh   | HYDERABAD |
| Rohit Desai   | PUNE      |

Suppose the manager asks:

"How many customers are there in each city?"

Without `GROUP BY`, you could count all customers:

```
SELECT COUNT(*) AS Total_Customers
FROM Customer;
```

This gives one overall count.

But the manager wants a separate count for every city. That's when you use `GROUP BY`.

```
SELECT Customer.City,
       COUNT(*) AS Total_Customers
FROM Customer
GROUP BY Customer.City;
```

The output looks like this:

| City      | Total_Customers |
| --------- | --------------- |
| BENGALURU | 1               |
| CHENNAI   | 1               |
| DELHI     | 1               |
| HYDERABAD | 1               |
| MUMBAI    | 1               |
| MYSURU    | 1               |
| PUNE      | 1               |

These counts illustrate the visible sample customers. Each city currently has one customer in the screenshot.

Notice what happened: MySQL grouped rows with the same city together, then counted the rows in each group.

# 2. How does GROUP BY actually work?

Imagine you have these rows:

| City      | Product |
| --------- | ------- |
| BENGALURU | iPhone  |
| BENGALURU | Galaxy  |
| BENGALURU | Chair   |
| MUMBAI    | iPhone  |
| MUMBAI    | Galaxy  |

Now execute:

```
SELECT Customer.City,
       COUNT(*) AS Total_Combinations
FROM Customer
CROSS JOIN Inventory
GROUP BY Customer.City;
```

Conceptually, MySQL does this:

Step 1

Read the rows

The query has a collection of customer-product combinations.

Step 2

Group matching cities

BENGALURU

iPhone

Galaxy

Chair

MUMBAI

iPhone

Galaxy

Step 3

Calculate for each group

| City      | COUNT(\*) |
| --------- | --------- |
| BENGALURU | 3         |
| MUMBAI    | 2         |

The table above is an illustrative example, not your database's exact output.

Important: `GROUP BY` does not itself count or add anything. It creates groups. Functions such as `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()` calculate values for those groups.

# 3. The syntax you should remember

```
SELECT grouping_column,
       aggregate_function(column_name)
FROM table_name
GROUP BY grouping_column;
```

For your tables:

```
SELECT Customer.City,
       COUNT(*) AS Total_Customers
FROM Customer
GROUP BY Customer.City;
```

Here:

- `SELECT` — chooses what to display.
- `FROM` — identifies the table.
- `GROUP BY Customer.City` — creates one group per city.
- `COUNT(*)` — counts rows in each city group.

## 4. What functions can you use with GROUP BY?

| Function   | What it calculates | Example                |
| ---------- | ------------------ | ---------------------- |
| `COUNT(*)` | Number of rows     | Number of combinations |
| `SUM()`    | Total              | Total quantity         |
| `AVG()`    | Average            | Average product price  |
| `MIN()`    | Smallest value     | Cheapest product       |
| `MAX()`    | Largest value      | Highest rating         |

For example, with your `Inventory` table:

```
SELECT Inventory.Category_ID,
       COUNT(*) AS Total_Products,
       AVG(Inventory.Price) AS Average_Price,
       MIN(Inventory.Price) AS Minimum_Price,
       MAX(Inventory.Rating) AS Maximum_Rating
FROM Inventory
GROUP BY Inventory.Category_ID;
```

This gives one result row per category ID, with the number of products, average price, minimum price, and maximum rating for that category.

# 5. How GROUP BY works with CROSS JOIN

This is the part most relevant to your current practice.

Your `CROSS JOIN` creates every possible customer-product combination.

```
FROM Customer
CROSS JOIN Inventory
```

Suppose there are 10 customers and 15 products.

\\[ 10 \times 15 = 150\text{ combinations} \\]

If you group those combinations by customer city, MySQL creates one group for each city.

```
SELECT Customer.City,
       COUNT(*) AS Total_Combinations
FROM Customer
CROSS JOIN Inventory
GROUP BY Customer.City;
```

What does `COUNT(*)` count here?

It counts customer-product combinations in each city group, not just the number of customers.

For example, if Bengaluru has 2 customers and the inventory has 15 products, that city has \\(2 \times 15 = 30\\) combinations before filtering.

If filters leave only 9 qualifying products, those 2 customers would contribute \\(2 \times 9 = 18\\) combinations.

This is why the meaning of `COUNT(*)` depends on the rows entering the grouping.

# 6. WHERE vs GROUP BY vs HAVING

These three clauses have different jobs.

| Clause     | Purpose                                 | Example                   |
| ---------- | --------------------------------------- | ------------------------- |
| `WHERE`    | Filters individual rows before grouping | `Inventory.Price >= 5000` |
| `GROUP BY` | Creates groups                          | `GROUP BY Customer.City`  |
| `HAVING`   | Filters groups after aggregation        | `HAVING COUNT(*) > 5`     |

Consider this complete query:

```
SELECT Customer.City,
       COUNT(*) AS Total_Combinations,
       AVG(Inventory.Price) AS Average_Product_Price
FROM Customer
CROSS JOIN Inventory
WHERE Customer.Gender <> 'Female'
AND Inventory.Price BETWEEN 2000 AND 80000
GROUP BY Customer.City
HAVING COUNT(*) > 5
ORDER BY Total_Combinations DESC;
```

Read it in this order:

1. Generate customer-product combinations.
2. Keep rows matching the `WHERE` conditions.
3. Group the remaining rows by city.
4. Count combinations and calculate the average price per city.
5. Keep cities with more than five combinations.
6. Sort the remaining cities by their combination counts.

# 7. One important rule

When you use `GROUP BY`, columns in your `SELECT` generally need to be either:

- Included in the `GROUP BY`, or
- Used inside an aggregate function.

For example, this is valid:

```
SELECT Customer.City,
       COUNT(*) AS Total_Combinations
FROM Customer
CROSS JOIN Inventory
GROUP BY Customer.City;
```

But this is generally invalid with MySQL's `ONLY_FULL_GROUP_BY` setting:

```
SELECT Customer.City,
       Inventory.Product_Name,
       COUNT(*) AS Total_Combinations
FROM Customer
CROSS JOIN Inventory
GROUP BY Customer.City;
```

Why? One city may have many different product names. MySQL cannot choose a single product name to represent the entire city group.

# 8. Your practice question

Let's check your understanding before moving on.

Problem — Count products by customer city

Scenario: A marketing manager wants to know how many qualifying customer-product combinations exist in each city.

Tables: `Customer`, `Inventory`

Requirements:

1. Use `CROSS JOIN`.
2. Include customers from `BENGALURU`, `MUMBAI`, and `PUNE`.
3. Exclude customers whose gender is `Female`.
4. Include products priced between ₹2,000 and ₹80,000.
5. Display customer city and total combinations.
6. Group by customer city.
7. Show only cities with more than five combinations using `HAVING`.
8. Sort by total combinations descending.

Write the query yourself. No window functions.

Check my query

The key idea to remember is: `CROSS JOIN` creates combinations; `WHERE` filters them; `GROUP BY` organizes them into groups; aggregate functions calculate values for each group; and `HAVING` filters those groups.