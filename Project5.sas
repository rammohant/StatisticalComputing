*Tara Ram Mohan 
V00854777
9/17/2020 Project 5;

*Using the Baltimore Crime data;

*1. Find the number of crimes using a Firearm 
Returns the number of rows using Count(Total_Incident)where Weapon is a "FIREARM"
31180 crimes committed using a Firearm;
PROC SQL; 
SELECT Count(Total_Incidents) AS TotalFirearmCrimes
FROM work.baltcrime
WHERE Weapon = 'FIREARM';
QUIT; 

*2. Find the number of crimes by district
Returns the number of rows using Count(Total_Incident) grouped by the district name;
PROC SQL; 
SELECT District, 
	Count(Total_Incidents) AS TotalCrimes
FROM work.baltcrime
GROUP BY District;
QUIT; 

*3. Find the number of Firearm crimes by Neighborhood by year
Returns the number of rows using Count(Total_Incident) where Weapon is a "FIREARM" grouped by neighborhood and by year from CrimeDate; 
PROC SQL; 
SELECT Neighborhood, 
	year(crimedate) AS Year, 
	Count(Total_Incidents) As TotalFirearmCrimes
FROM work.baltcrime
WHERE Weapon = 'FIREARM'
GROUP BY Neighborhood, Year; 
QUIT; 

*4. Find the number of Firearm crimes by year
Returns the number of rows using Count(Total_Incident) where Weapon is a "FIREARM" grouped by year from CrimeDate;
PROC SQL; 
SELECT year(crimedate) AS Year, 
	Count(Total_Incidents) As TotalFirearmCrimes
FROM work.baltcrime
WHERE Weapon = 'FIREARM'
GROUP BY Year; 
QUIT; 

*5. Use CrimeCode to find the number of Aggravated Assaults by month
Returns the number of rows using Count(Total_Incident) where CrimeCode is a "4C" grouped by month from CrimeDate
4C = Aggravated Assault;
PROC SQL; 
SELECT month(crimedate) AS Month, 
	Count(Total_Incidents) As TotalAggravatedAssaults
FROM work.baltcrime
WHERE CrimeCode = '4C'
GROUP BY Month; 
QUIT; 

*6. Use CrimeCode to find the number of Common Assaults by year
Returns the number of rows using Count(Total_Incident) where CrimeCode is a "4E" grouped by year from CrimeDate
4E = Common Assault;
PROC SQL; 
SELECT year(crimedate) AS Year, 
	Count(Total_Incidents) As TotalCommonAssaults
FROM work.baltcrime
WHERE CrimeCode = '4E'
GROUP BY Year; 
QUIT; 

*7.  Create a dataset that has year, number of Aggravated Assaults and number of Common Assaults;

*Create a dataset that shows number of Aggravated Assaults by year
Returns the number of rows using Count(Total_Incident) where CrimeCode is a "4C" grouped by year from CrimeDate; 
PROC SQL; 
CREATE TABLE work.AggravatedAssaults AS 
SELECT year(crimedate) AS Year, 
	Count(Total_Incidents) As AggravatedAssaults
FROM work.baltcrime
WHERE CrimeCode = '4C'
GROUP BY Year;
QUIT; 
 
*Create a dataset that shows number of Common Assaults by year
Returns the number of rows using Count(Total_Incident) where CrimeCode is a "4E" grouped by year from CrimeDate; 
PROC SQL;
CREATE TABLE work.CommonAssaults AS 
SELECT year(crimedate) AS Year, 
	Count(Total_Incidents) As CommonAssaults
FROM work.baltcrime
WHERE CrimeCode = '4E'
GROUP BY Year;
QUIT; 

*Create a dataset that joins AggravatedAssaults and CommonAssaults tables with 3 columns
Dataset should show number of Aggravated Assaults and Common Assaults by year; 
PROC SQL;
CREATE TABLE work.Assaults AS 
SELECT a.Year, a.AggravatedAssaults, b.CommonAssaults
FROM work.AggravatedAssaults as A, 
	work.CommonAssaults as B
WHERE a.Year = b.Year;
QUIT; 

