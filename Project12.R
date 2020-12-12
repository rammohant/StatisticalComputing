# Tara Ram Mohan 
# V00854777
# Project 12
# November 12 2020

pdf("AllPlots.pdf")

#Download ggplot library 
library(ggplot2)

#Import .csv from directory 
crime.data <- read.csv("/Users/tara_rammohan/RStudio/Project 12/BPD_Part_1_Victim_Based_Crime_Data(2) (1).csv", header=TRUE)
crime.data$CrimeDate <- as.Date(crime.data$CrimeDate, format="%m/%d/%Y")

#1. Create Barplot of SHOOTINGS by month. ------------------------------------------ 

#Create a subset of original dataset for shootings only 
shootings <- crime.data[crime.data$Description=="SHOOTING", ]

#Create column of corresponding months from CrimeDate
Month <- months(as.Date(shootings$CrimeDate, "%m/%d/%Y"))

#Add month column to shootings subset
ShootingsByMonth <- cbind(shootings,Month)

#Create table of shootings
table1 <- table(ShootingsByMonth$Month)

#Make barplot 
names(table1) <- c("Apr"
                   ,"Aug"
                   ,"Dec"
                   ,"Feb"
                   ,"Jan"
                   ,"Jul"
                   ,"Jun"
                   ,"Mar"
                   ,"May"
                   ,"Nov"
                   ,"Oct"
                   ,"Sep")
barplot(table1, 
        main = "Shootings by Month", 
        ylab = "Count", 
        xlab = "Month", 
        col = "lightblue", 
        ylim = c(0,500))

# August has the most shootings and February has the least shootings 

# 2. Create a Barplot of the Top 10 neighborhoods for LARCENY. ------------------------------------------  
# Sort the Barplot from greatest to least. (20 pts)

#Create a subset of original dataset for larceny only 
larceny <- crime.data[crime.data$Description=="LARCENY", ]

# Create and sort table of shootings by decreasing count
# Note that count > 850 for top 10 neighboorhoods 
summary(larceny$Neighborhood)

larceny.top <- Filter(function(x) x > 850 && x!=1939 , with(larceny, table(larceny$Neighborhood)))
names(larceny.top) <- c('Belair-\nEdison','Canton','Canton\nIndustry','Charles\nVlg','Downtown','Fells\nPt','Frankford','Inner\nHbr','Mondawmin','Wash\nVlg')
larceny.df <- data.frame(larceny.top)

colnames(means) <- c("Neighborhood","Count")
ggplot(larceny.df, aes(x = reorder(Var1, -Freq), y = Freq),fill = variable) +
  geom_bar(stat = "identity") + 
  labs(title= "Top 10 Neighborhoods for Larceny",x="Neighborhood",y="Count")

#3. Create a Barplot of AUTO THEFT versus hour of the day ------------------------------------------ 

#Create a subset of original dataset for AUTO THEFT only 
autotheft <- crime.data[crime.data$Description=="AUTO THEFT", ]

#Create column of corresponding hours from CrimeDate
Hours <- format(strptime(autotheft$CrimeTime,"%H:%M:%S"),'%H')

#Add month column to shootings subset
AutotheftByHour <- cbind(autotheft,Hours)

#Create table of shootings
table3 <- table(AutotheftByHour$Hours)

#Make barplot
barplot(table3, 
        main = "Autotheft by Hour of the Day", 
        ylab = "Count", 
        xlab = "Hour of the Day", 
        ylim = c(0,2000)
)

# Hour 22 (10 PM) has the MOST number of auto thefts while hour 4 (4 AM) has the LEAST number of autothefts

#4. Create a Barplot of the mean AUTO THEFT by day of the Week. ------------------------------------------ 
#Which days of the week have the most and least mean auto thefts? (20 pts)

#Create a subset of original dataset for AUTO THEFT only 
Autotheft <- crime.data[crime.data$Description=="AUTO THEFT", ]
Autotheft$CrimeDate <- as.Date(autotheft$CrimeDate, format="%m/%d/%Y")

#Create table with total autotheft by CrimeDate and convert to dataframe
Autotheft.Freq <- as.data.frame(table(Autotheft$CrimeDate))

#Create table with Weekday from CrimeDate
Weekdays <- as.numeric(format(as.Date(Autotheft.Freq$Var1),"%u"))
Autotheft.FreqByWeekday <- cbind(Autotheft.Freq,Weekdays)

#Determine mean number of autothefts by weekday  
means <- aggregate(Autotheft.FreqByWeekday[, 2], list(Autotheft.FreqByWeekday$Weekdays), mean)
colnames(means) <- c("Weekday","Mean")
means$Weekday <- c("Mon","Tues","Wed","Thurs","Fri","Sat","Sun")

#Plot barplot 
ggplot(means, aes(x=Weekday, y=Mean)) + 
  geom_bar(stat = "identity") + ylim(0,12) +
  labs(title= "Mean Number of Autothefts by Day of the Week",x="Day of the Week",y="Count")

#Friday has the largest mean and Thursday has the smallest mean

#5. Create a timeplot of the number of autothefts by year.------------------------------------------ 

#Create a subset of original dataset for AUTO THEFT only 
autotheft <- crime.data[crime.data$Description=="AUTO THEFT", ]

#Create row of Crime Year retrieved from CrimeDate
date <- as.Date(autotheft$CrimeDate, format="%d/%m/%Y")
year <- as.numeric(format(date,'%Y'))

#Combine Year row and create new dataframe
Autotheft.ByYear <- cbind(autotheft,year)

#Create table with total autotheft for each year and convert to dataframe
table.year <- table(Autotheft.ByYear$year)
df.year <- as.data.frame(table.year)
names(df.year) <- c("Year", "Count")

#Update Year column from type factor-level to num 
df.year$Year <- c(2014,2015,2016,2017,2018,2019,2020)

#Plot scatterplot
plot(df.year$Count ~ df.year$Year,
     type="b",
     xlab = "Year",
     ylab = "Number of Autothefts",
     main = "Number of Autothefts by Year", 
)

#Does there seem to be a trend? 
#Yes, number of autothefts seems to increase from 2014 to 2017 and then decrease from 2017 to 2020.

#If so, run a regression and see if the trend is statistically significant. 
reg<-lm(df.year$Count ~ df.year$Year)
summary(reg)

# P-value = 0.1715 > 0.05, therefore, the trend is not statistically significant 
# Y-intercept: 344026.6
# Slope = -169.9 would indicate that as the year increased, the number of autothefts decreased, 
# but we know that the trend isn't statisically significant and thus, we cannot make this claim 

dev.off()


