# CROSS JOIN — Complete Revision Notes

---

# 1. What is CROSS JOIN?

A CROSS JOIN returns:

```text
Every row from Table A
×
Every row from Table B
```

Also called:

```text
Cartesian Product
```

---

# 2. Syntax

```sql
SELECT *
FROM Table1
CROSS JOIN Table2;
```

No ON condition.

```sql
SELECT *
FROM Customer
CROSS JOIN Categories;
```

---

# 3. Why No ON Condition?

Because CROSS JOIN does NOT need a relationship.

Example:

```text
Customer
   ❌
Categories
```

No foreign key.

No matching column.

Still possible:

```sql
SELECT Customer.Customer_Name,
       Categories.Category_Name
FROM Customer
CROSS JOIN Categories;
```

---

# 4. How CROSS JOIN Works

### Customer

| Customer_Name |
|---------------|
| Rahul |
| Priya |

### Categories

| Category_Name |
|---------------|
| Electronics |
| Furniture |

---

Output

| Customer_Name | Category_Name |
|---------------|---------------|
| Rahul | Electronics |
| Rahul | Furniture |
| Priya | Electronics |
| Priya | Furniture |

---

# 5. Row Count Formula

```text
Rows in Table A
×

Rows in Table B
```

Example:

```text
Customer = 10 rows

Categories = 4 rows
```

Result:

```text
10 × 4 = 40 rows
```

---

# 6. Difference Between INNER JOIN and CROSS JOIN

## INNER JOIN

Needs relationship.

```sql
SELECT *
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;
```

Requirement:

```text
Matching records only
```

---

## CROSS JOIN

No relationship.

```sql
SELECT *
FROM Customer
CROSS JOIN Categories;
```

Requirement:

```text
Every combination
```

---

# 7. When To Use CROSS JOIN

Look for keywords:

```text
Every combination

All combinations

Every customer with every product

Every customer with every category

Every supplier with every product

Every employee with every training course

Every month with every product
```

Immediately think:

```text
CROSS JOIN
```

---

# 8. How To Identify CROSS JOIN Questions

Question:

```text
Is there a relationship between tables?
```

If:

```text
YES
```

Use:

```text
INNER JOIN
LEFT JOIN
RIGHT JOIN
```

---

If:

```text
NO
```

and requirement says:

```text
Every combination
```

Use:

```text
CROSS JOIN
```

---

# 9. Can We Use WHERE After CROSS JOIN?

YES.

Example:

```sql
SELECT Customer.Customer_Name,
       Supplier.Supplier_Name
FROM Customer
CROSS JOIN Supplier
WHERE Customer.City = 'BENGALURU';
```

Process:

```text
Step 1:
Create all combinations

Step 2:
Apply WHERE filter
```

---

# 10. Example Using Your Database

```sql
SELECT Customer.Customer_Name,
       Supplier.Supplier_Name
FROM Customer
CROSS JOIN Supplier;
```

Meaning:

```text
Every Customer
with
Every Supplier
```

---

# 11. Interview Questions

### Q1

Does CROSS JOIN need ON?

```text
NO
```

---

### Q2

What is another name for CROSS JOIN?

```text
Cartesian Product
```

---

### Q3

Customer = 5 rows

Supplier = 4 rows

Output rows?

```text
5 × 4 = 20 rows
```

---

### Q4

When should CROSS JOIN be used?

```text
When every possible combination is required.
```

---

# Memory Trick

```text
INNER JOIN
=
Matching Records

LEFT JOIN
=
Keep Left Table

RIGHT JOIN
=
Keep Right Table

CROSS JOIN
=
Everything × Everything
```

---

# One-Line Revision

```text
CROSS JOIN creates every possible combination between two tables, requires no relationship, requires no ON condition, and returns Rows(Table1) × Rows(Table2).
```