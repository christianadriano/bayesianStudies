## Computing intervals for the Gamma distribution

 

shape<-9;
rate<-390;
scale<-1/rate;
density <-pgamma(0.95, shape, rate,lower.tail=TRUE);#scale); 
round(0.025*density,2);

qgamma(0.975,shape,rate);



#[1] 3.429152e-24
 
x<-6;
p6<- pgamma(x, shape, scale); 
#[1] 1.312212e-22
gap = 0.025*(p6-p4);
gap
#[1] 0.02113

##Plotting
install.packages("distr")
library(distr)

A <- Exp(rate)
B <- Gammad(shape, scale)

conv <- 0.5*(A+B)

plot(conv)
plot(conv, to.draw.arg=1)
#########################333

> p<-dgamma(y,shape,scale)
> plot(y,p)
