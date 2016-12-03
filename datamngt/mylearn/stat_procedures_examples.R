options(digits=3)
options(width=72) # narrows output to stay in the grey box
ds = read.csv("http://www.amherst.edu/~nhorton/r2/datasets/help.csv")
with(ds, mean(cesd))#mean of cesd
with(ds, median(cesd))#median
with(ds, range(cesd))
with(ds, sd(cesd))
with(ds, var(cesd))
library(mosaic)
favstats(~ cesd, data=ds)
library(moments)
with(ds, skewness(cesd))
with(ds, kurtosis(cesd))
with(ds, quantile(cesd, seq(from=0, to=1, length=11)))
#run next 4 lines together to get Density plot of depressive symptom scores (CESD) plus superimposed histogram and normal distribution
with(ds, hist(cesd, main="", freq=FALSE))
with(ds, lines(density(cesd), main="CESD", lty=2, lwd=2))
xvals = with(ds, seq(from=min(cesd), to=max(cesd), length=100))
with(ds, lines(xvals, dnorm(xvals, mean(cesd), sd(cesd)), lwd=2))
#bivariates
cormat = cor(with(ds, cbind(cesd, mcs, pcs)));cormat
#Scatterplot of CESD and MCS for women, with primary substance shown as the plot symbol
with(ds, plot(cesd[female==1], mcs[female==1], xlab="CESD", ylab="MCS",
              type="n", bty="n"))
with(ds, text(cesd[female==1&substance=="alcohol"],
              mcs[female==1&substance=="alcohol"],"A"))
with(ds, text(cesd[female==1&substance=="cocaine"],
              mcs[female==1&substance=="cocaine"],"C"))
with(ds, text(cesd[female==1&substance=="heroin"],
              mcs[female==1&substance=="heroin"],"H"))
with(ds, rug(jitter(mcs[female==1]), side=2))
with(ds, rug(jitter(cesd[female==1]), side=3))
#contingency tables
require(gmodels)
with(ds, CrossTable(homeless, female, prop.chisq=FALSE, format="SPSS"))
#oddratios
library(epitools)
oddsobject = with(ds, oddsratio.wald(homeless, female));oddsobject
#Fisher’s exact tests and chisquare test
chisqval = with(ds, chisq.test(homeless, female, correct=FALSE));chisqval
with(ds, fisher.test(homeless, female))
#graphical depiction
library(gridExtra)
mytab = tally(~ racegrp + substance, data=ds)
plot.new()
grid.table(mytab)
#Two sample tests of continuous variables
ttres = t.test(age ~ female, data=ds);ttres
#permutation test can be run and used to generate a Monte Carlo p-value
library(coin)
oneway_test(age ~ as.factor(female),
            distribution=approximate(B=9999), data=ds)
with(ds, wilcox.test(age ~ as.factor(female), correct=FALSE))
ksres = with(ds, ks.test(age[female==1], age[female==0]));ksres
#estimated density functions
plotdens = function(x,y, mytitle, mylab) {
    densx = density(x)
    densy = density(y)
    plot(densx, main=mytitle, lwd=3, xlab=mylab, bty="l")
    lines(densy, lty=2, col=2, lwd=3)
    xvals = c(densx$x, rev(densy$x))
    yvals = c(densx$y, rev(densy$y))
    polygon(xvals, yvals, col="gray")
}
mytitle = paste("Test of ages: D=", round(ksres$statistic, 3),
                " p=", round(ksres$p.value, 2), sep="")
with(ds, plotdens(age[female==1], age[female==0], mytitle=mytitle,
                  mylab="age (in years)"))
legend(50, .05, legend=c("Women", "Men"), col=1:2, lty=1:2, lwd=2)
#survival analysis
library(survival)
survobj = survdiff(Surv(dayslink, linkstatus) ~ treat,data=ds);survobj#log test
names(survobj)
