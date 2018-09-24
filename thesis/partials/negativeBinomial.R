cycleData <- read.csv(file='data/cleanMotorCycleData.csv', sep=',', header=TRUE)
cycleData <- within(cycleData, {
    COUNTY <- factor(COUNTY)
    VICTIM <- factor(VICTIM)
    YEAR.QUARTER <- factor(YEAR.QUARTER)
})
summary(cycleData)
pkgTest("ggplot2")
ggplot(cycleData, aes(FATALITIES)) + geom_histogram() + scale_x_log10() + facet_grid(DAY ~ 
    VICTIM, margins = TRUE, scales = "free_y")

ggplot(cycleData, aes(factor(DAY), FATALITIES)) +
  geom_violin() +
  geom_jitter(size=1.5) +
  scale_y_log10() +
  stat_smooth(aes(x = DAY, y = FATALITIES, group=1), method="loess")

ggplot(cycleData, aes(FATALITIES, fill=VICTIM)) +
  geom_histogram(binwidth=.5, position="fill") +
  facet_grid(DAY ~ ., margins=TRUE)

pkgTest("VGAM")
m1 <- vglm(FATALITIES ~ DAY + COUNTY + VICTIM + YEAR.QUARTER, family = posnegbinomial(), data = cycleData)
summary(m1)

output <- data.frame(resid = resid(m1)[, 1], fitted = fitted(m1))
ggplot(output, aes(fitted, resid)) + geom_jitter(position = position_jitter(width = 0.25), 
                                                 alpha = 0.5) + stat_smooth(method = "loess")

ggplot(output, aes(fitted, resid)) +
  geom_jitter(position=position_jitter(width=.25), alpha=.5) +
    stat_quantile(method="rq")

output <- within(output, {
  broken <- cut(fitted, hist(fitted, plot=FALSE)$breaks)
})

ggplot(output, aes(broken, resid)) +
 geom_boxplot() +
 geom_jitter(alpha=.25)

dput(round(coef(m1),3))

f <- function(data, i) {
  m <- vglm(formula = FATALITIES ~ DAY + COUNTY + VICTIM + YEAR.QUARTER, family = pospoisson(),
    data = data[i, ], coefstart = c(2.436, -0.014, -0.136, -0.204))
  as.vector(t(coef(summary(m))[, 1:2]))
}

set.seed(10)
res <- boot(dat, f, R = 1200, parallel = "snow", ncpus = 4)

## print results
res
