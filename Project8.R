#Tara Ram Mohan 
#V00854777
#Project 8
#October 13, 2020

# 1. Import all the sheets and make one dataset out of them. (15 pts)

#Import .csv from "C:\TempData" directory 
storesales <- read.csv("C:/TempData/StoreSales.csv", header=TRUE)

#Correct input data error for Store ME0003
storesales[56,2] <- 4

#1. Create a scatterplot of revenue versus month with correct titles for the plot. 

#Comment on your plot. What do you observe? (30 pts)
# From January to November, there appears to be no strong correlation for Revenue V. Month. 
# However, we see a drastic jump in sales for December 
# Additionally, there is one store (NM0034) that continuously garners more revenue than the rest
plot(storesales$Month,storesales$Revenue, 
     xlab = "Month",
     ylab = "Revenue (dollars)",
     main = "Store Sales \n Revenue VS. Month", 
     col = "blue"
)

#2. Create a wide dataset with each row corresponding to a store and the remaining columns are the monthly revenue values. (30 pts)

#Create a subset of the data for each month
s1 <- storesales[ storesales$Month== 1, c(1,3) ]
s2 <- storesales[ storesales$Month== 2, c(1,3) ]
s3 <- storesales[ storesales$Month== 3, c(1,3) ]
s4 <- storesales[ storesales$Month== 4, c(1,3) ]
s5 <- storesales[ storesales$Month== 5, c(1,3) ]
s6 <- storesales[ storesales$Month== 6, c(1,3) ]
s7 <- storesales[ storesales$Month== 7, c(1,3) ]
s8 <- storesales[ storesales$Month== 8, c(1,3) ]
s9 <- storesales[ storesales$Month== 9, c(1,3) ]
s10 <- storesales[ storesales$Month== 10, c(1,3) ]
s11 <- storesales[ storesales$Month== 11, c(1,3) ]
s12 <- storesales[ storesales$Month== 12, c(1,3) ]

#Change name of revenue column to reflect month
names( s1 )[2] <- "January Revenue"
names( s2 )[2] <- "February Revenue"
names( s3 )[2] <- "March Revenue"
names( s4 )[2] <- "April Revenue"
names( s5 )[2] <- "May Revenue"
names( s6 )[2] <- "June Revenue"
names( s7 )[2] <- "July Revenue"
names( s8 )[2] <- "August Revenue"
names( s9 )[2] <- "September Revenue"
names( s10 )[2] <- "October Revenue"
names( s11 )[2] <- "November Revenue"
names( s12 )[2] <- "December Revenue"

#Merge the data (via outer join) with Store as the matching key
#Note that for store ME0003, there are two values for May Revenue values and no April Revenue values
sales1 <- merge(s1,s2, by = "Store", all = TRUE) 
sales2 <- merge(sales1,s3, by = "Store", all = TRUE) 
sales3 <- merge(sales2,s4, by = "Store", all = TRUE) 
sales4 <- merge(sales3,s5, by = "Store", all = TRUE) 
sales5 <- merge(sales4,s6, by = "Store", all = TRUE) 
sales6 <- merge(sales5,s7, by = "Store", all = TRUE) 
sales7 <- merge(sales6,s8, by = "Store", all = TRUE) 
sales8 <- merge(sales7,s9, by = "Store", all = TRUE) 
sales9 <- merge(sales8,s10, by = "Store", all = TRUE) 
sales10 <- merge(sales9,s11, by = "Store", all = TRUE) 
SalesByStore <- merge(sales10,s12, by = "Store", all = TRUE) 

#4. Create a summary of revenues for each store.

#Create a subset of the StoreSales data for each store
r1 <- storesales[ storesales$Store== "NM0034", c(2,3) ]
r2 <- storesales[ storesales$Store == "NE0041", c(2,3) ]
r3 <- storesales[ storesales$Store == "SC0345", c(2,3) ]
r4 <- storesales[ storesales$Store == "NM0331", c(2,3) ]
r5 <- storesales[ storesales$Store == "SC0001", c(2,3) ]
r6 <- storesales[ storesales$Store == "SC0041", c(2,3) ]
r7 <- storesales[ storesales$Store == "NC0041", c(2,3) ]
r8 <- storesales[ storesales$Store == "VA0031", c(2,3) ]
r9 <- storesales[ storesales$Store == "RI0031", c(2,3) ]
r10 <- storesales[ storesales$Store == "MA0041", c(2,3) ]
r11 <- storesales[ storesales$Store == "NM0004", c(2,3) ]
r12 <- storesales[ storesales$Store == "NM0003", c(2,3) ]
r13 <- storesales[ storesales$Store == "MA0044", c(2,3) ]
r14 <- storesales[ storesales$Store == "ME0003", c(2,3) ]

# Summary for Store NM0034 ----------------------------
# Min.   :1541626  
# 1st Qu.:1633940  
# Median :1670653  
# Mean   :1758293  
# 3rd Qu.:1766750  
# Max.   :2705792 
summary(r1$Revenue)

#IQR: 132810.2
IQR(r1$Revenue)

