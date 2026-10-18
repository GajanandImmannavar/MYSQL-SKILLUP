# MySQL SELF JOIN — Complete Notes from Basic to Advanced

These notes cover SELF JOIN from the basics through interview-level questions, with simple explanations, SQL queries, expected outputs, common mistakes, and practice problems.

## 1. What is a SELF JOIN?

Definition: A SELF JOIN is a join in which a table is joined with itself to compare rows within the same table.

In simple words, we use SELF JOIN when we want to compare one record with another record in the same table.

For example, suppose a shopping company wants to find:

- Customers who live in the same city.
- Products with the same price.
- Employees who report to the same manager.
- Employees earning more than another employee.
- Records that have matching values.

All these tasks can be solved using SELF JOIN when the relevant information is stored in one table.

Technical definition: A SELF JOIN is a relational operation that combines rows from two references to the same table based on a specified join condition.

## 2. Why do we need SELF JOIN?

Consider this `Customer` table:

| Customer_ID | Customer_Name | City      |
| ----------- | ------------- | --------- |
| 1           | Aarav Sharma  | BENGALURU |
| 2           | Ananya Rao    | MYSURU    |
| 3           | Rahul Verma   | BENGALURU |
| 4           | Sneha Patil   | CHENNAI   |
| 5           | Kiran Kumar   | MYSURU    |

Suppose the company asks:

Find customers who live in the same city.

We must compare each customer's city with the cities of other customers. Since both sets of records are stored in `Customer`, we can reference `Customer` twice in one query.

- First reference: the customer being compared.
- Second reference: the other customer.

That is the purpose of SELF JOIN.

## 3. SELF JOIN syntax

In MySQL, the standard pattern is:

```
SELECT columns
FROM table_name AS T1
JOIN table_name AS T2
    ON join_condition;
```

Here is what each part means:

| SQL part           | Meaning                                |
| ------------------ | -------------------------------------- |
| `table_name AS T1` | First reference to the table           |
| `table_name AS T2` | Second reference to the same table     |
| `JOIN`             | Combines matching rows                 |
| `ON`               | Specifies how the two references match |
| `SELECT`           | Chooses the columns to display         |

`T1` and `T2` are table aliases. They are temporary names used within the query, not new tables in your database.

Important: Aliases are especially useful in SELF JOIN because MySQL needs a way to distinguish the two references to the same table.

## 4. First SELF JOIN example

Let's find customers who live in the same city.

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City;
```

### How does this query work?

Step 1 — Read the table twice

```
FROM Customer AS T1
INNER JOIN Customer AS T2
```

Both `T1` and `T2` refer to the `Customer` table.

Step 2 — Compare the cities

```
ON T1.City = T2.City
```

A row from the first reference matches a row from the second reference whenever their cities are equal.

Step 3 — Display the results

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
```

We display both customer names and their city.

### Expected output

Using the sample data above, the query produces results like these:

| Customer_1   | Customer_2   | City      |
| ------------ | ------------ | --------- |
| Aarav Sharma | Aarav Sharma | BENGALURU |
| Aarav Sharma | Rahul Verma  | BENGALURU |
| Ananya Rao   | Ananya Rao   | MYSURU    |
| Ananya Rao   | Kiran Kumar  | MYSURU    |
| Rahul Verma  | Aarav Sharma | BENGALURU |
| Rahul Verma  | Rahul Verma  | BENGALURU |
| Kiran Kumar  | Ananya Rao   | MYSURU    |
| Kiran Kumar  | Kiran Kumar  | MYSURU    |

This is a partial output; other rows may also appear depending on the full data.

Notice two problems:

1. A customer matches with themselves.
2. A pair can appear in both directions.

We'll fix these next.

## 5. Removing self-matches

A customer should not be matched with themselves if the goal is to find pairs of different customers.

For this, compare their IDs:

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
WHERE T1.Customer_ID <> T2.Customer_ID;
```

The condition is:

```
T1.Customer_ID <> T2.Customer_ID
```

`<>` means not equal to.

This excludes pairs where both references represent the same customer.

However, the query can still return both:

- Aarav Sharma → Rahul Verma
- Rahul Verma → Aarav Sharma

We need another condition to remove the reversed duplicate.

## 6. Removing duplicate pairs

Use this condition:

```
T1.Customer_ID < T2.Customer_ID
```

Complete query:

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID < T2.Customer_ID;
```

### Why does `<` work?

Suppose the IDs are:

