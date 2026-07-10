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

