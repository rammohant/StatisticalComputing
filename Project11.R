# Tara Ram Mohan 
# V00854777
# Project 11
# November 5 2020

# Part 1  -------------------------------------------------------------------
# (a) Run the following lines:
# Note: the samples in “x” are contaminated.
  
  n<-30
  
  x<-matrix(rnorm(n*1000),1000,n)
  
  x[,1:3]<-x[,1:3]*10
  
  y<-1+matrix(rnorm(n*1000),1000,n)
  
#b) Conduct 1000 two-sample two-sided t-tests for the associated rows of “x”and “y”. 

# Function that loops through x and y matrixes, runs t-tests, and determines whether it was rejected or failed to reject
  nreject = 0.0
  for (i in 1:1000) {
   temp <- t.test(x[i,],y[i,],mu =)$p.value
   if (temp < 0.05)
     nreject = nreject +1
  }
  
# Output total number of rejections of the 1000 tests: 
# 453 total rejections
print(nreject)

# Part 2 -------------------------------------------------------------------
# Write a code to find all values of x for which the functions below are zero. 
# a) Function 1: f(x)=2ex2 −1   
  
# Write the function 1
eqn1 = function(x1){
  y1 <- 2*exp(x1^2)-1
  return(y1)
}

# x-values of function 1 
x1<- seq(-1,1,by=0.01)

# Plot function 1 
curve(eqn1, from=-1, to=1)

# Derivative of function 1
eqn1p = function(x1){
  y1 <- 4*(x1)*exp(x1^2)
  return(y1)
}

# Newton's method for function 1
eqn1d0 <- function(xguess1) {
  x1 <- xguess1 - eqn1(xguess1)/eqn1p(xguess1)
  return(x1)
}

# Graph is closest to x axis around 0, so guess = 0.0001
# Note that you get an error because Newton's method cannot find a root, 
# therefore, this function has no root
xguess <- 0.0001
xzero <- 1
count <- 0
error <- 1 
xlast <- 0
while(error > 0.0001) {
  xguess <- eqn1d0(xguess)
  error <- (xzero - xguess)^2
  xzero <- xguess
  count <- count + 1
}  
count
error
xguess

# b) Function 2: f(x) = x2 − 251/187x + 82/187 

# Write the function 2
eqn2 = function(x2){
  y2 <- (x2^2)-((251/187)*x2)+(82/187)
  return(y2)
}

# x-values of function 2
x2<- seq(-2,2,by=0.01)

# Plot function 2
curve(eqn2, from=-2, to=3)

# Derivative of function 2
eqn2p = function(x2){
  y2 <- (2*x2)-(251/187)
  return(y2)
}

# Newton's method for function 2
eqn2d0 <- function(xguess2) {
  x2 <- xguess2 - eqn2(xguess2)/eqn2p(xguess2)
  return(x2)
}

# guess = 0.5 (based on graphing curve)
# root = 0.562019
# 3 total iterations
xguess1 <- 0.5
xzero1 <- 1
count1 <- 0
error1 <- 1
xlast1 <- 0
while(error1 > .0001) {
  xguess1 <- eqn2d0(xguess1)
  error1 <- (xzero1 - xguess1)^2
  xzero1 <- xguess1
  count1 <- count1 + 1
}
count1
error1
xguess1

# guess = 0.7 (based on graph)
# root = 0.7802629
# 4 total iterations 
xguess2 <- 0.7
xzero2 <- 1
count2 <- 0
error2 <- 1
xlast2 <- 0
while(error2 > .0001) {
  xguess2 <- eqn2d0(xguess2)
  error2 <- (xzero2 - xguess2)^2
  xzero2 <- xguess2
  count2 <- count2 + 1
}
count2
error2
xguess2