- Aarav: `1`
- Rahul: `3`

The condition `1 < 3` is true, so Aarav–Rahul appears.

When the order is reversed, `3 < 1` is false, so Rahul–Aarav does not appear.

Because an ID cannot be less than itself, this condition also excludes self-matches.

Expected output:

| Customer_1   | Customer_2  | City      |
| ------------ | ----------- | --------- |
| Aarav Sharma | Rahul Verma | BENGALURU |
| Ananya Rao   | Kiran Kumar | MYSURU    |

This is the clean version for finding unique pairs of customers living in the same city.

Interview tip: Remember these three conditions:

| Requirement          | Condition                          |
| -------------------- | ---------------------------------- |
| Match the same city  | `T1.City = T2.City`                |
| Exclude self-matches | `T1.Customer_ID <> T2.Customer_ID` |
| Keep each pair once  | `T1.Customer_ID < T2.Customer_ID`  |

The `<` condition is usually enough to handle the last two requirements when IDs are unique and non-NULL.

## 7. SELF JOIN with different comparison conditions

SELF JOIN is not limited to matching identical values. You can compare values using operators such as `=`, `>`, `<`, `>=`, and `<=`.

### Example A: Find customers with different cities

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City AS City_1,
    T2.City AS City_2
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City <> T2.City
    AND T1.Customer_ID < T2.Customer_ID;
```

This produces unique pairs of customers from different cities.

Be careful: this can generate many pairs because each customer may be compared with several others.

### Example B: Find products with the same price

Suppose the `Inventory` table contains `Product_ID`, `Product_Name`, and `Price`.

```
SELECT
    T1.Product_Name AS Product_1,
    T2.Product_Name AS Product_2,
    T1.Price
FROM Inventory AS T1
INNER JOIN Inventory AS T2
    ON T1.Price = T2.Price
    AND T1.Product_ID < T2.Product_ID;
```

This finds different products with equal prices, showing each pair only once.

### Example C: Find products cheaper than another product

```
SELECT
    T1.Product_Name AS Cheaper_Product,
    T1.Price AS Cheaper_Price,
    T2.Product_Name AS Costlier_Product,
    T2.Price AS Costlier_Price
FROM Inventory AS T1
INNER JOIN Inventory AS T2
    ON T1.Price < T2.Price;
```

This compares products at different prices.

Warning: Without a unique-pair condition, both directions or many combinations may appear when you compare records. For a comparison like cheaper versus costlier, the `<` condition already establishes the direction.

## 8. SELF JOIN with WHERE

You can combine SELF JOIN with `WHERE` to filter the matched rows.

Suppose the company wants to find pairs of customers living in the same city, but only for Bengaluru and Mysuru.

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID < T2.Customer_ID
WHERE T1.City IN ('BENGALURU', 'MYSURU');
```

The `ON` condition matches the rows and ensures each pair appears once. The `WHERE` condition restricts the result to the specified cities.

You could also place the city filter in `ON`:

```
ON T1.City = T2.City
AND T1.City IN ('BENGALURU', 'MYSURU')
AND T1.Customer_ID < T2.Customer_ID
```

For this `INNER JOIN`, both approaches can produce the same results. With outer joins, moving conditions between `ON` and `WHERE` can change the result.

## 9. SELF JOIN with ORDER BY

You can sort the result using any selected or available column.

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID < T2.Customer_ID
ORDER BY T1.City, T1.Customer_Name;
```

This sorts the results by city first and customer name second.

## 10. SELF JOIN with aggregate functions

You can combine SELF JOIN with `COUNT()`, `GROUP BY`, and `HAVING`.

For example, count how many unique customer pairs are found in each city:

```
SELECT
    T1.City,
    COUNT(*) AS Total_Pairs
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID < T2.Customer_ID
GROUP BY T1.City;
```

Using our sample data:

| City      | Total_Pairs |
| --------- | ----------- |
| BENGALURU | 1           |
| MYSURU    | 1           |

Why is the count 1 for each city? Bengaluru has two customers, producing one unique pair. Mysuru also has two customers, producing one unique pair.

If a city has three customers, the number of unique pairs is three. If it has four customers, there are six unique pairs.

The formula is:

\\[ \text{Unique pairs}=\frac{n(n-1)}{2} \\]

Here, \\(n\\) is the number of customers in that city.

You can filter groups using `HAVING`:

```
SELECT
    T1.City,
    COUNT(*) AS Total_Pairs
