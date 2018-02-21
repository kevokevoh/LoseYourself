# Install the power package
install.packages('pwr')
library(pwr)
delta <- 100 # this is the difference between first and secon mean of what is being compared
sigma <- 60  # this is the standard deviation of the population
effectsize <- delta/sigma # Get effect size of the population by dividing delta by sigma
## Calculate sample size with significance level 0.5 and power 80 percent(
## Assuming you will use a normal two sample t test)
## The result will give you the sample size in each group (n)
## Will have to calculate the values of delta and sigma
pwr.t.test(d=effectsize, sig.level=.05, power = .80, type = 'two.sample')
