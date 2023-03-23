# title: Quiz 3
# author: Amber 
# date: Sep 10, 2021


# Simulations
## Problem 1: Draw 100 simulated values from Bernoulli (p = 0.2). 
bernoulli = rbinom(100,size = 1, prob =0.2)
print(bernoulli)
## What is the proportion of "successes" in your simulated batch?
print(paste('sum=',sum(bernoulli)))
print(paste('Proportion of successes:',sum(bernoulli)/100))


## Problem 2. 
## Draw 1000 simulated values from Binomial(n=100, p=0.2). 
## Plot the histogram of your simulated values.
binomial = rbinom(1000,size = 100, prob = 0.2)
print(binomial)
hist(binomial,breaks = seq(-0.5,100.5,1),
     main="Histogram of my simulated values",
     xlab="Values",
     ylab="Counts")


## Problem 3. **(8 points)** 
# Consider the following two-step experiment. 
# First you draw a simulated value from a Bernoulli(p=1/3). 
# If the drawn value from the Bernoulli equals 0, then you draw a simulated value from Binomial(n=50,p=0.5). 
# On the other hand, if the drawn value from the Bernoulli equals $1$, then you draw a simulated value from 
# Binomial(100,0.5). 

# You should repeat the above two-step experiment $1000$ times and draw the histogram of the simulated values. 

nsim<-1000
simulations <-c()
for (i in 1:nsim){
  bernoulli = rbinom(1,size = 1, prob = 1/3)
  #print(bernoulli)
  if (bernoulli == 0 ) {
    binomial = rbinom(1,size = 50, prob = 0.5)
    #print(paste("binomial",binomial))
    }else{
    #if (bernoulli == 1){
    binomial = rbinom(1,size = 100, prob = 0.5)
    #print(paste("binomial",binomial))
    }
  simulations<-c(simulations,binomial)
  # print(simulations)
}

hist(simulations, breaks = seq(-0.5,100,1)) 


