FROM Customer AS T1
INNER JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID < T2.Customer_ID
GROUP BY T1.City
HAVING COUNT(*) > 2;
```

This displays only cities with more than two unique customer pairs.

Important: `COUNT(*)` here counts pairs, not individual customers.

## 11. SELF JOIN with employee-manager relationships

This is one of the most common real-world and interview uses of SELF JOIN.

Suppose we have an `Employee` table:

| Employee_ID | Employee_Name | Manager_ID |
| ----------- | ------------- | ---------- |
| 1           | Priya         | NULL       |
| 2           | Arjun         | 1          |
| 3           | Neha          | 1          |
| 4           | Rohan         | 2          |

`Manager_ID` refers to another employee's `Employee_ID` in the same table.

We can find each employee's manager by joining the table to itself:

```
SELECT
    Employee.Employee_Name AS Employee,
    Manager.Employee_Name AS Manager
FROM Employee AS Employee
LEFT JOIN Employee AS Manager
    ON Employee.Manager_ID = Manager.Employee_ID;
```

Expected output:

| Employee | Manager |
| -------- | ------- |
| Priya    | NULL    |
| Arjun    | Priya   |
| Neha     | Priya   |
| Rohan    | Arjun   |

Priya has no manager, so `LEFT JOIN` keeps Priya in the output and displays `NULL` for the manager.

This is a particularly useful example because it demonstrates that SELF JOIN can use different columns for matching, not just the same column.

## 12. Can we use INNER JOIN, LEFT JOIN, and RIGHT JOIN for SELF JOIN?

Yes. SELF JOIN describes joining a table to itself; it is not a separate join keyword. You can use different join types depending on your requirement.

| Join type    | What it does in a SELF JOIN                                            |
| ------------ | ---------------------------------------------------------------------- |
| `INNER JOIN` | Returns matching pairs only                                            |
| `LEFT JOIN`  | Keeps every row from the first reference, even when there is no match  |
| `RIGHT JOIN` | Keeps every row from the second reference, even when there is no match |
| `CROSS JOIN` | Generates combinations of rows without a matching condition            |

Example: find all customers and any other customers who live in the same city.

```
SELECT
    T1.Customer_Name AS Customer_1,
    T2.Customer_Name AS Customer_2,
    T1.City
FROM Customer AS T1
LEFT JOIN Customer AS T2
    ON T1.City = T2.City
    AND T1.Customer_ID <> T2.Customer_ID;
```

This keeps customers even if no other customer shares their city. In the example data, all cities shown have at least one other customer except Chennai, so Sneha would appear with a `NULL` for `Customer_2`.

Notice that the different-customer condition is in `ON`. Moving it to `WHERE` could remove the unmatched customers and defeat the purpose of the `LEFT JOIN`.

## 13. SELF JOIN versus other JOINs

Understand the difference between these joins because interviewers often ask about it.

| Feature           | SELF JOIN                                 | INNER JOIN between different tables |
| ----------------- | ----------------------------------------- | ----------------------------------- |
| Tables referenced | Same table twice                          | Two different tables                |
| Main purpose      | Compare records within one table          | Match related records across tables |
| Example           | Customers in the same city                | Customers and their orders          |
| Join condition    | Can compare columns within the same table | Usually compares related keys       |

For your shopping database:

- `Customer` joined to `Customer` can find customers in the same city.
- `Customer` joined to `Orders` can find customers who placed orders.
- `Inventory` joined to `Inventory` can compare products with one another.

SELF JOIN is not restricted to `INNER JOIN`. The name describes the use of the same table twice, while `INNER`, `LEFT`, and `RIGHT` describe how rows are retained.

## 14. Common mistakes to avoid

### Mistake 1: Forgetting aliases

Incorrect or ambiguous:

```
SELECT Customer_Name
FROM Customer
JOIN Customer
    ON City = City;
