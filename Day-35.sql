-- show databases;

-- use Joins;

-- show tables;

🏢 Business Scenario
The marketing team wants to generate every possible combination of customers and products, then identify how many qualifying combinations belong to each customer city.
Display


- Customer City
- Total Combinations
- Average Product Price
- Maximum Product Rating

Tables
Customer
Inventory


Requirements
1. Use CROSS JOIN to generate every possible customer-product combination.
2. Include customers from BENGALURU, MUMBAI, PUNE, or HYDERABAD.
3. Exclude customers whose gender is Female.
4. Product price must be between ₹2,000 and ₹60,000.
5. Product rating must be at least 3.
6. Exclude products with status DISCONTINUED or OUT OF STOCK.
7. Count qualifying combinations using COUNT(*).
8. Calculate average product price using AVG().
9. Calculate maximum rating using MAX().
10. Group results by customer city.
11. Show only cities with more than 5 qualifying combinations using HAVING.
12. Sort by total combinations from highest to lowest.
Concepts tested
CROSS JOIN, WHERE, IN, NOT IN, BETWEEN, COUNT(*), AVG(), MAX(), GROUP BY, HAVING, and ORDER BY.


select 