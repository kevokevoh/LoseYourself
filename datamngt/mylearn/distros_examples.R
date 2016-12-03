x = seq(from=-4, to=4.2, length=100)
normval = dnorm(x, 0, 1)
dfval = 1
tval = dt(x, df=dfval)
plot(x, normval, type="n", ylab="f(x)", las=1)
lines(x, normval, lty=1, lwd=2)
lines(x, tval, lty=2, lwd=2)
legend(1.1, .395, lty=1:2, lwd=2,
legend=c(expression(N(mu == 0,sigma == 1)),
paste("t with ", dfval," df", sep="")))


library(mosaic)
xpnorm(1.96, mean=0, sd=1)
