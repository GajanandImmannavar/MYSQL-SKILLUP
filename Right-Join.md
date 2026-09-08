# 🔵 RIGHT JOIN — Complete Notes

`RIGHT JOIN` becomes very easy once you understand **which table is on the right side of the JOIN** and **which table we want to preserve**.

---

# 1. What is RIGHT JOIN?

A `RIGHT JOIN` returns:

> **ALL rows from the RIGHT table + matching rows from the LEFT table.**

If there is no matching row in the left table, the columns from the left table become `NULL`.

### Basic syntax

```sql
SELECT ...
FROM Left_Table
RIGHT JOIN Right_Table
ON Left_Table.key = Right_Table.key;
```

The names **Left_Table** and **Right_Table** are just for understanding.

---

# 2. Which table is LEFT and which is RIGHT?

Look at the position around `JOIN`.

```sql
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;
```

Visually:

```text
        LEFT TABLE              RIGHT TABLE
             ↓                       ↓
       FROM Customer          RIGHT JOIN Orders
             │                       │
             └────────── JOIN ───────┘
```

Therefore:

```text
Customer = LEFT table
Orders   = RIGHT table
```

### ⭐ Most important rule

> The table **before `RIGHT JOIN`** is the **LEFT table**.

> The table **after `RIGHT JOIN`** is the **RIGHT table**.

---

# 3. What does RIGHT JOIN preserve?

`RIGHT JOIN` preserves the **RIGHT table**.

```sql
FROM Customer
RIGHT JOIN Orders
```

Here:

```text
Customer              Orders
   LEFT       RIGHT      RIGHT
   table      JOIN       table
                         ↑
                    ALL Orders
                    are preserved
```

So every row from `Orders` will appear.

If an order doesn't have a matching customer:

```text
Customer_Name = NULL
```

but the order still appears.

---

# 4. Simple Example

Suppose we have:

### Customer

| Customer_ID | Customer_Name |
| ----------: | ------------- |
|           1 | Aarav         |
|           2 | Ananya        |
|           3 | Rahul         |

### Orders

| Order_ID | Customer_ID |
| -------: | ----------: |
|      101 |           1 |
|      102 |           2 |
|      103 |           5 |

Notice:

`Customer_ID = 5` doesn't exist in Customer.

Now:

```sql
SELECT Customer.Customer_Name,
       Orders.Order_ID
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;
```

Result:

| Customer_Name | Order_ID |
| ------------- | -------: |
| Aarav         |      101 |
| Ananya        |      102 |
| NULL          |      103 |

Why?

Because:

```text
Customer = LEFT
Orders   = RIGHT
```

And `RIGHT JOIN` says:

> "Give me **every row from Orders**, whether Customer matches or not."

Therefore Order `103` survives.

---

# 5. Compare LEFT JOIN vs RIGHT JOIN

This is the easiest way to understand them.

### LEFT JOIN

```sql
FROM Customer
LEFT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;
```

```text
Customer              Orders
   LEFT                 RIGHT
    ↑
 PRESERVE
```

All customers survive.

---

### RIGHT JOIN

```sql
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID;
```

```text
Customer              Orders
   LEFT                 RIGHT
                         ↑
                      PRESERVE
```

All orders survive.

---

# 6. Think of it as "Who must NOT disappear?"

This is the best interview trick.

Suppose the manager says:

> "Show every customer, even customers who never ordered."

Ask yourself:

**Who must not disappear?**

Answer:

```text
Customer
```

Therefore preserve Customer.

You can write:

```sql
FROM Customer
LEFT JOIN Orders
```

---

Now suppose the manager says:

> "Show every order, even if customer information is missing."

Who must not disappear?

```text
Orders
```

Therefore preserve Orders.

You can write:

```sql
FROM Customer
RIGHT JOIN Orders
```

---

# 7. Where should I put the table?

This is where most beginners get confused.

## If you use LEFT JOIN

