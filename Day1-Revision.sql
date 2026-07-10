🏥 Problem 8: Exclude Paid Patients
Problem Statement

The hospital billing department wants to focus only on patients whose bills are not paid.
Write an SQL query to display all details of patients whose AMOUNT_STATUS is not 'PAID'.

select * from patients where AMOUNT_STATUS != 'PAID';


Another 2 ways to write the same query:

select * from patients where AMOUNT_STATUS <> 'PAID';

select * from patients where AMOUNT_STATUS NOT IN ('PAID');

SELECT *
FROM Patients
WHERE NOT AMOUNT_STATUS = 'PAID';

Interview Tip: In SQL, there are multiple ways to express the same condition. The choice of syntax can depend on personal preference, readability, or specific database optimizations.

select patient_id, first_name, Amount_status
from patients
where Amount_status != 'PAID';


✅ In MySQL, both != and <> mean "not equal to". <> is the ANSI SQL standard.

Explain Plan:

⭐ The Most Important Part: Row 13

Row 13 has:

AMOUNT_STATUS = NULL

Now evaluate:

NOT (AMOUNT_STATUS = 'PAID')

First SQL checks:

AMOUNT_STATUS = 'PAID'

But:

NULL = 'PAID'

is not TRUE. In SQL, it evaluates to UNKNOWN (because NULL means "missing/unknown value").

Then SQL applies NOT:

NOT UNKNOWN

The result is still UNKNOWN, not TRUE.

Since the WHERE clause only returns rows where the condition is TRUE, Row 13 is not returned.

🧠 Three-Valued Logic (Interview Concept)

Unlike many programming languages, SQL has three logical values:

Result	Meaning
TRUE	Condition matches
FALSE	Condition does not match
UNKNOWN	Cannot determine because of NULL

The WHERE clause returns only TRUE.

So:

Expression	Result
TRUE	✅ Returned
FALSE	❌ Not returned
UNKNOWN	❌ Not returned

🎯 Interview Question

Suppose I ask:

SELECT *
FROM Patients
WHERE AMOUNT_STATUS != 'PAID';

Many beginners answer:

"It will return UNPAID and NULL."

❌ That's incorrect.

It returns only UNPAID.

NULL is not equal, but it's also not considered unequal. It's unknown.

How to Include NULL Too?

If the requirement is:

"Show patients whose status is not PAID or whose status is missing."

Then write:

SELECT *
FROM Patients
WHERE AMOUNT_STATUS != 'PAID'
   OR AMOUNT_STATUS IS NULL;

Now Row 13 will also appear.

NOT Operator

WHERE NOT condition

Equivalent to:

WHERE column != value

WHERE column <> value

---------------------------------

NULL Comparison

NULL = value      ❌ UNKNOWN
NULL != value     ❌ UNKNOWN
NULL > value      ❌ UNKNOWN
NULL < value      ❌ UNKNOWN

WHERE returns only TRUE rows.

To find NULL values:

WHERE column IS NULL

To find non-NULL values:

WHERE column IS NOT NULL

Easy Rule to Remember

Whenever you see NULL, ask yourself:

Am I comparing a value?

Examples:

=
>
<
>=
<=
!=
<>

These do not work with NULL.

Instead ask:

Am I checking whether the value is missing?

Then use:

IS NULL

or

IS NOT NULL