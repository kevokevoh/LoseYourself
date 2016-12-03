options(digits=3)
ds = read.csv("http://www.amherst.edu/~nhorton/r2/datasets/help.csv")
#Scatterplot with multiple axes
plottwoy = function(x, y1, y2, xname="X", y1name="Y1", y2name="Y2") {
    plot(x, y1, ylab=y1name, xlab=xname)
    lines(lowess(x, y1), lwd=3)
    addsecondy(x, y2, y1, yname=y2name)
}
addsecondy = function(x, y, origy, yname="Y2") {
    prevlimits = range(origy)
    axislimits = range(y)
    axis(side=4, at=prevlimits[1] + diff(prevlimits)*c(0:5)/5,
         labels=round(axislimits[1] + diff(axislimits)*c(0:5)/5, 1))
    mtext(yname, side=4)
    newy = (y-axislimits[1])/(diff(axislimits)/diff(prevlimits)) +
        prevlimits[1]
    points(x, newy, pch=2)
    lines(lowess(x, newy), lty=2, lwd=3)
}
with(ds, plottwoy(cesd[female==1&substance=="alcohol"],
                  indtot[female==1&substance=="alcohol"],
                  mcs[female==1&substance=="alcohol"], xname="cesd",
                  y1name="indtot", y2name="mcs"))
library(lattice)
library(mosaic)
#Scatterplot with marginal histograms
trellis.par.set(theme=col.mosaic(bw=TRUE))
ds = transform(ds, suicidal.thoughts = ifelse(g1b==1, "Y", "N"))
coplot(mcs ~ cesd | suicidal.thoughts*substance,
       panel=panel.smooth, data=ds)
#kaplan meier
scatterhist = function(x, y, xlab="x label", ylab="y label", cexval=1.3){
    zones=matrix(c(3,1,2,4), ncol=2, byrow=TRUE)
    layout(zones, widths=c(4/5,1/5), heights=c(1/5,4/5))
    par(mar=c(0,0,0,0))
    plot(type="n",x=1, y =1, bty="n",xaxt="n", yaxt="n")
    text(x=1,y=1,paste0("n = ",min(length(x), length(y))), cex=cexval)
    xhist = hist(x, plot=FALSE)
    yhist = hist(y, plot=FALSE)
    top = max(c(xhist$counts, yhist$counts))
    par(mar=c(3.9,3.9,1,1))
    plot(x,y, xlab=xlab, ylab=ylab, cex.sub=cexval,
         pch=19, col="#00000044")
    lines(lowess(x, y), lwd=2)
    par(mar=c(0,3,1,1))
    barplot(xhist$counts, axes=FALSE, ylim=c(0, top), space=0)
    par(mar=c(3,0,1,1))
    barplot(yhist$counts, axes=FALSE, xlim=c(0, top), space=0, horiz=TRUE)
    par(oma=c(3,3,0,0))
}
library(survival)
survobj = survfit(Surv(dayslink, linkstatus) ~ treat, data=ds);survobj
with(ds, scatterhist(mcs, pcs, xlab="MCS", ylab="PCS"))
#ROC curve
library(ROCR)
pred = with(ds, prediction(cesd, g1b))
auc = slot(performance(pred, "auc"), "y.values")[[1]]
#pairs plot
plot(survobj, lty=1:2, lwd=2, col=c(4,2))
title("Product-Limit Survival Estimates")
legend(20, .38, legend=c("Control", "Treatment"), lty=c(1,2), lwd=2,
       col=c(4,2), cex=1.2)



