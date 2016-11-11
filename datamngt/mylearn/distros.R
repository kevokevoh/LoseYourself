library(mosaic)
y = xpnorm(1.96, mean=0, sd=1);y #get graphical pdf (probability that the random variable is less than the first argument)
y = pnorm(1.96, mean=0, sd=1);y #just pdf
y = qnorm(.975, mean=0, sd=1);y #use normal distribution
x = runif(20, min=10, max=30) #Uniform random variables
install.packages("")
library(Hmisc)
