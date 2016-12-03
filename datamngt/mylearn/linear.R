ds = read.csv("http://www.amherst.edu/~nhorton/r2/datasets/help.csv")
mod1 = lm(y ~ x1 + ... + xk, data=ds) #linear regression
summary(mod1)
summary.aov(mod1)
#use library(biglm)for big data to fit in linear models
#One-way analysis of variance
ds = transform(ds, xf=as.factor(cesd))
mod1 = aov(y ~ xf, data=ds)
summary(mod1)
anova(mod1)
#Analysis of variance with two or more factors
aov(y ~ as.factor(x1) + as.factor(x2), data=ds)
#Joint null hypotheses: several parameters equal 0
#ie testing the null hypothesis H 0 : β 1 = β 2 = 0.
mod1 = lm(y ~ x1 + ... + xk, data=ds)
mod2 = lm(y ~ x3 + ... + xk, data=ds)
anova(mod2, mod1)
#Joint null hypotheses: sum of parameters
#ie testing the null hypothesis H 0 : β 1 + β 2 = 1.
mod1 = lm(y ~ x1 + ... + xk, data=ds)
covb = vcov(mod1)
coeff.mod1 = coef(mod1)
t = (coeff.mod1[2] + coeff.mod1[3] - 1)/
sqrt(covb[2,2] + covb[3,3] + 2*covb[2,3])
pvalue = 2*(1-pt(abs(t), df=mod1$df))
#Tests of equality of parameters
#testing the null hypothesis H 0 : β 1 = β 2 .
mod1 = lm(y ~ x1 + ... + xk, data=ds)
mod2 = lm(y ~ I(x1+x2) + ... + xk, data=ds)
anova(mod2, mod1)
#Multiple comparisons
mod1 = aov(y ~ x, data=ds)
TukeyHSD(mod1, "x")
#Linear combinations of parameters
# ie calculate the predicted value E[Y |X 1 = 1, X 2 = 3] = β̂ 0 + β̂ 1 + 3 β̂ 2 .
mod1 = lm(y ~ x1 + x2, data=ds)
newdf = data.frame(x1=c(1), x2=c(3))
predict(mod1, newdf, se.fit=TRUE, interval="confidence")
# Predicted values
mod1 = lm(y ~ x, data=ds)
predicted.varname = predict(mod1)
#residuals
mod1 = lm(y ~ x, data=ds)
residual.varname = residuals(mod1)
#Standardized and Studentized residuals
mod1 = lm(y ~ x, data=ds)
standardized.resid.varname = rstandard(mod1)
studentized.resid.varname = rstudent(mod1)
#leverage
# defined as the diagonal element of the (X(X T X) −1 X T ) or “hat” matrix
mod1 = lm(y ~ x, data=ds)
leverage.varname = hatvalues(mod1)
# Cook’s distance
#function of the leverage and the magnitude of the residual
mod1 = lm(y ~ x, data=ds)
cookd.varname = cooks.distance(mod1)
# Confidence interval for parameter estimates
mod1 = lm(y ~ x, data=ds)
confint(mod1)







