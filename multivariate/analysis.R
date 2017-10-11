datax<-read.table("LDA.dat",header=TRUE)
S=round(cov(datax),2)
factanal(datax,factor=1,method='mle')
factanal(datax,factor=2,method='mle')
factanal(covmat=S,factor=2,method='mle')
fit1<-factanal(datax,factors=2,method='mle',n.obs=500,scores="regression",rotation="varimax")
fit1$scores
pairs(fit1$scores)
