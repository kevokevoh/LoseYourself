options(digits=3) # read in Stata format
library(foreign)
ds = read.dta("http://www.amherst.edu/~nhorton/r2/datasets/help.dta",
              convert.underscore=FALSE)
library(dplyr)
ds = mutate(ds, sub=factor(substance,levels=c("heroin", "alcohol", "cocaine")))
newds = filter(ds, female==1)
alcohol = filter(newds, substance=="alcohol")
cocaine = filter(newds, substance=="cocaine")
heroin = filter(newds, substance=="heroin")
#Scatterplot with smooth fit
with(newds, plot(age, i1, ylim=c(0,40), type="n", cex.lab=1.2,
                 cex.axis=1.2))
with(alcohol, points(age, i1, pch="a"))
with(alcohol, lines(lowess(age, i1), lty=1, lwd=2))
with(cocaine, points(age, i1, pch="c"))
with(cocaine, lines(lowess(age, i1), lty=2, lwd=2))
with(heroin, points(age, i1, pch="h"))
with(heroin, lines(lowess(age, i1), lty=3, lwd=2))
legend(44, 38, legend=c("alcohol", "cocaine", "heroin"), lty=1:3,
cex=1.4, lwd=2, pch=c("a", "c", "h"))
#Linear regression with interaction
options(show.signif.stars=FALSE)
library(lattice)
lm1 = lm(i1 ~ sub * age, data=newds)
lm2 = lm(i1 ~ sub + age, data=newds)
xyplot(i1 ~ age, groups=substance, type=c("p", "smooth"),
       auto.key=list(columns=3, lines=TRUE, points=FALSE),
       ylim=c(0, 40), data=newds)
anova(lm2, lm1) #anova
summary.aov(lm1)
#Scatterplot of observed values for age and I1 (plus smoothers by substance) using the ggplot2 package
library(ggplot2)
ggplot(data=newds, aes(x=age, y=i1)) + geom_point(aes(shape=substance)) +
    stat_smooth(method=loess, level=0.50, colour="black") +
    aes(linetype=substance) +
    coord_cartesian(ylim = c(0, 40)) +
    theme(legend.position="top") + labs(title="")
summary(lm1)
#produce table in latex format
library(xtable)
lmtab = xtable(lm1, digits=c(0,3,3,2,4), label="better",
               caption="Formatted results using the {\\tt xtable} package")
print(lmtab)
#quantities of interest stored in the linear model object lm1
names(summary(lm1))
summary(lm1)$sigma
names(lm1)
coef(summary(lm1))
#the quantiles of their distribution and display smallest residual
library(mosaic)
mplot(lm2, which=7, rows=-1)

library(dplyr)
newds = mutate(newds, pred = fitted(lm1), resid = residuals(lm1))
with(newds, quantile(resid))
#print the largest value
newds %>%
    select(id, age, i1, sub, pred, resid) %>%
    mutate(rstand = rstandard(lm1)) %>%
    filter(resid==max(resid))
#default diagnostic plots
oldpar = par(mfrow=c(2, 2), mar=c(4, 4, 2, 2) + .1)
plot(lm1); par(oldpar)
#Fitting a regression model separately for each value of another variable
uniquevals = unique(newds$substance)
numunique = length(uniquevals)
formula = as.formula(i1 ~ age)
p = length(coef(lm(formula, data=newds)))
res = matrix(rep(0, numunique*p), p, numunique)
for (i in 1:length(uniquevals)) {
    res[,i] = coef(lm(formula,
                      data=subset(newds, substance==uniquevals[i])))
}
rownames(res) = c("intercept","slope")
colnames(res) = uniquevals
#Empirical density of residuals, with superimposed normal density
library(MASS)
std.res = rstandard(lm1)
hist(std.res, breaks=seq(-2.5, 3.5, by=.5), main="",
     xlab="standardized residuals", col="gray80", freq=FALSE)
lines(density(std.res), lwd=2)
xvals = seq(from=min(std.res), to=max(std.res), length=100)
lines(xvals, dnorm(xvals, mean(std.res), sd(std.res)), lty=2)
res
#two way anova
ds = mutate(ds, genf = as.factor(ifelse(female, "F", "M")))
with(ds, interaction.plot(substance, genf, cesd,
                          xlab="substance", las=1, lwd=2))
library(memisc)
ds = mutate(ds, subs = cases(
                    "Alc" = substance=="alcohol",
                    "Coc" = substance=="cocaine",
                    "Her" = substance=="heroin"))
aov1 = aov(cesd ~ sub * genf, data=ds)
aov2 = aov(cesd ~ sub + genf, data=ds)
anova(aov2, aov1)
#boxplot
boxout = with(ds,
              boxplot(cesd ~ subs + genf, notch=TRUE, varwidth=TRUE,
                      col="gray80"))
boxmeans = with(ds, tapply(cesd, list(subs, genf), mean))
points(seq(boxout$n), boxmeans, pch=4, cex=2)



