*Tara Ram Mohan 
V00854777
9/3/2020 Project 3;

DATA Data; 
	INPUT Repoxodil $ Site $ Gender $ SubjectNumber $ T1 T2 T3; 
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
*QUESTION 1: Use PROC TTEST to determine if the treatment Repoxodil causes statistically different mean responses for each task.  

Null Hypothesis: The mean response time for Task 1 of the two groups (those who received Repoxodil and those who received the Control) 
are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 1 of the two groups (those who received Repoxodil and those who received the Control) 
are significantly different.
 
Assumptions: All assumptions were met except #2 normal distribution 
1. The data for the response values for each task are continuous (not discrete).
2. The data does not follow the normal probability distribution (See test for normality in Question 3 below).  
3. The variances of the two populations are equal. (See test for equal variances below) 
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group.
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

*Assumption of Equal Variance: 
Null hypothesis: There is no statistically significant difference in the variances between the groups.
Folded F statistic F' = 3.85
P = 0.0575
According to the F test for Equality of Variances, we fail to reject the null hypothesis of equal variances since p > 0.035, 
so assumption of equal variances is reasonable for these data, and we use Pooled

*Test Statistic: t = 0.91
Pooled P-value: p = 0.3742
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +- 2.28
Decision Rule: Reject the null hypothesis if test statistic > 2.28 or if test-statistic < -2.28.
Conclusion: Fail to reject the null hypothesis because -2.28 < t < 2.28 and p-value = 0.3741 > 0.035, 
so mean response time for Task 1 between the Repoxodil and Control groups is significantly different;

PROC TTEST data = Data ALPHA=0.035 DIST=NORMAL;
	CLASS Repoxodil; 
	VAR t1; 
RUN; 

*Null Hypothesis: The mean response time for Task 2 of the two groups (those who received Repoxodil and those who received the Control) 
are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 2 of the two groups (those who received Repoxodil and those who received the Control) 
are significantly different. 

Assumptions: All assumptions were met except #2 normal distribution 
1. The data for the response values for each task are continuous (not discrete).
2. The data does not follow the normal probability distribution (See test for normality in Question 3 below) 
3. The variances of the two populations are equal. (See test for equal variances below)
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group.  
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

Assumption of Equal Variance: 
Null hypothesis: There is no statistically significant difference in the variances between the groups.
Folded F statistic: F' = 2.02
P = 0.3112
According to the F test for Equality of Variances, we fail to reject the null hypothesis of equal variances since p > 0.035, 
so assumption of equal variances is reasonable for these data, and we use Pooled.

Test Statistic: t = 0.14
Pooled P-value: p = 0.8902
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +- 2.28
Decision Rule: Reject the null hypothesis if test statistic > 2.28 or if test-statistic < -2.28.
Conclusion: Fail to reject the null hypothesis because -2.28 < t < 2.28 and p-value = 0.8902 > 0.035, 
so mean response time for Task 2 between the Repoxodil and Control groups is significantly different;

PROC TTEST data = Data ALPHA=0.035;
	CLASS Repoxodil;
	VAR t2; 
RUN; 

*Null Hypothesis: The mean response time for Task 3 of the two groups (those who received Repoxodil and those who received the Control) 
are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 3 of the two groups (those who received Repoxodil and those who received the Control) 
are significantly different. 
 
Assumptions: All assumptions were met, other than #2 normal distribution and #3 equal variances
1. The data for the response values for each task are continuous (not discrete).
2. The data does not  follow the normal probability distribution (See test for normality in Question 3 below) 
3. The variances of the two populations are not equal. (See test for equal variances below)
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group. 
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

Assumption of Equal Variance:  
Null hypothesis: There is no statistically significant difference in the variances between the groups. 
Folded F statistic: F' = 7.93
P = 0.0050
According to the F test for Equality of Variances, we reject the null hypothesis of equal variances since p < 0.035, 
so assumption of equal variances is not reasonable for these data, and we use Satterthwaite.

Test Statistic: t = -1.66 
Pooled P-value: p = 0.1244 
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +- 2.28
Decision Rule: Reject the null hypothesis if test statistic > 2.28 or if test-statistic < -2.28.
Conclusion: Fail to reject the null hypothesis because -2.28 < t < 2.28 and p-value = 0.1244  > 0.035, 
so mean response time for Task 3 between the Repoxodil and Control groups is significantly different;

PROC TTEST data = Data ALPHA=0.035;
	CLASS Repoxodil; 
	VAR t3; 
RUN; 

*QUESTION 2: Use PROC TTEST to determine if gender influences the mean response for each task.  

*Null Hypothesis: The mean response time for Task 1 of the two groups (males and females) are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 1 of the two groups (males and females) are significantly different. 
 
Assumptions: All assumptions were met, other than #2 normal distribution and #3 equal variances
1. The data for the response values for each task are continuous (not discrete).
2. The data does not  follow the normal probability distribution (See test for normality in Question 3 below) 
3. The variances of the two populations are not equal. (See test for equal variances below)
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group. 
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

