# SQL JOIN Decision Framework (Interview Revision Notes)

## Step 1: Never Start Writing SQL Immediately

Before writing any query, ask:

```text
1. What is the business asking?

2. Which tables are needed?

3. How are those tables connected?

4. Which table must never disappear?

5. Am I showing details or summary?

6. Am I filtering rows or groups?
```

If you answer these questions first, most SQL mistakes disappear.

---

# Rule 1: Choose JOIN Based on Business Requirement

## INNER JOIN

Use when:

```text
Only matching records are needed.
```

Business Keywords:

```text
Customers who purchased

Successful orders

Products that were sold

Suppliers whose products sold

Completed purchases

Active customers

Sales report

Revenue report

Performance report
```

Example:

```text
Customer = 100

Orders = 60

Need customers who purchased

Result = 60
```

Use:

```sql
INNER JOIN
```

---

## LEFT JOIN

Use when:

```text
Every record from LEFT table must appear.
```

Business Keywords:

```text
All customers

Every customer

Even if no order exists

All suppliers

All categories

Include records with no matches
```

Example:

```text
Show all customers
Even if they never ordered
```

Use:

```sql
Customer
LEFT JOIN Orders
```

---

## RIGHT JOIN

Use when:

```text
Every record from RIGHT table must appear.
```

Business Keywords:

```text
All orders

Every order

All products

Every product

All inventory items

Every transaction
```

Example:

```text
Show all products
Even if supplier data is missing
```

Use:

```sql
Supplier
RIGHT JOIN Inventory
```

---

# Rule 2: The Most Important JOIN Question

Ask:

```text
Which table must never disappear?
```

If answer is:

```text
Customer
```

Use:

```sql
LEFT JOIN
```

If answer is:

```text
Orders
```

Use:

```sql
RIGHT JOIN
```

If answer is:

```text
Only matching records
```

Use:

```sql
INNER JOIN
```

---

# Rule 3: When To Use WHERE

Use WHERE for row filtering.

Examples:

```sql
WHERE Payment_Status = 'Success'
```

```sql
WHERE Price > 5000
```

```sql
WHERE Rating >= 4
```

```sql
WHERE Product_Name LIKE '%a%'
```

```sql
WHERE City IN ('Bengaluru','Mumbai')
```

Think:

```text
Filter individual rows.
```

---

# Rule 4: When To Use HAVING

Use HAVING for group filtering.

Examples:

```sql
HAVING COUNT(Order_ID) > 2
```

```sql
HAVING SUM(Quantity) > 10
```

```sql
HAVING AVG(Price) > 5000
```

Think:

```text
Filter groups after grouping.
```

---

# Rule 5: WHERE vs HAVING

Wrong:

```sql
WHERE COUNT(Order_ID) > 2
```

Correct:

```sql
HAVING COUNT(Order_ID) > 2
```

Shortcut:

```text
COUNT()
SUM()
AVG()
MIN()
MAX()

→ HAVING
```

---

# Rule 6: SQL Execution Order

We write:

```sql
SELECT
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
ORDER BY
```

SQL processes:

```text
FROM
JOIN
ON
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
```

Memory Trick:

```text
Get tables
↓
Connect tables
↓
Filter rows
↓
Create groups
↓
Filter groups
↓
Show columns
↓
Sort result
```

---

# Rule 7: Filtering During JOIN

## INNER JOIN

Most conditions go in WHERE.

Example:

```sql
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
WHERE Orders.Payment_Status = 'Success'
```

---

## LEFT JOIN

Requirement:

```text
Show all customers.
Attach only PAID orders.
```

Correct:

```sql
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
AND Orders.Payment_Status = 'PAID'
```

Reason:

```text
All customers survive.
Only matching PAID orders attach.
```

---

## RIGHT JOIN

Requirement:

```text
Show all products.
Attach only Bengaluru suppliers.
```

Correct:

```sql
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
AND Supplier.Supplier_City = 'Bengaluru'
```

Reason:

```text
All products survive.
Only Bengaluru suppliers attach.
```

---

# Rule 8: Summary Report vs Detail Report

## Detail Report

Display:

```text
Customer Name
Order ID
Product Name
Price
```

Think:

```text
Individual records
No GROUP BY
```

---

## Summary Report

Display:

```text
Number Of Orders

Total Quantity

Total Sales

Average Price
```

Think immediately:

```sql
COUNT()
SUM()
AVG()
GROUP BY
HAVING
```

---

# Rule 9: Common Pattern Recognition

If requirement contains:

```text
Number of Orders
```

Use:

```sql
COUNT(Order_ID)
```

---

If requirement contains:

```text
Total Quantity
```

Use:

```sql
SUM(Quantity)
```

---

If requirement contains:

```text
Average Price
```

Use:

```sql
AVG(Price)
```

---

If requirement contains:

```text
More than 2 orders
```

Use:

```sql
HAVING COUNT(Order_ID) > 2
```

---

If requirement contains:

```text
Total quantity greater than 10
```

Use:

```sql
HAVING SUM(Quantity) > 10
```

---

# Rule 10: Sales Analysis Shortcut

When you see:

```text
Sales Analysis

Supplier Performance

Category Performance

Customer Performance

Revenue Analysis

Order Analysis
```

and requirements contain:

```text
COUNT()

SUM()

GROUP BY

HAVING
```

Most of the time use:

```sql
INNER JOIN
```

Why?

Because performance reports are based on existing transactions, not missing records.

---

# Final Interview Formula

Read the requirement and ask:

```text
1. Which table must never disappear?

2. Detail report or summary report?

3. Row filtering?
   → WHERE

4. Group filtering?
   → HAVING

5. Only matching records?
   → INNER JOIN

6. All records from left table?
   → LEFT JOIN

7. All records from right table?
   → RIGHT JOIN
```

If you follow this framework before writing any query, you can solve most JOIN, GROUP BY, HAVING, and filtering questions confidently in interviews and real projects.