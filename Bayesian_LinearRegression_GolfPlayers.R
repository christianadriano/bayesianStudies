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
