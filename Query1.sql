CREATE DATABASE a1;
USE a1;

CREATE TABLE DeptTable(DeptNo Integer,Dname varchar(100),Loc TEXT);
INSERT INTO DeptTable VALUES(10,'Accounts','Bangalore');
INSERT INTO DeptTable VALUES(20,'IT','Delhi');
INSERT INTO DeptTable VALUES(30,'Production','Chennai');
INSERT INTO DeptTable VALUES(40,'Sales','Hyd');
INSERT INTO DeptTable VALUES(50,'Admn','London');
SELECT * FROM DeptTable;

CREATE TABLE EmpTable(EmpNo Integer,Ename varchar(100),Sal INTEGER,Hire_Date date,Commission integer,DeptNo integer,Mgr Integer);
INSERT INTO EmpTable VALUES(1001,'Sachin',19000,'1980-1-1',2100,20,1003);
INSERT INTO EmpTable VALUES(1002,'Kapil',15000,'1970-1-1',2300,10,1003);
INSERT INTO EmpTable VALUES(1003,'Stefen',12000,'1990-1-1',500,20,1007);
INSERT INTO EmpTable VALUES(1004,'Williams',9000,'2001-1-1',NULL,30,1007);
INSERT INTO EmpTable VALUES(1005,'John',5000,'2005-1-1',NULL,30,1006);
INSERT INTO EmpTable VALUES(1006,'Dravid',19000,'1985-1-1',2400,10,1007);
INSERT INTO EmpTable VALUES(1007,'Martin',21000,'2000-1-1',1040,NULL,NULL);

SELECT * FROM EmpTable;

#1
SELECT * FROM EmpTable WHERE DeptNo=10 OR DeptNo= 30;

#2
SELECT DeptTable.DeptNo,DeptTable.Dname,DeptTable.Loc FROM DeptTable
	INNER JOIN EmpTable On
    DeptTable.DeptNo=EmpTable.DeptNo
    GROUP BY deptTable.DeptNo
    HAVING COUNT(EmpTable.DeptNo)>1;
#3
SELECT * FROM EmpTable WHERE Ename LIKE 's%';

#4
SELECT * FROM EmpTable WHERE Hire_Date<'2018-1-1';

#5
SELECT REPLACE (Ename,'a','#')AS Replaced_Name FROM EmpTable;

#6
SELECT e.Ename,m.Ename AS Manager_Name 
	FROM EmpTable e
	JOIN EmpTable m ON
	e.Mgr=m.EmpNo;

#7    
SELECT DeptTable.Loc ,SUM(Sal) AS Total_Sal FROM EmpTable 
	JOIN DeptTable ON
	DeptTable.DeptNo=EmpTable.DeptNo
	GROUP BY EmpTable.DeptNo;    

#8    
 SELECT EmpTable.EmpNo,EmpTable.Ename,EmpTable.Sal,EmpTable.Hire_Date,EmpTable.Commission,EmpTable.DeptNo,EmpTable.Mgr,DeptTable.Dname,DeptTable.Loc
	FROM EmpTable
	JOIN DeptTable ON
	DeptTable.DeptNo=EmpTable.DeptNo;

#9    
UPDATE EmpTable SET Sal=Sal+(Sal*10/100);
SELECT * FROM EmpTable;

#10
DELETE FROM EmpTable WHERE DeptNo=30;
SELECT * FROM EmpTable;

#11
SELECT Ename,(Sal+Commission) AS Gross_Salary FROM EmpTable;

#12
ALTER TABLE EmpTable MODIFY COLUMN Ename varchar(250);

#13
SELECT CURDATE();

#14
CREATE TABLE Students(Roll_No INTEGER,SName varchar(100),Branch TEXT,Age INTEGER,DOB DATE);
INSERT INTO Students VALUES(23,'Kathija','IS',19,'2000-12-14');
INSERT INTO Students VALUES(22,'Jyothi','IS',20,'2000-05-01');
INSERT INTO Students VALUES(67,'Inara','ME',21,'1999-02-13');
SELECT * FROM Students;

#15
SELECT COUNT(*) AS No_of_Emp FROM EmpTable WHERE Sal>10000;

#16
SELECT MIN(Sal) AS Minimum,MAX(Sal) AS Maximum,AVG(Sal) AS Average FROM EmpTable;

#17
SELECT DeptTable.Loc,count(*)AS No_of_Emp FROM EmpTable
	JOIN DeptTable ON
	DeptTable.DeptNo=EmpTable.DeptNo
	GROUP BY EmpTable.DeptNo;
    
#18
SELECT Ename FROM EmpTable 
	ORDER BY Ename DESC;  
    
#19    
CREATE TABLE EMP_BKP SELECT * FROM EmpTable;
SELECT * FROM EMP_BKP;

#20
SELECT Concat(Substring(Ename,1,3),Sal)FROM EmpTable;