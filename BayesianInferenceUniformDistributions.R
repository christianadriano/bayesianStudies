#Bayesian inference with uniform distributions

##############
# What is the upper end of a 95% equal-tailed credible interval for 
# considering a normal distribution with the follown parameters
mean <- 96.17;
variance <- 0.042;

round(qnorm(p=0.975, mean, sd=sqrt(variance)),2)
#result = 96.57

##############
# Simulating a large number of draws from the prior 
# for and report your approximate prior mean from these draws

#Create a gamma distribution for the prior
#parameters for an inverse gamma distribution
a<-3;
b<-200;

z <- rgamma(n=300, shape=a, rate=b);
x <- 1/z;
round(mean(x),2); 
# 95.79 
#This is the mean value of the draws taken 
#from an inverse gamma distribution

###############
# Simulating a large number of draws from the prior 
# for and report your approximate prior mean from these draws

z <- rgamma(1000, shape=16.5, rate=6022.9);
sig2 <- 1/z;
muB <- rnorm(1000, mean=609.3, sd=sqrt(sig2/27.1));
quantile(x=muB, probs=c(0.025, 0.975));

###############
# Question 10

w <- 0.1;
n <- 30;
a <- 3;
b <- 200;
mu <-622.8;
m<-500;


alpha <- a +n/2;
beta <-200 +(n-1)*403.1/2 + (w*n*(622.8-500)^2)/(2*(w+n))
mprime <- (n*mu + w*m) / (w+n);


z <- rgamma(1000, shape=alpha, rate=beta);
sig2 <- 1/z;
muA <- rnorm(1000, mean=mprime, sd=sqrt(sig2/(w+n)));

quantile(x=mu, probs=c(0.025, 0.975))

sum( muA > muB ) / 1000