```

MySQL cannot reliably distinguish the two references when column names are ambiguous. Use aliases and qualify the columns.

### Mistake 2: Forgetting to exclude the same record

```
ON T1.City = T2.City
```

This allows a customer to match themselves.

Correction:

```
ON T1.City = T2.City
AND T1.Customer_ID <> T2.Customer_ID
```

### Mistake 3: Showing reversed duplicate pairs

If you only exclude equal IDs, both Aarav–Rahul and Rahul–Aarav can appear.

For unique unordered pairs, use:

```
AND T1.Customer_ID < T2.Customer_ID
```

### Mistake 4: Joining on the wrong columns

If your requirement is to find customers in the same city, compare `City` with `City`.

If your requirement is to find an employee's manager, compare `Manager_ID` with `Employee_ID`.

The condition depends on the relationship you want to identify.

### Mistake 5: Assuming SELF JOIN always produces a small result

If a table has \\(n\\) rows and the condition matches many of them, the result can be large. A SELF JOIN without a useful condition can produce many combinations.

Use suitable join conditions and filters, and inspect the expected number of rows.

## 15. SELF JOIN interview questions

Q1. What is SELF JOIN?

It joins a table with itself to compare rows within that table.

Q2. Is SELF JOIN a separate SQL keyword?

No. It is a technique. You use ordinary join syntax and reference the same table twice.

Q3. Why are aliases used?

Aliases distinguish the two references to the same table and make column references clear.

Q4. Can SELF JOIN use different columns?

Yes. For example, `Employee.Manager_ID = Manager.Employee_ID`.

Q5. How do you avoid matching a row with itself?

For unique IDs, use a condition such as `T1.Customer_ID <> T2.Customer_ID`.

Q6. How do you avoid duplicate unordered pairs?

Use `T1.Customer_ID < T2.Customer_ID` when IDs are unique and comparable.

Q7. Can SELF JOIN use `LEFT JOIN`?

Yes. `LEFT JOIN` can preserve every row from the first table reference, including records without a match.

Q8. Can SELF JOIN compare numerical values?

Yes. For example, `T1.Price < T2.Price` finds ordered pairs where the first product is cheaper than the second.

Q9. Can SELF JOIN use `GROUP BY` and `HAVING`?

Yes. You can count matching pairs by city or category and filter the groups.

Q10. When is SELF JOIN useful in real applications?

It is useful for hierarchical data, employee-manager relationships, duplicate detection, customer comparisons, price comparisons, and identifying related records.

## 16. Practice problems — basic to advanced

Solve these in order. Use your existing `Customer` and `Inventory` tables. Expected outputs below are illustrative examples, not verified results from your full database.

### Level 1 — Basic

Problem 1: Find customers living in the same city.

Requirements:

- Use SELF JOIN on `Customer`.
- Display both customer names and their city.
- Exclude self-matches and duplicate pairs.

Expected output format:

| Customer_1   | Customer_2  | City      |
| ------------ | ----------- | --------- |
| Aarav Sharma | Rahul Verma | BENGALURU |
| Ananya Rao   | Kiran Kumar | MYSURU    |

### Level 2 — Basic to intermediate

Problem 2: Find products with exactly the same price.

Requirements:

- Use SELF JOIN on `Inventory`.
- Display both product names and their price.
- Show each pair only once.

Expected output format:

| Product_1         | Product_2         | Price |
| ----------------- | ----------------- | ----- |
| Example Product A | Example Product B | 2,500 |

### Level 3 — Intermediate

Problem 3: Find products where one costs less than another.

Requirements:

- Compare products using their prices.
- Display the cheaper product, its price, the costlier product, and its price.
- Exclude comparing a product with itself.

Expected output format:

| Cheaper_Product | Cheaper_Price | Costlier_Product | Costlier_Price |
| --------------- | ------------- | ---------------- | -------------- |
| Football        | 2,200         | Cricket Bat      | 8,500          |

### Level 4 — Intermediate to advanced

Problem 4: Count unique customer pairs in each city.

Requirements:

- Use SELF JOIN on `Customer`.
- Match customers living in the same city.
- Count each pair once.
- Group by city.
- Display only cities with more than one unique pair.

Expected output format:

| City      | Total_Pairs |
| --------- | ----------- |
| BENGALURU | 3           |
| MYSURU    | 2           |

The counts are examples only; actual results depend on your data.

### Level 5 — Advanced

Problem 5: Find products that cost more than ₹10,000 and are cheaper than at least one other product.

Requirements:

- Use SELF JOIN on `Inventory`.
- Compare product prices.
- Apply the ₹10,000 condition.
- Display product names and prices for both products.
- Sort by the cheaper product's price in ascending order.

Expected output format:

| Cheaper_Product | Cheaper_Price | Costlier_Product | Costlier_Price |
| --------------- | ------------- | ---------------- | -------------- |
| Office Chair    | 12,000        | Microwave Oven   | 18,000         |
| Microwave Oven  | 18,000        | Dining Table     | 22,000         |

These example pairs are illustrative and do not guarantee that all shown products satisfy every condition in your actual database.

