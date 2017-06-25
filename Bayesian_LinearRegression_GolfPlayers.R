#####################################################
# Linear regression Analysis of golf players data
#####################################################

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

attach(datF.frame);
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

####################
#Computeing the Posterior Predictive Mean Estimate for the FinishedFair Accuracy
accuracy<- coef(datF.lm)[1] + coef(datF.lm)[2]*260
round(accuracy,2)
####################
upperInterval <- -0.25649 + 0.04424*qt(.975,21)
lowerInterval <- -0.25649 - 0.04424*qt(.975,21)
#####################

datF.frame<-data.frame(datF)

newData = data.frame(DrivingDistance=260)

#Prediction interval
predict(datF.lm,newData,interval="predict")
#       fit      lwr      upr
#   1 64.20573 53.74528 74.66619
#####################################################
attach(data_all);
data_all.lm <- lm(FinishedFair~DrivingDistance);
summary(data_all.lm);

# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)     102.80154    3.31858   30.98   <2e-16 ***
#   DrivingDistance  -0.13937    0.01227  -11.36   <2e-16 ***
#   ---
#   Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
# 
# Residual standard error: 5.118 on 352 degrees of freedom
# Multiple R-squared:  0.2682,	Adjusted R-squared:  0.2661 
# F-statistic:   129 on 1 and 352 DF,  p-value: < 2.2e-16

##############################################
# Investigating Model Fit by Plotting the Residuals

plot(fitted(data_all.lm), residuals(data_all.lm))
