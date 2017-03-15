
theta=seq(from=0,to=1,by=.01)
plot(theta,dbeta(theta,1,5),type="l")

# find the posterior probability that ??<0.5 
#if we observe the sequence (T,T,T,T). Round your answer to two decimal places.
pbeta(.5,1,5)


# equal-tailed 95% credible interval
qbeta(0.025,8,16)
qbeta(0.975,8,16)

#find the posterior probability that ??>0.90 
qbeta(0.90,8,16)
#[1] 0.4585561, which is larger than 0.35

qbeta(0.95,8,16)
#-----------------------------------------------
#Plotting gamma distribution for Poisson exercises

gam=seq(from=0,to=20,by=1)

plot(gam,dgamma(gam,67,6),type="l")
lines(gam,dgamma(gam,8,1),lty=2)
lines(gam,dgamma(gam,67,6),lty=3)

# equal-tailed 90% credible interval
qgamma(0.05,67,6)
qgamma(0.95,67,6)

