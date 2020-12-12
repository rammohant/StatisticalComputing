#Tara Ram Mohan 
#V00854777
#Project 9
#Tuesday October 20 2020

#(a) X ∼ N (0, 1) using rnorm function.  (15 pts)
set.seed(910)
normal <- rnorm(1000,0,1)

# 1 Shape: Symmetric
# 2 Center: 0
# 3 Spread from -4 to 4. Range = 8
# 4 Unusual features, gaps, extreme values: None
hist(normal, 
     xlab = "x", 
     main = "Histogram of Normal Distribution \n N(0,1)")
points(normal, rep(0,length(normal)))

#(b) X ∼ Gamma(2, 3) using the rgamma function. (15 pts)
set.seed(910)
gamma <- rgamma(1000,2, 3)

# 1 Shape: Very skewed right
# 2 Center: 0.6
# 3 Spread from 0 to 3. Range = 3
# 4 Unusual features (gaps, extreme values): Two extreme values at 2.9 and 2.97
hist(gamma, 
     xlab = "x", 
     main = "Histogram of Gamma Distribution \n Gamma(2,3)")
points(gamma, rep(0,length(gamma)))

#(c) X+Y where X ∼ N(5,2) and Y ∼ χ2(15).  (15 pts) 
set.seed(910)
x <- rnorm(1000,5,2)
y <- rchisq(1000,15)
funct <- x + y
  
# 1 Shape: Skewed right
# 2 Center: 20
# 3 Spread from 5 to 45. Range = 40
# 4 Unusual features (gaps, extreme values): None
hist(funct, 
     xlab = "x", 
     main = "Histogram of X+Y Function \n X=N(5,2) and Y=χ2(15)")
points(funct, rep(0,length(funct)))

#(d) X ∼ Binomial(1, 0.3).  (15 pts)
set.seed(6)
binom <- rbinom(1000,1, 0.3)

# 1 Shape: Bimodal
# 2 Center: 0.3
# 3 Spread from 0 to 1. Range = 1
# 4 Unusual features (gaps, extreme values): No extreme values
hist(binom, 
     xlab = "x", 
     main = "Histogram of Binomial Distribution \n Binomial(1, 0.3)")
points(binom, rep(0,length(binom)))

#(e) 

# n=2 ----------------------------------------
n2 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(2,1, 0.4)
  n2[i] <- mean(temp)
}

# 1 Shape: Slightly skewed right
# 2 Center: 0.4
# 3 Spread from 0 to 1. Range = 1
# 4 Unusual features (gaps, extreme values): 2 gaps from 0.1 to 0.4 and 0.5 to 0.9
hist(n2, 
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(2,1, 0.4)")

# n=5 ----------------------------------------
n5 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(5,1, 0.4)
  n5[i] <- mean(temp)
}

# 1 Shape: Slightly right skewed
# 2 Center: 0.4
# 3 Spread from 0 to 1. Range = 1
# 4 Unusual features (gaps, extreme values): 4 gaps in the 0.2-0.3, 0.4-0.5, 0.6-0.7, and 0.8-0.9 buckets
hist(n5, 
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(5,1, 0.4)")

# n=10 ----------------------------------------
n10 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(10,1, 0.4)
  n10[i] <- mean(temp)
}

# 1 Shape: Slightly skewed right
# 2 Center: 0.4
# 3 Spread from 0 to 0.9. Range = 0.9
# 4 Unusual features (gaps, extreme values): One peak from the 0.3 to 0.4 bucket
hist(n10, 
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(10,1, 0.4)")

# n=20 ----------------------------------------
n20 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(20,1, 0.4)
  n20[i] <- mean(temp)
}

# 1 Shape: Slightly skewed right
# 2 Center: 0.4
# 3 Spread from 0.1 to 0.75. Range = 0.65
# 4 Unusual features (gaps, extreme values): One peak from the 0.35 to 0.4 bucket
hist(n20, 
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(20,1, 0.4)")

# n=50 ----------------------------------------
n50 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(50,1, 0.4)
  n50[i] <- mean(temp)
}

# 1 Shape: Slightly skewed right
# 2 Center: 0.4
# 3 Spread from 0.2 to 0.6. Range = 0.4
# 4 Unusual features (gaps, extreme values): 1 peak in the 0.35 to 0.45 bucket
hist(n50,
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(50,1, 0.4)")

# n=100 ----------------------------------------
n100 <- rep(0, 1000)
for(i in 1:1000){
  temp <- rbinom(100,1, 0.4)
  n100[i] <- mean(temp)s
}

# 1 Shape: Slightly skewed right
# 2 Center: 0.4
# 3 Spread from 0.25 to 0.6. Range = 0.35
# 4 Unusual features (gaps, extreme values): 1 peak in the 0.35 to 0.4 bucket 
hist(n100, 
     xlim = c(0,1),
     xlab = "x", 
     main = "Histogram of Mean of Binom Distributions \n Rbinom(100,1, 0.4)")

# e) Conclusion: As n increases, the range decreases, the bin size decreases, and there are fewer gaps.

nreject1 = 0.0
for(i in 1:1000) {
  if (alltests[i] < 0.05) {
    nreject1 = nreject1 + 1.0
  }
}
ratio1 = nreject1/1000.0

nreject2 = 0
for(i in 1:1000) {
  if (alltests[i] < 0.1) {
    nreject2 = nreject2 + 1
  }
}
ratio2 = nreject2/1000

nreject3 = 0
for(i in 1:1000) {
  if (alltests[i] < 0.01) {
    nreject3 = nreject3 + 1
  }
}
ratio3 = nreject3/1000
