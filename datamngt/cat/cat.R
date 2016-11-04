library(plyr)
install.packages("plyr")
library(plyr)
x<-c(1,2,3,4,5,6,7,8,9,10)
x = 1:10;x
y = sample(c("m","f"),10, replace= TRUE);y
z= rnorm(10)
z

data<-data.frame(x,y,z)
data
str(data)
colnames(data)<-c("id","gender","height")
data
data2<-mutate(data,x1=x^2,y1=y,z1=((z+10)/2))

data1<-subset(airquality, Temp > 80, select = c(Ozone, Temp))
