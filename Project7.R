#Tara Ram Mohan 
#V00854777
#Project 7 
#October 6, 2020

# A researcher conducting a multi-site study is interested in impulsiveness in individuals who use Cocaine.  
# This study is conducted at five sites across the country.  
if(!require("readxl")) install.packages("readxl")

# 1. Import all the sheets and make one dataset out of them. (15 pts)

#Import each sheet from "C:\TempData" directory 
a1 <- read_excel("C:/TempData/Impulsivity.xlsx",sheet = "Site 1")
a2 <- read_excel("C:/TempData/Impulsivity.xlsx",sheet = "Site 2")
a3 <- read_excel("C:/TempData/Impulsivity.xlsx",sheet = "Site 3")
a4 <- read_excel("C:/TempData/Impulsivity.xlsx",sheet = "Site 4")
a5 <- read_excel("C:/TempData/Impulsivity.xlsx",sheet = "Site 5")

#Add additional column specifying site number of each dataset
b1 <- cbind(Data = 'Site1', a1)
b2 <- cbind(Data = 'Site2', a2)
b3 <- cbind(Data = 'Site3', a3)
b4 <- cbind(Data = 'Site4', a4)
b5 <- cbind(Data = 'Site5', a5)

#Combine all sheets into one table
alldata <- rbind(b1,b2,b3,b4,b5)

#Convert table to a dataframe
data <- data.frame(alldata)

# 7. Create a  pdf document that has all of the plots (10 pts). 
# Open a pdf file
pdf("allplots.pdf") 

# 2. Histograms of Age across treatments. (10 pts)

# Histogram of Age across Treatment C
# Shape:  Slightly skewed left
# Center: 41
# Spread from 20 to 55. Range = 35
# Unusual features, gaps, extreme values: 2 peaks at the 40 to 45 bucket and 50 to 55 bucket 
trtC <- subset(data, TRT=='C')
hist( trtC$Age, 
      main = "Age across Treatment C", 
      xlab = "Age")

# Histogram of Age across Treatment L
# Shape:  Skewed left
# Center: 43
# Spread from 20 to 55. Range = 35
# Unusual features, gaps, extreme values: 3 Peaks at the 25 to 30 bucket, 40 to 45 bucket, and 50 to 55 bucket
trtL <- subset(data, TRT=='L')
hist( trtL$Age, 
      main = "Age across Treatment L", 
      xlab = "Age")

# Histogram of Age across Treatment N
# Shape:  Slightly skewed left
# Center: 39
# Spread from 20 to 55. Range = 35
# Unusual features, gaps, extreme values: 2 slight peaks at the 25 to 30 bucket and the 40 to 45 bucket
trtN <- subset(data, TRT=='N')
hist( trtN$Age, 
      main = "Age across Treatment N", 
      xlab = "Age")

# 3. Histograms of Age for different gender. (10 pts)

# Histogram of Age for Females
# Shape:  Slightly skewed left
# Center: 40
# Spread from 20 to 55. Range = 35
# Unusual features, gaps, extreme values: 2 peaks at the 40 to 45 bucket and 50 to 55 bucket
female <- subset(data, Gender=='F')
hist( trtC$Age, 
      main = "Age across Females", 
      xlab = "Age")

# Histogram of Age for Males
# Shape:  Skewed left
# Center: 43
# Spread from 20 to 55. Range = 35
# Unusual features, gaps, extreme values: Three peaks at the 25 to 35 bucket, 40 to 45 bucket, and 50 to 55 bucket
male <- subset(data, Gender=='M')
hist( trtL$Age, 
      main = "Age across Males", 
      xlab = "Age")

# 4. Box plots of Impulsivity for each visit time (You should have 5 boxplots).  (10 pts) DONE DONE 

# Boxplot for visit time 1 (Imp1)
# Shape: Skewed left (because bottom whisker is longer)
# Center: 72
# Spread: 65 to 79
# Unusual Features: One outlier at 79

# Boxplot for visit time 2 (Imp2)
# Shape: Skewed right (because top whisker is longer)
# Center: 68
# Spread: 59 to 77
# Unusual Features: Two outliers at 77 and 59

# Boxplot for visit time 3 (Imp3)
# Shape: Skewed right (because top whisker is longer)
# Center: 65
# Spread: 56 to 73
# Unusual Features: One outlier at 56

# Boxplot for visit time 4 (Imp4)
# Shape: Symmetric
# Center: 65 
# Spread: 58 to 72
# Unusual Features: No outliers 

