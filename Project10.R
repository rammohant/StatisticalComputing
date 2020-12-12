#Tara Ram Mohan 
#V00854777
#Project 10
#October 27 2020

# Part 1 -----------------------------------------------
# a) Generate a matrix “ss” with 1000 rows and 10 columns. The elements of “ss” are random samples from standard normal distribution.

#Create empty matrix
ss <- matrix(nrow = 1000, ncol = 10)

#For loop to fill elements of matrix with random samples from standard normal distribution
for(i in 1:1000) {
  for(j in 1:10) {
    temp <- rnorm(1,0,1)
    ss[i,j] <- temp
  }
}

# b) Run the following lines:
# One sample t-test 
# H0 : µ = 0 
# Ha : µ =/= 0
# Note that p-value changes every time because of rnorm 

  mytest <- function(x) {
    return(t.test(x,mu=0)$p.value)
  }
  mytest(rnorm(100))
  
# c) Conduct one sample t-test 
# H0 : µ = 0 
# Ha : µ =/= 0 for each row of “ss”
  
  mytest <- function(x) {
    return(t.test(x,mu=0)$p.value)
  }
  alltests <- apply(ss, 1, mytest)
  
# d) For the 1000 tests you conducted in c), what is the ratio of rejection for the following signifcance levels

# Function that determines ratio of rejection given an input x that equals the significance level
  rejectratio <- function(x) {
    nreject = 0.0
    for(i in 1:1000) {
      if (alltests[i] < x) {
        nreject = nreject + 1.0
      }
    }
    ratio = nreject/1000.0
    print(ratio)
  }
  
# α = 0.05? rejection ratio = 0.052
  rejectratio(0.05)
  
# α = 0.1? rejection ratio = 0.113
  rejectratio(0.1)
  
# α = 0.01? rejection ratio = 0.01
  rejectratio(0.01)
  
# Part 2  -----------------------------------------------
#a) Load dataset sleep and open the description file.  - 5 points 
data(sleep)

#b) Draw histogram for column “extra”. 
# Shape: Slightly skewed right
hist(sleep$extra, 
     xlab = "Extra", 
     main = "Histogram of Increase in Hours of Sleep")

#c) Define two vectors “x” and “y” as following: 
x<-sleep$extra[1:10]
y<-sleep$extra[11:20]
  
#d) Conduct two-sample t-test to check whether the means of x and y are significantly different. 
# H0: µ1 = µ2
# Ha: µ1 =/= µ2 (or true difference in means is not equal to 0)
# Test statistic = -1.8608 
# P-value =  0.07939  
# Decision rule: Reject if p-value < 0.05
# Conclusion: Fail to reject null hypothesis because p-value = 0.07939 < 0.05, 
# which means that the means of x and y are not significantly different.
t.test(x,y)

#e) Define a vector “z” as following:
z<-x-y
  
#f) Conduct one-sample t-test to check whether the mean of z is significantly different from 0. 
# H0 : µ = 0 
# Ha : µ =/= 0
# Test statistic = -4.0621
# P-value = 0.002833 
# Decision rule: Reject if p-value < 0.05
# Conclusion: Reject null hypothesis because p-value = 0.002833  < 0.05, which means that the mean of z is not significantly different from 0
t.test(z, mu=0)
  
