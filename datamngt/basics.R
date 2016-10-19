 #Weight of Data
weight=c(50,54,68,85,75,88,68,72,62,85,64,70,56,57,70)
#Mean of the data
mean(weight)
#median of the data
median(weight)
#Variance of the data
var(weight)
#scattter plot
plot(weight)
#Histogram of data
hist(weight)
#line graph of the data
plot(weight,type="l",col="red")
#length of the data
length(weight)
#Range of the data
range(weight)
#min and max
B<-c(min(weight),max(weight));B
#get working directory for R getwd()
#To set the root wotking directoru setwd("The path or url")
#Read data from a csv file 'ds = read.csv("weight.csv",sep=",", header=TRUE)'
#can read the data in a csv format can use View(ds)
#To get variable names use names(ds)