Put the table you want to preserve **before `LEFT JOIN`**.

```sql
FROM Customer
LEFT JOIN Orders
```

Customer is preserved.

---

## If you use RIGHT JOIN

Put the table you want to preserve **after `RIGHT JOIN`**.

```sql
FROM Customer
RIGHT JOIN Orders
```

Orders is preserved.

### Remember:

```text
LEFT JOIN

FROM [TABLE TO PRESERVE]
LEFT JOIN [OTHER TABLE]
```

```text
RIGHT JOIN

FROM [OTHER TABLE]
RIGHT JOIN [TABLE TO PRESERVE]
```

---

# 8. Very important: FROM does NOT automatically mean LEFT table you want

Look carefully:

```sql
FROM Supplier
RIGHT JOIN Inventory
```

Here:

```text
Supplier  → LEFT table
Inventory → RIGHT table
```

Because Inventory is on the **right side of JOIN**.

Therefore:

```text
RIGHT JOIN → Inventory is preserved
```

So if the business requirement says:

> "Show every product."

You can use:

```sql
SELECT Inventory.Product_Name,
       Inventory.Price,
       Supplier.Supplier_Name
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID;
```

Here Inventory is preserved.

---

# 9. RIGHT JOIN can be rewritten as LEFT JOIN

This is another **very important concept**.

These two are logically equivalent:

### RIGHT JOIN

```sql
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID;
```

### LEFT JOIN

```sql
FROM Inventory
LEFT JOIN Supplier
ON Inventory.Supplier_ID = Supplier.Supplier_ID;
```

Why?

Because we simply switched the table positions.

### RIGHT JOIN version

```text
Supplier → RIGHT JOIN → Inventory
                          ↑
                       preserve
```

### LEFT JOIN version

```text
Inventory → LEFT JOIN → Supplier
     ↑
  preserve
```

Same preserved table:

```text
Inventory
```

---

# 10. RIGHT JOIN with 3 tables

Suppose we have:

```text
Customer
   ↓
Orders
   ↓
Inventory
```

And we want **every product**, even products that haven't been ordered.

We need Inventory to be preserved.

One possible approach:

```sql
SELECT Inventory.Product_Name,
       Orders.Order_ID,
       Customer.Customer_Name
FROM Customer
RIGHT JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
RIGHT JOIN Inventory
ON Orders.Product_ID = Inventory.Product_ID;
```

Here the final `RIGHT JOIN Inventory` preserves Inventory.

Conceptually:

```text
Customer
   LEFT
    │
    │ RIGHT JOIN
    ↓
 Orders
   LEFT
    │
    │ RIGHT JOIN
    ↓
Inventory
   RIGHT
     ↑
 PRESERVED
```

**However**, in real SQL, when requirements become complex, using `LEFT JOIN` from the entity that must be preserved is usually clearer:

```sql
FROM Inventory
LEFT JOIN Orders
ON Inventory.Product_ID = Orders.Product_ID
LEFT JOIN Customer
ON Orders.Customer_ID = Customer.Customer_ID;
```

So don't use `RIGHT JOIN just because the question says RIGHT JOIN`; understand what must be preserved.

---

# 11. RIGHT JOIN + WHERE — Important

Consider:

```sql
SELECT Supplier.Supplier_Name,
       Inventory.Product_Name
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
WHERE Supplier.Supplier_City = 'BENGALURU';
```

Remember:

```text
RIGHT JOIN
    ↓
preserves Inventory

WHERE
    ↓
filters final result
```

If an Inventory row has no matching Supplier:

```text
Supplier_City = NULL
```

Then:

```sql
WHERE Supplier.Supplier_City = 'BENGALURU'
```

is not true for that row.

So the unmatched Inventory row disappears.

### Therefore:

If your requirement is:

> **Show every product, but only attach Bengaluru suppliers**

put the supplier condition in `ON`:

```sql
SELECT Supplier.Supplier_Name,
       Inventory.Product_Name
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
AND Supplier.Supplier_City = 'BENGALURU';
```

