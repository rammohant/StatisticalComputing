*Tara Ram Mohan 
V00854777
9/10/2020 Project 4;

*Using the Rxdata.csv file; 
*QUESTION 1: Convert the data format from wide to long.; 
DATA rxdata1;
	SET rxdata; 
	Time = Time1; 
	Session = 1; 
	DROP Time1 Time2 Time3;
RUN; 

DATA rxdata2; 
	SET rxdata; 
	Time = Time2; 
	Session = 2; 
	DROP Time1 Time2 Time3;
RUN; 

DATA rxdata3; 
	SET rxdata; 
	Time = Time3; 
	Session = 3; 
	DROP Time1 Time2 Time3;
RUN; 

DATA rxdataLONG; 
	SET rxdata1 rxdata2 rxdata3;
RUN; 

*QUESTION 2: Conduct an ANOVA test to determine if differences in mean time differs across treatment for only Session 1.  

*One-way ANOVA 
Null Hypothesis: The mean times for Session 1 were the same across all 4 treatment groups. (H0: µ1 = µ2 = µ3 = µ4)
Alternative H0: At least 2 of the Session 1 mean times differed.
Significance level: alpha = 0.05
Decision rule: Reject H0 if p-value < 0.05
P-value < .0001 
Conclusion: We reject the null hypothesis because p < 0.05, which implies there do exist differences in Session 1 mean times across treatment groups; 
PROC GLM data=rxdata; 
	CLASS treatment; 
	MODEL time1 = treatment; 
RUN; 
QUIT; 

*QUESTION 3: Conduct a post hoc test to determine where the differences exist in the data using Tukey's HSD procedure 
for only Session 1;

*Tukey HSD (Honestly Signficant Difference) Procedure
There is a significant statistical difference between Treatments C and H, Treatments H and L, Treatments H and M because P-value < 0.05 for those comparisons;

PROC GLM data=rxdata; 
	CLASS treatment; 
	MODEL time1 = treatment; 
	LSMEANS treatment / ADJUST = tukey; 
RUN; 
QUIT; 
