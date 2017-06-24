# Sport players data
#

oring=read.table("http://www.stat.ufl.edu/~winner/data/pgalpga2008.dat",header=F)
attach(oring)
#note: masking T=TRUE

setwd("C://Users//chris//OneDrive//Documentos//GitHub//bayesianStudies//");
fileName = "pgalpga2008.csv";

data_all <- read.csv(fileName,header = TRUE,sep=",");

summary(data_all);
datF <- subset(data_all, FM==1, select=1:2)
summary(datF)

datM <- subset(data_all, FM==2, select=1:2)
summary(datM)

library(ggplot2);
ggplot(datF, aes(x=DrivingDistance, y=FinishedFair)) +
  geom_point(shape=1) +    # Use hollow circles
  geom_smooth();            # Add a loess smoothed fit curve with confidence region

ggplot(datM, aes(x=DrivingDistance, y=FinishedFair)) +
  geom_point(shape=1) +    # Use hollow circles
  geom_smooth();            # Add a loess smoothed fit curve with confidence region

################################################################################3

attach(datF);
datF.lm <- lm(FinishedFair~DrivingDistance);
summary(datF.lm);


# Call:
#   lm(formula = FinishedFair ~ DrivingDistance)
# 
# Residuals:
#   Min       1Q   Median       3Q      Max 
# -23.6777  -2.6583   0.9829   3.6346  10.2339 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)     130.89331   10.92765  11.978  < 2e-16 ***
#   DrivingDistance  -0.25649    0.04424  -5.797 3.66e-08 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 5.246 on 155 degrees of freedom
# Multiple R-squared:  0.1782,	Adjusted R-squared:  0.1729 
# F-statistic: 33.61 on 1 and 155 DF,  p-value: 3.662e-08