# Boxplot for visit time 5 (Imp5)
# Shape: Symmetric
# Center: 60 
# Spread: 53 to 70
# Unusual Features: One outliers at 70

#Time3 and Time4 do not have noticable differences in impulsivity
#There is likely a difference between impulsivity 
#in Time1 and Time2, Time1 and Time3, Time2 and Time3, Time3 and Time5, and Time4 and Time5 

boxplot( data$Imp1, data$Imp2, data$Imp3, data$Imp4, data$Imp5,
         ylab = "Imp",
         names = c("Time1", "Time2", "Time3", "Time4", "Time5"),
         col = c("green", "blue", "red", "purple", "pink"), 
         main = "Boxplot of Impulsivity across Visit Time"
)

# 5. Box plots of Impulsivity across treatments. You have to construct them for each time visits,
# i.e., boxplots of imp1 and different treatments, imp2 and different treatments, etc. (10 pts) DONE DONE

#Turn wide to long 
imp1 <- data[,c(1,2,3,4,5,6,7)]
imp2 <- data[,c(1,2,3,4,5,6,8)]
imp3 <- data[,c(1,2,3,4,5,6,9)]
imp4 <- data[,c(1,2,3,4,5,6,10)]
imp5 <- data[,c(1,2,3,4,5,6,11)]

#Change the names on Imp 
names(imp1)[7] <- "Imp"
names(imp2)[7] <- "Imp"
names(imp3)[7] <- "Imp"
names(imp4)[7] <- "Imp"
names(imp5)[7] <- "Imp"

# Boxplot of Imp1 across treatment C
# Shape: Skewed left (because bottom whisker is longer)
# Center: 72 
# Spread: 66 to 79
# Unusual Features: One outlier at 79

# Boxplot of Imp1 across treatment L
# Shape: Symmetric
# Center: 72 
# Spread: 65 to 78
# Unusual Features: Two outliers at 78 and 65

# Boxplot of Imp1 across treatment N
# Shape: Skewed left (because bottom whisker is longer)
# Center: 73 
# Spread: 67 to 77
# Unusual Features: None 

#All boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
boxplot(imp1$Imp ~ imp1$TRT,
        xlab = "Treatment", 
        ylab = "Imp1", 
        main = "Imp1 across Treatment", 
        col = c("pink", "red", "purple"))

# Boxplot of Imp2 across treatment C
# Shape: Skewed left (because bottom whisker is longer) 
# Center: 68 
# Spread: 61 to 75
# Unusual Features: None

# Boxplot of Imp2 across treatment L
# Shape: Skewed right (because top whisker is longer)
# Center: 68 
# Spread: 63 to 73
# Unusual Features: None

# Boxplot of Imp2 across treatment N
# Shape: Skewed right (because top whisker is longer)
# Center: 68 
# Spread: 59 to 77
# Unusual Features: Two outliers at 59 and 77

#All boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
boxplot(imp2$Imp ~ imp2$TRT,
        xlab = "Treatment", 
        ylab = "Imp2", 
        main = "Imp2 across Treatment", 
        col = c("pink", "red", "purple"))

# Boxplot of Imp3 across treatment C
# Shape: Skewed right (because top whisker is longer)
# Center: 65 
# Spread: 60 to 74
# Unusual Features: None

# Boxplot of Imp3 across treatment L
# Shape: Skewed right (because top whisker is longer)
# Center: 65 
# Spread: 56 to 73
# Unusual Features: One outliers at 56

# Boxplot of Imp3 across treatment N
# Shape: Skewed right (because top whisker is longer)
# Center: 65 
# Spread: 59 to 74
# Unusual Features: None

#All boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
boxplot(imp3$Imp ~ imp3$TRT,
        xlab = "Treatment", 
        ylab = "Imp3", 
        main = "Imp3 across Treatment", 
        col = c("pink", "red", "purple"))

# Boxplot of Imp4 across treatment C
# Shape: Symmetric
# Center: 65
# Spread: 58 to 72
# Unusual Features: None

# Boxplot of Imp4 across treatment L
# Shape: Skewed right (because top whisker is longer)
# Center: 65 
# Spread: 58 to 71
# Unusual Features: None

# Boxplot of Imp4 across treatment N
# Shape: Symmetric
# Center: 65 
# Spread: 59 to 71
# Unusual Features: None

