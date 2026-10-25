-- show databases;


-- use Joins;


SELF JOIN — Problem 17: Find customers who share a phone number
Business scenario: The shopping company wants to detect customer accounts that use the same phone number, which may indicate duplicate registrations.

Use your Customer table.
Requirements
1. Use INNER JOIN on Customer with itself.
2. Match customers with the same phone number.
3. Exclude self-matches and reversed duplicate pairs.
4. Ignore NULL phone numbers.
5. Display both customer names, both customer IDs, and the shared phone number.
