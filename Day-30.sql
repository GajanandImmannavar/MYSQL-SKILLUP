-- use Joins;

🏢 Business Scenario

The sales manager wants to identify customers who have successfully completed purchases.

Display:

Customer Name
Customer City
Order ID
Product Name
Product Price
Payment Method

Requirements
Only successfully paid orders should be included.
Products priced between ₹2,000 and ₹90,000 should be considered.
Products whose names contain the letter o should be included.
Products from the Grocery category should not be included.
Show each customer/order combination only once.

Sort the report by:
Customer City — A → Z
Product Price — highest to lowest
Customer Name — A → Z

Tables
Customer
   ↓
Orders
   ↓
Inventory
   ↓
Categories





