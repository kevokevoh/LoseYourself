rm(list=ls());
gc();
dev.off();
par(oma=c(1,10,2,1),mar=c(2,3,1,0),mfrow=c(4,1))

x1 = read.csv("2015.csv",header=T)
x1t = table(x1$VICTIM);
ordx1 = order(x1t,decreasing=T);
x2t=x1t[ordx1]
x3t=x2t[1:10]
barplot(x3t,horiz=T,las=1,col=rainbow(10))


rm(list=ls());
x1 = read.csv("2016.csv",header=T)
x1t = table(x1$VICTIM);
ordx1 = order(x1t,decreasing=T);
x2t=x1t[ordx1]
x3t=x2t[1:10]
barplot(x3t,horiz=T,las=1,col=rainbow(10))

rm(list=ls());
x1 = read.csv("2017.csv",header=T)
x1t = table(x1$VICTIM);
ordx1 = order(x1t,decreasing=T);
x2t=x1t[ordx1]
x3t=x2t[1:10]
barplot(x3t,horiz=T,las=1,col=rainbow(10))

rm(list=ls());
x1 = read.csv("2018.csv",header=T)
x1t = table(x1$VICTIM);
ordx1 = order(x1t,decreasing=T);
x2t=x1t[ordx1]
x3t=x2t[1:10]
barplot(x3t,horiz=T,las=1,col=rainbow(10))

