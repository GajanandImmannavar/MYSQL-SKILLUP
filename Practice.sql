create database IF NOT EXISTS Practice;

use Practice;

create table StudentInfo(
    Name char(20),
    Usn int(20),
    Dept char(20),
    SkinColor char(20),
    Hight varchar(20),
    Weight int(20),
    DOB date,
    Age int(20),
    Grade char(10)
);

desc StudentInfo;

show Tables;

insert into StudentInfo (
    name, usn, dept, Skincolor, hight, weight, dob, age, grade) VALUES(
        'Gajanand',1,'Aiml','Brown','5',45,
        '2004-07-15',22,'A+'),
        ('Hanamanth', 2,'Aiml','Brown','5.5',55,'2003-07-18',21,'A+');

select * from StudentInfo;

insert into StudentInfo (
    name, usn, dept, skincolor, hight, weight, dob, age, Grade)
    values(
            'Mallu', 3, 'Cs', 'Brown', '5', 50, '2004-08-14',22,'A+'
    ),
    (
        'Praven', 4, 'Cs', 'Wight', '5', 55, '2004-08-15', 22,'A'
    ),
    (
        'Darshan', 5, 'Is', 'Wight','5.5',55, '2004-08-15',22, 'A'
    );
  

  select * from StudentInfo;

alter table StudentInfo CHANGE COLUMN  Weight TO WeightKG;


desc StudentInfo;

select * from StudentInfo;

select Name from StudentInfo 
 where Age < 22;

select * from StudentInfo 
where Dept in ('aiml','cs');


select * from StudentInfo 
where age between 20 and 21;

select * from studentinfo 
where name like 'G%';


select * from StudentInfo   
where name like '%h';

select * from StudentInfo 

where  Name like '%nd%';


select * from StudentInfo 
where Age like '_1';

select * from StudentInfo 

where Age like  '2_';

select * from StudentInfo 
where Age is null;

select * from StudentInfo 

where Age is not null;


select * from StudentInfo 
where Dept != 'Cs';

select * from StudentInfo WHERE
dept = 'cs' or dept = 'aiml';

select * from  StudentInfo 
where dept not in ('cs', 'aiml');

select * from StudentInfo 
where Dept in ('aiml','cs');

select Name, max(Age) as Sceiner FROM StudentInfo;



create table Hi (Id int,
Name char,
Dept char,
Age int,
marks int,
phone int
);

desc hi;

alter table Hi
add Dob date;

alter table hi modify
dob int;

alter table hi modify
dob date;


alter table hi  rename  to Students;

select * from Students

desc students;

alter table students change  dob to Dob;

desc students;

alter table students modify dob int;

alter table students modify dob date;

desc students;

alter table students 
drop dob;

desc students;

alter table students add Dob date;

desc students;


insert INTO students(
    id, name, dept, age, marks, phone, dob
)values(
    01,'Gajanand', 'Aiml', 22, 100, 1234567890,'15-07-2004'
);

select * from Students;

update students set Name = 'Gajanand' where Age = 22;

update students set age = 21 WHERE name = 'G';

alter table students modify  id int primary key AUTO_INCREMENT

insert into students (name, dept, age, marks, phone, dob)values(
    'Mallu', 'Aiml', 22, 100, 1223344512, '18-05-2004'
);

select * from Students;

desc Students;

alter table Students modify Name Char(20);

alter table students modify dept char(20), modify Dob DATE;

insert into students ( name, dept, age, marks, phone,Dob)value(
    'Akash','IS', 22, 100, 8134589375, '15-07-2004'
);

select  * from Students;

update students set Dob = '2004-07-15'
where id = 1;

select * from Students;


select * from students 
where Name like '_____'

select * from students
where age like '2_'


select * from  students 

where name like '%G' and  age =22;

select * from students where age BETWEEN 20 and 21;

select * from Students where age between 21 and 22;

update Students SET dept = 'Aiml' WHERE id =1;

update Students SET dept = 'aiml' where id = 2;

select * from Students ;

update students set Name = 'Gajanand' where dept = 'Aiml';


select * from students;


update students SET name = 'Chandru' where id = 2;

select * from Students;