Assumption of Equal Variance:
Null hypothesis: There is no statistically significant difference in the variances between the groups. 
Folded F statistic: F' = 7.39
P = 0.0140
According to the F test for Equality of Variances, we reject the null hypothesis of equal variances since p < 0.05, 
so assumption of equal variances is not reasonable for these data, and we use Satterthwaite.

Test Statistic: t = 0.70
Pooled P-value: p = 0.4963 
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +-2.10
Decision Rule: Reject the null hypothesis if test statistic > 2.10 or if test-statistic < -2.10.
Conclusion: Fail to reject the null hypothesis because -2.10 < t < 2.10 and p-value = 0.4963 > 0.05, 
so mean response time for Task 2 between the male and female groups is significantly different;

PROC TTEST data = Data ALPHA=0.05;
	CLASS gender; 
	VAR t1; 
RUN; 

*Null Hypothesis: The mean response time for Task 2 of the two groups (males and females) are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 2 of the two groups (males and females) are significantly different. 
 
Assumptions: All assumptions were met except #2 normal distribution 
1. The data for the response values for each task are continuous (not discrete).
2. The data does not  follow the normal probability distribution (See test for normality in Question 3 below) 
3. The variances of the two populations are equal. (See test for equal variances below)
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group. 
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

Assumption of Equal Variance:
Null hypothesis: There is no statistically significant difference in the variances between the groups. 
Folded F statistic: F' = 3.44
P = 0.0667 
According to the F test for Equality of Variances, we fail to reject the null hypothesis of equal variances since p > 0.05, 
so assumption of equal variances is reasonable for these data, and we use Pooled.

Test Statistic: t = -1.08
Pooled P-value: p = 0.2944 
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +-2.10
Decision Rule: Reject the null hypothesis if test statistic > 2.10 or if test-statistic < -2.10.
Conclusion: Fail to reject the null hypothesis because -2.10 < t < 2.10 and p-value = 0.2944 > 0.05, 
so mean response time for Task 2 between the male and female groups is significantly different;

PROC TTEST data = Data ALPHA=0.05;
	CLASS gender;
	VAR t2; 
RUN; 

*Null Hypothesis: The mean response time for Task 3 of the two groups (males and females) are not significantly different. (H0: µ1=µ2)
Alternate Hypothesis: The mean response time for Task 3 of the two groups (males and females) are significantly different. 
 
Assumptions: All assumptions were met, other than #2 normal distribution and #3 equal variances
1. The data for the response values for each task are continuous (not discrete).
2. The data does not follow the normal probability distribution (See test for normality in Question 3 below) 
3. The variances of the two populations are not equal. (See test for equal variances below)
4. The two samples are independent. There is no relationship between the individuals in one sample as
compared to the other since the individuals from each treatment group were distinct where each subject only belongs to one group.  
5. Samples are simple random samples from their respective populations where each individual in the
population has an equal probability of being selected in the sample.

Assumption of Equal Variance:
Null hypothesis: There is no statistically significant difference in the variances between the groups. 
Folded F statistic: F' = 6.08
P = 0.0246
According to the F test for Equality of Variances, we reject the null hypothesis of equal variances since p < 0.05, 
so assumption of equal variances is not reasonable for these data, and we use Satterthwaite. 

Test Statistic: t = 0.94
Pooled P-value: p = 0.3591 
Degrees of Freedom: df = 10+10-2 = 18
Significance level = 0.035 where critical value = +-2.10
Decision Rule: Reject the null hypothesis if test statistic > 2.10 or if test-statistic < -2.10.
Conclusion: Fail to reject the null hypothesis because -2.10 < t < 2.10 and p-value = 0.3591 > 0.05, 
so mean response time for Task 2 between the male and female groups is significantly different;
PROC TTEST data = Data ALPHA=0.05;
	CLASS gender; 
	VAR t3; 
RUN; 

*QUESTION 3: Does it appear the assumptions for the tests are met?
Other assumptions can be found under each test; 

*Assumption of Normality for T1:
Null hypothesis: The data in T1 is normally distributed
Conclusion: Reject H0 that the T1 data is normally distributed because p < 0.05;
PROC UNIVARIATE DATA = Data; 
	VAR T1;  
	HISTOGRAM / NORMAL; 
RUN; 
QUIT;

*Assumption of Normality for T2:
Null hypothesis: The data in T2 is normally distributed
Conclusion: Reject H0 that the T2 data is normally distributed because p < 0.05;
PROC UNIVARIATE DATA = Data; 
	VAR T2;  
	HISTOGRAM / NORMAL; 
RUN; 
QUIT;

*Assumption of Normality for T3:
Null hypothesis: The data in T3 is normally distributed
Conclusion: Reject H0 that the T3 data is normally distributed because p < 0.05;
PROC UNIVARIATE DATA = Data; 
	VAR T3;  
	HISTOGRAM / NORMAL; 
RUN; 
QUIT;