Now:

```text
Inventory = preserved
Supplier  = matching information
```

This follows the same principle you learned with `LEFT JOIN`.

---

# 12. RIGHT JOIN with conditions — Golden Rule

Suppose:

> Show **ALL products**, but attach only **AVAILABLE products**.

If Inventory is the preserved/right table:

```sql
FROM Supplier
RIGHT JOIN Inventory
ON Supplier.Supplier_ID = Inventory.Supplier_ID
AND Inventory.Product_Status = 'AVAILABLE';
```

But notice something important:

If `Inventory` itself is the table you want **all rows from**, putting a condition on Inventory in `ON` does **not remove Inventory rows**. It only controls matching behavior.

So you have to carefully distinguish:

### Condition on preserved table

It does **not necessarily filter it out** when placed in `ON`.

### Condition in WHERE

It filters the final result.

This distinction is extremely important in outer joins.

---

# 13. RIGHT JOIN mental model

Whenever you see a RIGHT JOIN, immediately draw this:

```text
FROM A
RIGHT JOIN B
```

Then write:

```text
A = LEFT
B = RIGHT
```

Then:

```text
RIGHT JOIN
     ↓
KEEP ALL B
```

So:

```text
A                         B
LEFT                      RIGHT
 │                          │
 │       RIGHT JOIN         │
 └──────────────────────────┘
                            ↑
                       ALL B survive
```

---

# 14. Business requirement → table placement

### Requirement 1

> Show every customer.

Use:

```sql
FROM Customer
LEFT JOIN Orders
```

because Customer must be preserved.

---

### Requirement 2

> Show every order.

Use:

```sql
FROM Customer
RIGHT JOIN Orders
```

because Orders must be preserved.

---

### Requirement 3

> Show every supplier.

Use:

```sql
FROM Supplier
LEFT JOIN Inventory
```

because Supplier must be preserved.

---

### Requirement 4

> Show every product.

Use either:

```sql
FROM Supplier
RIGHT JOIN Inventory
```

or the usually clearer:

```sql
FROM Inventory
LEFT JOIN Supplier
```

because Inventory must be preserved.

---

### Requirement 5

> Show every category.

Use:

```sql
FROM Categories
LEFT JOIN Inventory
```

because Categories must be preserved.

---

# 15. The golden table

| Requirement    | Preferred approach               | Preserved table |
| -------------- | -------------------------------- | --------------- |
| All Customers  | `Customer LEFT JOIN Orders`      | Customer        |
| All Orders     | `Customer RIGHT JOIN Orders`     | Orders          |
| All Suppliers  | `Supplier LEFT JOIN Inventory`   | Supplier        |
| All Products   | `Supplier RIGHT JOIN Inventory`  | Inventory       |
| All Categories | `Categories LEFT JOIN Inventory` | Categories      |
| All Inventory  | `Inventory LEFT JOIN Orders`     | Inventory       |

---

# 16. Interview answer ⭐

If interviewer asks:

**"What is RIGHT JOIN?"**

A strong answer:

> **RIGHT JOIN returns all rows from the right-side table and the matching rows from the left-side table. If there is no match, the left-side columns contain NULL. The table placed after RIGHT JOIN is the table that is preserved.**

If they ask:

**"How do you decide where to put the table?"**

Say:

> **I first identify which entity the business requirement says must be completely preserved. With a RIGHT JOIN, I place that table on the right side of the JOIN. With a LEFT JOIN, I place it on the left side.**

### 🔥 One-line memory trick

```text
LEFT JOIN  → ALL rows from LEFT table
RIGHT JOIN → ALL rows from RIGHT table
```

And the most important visual:

```text
FROM A
RIGHT JOIN B
       ↑
     RIGHT
     TABLE
       ↓
   ALL B SURVIVE
```

**This is the core of RIGHT JOIN.** Once this is clear, the actual SQL becomes much easier.
