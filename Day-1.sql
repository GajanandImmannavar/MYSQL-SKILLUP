show databases;

create database if not exists   Day1;

use Day1;

create table Patients (
    PATIENT_ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    AGE INT,
    BLOOD_GROUP VARCHAR(5),
    DECEASE VARCHAR(100),
    GENDER VARCHAR(10),
    ADDRESS VARCHAR(255),
    PHONE_NUMBER VARCHAR(15)UNIQUE,
    EMAIL VARCHAR(100) UNIQUE,
    DATE_OF_ADMISSION DATE,
    DOCTOR_NAME VARCHAR(100),
    AMOUNT DECIMAL(10, 2) DEFAULT 0.00,
    AMOUNT_STATUS ENUM('PAID', 'UNPAID') DEFAULT 'UNPAID',
    DATE_OF_DISCHARGE DATE
    
);

 desc Patients;

 insert into Patients (FIRST_NAME, LAST_NAME, AGE, BLOOD_GROUP, DECEASE, GENDER, ADDRESS, PHONE_NUMBER, EMAIL, DATE_OF_ADMISSION, DOCTOR_NAME, AMOUNT, AMOUNT_STATUS, DATE_OF_DISCHARGE)values
 ('Gajanand','Sharma', 30, 'O+', 'Diabetes', 'Male', 'Bengalore', '1234567890', 'Gajanand@gmail.com', '2024-01-01', 'Dr. Smith', 5000.00, 'PAID', '2024-01-10');                        

select * from Patients;

INSERT INTO Patients (
    FIRST_NAME,
    LAST_NAME,
    BLOOD_GROUP,
    DECEASE,
    GENDER,
    ADDRESS,
    PHONE_NUMBER,
    EMAIL,
    DATE_OF_ADMISSION,
    DOCTOR_NAME,
    AMOUNT,
    DATE_OF_DISCHARGE
)
VALUES
(
    'Harshitha',
    'Kumar',
    'A+',
    'Hypertension',
    'Female',
    'Bangalore',
    '9876543210',
    'harshitha@gmail.com',
    '2025-01-25',
    'Dr. Johnson',
    3000.00,
    '2025-02-05'
),
(
    'Adil',
    'Khan',
    'A+',
    'Fever',
    'Male',
    'Bangalore',
    '9876543211',
    'adil@gmail.com',
    '2025-01-26',
    'Dr. Johnson',
    2000.00,
    '2025-02-06'
);


select * from Patients;

INSERT INTO Patients
(FIRST_NAME, LAST_NAME, AGE, BLOOD_GROUP, DECEASE, GENDER, ADDRESS, PHONE_NUMBER, EMAIL, DATE_OF_ADMISSION, DOCTOR_NAME, AMOUNT, AMOUNT_STATUS, DATE_OF_DISCHARGE)
VALUES
('Rahul', 'Sharma', 28, 'O+', 'Fever', 'Male', 'Bangalore', '9876500001', 'rahul@gmail.com', '2025-01-05', 'Dr. Smith', 2500.00, 'PAID', '2025-01-08'),

('Priya', 'Patil', 35, 'A+', 'Diabetes', 'Female', 'Mysore', '9876500002', 'priya@gmail.com', '2025-01-10', 'Dr. Johnson', 12000.00, 'UNPAID', NULL),

('Arjun', 'Reddy', 42, 'B+', 'Hypertension', 'Male', 'Hubli', '9876500003', 'arjun@gmail.com', '2025-01-12', 'Dr. Kumar', 8500.00, 'PAID', '2025-01-18'),

('Sneha', 'Kulkarni', 24, 'AB+', 'Malaria', 'Female', 'Belgaum', '9876500004', 'sneha@gmail.com', '2025-01-15', 'Dr. Smith', 4500.00, 'UNPAID', NULL),

('Rohit', 'Joshi', 55, 'O-', 'Asthma', 'Male', 'Dharwad', '9876500005', 'rohit@gmail.com', '2025-01-18', 'Dr. Mehta', 6500.00, 'PAID', '2025-01-24'),

('Anjali', 'Desai', 31, 'A-', 'Migraine', 'Female', 'Bangalore', '9876500006', 'anjali@gmail.com', '2025-01-20', 'Dr. Kumar', 3000.00, 'PAID', '2025-01-22'),

('Kiran', 'Naik', 47, 'B-', 'Typhoid', 'Male', 'Mangalore', '9876500007', 'kiran@gmail.com', '2025-01-22', 'Dr. Johnson', 7200.00, 'UNPAID', NULL),

('Pooja', 'Shetty', 26, 'O+', 'Dengue', 'Female', 'Udupi', '9876500008', 'pooja@gmail.com', '2025-01-25', 'Dr. Smith', 9800.00, 'PAID', '2025-01-31'),

