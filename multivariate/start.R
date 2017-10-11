#Get standard quartiles in In R
qnorm(x)
#Q-Q plot where n=15
i<-c(1:10)
pi<-c((i-0.5)/10);
xi<-c(-1,-0.1,0.16,0.41,0.62,0.8,1.26,1.54,1.71,2.3)
plot(pi,xi)
#Eigen Values
A <- matrix(c(1, 0.63, 0.45, 0.63, 1, 0.35, 0.45, 0.35, 1), 3, 3, byrow=TRUE)
eigen(A)
# Principal Component Analysis
x=matrix(c(1.9751,1.0236,0.9277,-0.0016,-0.0471,0.0321,1.0236,1.9529,1.0437,-0.0691,-0.0667,-0.0288,0.9277,1.0437,1.9566,-0.0202,-0.0732,0.0708,-0.0016,-0.0691,-0.0202,2.0543,0.8053,0.6855,-0.0471,-0.0667,-0.0732,0.8053,1.7096,0.7237,0.0321,-0.0288,0.0708,0.6855,0.7237,1.6819),ncol=6,byrow=T)
str(x)
is.matrix(x)
eigen(x)
fit1=princomp(covmat=x)
summary(fit1,loading=T)
fit2=screeplot(fit1,type='l')
fit2$scores





