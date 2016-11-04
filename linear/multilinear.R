chem<-read.csv(file.choose(),header=TRUE)
attach(chem)
fit1<-lm(y1~x1+x2+x3)
summary(fit1)
x<-cbind(rep(1,19),x1,x2,x3)
y=t(x)%*%x
I=solve(y);I
B=(solve(t(x)%*%x)%*%(t(x)%*%y1));B
SSE=t(y1)%*%y1-(t(B)%*%t(x)%*%y1)
S2=SSE/15;S2
Cov=5.345*solve(t(x)%*%x);Cov#Covariance of beta note 5.345 is value of S2
fit2<-lm(y1~x1+x2+x3+x1^2+x2^2+x3^2+x1*x2+x1*x3+x2*x3)
summary(fit2)
