*Tara Ram Mohan 
V00854777
8/27/2020 
Project 2;

DATA Flu; 
	INPUT Region $ Temperature Incidence; 
	DATALINES;
NorthWest	-6	0.74
NorthEast	-5.6	1.85
NorthEast	-5.2	0.41
NorthWest	-2.2	0.23
NorthEast	-2.1	1.5
UpperMidWest	-1.9	0.53
NorthEast	-1.2	0.93
NorthEast	-0.6	0.34
UpperMidWest	-0.6	0.57
NorthEast	-0.1	0.99
NorthEast	0	0.49
NorthEast	1	0.64
NorthWest	2.1	0.08
UpperMidWest	2.4	0.43
NorthWest	2.9	0.22
NorthWest	3	0.04
UpperMidWest	3.1	0.44
UpperMidWest	3.6	0.39
UpperMidWest	3.7	0.29
UpperMidWest	3.8	0.34
NorthEast	4.6	0.38
NorthWest	4.8	0.07
NorthEast	4.9	0.28
UpperMidWest	5.1	0.28
UpperMidWest	5.3	0.44
UpperMidWest	5.6	0.4
NorthWest	6	0.28
NorthEast	6	0.33
NorthWest	6.6	0.03
NorthEast	7.4	0.14
NorthEast	8	0.17
NorthWest	8.3	0.04
NorthWest	8.6	0.03
UpperMidWest	9	0.26
NorthWest	9.3	0.05
UpperMidWest	9.3	0.17
NorthWest	9.8	0.04
NorthWest	10.7	0.02
NorthWest	10.8	0.1
UpperMidWest	10.8	0.24
NorthEast	11.9	0.07
UpperMidWest	11.9	0.13
NorthEast	12.1	0.13
NorthEast	12.8	0.09
NorthWest	14.2	0.02
UpperMidWest	14.6	0.15
UpperMidWest	15	0.11
UpperMidWest	15.9	0.1
NorthWest	16.5	0.01
NorthWest	19.4	0
UpperMidWest	19.7	0.06
UpperMidWest	19.9	0.05
NorthEast	20	0.09
NorthWest	20.3	0.01
NorthWest	20.4	0.01
NorthWest	20.5	0
NorthEast	20.7	0.05
NorthEast	21.2	0.04
NorthEast	21.3	0.06
NorthWest	21.7	0
UpperMidWest	22.2	0.04
NorthWest	22.4	0
NorthEast	23.1	0.04
NorthWest	23.6	0
NorthEast	24	0.04
UpperMidWest	24.1	0.05
UpperMidWest	24.2	0.05
UpperMidWest	24.2	0.05
NorthEast	24.3	0.03
NorthWest	24.4	0
NorthEast	24.8	0.06
NorthEast	24.9	0.05
UpperMidWest	25.4	0.05
NorthEast	25.7	0.04
UpperMidWest	25.9	0.02
UpperMidWest	26.2	0.03
NorthEast	26.4	0.04
UpperMidWest	26.5	0.03
NorthWest	26.6	0
UpperMidWest	27	0.04
UpperMidWest	27.2	0.02
UpperMidWest	27.6	0.03
NorthWest	28.2	0
UpperMidWest	28.6	0.02
NorthWest	28.8	0
UpperMidWest	29.1	0.03
UpperMidWest	29.4	0.02
UpperMidWest	29.5	0.02
NorthEast	30.4	0.02
NorthWest	30.5	0
NorthWest	30.7	0
UpperMidWest	30.7	0.02
NorthEast	31	0.02
NorthEast	31.4	0.02
NorthEast	31.8	0.02
UpperMidWest	32.6	0.01
NorthWest	32.7	0
NorthWest	33.4	0
NorthEast	33.6	0.02
NorthEast	33.7	0.01
UpperMidWest	33.7	0.02
UpperMidWest	33.9	0.01
NorthWest	34.4	0
UpperMidWest	34.4	0.01
UpperMidWest	34.7	0.01
UpperMidWest	35	0.02
UpperMidWest	35.3	0.01
NorthWest	36.4	0
UpperMidWest	36.6	0.01
NorthEast	37.2	0.02
NorthWest	37.3	0
;
RUN; 

