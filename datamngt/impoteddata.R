datax<-read.csv("data/nels.csv",sep=",",header=TRUE)
head(datax)
tail(datax)
gender<-c(rep("M",15),rep("F",14))
location<-c(rep("nairobi",10),rep("kisumu",19))
datax<-cbind(datax,gender,location)
str(datax) #types of variables forming columns of the data
dim(datax) #number of rows and columns
View(datax)#view data as a spreadsheet
colnames(datax)<-c("age","height","weight","income","gender","location") #attach new title
View(datax)
write.table(datax,file="data/dataxx.csv",sep=",") #write datax
dataxx<-read.csv("dataxx.csv",sep=",",header=TRUE)
attach(dataxx)
mean(age)
tapply(age,location,mean) # checks the mean age in the specific location

 #indexing
datax[,-1] #omit first column
datax[2:5,-1] #show rows 2 to 3 and omit column one
datax[2:5] #show column 2 to 5
#Generate new Variables
y<-runif(dim(datax)[1]) #random from uniform distribution with length of rows
logy<-log10(y)#log to base 10
ln<-log(y, base = exp(1))#natural log

#Get data ie num to be factor
age<-rep(c(1,2),10);age
age<-as.factor(age)