('Vikram', 'Patel', 38, 'AB-', 'Kidney Stone', 'Male', 'Hubli', '9876500009', 'vikram@gmail.com', '2025-01-28', 'Dr. Mehta', 15000.00, 'UNPAID', NULL);

INSERT INTO Patients
(
    FIRST_NAME,
    LAST_NAME,
    AGE,
    BLOOD_GROUP,
    DECEASE,
    GENDER,
    ADDRESS,
    PHONE_NUMBER,
    EMAIL,
    DATE_OF_ADMISSION,
    DOCTOR_NAME,
    AMOUNT,
    AMOUNT_STATUS,
    DATE_OF_DISCHARGE
)
VALUES
(
    'Harshitha',
    'Kumar',
    29,
    'A+',
    NULL,
    'Female',
    NULL,
    '9876512356',
    'harshitha.kumar02@gmail.com',
    '2025-02-01',
    'Dr. Johnson',
    3000.00,
    NULL,
    NULL
);


Write an SQL query to display all columns and all records from the Patients table.

select * from Patients;


Write an SQL query to display all details of patients whose blood group is A+.

select * from Patients where BLOOD_GROUP='A+';

Write an SQL query to display all details of patients whose age is greater than 40.

select * from Patients where AGE > 40;

| Operator | Meaning                  | Includes 40?   |
| -------- | ------------------------ | ------------ |
| `>`      | Greater than             | ❌ No         |
| `>=`     | Greater than or equal to | ✅ Yes        |
| `<`      | Less than                | ❌ No         |
| `<=`     | Less than or equal to    | ✅ Yes        |

Write an SQL query to display all details of patients whose age is less than 30.

select * from Patients where AGE < 30;

⚠️ Challenge (Optional):
Without changing the logic, can you write a query that returns only the patient's:

FIRST_NAME
LAST_NAME
AGE

instead of all columns?

select FIRST_NAME, LAST_NAME, AGE from Patients where AGE < 30;

Write an SQL query to display all patient details where the patient's age is 30 or greater.

select * from patients where AGE >= 30; 

Write another query to return only these columns:

FIRST_NAME
LAST_NAME
AGE
DOCTOR_NAME

for patients aged 30 or above.

select FIRST_NAME, LAST_NAME, AGE, DOCTOR_NAME from Patients where AGE >= 30;

| Condition   | Includes 30? |
| ----------- | ------------ |
| `AGE > 30`  | ❌ No         |
| `AGE >= 30` | ✅ Yes        |



select * from patients;

The hospital wants to identify young patients who may require follow-up care. Specifically, management needs a list of patients who:

are 30 years old or younger, and
have an unpaid bill.

Write an SQL query to display all details of such patients.

 select * from patients where AGE <= 30 and AMOUNT_STATUS = 'UNPAID';

⭐ Very Important Concept: NULL

This is something SQL interviews frequently test.

Consider Row 2:

AGE = NULL

Does this satisfy:

AGE <= 30

❌ No.

In SQL, any comparison with NULL does not evaluate to TRUE.

For example:

NULL = 30

→ Not TRUE

NULL > 30

→ Not TRUE

NULL <= 30

→ Not TRUE

To check for missing values, you must use:

WHERE AGE IS NULL

instead of:

WHERE AGE = NULL   -- Incorrect

This is a very common interview question.

A hospital is organizing a Free Health Check-up Camp. The management wants to invite patients who satisfy at least one of the following conditions:

The patient is 60 years or older, OR
The patient's bill is UNPAID.

Write an SQL query to display all details of eligible patients.

select * from patients where AGE >= 60 OR AMOUNT_STATUS = 'UNPAID'; 


⭐ Bonus Challenge (Interview Level)

The hospital wants to print a short report instead of all patient details.

Write another SQL query to display only:

PATIENT_ID
FIRST_NAME
AGE
AMOUNT_STATUS

for patients who satisfy the same condition.

select PATIENT_ID, FIRST_NAME, AGE, AMOUNT_STATUS 
from patients 
where AGE >= 60 OR AMOUNT_STATUS = 'UNPAID';


A row is returned only if at least one condition evaluates to TRUE.

Remember:

TRUE OR FALSE → ✅ TRUE
FALSE OR TRUE → ✅ TRUE
TRUE OR TRUE → ✅ TRUE
FALSE OR FALSE → ❌ FALSE

With NULL, SQL uses three-valued logic, but for now, think of NULL comparisons as not satisfying the condition.


⭐ Very Important Concept: NULL

This is something SQL interviews frequently test.

Consider Row 2:

AGE = NULL

Does this satisfy:

AGE <= 30

❌ No.

In SQL, any comparison with NULL does not evaluate to TRUE.

For example:

NULL = 30

→ Not TRUE

NULL > 30

→ Not TRUE

NULL <= 30

→ Not TRUE

To check for missing values, you must use:

WHERE AGE IS NULL

instead of:

WHERE AGE = NULL   -- Incorrect

This is a very common interview question.






