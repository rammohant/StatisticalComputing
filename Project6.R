#Tara Ram Mohan 
#V00854777
#Project 6 in R
#September 29, 2020

#1.  Build an R data frame that contains all of the data.  
Repoxodin <- c('k','k','k','k','k','k','c','c','c','c','k','k','k','k','k','k','k','c','c','c','c')
Gender <-c('f','f','f','f','f','f','f','f','f','f','m','m','m','m','m','m','m','m','m','m','m')
SubjectNumber <- c('k4f','k14f','k18f','k22f','k26f','k34f','c40f','c49f','c58f','c41f','k63m','k73m','k80m','k85m','k95m','k98m','k99m','c105m','c114m','c119m','c128m')
Time1 <- c(16.5,14.8,15.1,14.2,16.0,13.3,11.8,14.8,15.4,12.2,14.3,11.2,13.0,16.0,14.7,15.3,14.2,16.4,16.2,16.0,13.5)
Time2 <- c(15.3,12.2,12.6,16.4,17.4,15.1,11.1,12.7,11.6,18.0,14.8,15.9,16.9,15.9,16.5,13.8,18.1,11.0,14.4,16.7,14.5)
Time3 <- c(14.3,17.8,12.3,18.3,18.5,15.2,15.8,14.9,13.7,15.8,15.8,19.9,14.9,16.0,12.9,15.2,12.2,15.1,15.8,14.1,11.9)
Time4 <- c(13.8,15.7,13.0,8.7,7.6,7.4,11.0,13.9,7.6,8.9,8.0,6.8,5.8,10.5,9.9,11.3,10.3,12.2,13.8,8.3,12.7)

research.data <- data.frame(Repoxodin,Gender,SubjectNumber,Time1,Time2,Time3,Time4)

#2.  Create two subsets of the data one for Repoxodin or not (using the subsetting logic) (10 points). 
repoxodil.subset <- subset(research.data, Repoxodin == 'k')
control.subset <- subset(research.data, Repoxodin == 'c')

#3.  Create two subsets of the data one for Male and one for Female using the subsetting logic (10 points).  

#Create one subset of the data for Male, 
male.subset <- subset(research.data, Gender == 'm')

#Create one subset of the data for Female.  
female.subset <- subset(research.data, Gender == 'f')

#4.  Find summaries for each of the five datasets (research, repoxodil, control, male, female). 
summary(research.data)
summary(repoxodil.subset)
summary(control.subset)
summary(male.subset)
summary(female.subset)

#5.  Create a new data frame that has the summaries for each of the 5 datasets.

#Add additional column stating name of dataset for each summary 
a1 <- cbind(Data = 'All Data', summary(research.data))
b1 <- cbind(Data = 'Repoxodil subset', summary(repoxodil.subset))
c1 <- cbind(Data = 'Control subset',summary(control.subset))
d1 <- cbind(Data = 'Male subset',summary(male.subset))
e1 <- cbind(Data = 'Female subset',summary(female.subset))

#Combine all summaries into one table
alldata <- rbind(a1,b1,c1,d1,e1)

#Convert table to a dataframe
summaries <- data.frame(alldata)

#6.  Export the data frame containing the summaries into an Excel (.xlsx) format (10 points).
write.csv(summaries, "/Users/tara_rammohan/Downloads/AllSummaries.csv")