#All boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
boxplot(imp4$Imp ~ imp4$TRT,
        xlab = "Treatment", 
        ylab = "Imp4", 
        main = "Imp4 across Treatment", 
        col = c("pink", "red", "purple"))

# Boxplot of Imp5 across treatment C
# Shape: Symmetric
# Center: 61 
# Spread: 55 to 67
# Unusual Features: One outliers at 67

# Boxplot of Imp5 across treatment L
# Shape: Symmetric
# Center: 60 
# Spread: 53 to 70
# Unusual Features: One outliers at 70

# Boxplot of Imp5 across treatment N
# Shape: Skewed right (because top whisker is longer)
# Center: 60 
# Spread: 53 to 67
# Unusual Features: None

#All boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#Note that Treatment L and N have the same median
boxplot(imp5$Imp ~ imp5$TRT,
        xlab = "Treatment", 
        ylab = "Imp5", 
        main = "Imp5 across Treatment", 
        col = c("pink", "red", "purple"))

# 6. Box plots of Impulsivity across gender. You have to construct them for each time visits, 
# i.e., for imp1 and different gender, imp2 and different gender, etc. (10 pts) DONE DONE 

# Boxplot of Imp1 across Females
# Shape: Symmetric
# Center: 72
# Spread: 66 to 79
# Unusual Features: 5 outliers at 66, 67, 77, 78, and 79

# Boxplot of Imp1 across Males
# Shape: Symmetric
# Center: 72
# Spread: 65 to 79
# Unusual Features: None

#Both boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#Notice that the IQR of Impulsivity 1 is noticably bigger for Males than for Females
#Impulsivity1 across Females also has signifcantly more outliers. 
boxplot(imp1$Imp ~ imp1$Gender,
        xlab = "Gender", 
        ylab = "Imp1", 
        main = "Imp1 across Gender", 
        col = c("pink", "light blue"))

# Boxplot of Imp1 across Females
# Shape: Symmetric
# Center: 68
# Spread: 50 to 76
# Unusual Features: 4 outliers at 59, 61, 75, and 76

# Boxplot of Imp2 across Males
# Shape: Symmetric
# Center: 68
# Spread: 62 to 77
# Unusual Features: 3 outliers at 62, 75, and 77

#Both boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#The IQR of the Female boxplot is equal to that of the Male boxplot
boxplot(imp2$Imp ~ imp2$Gender,
        xlab = "Gender", 
        ylab = "Imp2", 
        main = "Imp2 across Gender", 
        col = c("pink", "light blue"))

# Boxplot of Imp3 across Females
# Shape: Skewed right (because top whisker is longer)
# Center: 65
# Spread: 56 to 74
# Unusual Features: 1 outlier at 56

# Boxplot of Imp1 across Males
# Shape: Skewed right (because top whisker is longer)
# Center: 65
# Spread: 59 to 74
# Unusual Features: None

#Both boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#Both Male and Female have the exact same box plot for Imp3, but there exists one outlier for Female
boxplot(imp3$Imp ~ imp3$Gender,
        xlab = "Gender", 
        ylab = "Imp3", 
        main = "Imp3 across Gender", 
        col = c("pink", "light blue"))

# Boxplot of Imp4 across Females
# Shape: Symmetric
# Center: 65
# Spread: 58 to 72
# Unusual Features: none

# Boxplot of Imp4 across Males
# Shape: Skewed left (because bottom whisker is longer)
# Center: 65
# Spread: 58 to 71
# Unusual Features: None

#Both boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#Both boxplots have the exact same IQR and median, but Female has a longer top whisker 
boxplot(imp4$Imp ~ imp4$Gender,
        xlab = "Gender", 
        ylab = "Imp4", 
        main = "Imp4 across Gender", 
        col = c("pink", "light blue"))

# Boxplot of Imp1 across Females
# Shape: Symmetric
# Center: 60
# Spread: 53 to 70
# Unusual Features: One outlier at 70

# Boxplot of Imp1 across Males
# Shape: Skewed right (because top whisker is longer)
# Center: 60
# Spread: 54 to 67
# Unusual Features: None

#Both boxes and median lines overlap, so we will have to take another step to determine if a difference exists between the treatment groups.
#Both boxplots have the exact same IQR and median, but Female has a longer bottom whisker and an outlier 
boxplot(imp5$Imp ~ imp5$Gender,
        xlab = "Gender", 
        ylab = "Imp5", 
        main = "Imp5 across Gender", 
        col = c("pink", "light blue"))

# Close the pdf file
dev.off() 

