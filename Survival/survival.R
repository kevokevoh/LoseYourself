library(survival)
stime<-c(2.2,3.0,8.4,7.5)
status<c(1,0,1,0)
mysuv<-Surv(stime,status)
kaplan<-survfit(mysuv ~ 1)
summary(kaplan)
plot(kaplan,conf.int=0, col = 'red', xlab= 'Time (weeks)', ylab= 'Survival Probability')

                                        # If have 2 things
time1 <-c(6,6,6,7,10,13,16,22,23,6,9,10,11,17,19,20,25,32,32,34,35)
status1 <-c(1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0)
time2 <-c(1,1,2,2,3,4,4,5,5,8,8,8,8,11,11,12,12,15,17,22,23)
status2 <-c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
fit1 <-survfit(Surv(time1, status1) ~ 1)
fit2 <-survfit(Surv(time2, status2) ~ 1)
plot(fit1,conf.int=0, col='blue', xlab= 'Time (weeks)', ylab= 'SurvivalProbability')
lines(fit2, col= 'red')
legend(21,1,c('Group 1 (treatment)', 'Group 2 (placebo)'), col= c('blue','red'), lty= 1)
title(main='KM-Curves for Remission Data')

                                        # Log Rank Test
time <-c(6,6,6,7,10,13,16,22,23,6,9,10,11,17,19,20,25,32,32,34,35,1,1,2,2,3,4,4,5,5,8,8,8,8,11,11,
         12,12,15,17,22,23)
status <-c(1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
treatment <-c(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2)
fit <-survdiff(Surv(time, status) ~ treatment)

                                        #wilcoxon Test
x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)
wilcox.test(x,y)
