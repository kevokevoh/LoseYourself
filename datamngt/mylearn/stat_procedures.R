library(mosaic)
favstats(x, data=ds) #similar to summary(x)
library(Hmisc)
wtd.mean(x)#Weighted mean
wtd.var(x)#weighted variance
library(moments)
kurtosis(x)#kurtosis of x
skewness(x) #skewness of x
mean(x, trim=0.5) #trimmed mean
quantile(x, c(.025, .975))#quantiles
quantile(x, seq(from=.95, to=.975, by=.0125))
scale(x) #create a Z-score transformation
t.test(x) #Mean and 95% confidence interval etal
library(MASS)
fitdistr(x, "exponential")#can be many distributins here(Maximum likelihood estimation of parameters)
#correlations
pearsoncorr = cor(x, y)
spearmancorr = cor(x, y, method="spearman")
kendalltau = cor(x, y, method="kendall")
table(x1, x2, useNA="ifany")#Displaying missing value categories in a table
chisq.test(x, y)#Pearson chi-square statistic
fisher.test(y, x)#Fisher’s exact test
shapiro.test(x)#Tests for normality also check nortest package
var.test(y, x) #Test for equal variances
#Nonparametric tests
wilcox.test(y1, y2)
ks.test(y1, y2)
library(coin)
median_test(y ~ x)
#permutation tests
library(coin)
oneway_test(y ~ as.factor(x), distribution=approximate(B=bnum))
#Logrank test
library(survival)
survdiff(Surv(timevar, cens) ~ x)
#analytics Power
# find sample size for two-sample t-test
power.t.test(delta=0.5, power=0.9)
# find power for two-sample t-test
power.t.test(delta=0.5, n=100)
# find sample size for two-sample test of proportions
power.prop.test(p1=.1, p2=.2, power=.9)
# find power for two-sample test of proportions
power.prop.test(p1=.1, p2=.2, n=100)

