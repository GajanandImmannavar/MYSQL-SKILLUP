# SQL Debugging Notes (When Query Returns No Rows)

## Why This Matters

Many beginners think:

```text
No Output = Wrong SQL
```

Not always.

Sometimes:

```text
SQL is Correct
BUT
No Data Matches All Conditions
```

A good SQL developer always verifies the data before changing the query.

---

# Step 1: Check JOINs First

Before adding any WHERE conditions, verify that your joins are working.

```sql
SELECT COUNT(*)
FROM Supplier
INNER JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
INNER JOIN Categories
ON Inventory.Category_ID = Categories.Category_ID
INNER JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID;
```

### Result

```text
COUNT(*) > 0
```

✅ Joins are correct.

---

If:

```text
COUNT(*) = 0
```

Then check:

```text
Wrong JOIN condition

Wrong Foreign Key

Wrong table relationship
```

---

# Step 2: View Actual Rows

Instead of COUNT(*), see the data.

```sql
SELECT *
FROM Supplier
INNER JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
INNER JOIN Categories
ON Inventory.Category_ID = Categories.Category_ID
INNER JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID;
```

Verify:

```text
Do rows exist?

Are columns correct?

Are relationships correct?
```

---

# Step 3: Add Filters One By One

Never add 10 filters together.

Start with:

```sql
SELECT COUNT(*)
FROM Supplier
INNER JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
INNER JOIN Categories
ON Inventory.Category_ID = Categories.Category_ID
INNER JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID
WHERE Orders.Payment_Status = 'PAID';
```

Suppose:

```text
100 → 70 rows
```

Good.

---

Add next filter:

```sql
AND Inventory.Rating >= 4
```

Now:

```text
70 → 45 rows
```

Good.

---

Add next filter:

```sql
AND Inventory.Price BETWEEN 3000 AND 75000
```

Now:

```text
45 → 20 rows
```

Good.

---

Continue until:

```text
20 → 0 rows
```

🎯 The last filter added is the problem.

---

# Step 4: Check Distinct Values

If a filter removes everything, verify the actual data.

Example:

```sql
SELECT DISTINCT Supplier_City
FROM Supplier;
```

Output:

```text
BENGALURU
MUMBAI
HYDERABAD
```

But query uses:

```sql
WHERE Supplier_City IN
('Bengaluru','Mumbai','Hyderabad')
```

Possible mismatch.

Always verify actual values.

---

# Step 5: Verify LIKE Conditions

Before using:

```sql
WHERE Product_Name LIKE '%e%'
```

Check:

```sql
SELECT Product_Name
FROM Inventory
WHERE Product_Name LIKE '%e%';
```

If no rows:

```text
The filter itself removes everything.
```

---

# Step 6: Verify GROUP BY Before HAVING

Many queries fail because of HAVING.

First run:

```sql
SELECT Supplier.Supplier_Name,
       COUNT(Orders.Order_ID),
       SUM(Orders.Quantity)
FROM Supplier
INNER JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
INNER JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID
GROUP BY Supplier.Supplier_Name;
```

Example Output:

```text
Supplier A   1   2
Supplier B   2   5
Supplier C   1   1
```

---

Now apply:

```sql
HAVING COUNT(Order_ID) > 2
```

Result:

```text
0 rows
```

Reason:

```text
No supplier has more than 2 orders.
```

SQL is correct.

Data doesn't satisfy the condition.

---

# Step 7: Debug HAVING Separately

Check aggregates first.

```sql
SELECT Supplier.Supplier_Name,
       COUNT(Orders.Order_ID) AS Orders_Count,
       SUM(Orders.Quantity) AS Total_Qty
FROM Supplier
INNER JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
INNER JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID
GROUP BY Supplier.Supplier_Name;
```

Look at values.

Then decide whether:

```sql
HAVING COUNT(Order_ID) > 2
```

or

```sql
HAVING SUM(Quantity) > 10
```

will return rows.

---

# Step 8: Debugging Formula

Whenever Query Returns No Rows:

```text
1. Check JOINs
   ↓
2. SELECT *
   ↓
3. COUNT(*)
   ↓
4. Add WHERE conditions one by one
   ↓
5. Check DISTINCT values
   ↓
6. Run GROUP BY without HAVING
   ↓
7. Check aggregate values
   ↓
8. Add HAVING
```

---

# Golden Rule

Never do this:

```sql
SELECT ...
FROM ...
JOIN ...
WHERE 10 conditions
GROUP BY ...
HAVING 2 conditions;
```

and immediately assume SQL is wrong.

Instead think:

```text
Do matching records actually exist?
```

This mindset separates a SQL learner from a SQL developer. 🚀