--Marzieh Nouri 
--9637353

--!!PLEASE RUN THIS CODE PART BY PART TO PREVENT ERRORS

--Table creation and data insertion----------------------------------------------------------

CREATE TABLE Customers (
	CID int,
	Name varchar(50) NOT NULL,
	natCod char(10) NOT NULL,
	birthDate date,
	[add] varchar(150),
	tel varchar(11),
	PRIMARY KEY (CID)
);

INSERT INTO Customers (CID,Name,natCod,birthDate,[add],tel) VALUES 
						(1000,'Marzieh Nouri','1090591440','1999-06-19','Isfahan','09141234556'), 
						(1001,'Nasrin Radmehr','1583256628',NULL,NULL,NULL),
						(1002,'Hedieh Derakhshan','1583222154',NULL,NULL,NULL),
						(1003,'Farhad Sherafati','1234567890',NULL,NULL,NULL),
						(1004,'Amir Taban','9876543219',NULL,NULL,NULL),
						(1005,'Leila Saadat','3217653428',NULL,NULL,NULL),
						(1006,'Shahin Shams','4563452341',NULL,NULL,NULL),
						(1007,'Zohreh Ranjbar','2914321982',NULL,NULL,NULL),
						(1008,'Elham Tabatabaei','4320419432',NULL,NULL,NULL),
						(1009,'Saman Azad','2316541290',NULL,NULL,NULL),
						(1010,'Ardalan Pirzad','7093781568',NULL,NULL,NULL),
						(1011,'Miniru Ravanipour','7093781562',NULL,NULL,NULL),
						(1012,'Houshang Golshiri','7093781561',NULL,NULL,NULL),
						(1013,'Bozorg Alavi','7093781538',NULL,NULL,NULL),
						(1014,'Fariba Vafi','7193781562',NULL,NULL,NULL),
						(1015,'Abbas Maaroufi','2193781561',NULL,NULL,NULL),
						(1016,'Nader Ebrahimi','7091281538',NULL,NULL,NULL)



CREATE TABLE Branch(
	branch_id int,
	branch_name varchar(50),
	branch_add varchar(150),
	branch_tel varchar(11),
	PRIMARY KEY(branch_id)
);

INSERT INTO Branch (branch_id,branch_name,branch_add,branch_tel) VALUES 
		     	(1,'Tehran','Azadi sqr.','02112312123'),
			   	  (2,'Tabriz',NULL,NULL),
				  (3,'Isfahan',NULL,NULL),
				  (4,'Sari',NULL,NULL),
				  (5,'Rasht',NULL,NULL),
				  (6,'KhorramAbad',NULL,NULL)

