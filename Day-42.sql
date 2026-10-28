-- show databases;


-- use Joins;


SELF JOIN — Problem 22: Customers Who Joined on Different Dates but Live in the Same City
Business scenario: A company wants to compare customers from the same city and identify who registered earlier and who registered later.

Table: Customer
Your task
Display these columns:
- Customer_1
- Customer_2
- City
- Join_Date_1
- Join_Date_2
Conditions
1. Both customers must live in the same city.
2. They must have different Customer_ID values.
3. Their Join_Date values must be different.
4. Show each customer pair only once.
5. Display the earlier-joining customer first.
6. Sort by city, then by the earlier join date.