*Create an overall scatterplot using PROC PLOT with temperature on the x-axis 
Comment: The scatterplot of temperature v. incidence of the influenza virus has a moderate, negative, possibly nonlinear correlation.;
PROC PLOT DATA = flu; 
	PLOT incidence*temperature; 
RUN; 
QUIT; 

*Add a title;
title1 "Plot of Incidence V. Temperature";
*Change x-axis title;
axis1 label = ("Temperature (8C)");  
*Change the color of symbol; 
 symbol color = red value = dot interpol = spline; 

*Create an overall scatterplot using PROC GPLOT with temperature on the x-axis   
Comment: The scatterplots reveals a negative relationship between temperature and incidence where correlation seems to be very weak from -10 to 5 degrees Celsius
and become stronger as temperature increases.
There are two data points on the top left (low temp, high incidence) of the scatter plot that outlay further from the general trend posed by 
the spline curve, but further statistical analysis is necessary to determine outliers; 
PROC GPLOT DATA = flu; 
	PLOT incidence*temperature / HAXIS = axis1; 
RUN;
QUIT;  

*Create an overall scatterplot using PROC SGPLOT.
Comment: The regression line reveals a moderate, negative relationship between temperature and incidence of influenza.  
The confidence interval width is narrower for the central values of x (temperature) and becomes wider towards the limits of the data, 
meaning µy is estimated more precisely for values of x in the center, and extrapolating beyond the limits of the data used to create this model would yield higher margins of error.
At lower temperatures, more data points are found outside the confidence interval. Also, four data points (all at low temperatures) were outside the predictive interval. 
There is a weaker correlation between temperature and incidence at lower temperatures.; 
PROC SGPLOT DATA = flu; 
	ReG X = temperature Y = incidence / CLM CLI; 
RUN;
QUIT;  

*Create a grouped scatterplot using PROC SGPLOT with different colors for each region;
PROC SGPLOT DATA = flu; 
	ReG X = temperature Y = incidence/ group=region; 
RUN; 
QUIT; 

*Use PROC REG to fit an overall regression line.
Comment: Since temperature never equals 0, the intercept coefficient of 0.43375 has no intrinsic value. However,
the temperature coefficient of -0.01538 indicates a very weak, negative correlation between incidence of influenza and temperature;
PROC REG DATE = flu; 
	MODEL incidence = temperature; 
RUN; 
QUIT; 

*Create a subset for the NorthWest region; 
DATA fluNW; 
	SET flu; 
	WHERE Region = "NorthWes";
RUN;

*Use PROC REG to fit a regression for the NorthWest region. 
Comment: The relatively weak/moderate R2 value of 0.3740 with an adjusted R2 value of 0.3545 suggests that 37% of the data fit the regression model, 
meaning the model explains 37% variability of the response data around its mean. Note that R2 values of all regional regressions should not be used alone to assess goodness of fit; 
PROC REG DATA = fluNW; 
	MODEL incidence = temperature ; 
RUN; 
QUIT; 

*Create subset for NorthEast Region;
DATA fluNE; 
	SET flu; 
	WHERE Region = "NorthEas";
RUN;

*Use PROC REG to fit a regression for the NorthEast region. 
Comment: The relatively moderate R2 value of 0.5300 with an adjusted R2 value of 0.5154 suggests that 53% of the data fit the regression model, 
meaning the model explains 53% variability of the response data around its mean. The R2 value indicates a better fit for the incidience-temperature model of the NorthEast region than that of the NorthWest region; 
PROC REG DATA = fluNE; 
	MODEL incidence = temperature ; 
RUN; 
QUIT; 

*Create subset for UpperMidwest Region;
DATA fluUM; 
	SET flu; 
	WHERE Region = "UpperMid";
RUN;

*Use PROC REG to fit a regression for the UpperMidwest Region
Comment: The relatively strong/moderate R2 value of 0.8451 and an adjusted R2 value of 0.8413 suggests that 85% of the data fit the regression model, 
meaning the model explains 85% variability of the response data around its mean. The R2 value indicates a better fit for the incidience-temperature model of the UpperMidWest region than that of both the NorthWest and NorthEast regions; 
PROC REG DATA = fluUM; 
	MODEL incidence = temperature ; 
RUN; 
QUIT; 