#Standard Deviation: 307288.4
sd(r1$Revenue)

# Summary for Store NE0041 ----------------------------
# Min.   :1549432  
# 1st Qu.:1680505  
# Median :1706902  
# 3rd Qu.:1765550  
# Max.   :2412215 
summary(r2$Revenue)

#IQR: 85045.07
IQR(r2$Revenue)

#Standard Deviation: 217042.9
sd(r2$Revenue)

# Summary for Store SC0345 ----------------------------
# Min.   :1458647  
# 1st Qu.:1580413  
# Median :1641650  
# Mean   :1684606  
# 3rd Qu.:1688573  
# Max.   :2415358 
summary(r3$Revenue)

#IQR: 108160.2
IQR(r3$Revenue)

#Standard Deviation: 245318.9
sd(r3$Revenue)

# Summary for Store NM0331 ----------------------------
# Min.   :1940277  
# 1st Qu.:2031838  
# Median :2112982  
# Mean   :2161466  
# 3rd Qu.:2185176  
#  Max.   :2826570  
summary(r4$Revenue)

#IQR: 153338.3
IQR(r4$Revenue)

#Standard Deviation: 229514.1
sd(r4$Revenue)

# Summary for Store SC0001 ----------------------------
# Min.   :1605479  
# 1st Qu.:1663882  
# Median :1699951  
# Mean   :1755348  
# 3rd Qu.:1768147  
# Max.   :2341589 
summary(r5$Revenue)

#IQR: 104264.4
IQR(r5$Revenue)

#Standard Deviation: 197305.3
sd(r5$Revenue)

# Summary for Store SC0041 ----------------------------
# Min.   :1595935  
# 1st Qu.:1614426  
# Median :1674327  
# Mean   :1739878  
# 3rd Qu.:1765870  
# Max.   :2404866
summary(r6$Revenue)

#IQR: 151444.3
IQR(r6$Revenue)

#Standard Deviation: 221901.7
sd(r6$Revenue)

# Summary for Store NC0041 ----------------------------
# Min.   :1538688  
# 1st Qu.:1590793  
# Median :1634213  
# Mean   :1726232  
# 3rd Qu.:1733783  
# Max.   :2452462  
summary(r7$Revenue)

#IQR: 142989.5
IQR(r7$Revenue)

#Standard Deviation: 249654.9
sd(r7$Revenue)

# Summary for Store VA0031 ----------------------------
# Min.   :1470841  
# 1st Qu.:1577802  
# Median :1677447  
# Mean   :1705482  
# 3rd Qu.:1737004  
# Max.   :2378423
summary(r8$Revenue)

#IQR: 159201.6
IQR(r8$Revenue)

#Standard Deviation: 241826.6
sd(r8$Revenue)

# Summary for Store RI0031 ----------------------------
# Min.   :1515876  
# 1st Qu.:1574373  
# Median :1654064  
# Mean   :1698196  
# 3rd Qu.:1667253  
# Max.   :2458570  
summary(r9$Revenue)

#IQR: 92880.15
IQR(r9$Revenue)

#Standard Deviation: 252218.8
sd(r9$Revenue)

# Summary for Store MA0041 ----------------------------
# Min.   :1596073  
# 1st Qu.:1646386  
# Median :1687540  
# Mean   :1773216  
# 3rd Qu.:1752071  
# Max.   :2676496 
summary(r10$Revenue)

#IQR: 105684.8
IQR(r10$Revenue)

#Standard Deviation: 292648.4
sd(r10$Revenue)

# Summary for Store NM0004 ----------------------------
# Min.   :1542016  
# 1st Qu.:1640866  
# Median :1669338  
# Mean   :1731194  
# 3rd Qu.:1701121  
# Max.   :2507212  
summary(r11$Revenue)

#IQR: 60255.12
IQR(r11$Revenue)

#Standard Deviation: 251985.8
sd(r11$Revenue)

# Summary for Store NM0003 ----------------------------
# Min.   :1491877  
# 1st Qu.:1616153  
# Median :1679170  
# Mean   :1734061  
# 3rd Qu.:1728049  
# Max.   :2560826 
summary(r12$Revenue)

#IQR: 111896.4
IQR(r12$Revenue)

#Standard Deviation: 272780.7
sd(r12$Revenue)

# Summary for Store MA0044 ----------------------------
# Min.   :1556242  
# 1st Qu.:1686696  
# Median :1738690  
# Mean   :1791352  
# 3rd Qu.:1787414  
# Max.   :2608373  
summary(r13$Revenue)

#IQR: 100717.7
IQR(r13$Revenue)

#Standard Deviation: 271824.1
sd(r13$Revenue)

# Summary for Store ME0003 ----------------------------
# Min.   :1468064  
# 1st Qu.:1608150  
# Median :1637824  
# Mean   :1720529  
# 3rd Qu.:1733007  
# Max.   :2468168  
summary(r14$Revenue)

#IQR: 124856.3
IQR(r14$Revenue)

#Standard Deviation: 255887.4
sd(r14$Revenue)