CREATE TABLE Trn_Src_Des (
	voucherId varchar(10),
	trnDate date NOT NULL,
	trnTime char(8) NOT NULL,
	amount bigint NOT NULL,
	sourceDep int,
	desDep int,
	branch_id int,
	trn_desc varchar(150),
	PRIMARY KEY(voucherId),
	FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

INSERT INTO Trn_Src_Des (voucherId,trnDate,trnTime,amount,sourceDep,desDep,branch_id,trn_desc) VALUES
						(2000,'2019-11-11','09:15:00',100,3000,3001,1,NULL),
						(2001,'2019-11-13','11:09:23',100,3001,3002,1,NULL),
						(2002,'2019-11-13','16:16:19',100,3001,3003,1,NULL),
						(2003,'2019-12-29','20:19:18',50,3001,3004,1,NULL),
						(2004,'2020-01-09','12:19:43',40,3001,NULL,1,NULL),
						(2005,'2020-01-10','18:04:45',20,3001,5000,1,NULL),
						(2006,'2020-01-12','19:12:30',10,3001,3005,1,NULL),
						(2007,'2019-11-13','12:09:20',100,3002,3006,2,NULL),
						(2008,'2019-12-24','23:10:46',70,3002,NULL,2,NULL),
						(2009,'2020-02-13','01:10:20',30,3002,5002,2,NULL),
						(2010,'2020-02-13','11:12:19',12,3002,5003,2,NULL),
						(2011,'2020-07-12','12:12:12',80,3003,3007,3,NULL),
						(2012,'2020-08-12','13:13:13',30,3003,NULL,3,NULL),
						(2013,'2020-01-01','19:17:13',50,3004,3008,4,NULL),
						(2014,'2020-01-02','10:12:19',20,3004,5004,4,NULL),
						(2015,'2020-01-01','19:12:19',60,3004,NULL,4,NULL),
						(2016,'2020-02-25','12:12:12',10,3005,3009,5,NULL),
						(2017,'2020-02-25','15:16:17',5,3005,3009,5,NULL),
						(2018,'2020-02-29','20:20:20',5,3005,NULL,5,NULL),
						(2019,'2020-03-19','23:12:12',2,3005,5005,5,NULL),
					    (2020,'2019-11-13','16:16:19',50,3001,5009,1,NULL),
						(2021,'2020-07-13','11:12:19',60,3006,5050,1,NULL),
	    				 (2022,'2019-10-20','23:12:12',100,3011,3000,5,NULL),
		   			   (2023,'2019-10-20','12:08:23',50,3012,3000,5,NULL),
					   (2024,'2019-09-24','23:12:12',60,3013,3000,5,NULL),
					   (2025,'2018-10-17','23:12:12',100,3016,3011,5,NULL),
					   (2026,'2017-05-21','12:08:23',50,3017,3016,5,NULL),
					   (2027,'2019-09-24','23:12:12',120,3001,3015,5,NULL)

SELECT * FROM Trn_Src_Des



CREATE TABLE Deposit_type (
	dep_type int,
	dep_typ_desc varchar(50),
	PRIMARY KEY (dep_type)
); 

INSERT INTO Deposit_type (dep_type,dep_typ_desc) VALUES
						(1,'Jari'),
						(2,'PasAndaz')

CREATE TABLE Deposit_status (
	status int,
	status_desc varchar(50),
	PRIMARY KEY (status)
);

INSERT INTO Deposit_status (status, status_desc) VALUES  
							(1,'active'),
							(2,'closed')


CREATE TABLE Deposit (
	dep_id int,
	dep_type int,
	CID int,
	openDate date,
	status int,
	PRIMARY KEY (dep_id),
	FOREIGN KEY (dep_type) REFERENCES Deposit_type(dep_type),
	FOREIGN KEY (status) REFERENCES Deposit_status(status),
	FOREIGN KEY (CID) REFERENCES Customers(CID)
);

INSERT INTO Deposit  (dep_id,dep_type,CID,openDate,status) VALUES
					(3000,1,1000,'2018-07-09',1),
					(3001,1,1001,NULL,1),
					(3002,2,1002,NULL,1),		
					(3003,2,1003,NULL,1),
					(3004,1,1004,NULL,1),
					(3005,2,1005,NULL,1),
					(3006,1,1006,NULL,1),
					(3007,1,1007,NULL,1),
					(3008,1,1008,NULL,1),
					(3009,1,1009,NULL,1),
					(3010,2,1010,NULL,2)
INSERT INTO Deposit(dep_id,dep_type,CID,openDate,status) VALUES 	
					(3011,2,1011,NULL,2),
					(3012,2,1012,NULL,2),
					(3013,2,1013,NULL,2)
INSERT INTO Deposit(dep_id,dep_type,CID,openDate,status) VALUES 	
					(3014,2,1014,NULL,2),
					(3015,2,1015,NULL,2),
					(3016,2,1016,NULL,2)


--PART1----------------------------------------------------------------------
CREATE VIEW checkNationalCode_v AS
SELECT *,
CASE
WHEN 
(cast(substring(natCod,1,1) as int)*10+cast(substring(natCod,2,1) as int)*9+
+cast(substring(natCod,3,1) as int)*8+cast(substring(natCod,4,1) as int)*7
+cast(substring(natCod,5,1) as int)*6+cast(substring(natCod,6,1) as int)*5
+cast(substring(natCod,7,1) as int)*4+cast(substring(natCod,8,1) as int)*3
+cast(substring(natCod,9,1) as int)*2)%11<2 
AND
(cast(substring(natCod,1,1) as int)*10+cast(substring(natCod,2,1) as int)*9+
+cast(substring(natCod,3,1) as int)*8+cast(substring(natCod,4,1) as int)*7
+cast(substring(natCod,5,1) as int)*6+cast(substring(natCod,6,1) as int)*5
+cast(substring(natCod,7,1) as int)*4+cast(substring(natCod,8,1) as int)*3
+cast(substring(natCod,9,1) as int)*2)%11=cast(substring(natCod,10,1) as int)
THEN 'Valid'

WHEN 
(cast(substring(natCod,1,1) as int)*10+cast(substring(natCod,2,1) as int)*9+
+cast(substring(natCod,3,1) as int)*8+cast(substring(natCod,4,1) as int)*7
+cast(substring(natCod,5,1) as int)*6+cast(substring(natCod,6,1) as int)*5
+cast(substring(natCod,7,1) as int)*4+cast(substring(natCod,8,1) as int)*3
+cast(substring(natCod,9,1) as int)*2)%11>=2
AND
(cast(substring(natCod,1,1) as int)*10+cast(substring(natCod,2,1) as int)*9+
+cast(substring(natCod,3,1) as int)*8+cast(substring(natCod,4,1) as int)*7
+cast(substring(natCod,5,1) as int)*6+cast(substring(natCod,6,1) as int)*5
+cast(substring(natCod,7,1) as int)*4+cast(substring(natCod,8,1) as int)*3
+cast(substring(natCod,9,1) as int)*2)%11=11-cast(substring(natCod,10,1) as int) 
THEN 'Valid'
ELSE 'Invalid'
END AS isValid
FROM Customers
--TEST:
SELECT * FROM checkNationalCode_v

--PART2------------------------------------------------------------------------------
--All functions get a voucherid as an input
-------------------------------------------------------------------------------------

--"Functions Related to destination deposit of a given transaction"

-------------------------------------------------------------------------------------

--The function below determines date A that was mentioned in project description:
CREATE OR ALTER FUNCTION determineA_dst (@voucherid varchar(10)) 
RETURNS TABLE AS
RETURN
SELECT top 1 trnDate FROM Trn_Src_Des WHERE
sourceDep in (Select desDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
AND
(trnDate>(Select trnDate FROM Trn_Src_Des WHERE voucherId=@voucherid)
 OR (trnDate in (Select trnDate FROM Trn_Src_Des WHERE voucherId=@voucherid) AND 
	trnTime>(Select trnTime FROM Trn_Src_Des WHERE voucherId=@voucherid))
 ) ORDER BY trnDate, trnTime

-------------------------------------------------------------------------------------

--The function below covers case 1:
CREATE OR ALTER FUNCTION case1_dst (@voucherid VARCHAR(10)) 
RETURNS TABLE AS 
RETURN 
SELECT * FROM Trn_Src_Des
WHERE sourceDep=(Select desDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
and trnDate IN (SELECT * FROM determineA_dst(@voucherid))
and amount=(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)
 
-------------------------------------------------------------------------------------

--The function below covers case2:
CREATE OR ALTER FUNCTION case2_dst (@voucherid varchar(10))
RETURNS TABLE AS 
RETURN 
SELECT * FROM Trn_Src_Des
WHERE sourceDep=(Select desDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
and trnDate IN (SELECT * FROM determineA_dst(@voucherid))
and amount<>(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)

-------------------------------------------------------------------------------------

--The function below determines the sum of amounts that belong to the previous function:

CREATE OR ALTER FUNCTION sumCase2_dst (@voucherid varchar(10)) 
RETURNS TABLE AS 
RETURN 
WITH T AS (SELECT sum(amount) as s2 FROM case2_dst(@voucherid))
SELECT ISNULL(s2,0) as s2 FROM T 

-------------------------------------------------------------------------------------

--The function below covers case 3 and uses previous functions to reach out a table which contains our wanted data for just one transaction:
CREATE OR ALTER FUNCTION case3_dst (@voucherid varchar(10))
RETURNS TABLE AS 
RETURN 
WITH cumSum AS (
SELECT *,sum(amount) OVER (ORDER BY trnDate, trnTime  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_amount  
FROM Trn_Src_Des
WHERE trnDate>(SELECT * FROM determineA_dst(@voucherid)) 
	AND sourceDep=(Select desDep FROM Trn_Src_Des WHERE voucherId=@voucherid)) 
SELECT voucherId,trnDate,trnTime,amount,sourceDep,desDep,branch_id,trn_desc
FROM cumSum 
WHERE cum_amount+(select * from sumCase2_dst(@voucherid))<=(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)*1.1
UNION 
SELECT * FROM case2_dst(@voucherid)
UNION
SELECT * FROM case1_dst(@voucherid)

-------------------------------------------------------------------------------------

--The function below covers case 4 and returns our final result for destination:
CREATE OR ALTER FUNCTION case3_rec_dst (@voucherid varchar(10))
RETURNS TABLE AS 
RETURN
WITH case3_rec AS (
	SELECT * FROM case3_dst(@voucherid)
	UNION ALL
	SELECT X.* FROM case3_rec CROSS APPLY case3_dst(case3_rec.voucherId) X  
	WHERE case3_rec.trn_desc is null
) SELECT * FROM case3_rec 

-------------------------------------------------------------------------------------

--"Functions Related to source deposit of a given transaction"
--Functions below are just like the previous ones with the same order, but this time for source deposit:

-------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION determineA_src (@voucherid varchar(10)) 
RETURNS TABLE AS
RETURN
SELECT TOP 1 trnDate FROM Trn_Src_Des WHERE
desDep in (Select sourceDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
AND
(trnDate<(Select trnDate FROM Trn_Src_Des WHERE voucherId=@voucherid)
 OR (trnDate in (Select trnDate FROM Trn_Src_Des WHERE voucherId=@voucherid) AND 
	trnTime<(Select trnTime FROM Trn_Src_Des WHERE voucherId=@voucherid))
 )  ORDER BY trnDate DESC

--------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION case1_src (@voucherid VARCHAR(10)) 
RETURNS TABLE AS 
RETURN 
SELECT * FROM Trn_Src_Des
WHERE desDep=(Select sourceDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
and trnDate IN (SELECT * FROM determineA_src(@voucherid))
and amount=(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)

--------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION case2_src (@voucherid VARCHAR(10)) 
RETURNS TABLE AS 
RETURN 
SELECT * FROM Trn_Src_Des
WHERE desDep=(Select sourceDep FROM Trn_Src_Des WHERE voucherId=@voucherid)
and trnDate IN (SELECT * FROM determineA_src(@voucherid))
and amount<>(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)

--------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION sumCase2_src (@voucherid varchar(10)) 
RETURNS TABLE AS 
RETURN 
WITH T AS (SELECT sum(amount) as s2 FROM case2_src(@voucherid))
SELECT ISNULL(s2,0) as s2 FROM T 

--------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION case3_src (@voucherid varchar(10))
RETURNS TABLE AS 
RETURN 
WITH cumSum AS (
SELECT *,sum(amount) OVER (ORDER BY trnDate, trnTime desc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_amount  
FROM Trn_Src_Des
WHERE trnDate<(SELECT * FROM determineA_src(@voucherid)) 
	AND desDep=(Select sourceDep FROM Trn_Src_Des WHERE voucherId=@voucherid)) 
SELECT voucherId,trnDate,trnTime,amount,sourceDep,desDep,branch_id,trn_desc
FROM cumSum 
WHERE cum_amount+(select * from sumCase2_src(@voucherid))<=(Select amount FROM Trn_Src_Des WHERE voucherId=@voucherid)*1.1
UNION 
SELECT * FROM case2_src(@voucherid)
UNION
SELECT * FROM case1_src(@voucherid)

--------------------------------------------------------------------------------------

CREATE OR ALTER FUNCTION case3_rec_src (@voucherid varchar(10))
RETURNS TABLE AS 
RETURN
WITH case3_rec AS (
	SELECT * FROM case3_src(@voucherid)
	UNION ALL
	SELECT X.* FROM case3_rec CROSS APPLY case3_src(case3_rec.voucherId) X  
	WHERE case3_rec.trn_desc is null
) SELECT * FROM case3_rec 

--------------------------------------------------------------------------------------
--Here is the final function! It gets a voucherid and shows all related transactions:

CREATE OR ALTER FUNCTION src_dst_merged (@voucherid varchar(10))
RETURNS TABLE AS
RETURN 
SELECT * FROM case3_rec_dst(@voucherid)
UNION
SELECT * FROM case3_rec_src(@voucherid)

--------------------------------------------------------------------------------------
--This is a test:
SELECT * FROM src_dst_merged(2000)

