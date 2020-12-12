*Tara Ram Mohan 
V00854777
8/25/2020 
SAS Project 1;

*Use a DATA step with the DATALINES statement to put the data into SAS from the Study2 table;
DATA Study2; 
	INPUT Repoxodil $ Site $ Gender $ SubjectNumber T1 T2 T3; 
	DATALINES; 
	R A F 17 83 33 43 
	Q A F 19 48 25 43 
	R B M 22 28 20 46 
	Q B M 24 24 37 158
	R A M 26 15 82 81 
	Q A M 29 26 13 15 
	R B F 33 35 69 51 
	Q B F 37 153 11 68
	R A F 39 17 28 307
	Q A F 40 23 42 10 
	R B M 46 43 26 63 
	Q B M 49 59 101 24
	R A M 51 15 18 66 
	Q A M 56 37 105 08
	R B F 63 16 17 38 
	Q B F 71 24 21 48 
	R A F 79 24 40 90 
	R B F 80 20 73 389
	Q A F 81 24 13 44 
	Q B F 86 11 57 64 
	;
RUN; 

*Create a subset of the data for subjects who received the Repoxodil;
*Refered to as "Repoxodil Dataset" from this point on; 
DATA Repoxodil; 
	SET Study2; 
	WHERE Repoxodil = "R";
RUN; 

*Create a subset of the data for subjects who received the control;
*Refered to as "Control Dataset" from this point on; 
DATA Control; 
	SET Study2; 
	WHERE Repoxodil = "Q";
RUN; 

*Create a subset of the data for subjects who are male;
*Refered to as "Male Dataset" from this point on;  
DATA Male; 
	SET Study2; 
	WHERE gender = "M";
RUN; 

*Create a subset of the data for subjects who are female;
*Refered to as "Female Dataset" from this point on; 
DATA Female; 
	SET Study2; 
	WHERE gender = "F";
RUN; 
*Find basic summaries of each numerical variable for each of the five datasets;
*Numerical variables include T1, T2, and T3;

*Basic summary for T1 (Task 1) for general Study2 dataset;
PROC MEANS DATA = Study2; 
	VAR t1; 
RUN; 
*Basic summary for T2 (Task 2) for general Study2 dataset;
PROC MEANS DATA = Study2; 
	VAR t2; 
RUN;
*Basic summary for T3 (Task 3) for general Study2 dataset;
PROC MEANS DATA = Study2; 
	VAR t3; 
RUN;

*Basic summary for T1 (Task 1) for the Repoxodil subset;
PROC MEANS DATA = Repoxodil; 
	VAR t1; 
RUN; 
*Basic summary for T2 (Task 2) for the Repoxodil subset;
PROC MEANS DATA = Repoxodil; 
	VAR t2; 
RUN;
*Basic summary for T3 (Task 3) for the Repoxodil subset;
PROC MEANS DATA = Repoxodil; 
	VAR t3; 
RUN;
*Basic summary for T1 (Task 1) for the Control subset;
PROC MEANS DATA = Control; 
	VAR t1; 
RUN; 
*Basic summary for T2 (Task 2) for the Control subset;
PROC MEANS DATA = Control; 
	VAR t2; 
RUN;
*Basic summary for T3 (Task 3) for the Control subset;
PROC MEANS DATA = Control; 
	VAR t3; 
RUN;
*Basic summary for T1 (Task 1) for the Male subset;
PROC MEANS DATA = Male; 
	VAR t1; 
RUN; 
*Basic summary for T2 (Task 2) for the Male subset;
PROC MEANS DATA = Male; 
	VAR t2; 
RUN; 
*Basic summary for T3 (Task 3) for the Male subset;
PROC MEANS DATA = Male; 
	VAR t3; 
RUN; 
*Basic summary for T1 (Task 1) for the Female subset;
PROC MEANS DATA = Female; 
	VAR t1; 
RUN; 
*Basic summary for T2 (Task 2) for the Female subset;
PROC MEANS DATA = Female; 
	VAR t2; 
RUN; 
*Basic summary for T3 (Task 3) for the Female subset;
PROC MEANS DATA = Female; 
	VAR t3; 
RUN; 
