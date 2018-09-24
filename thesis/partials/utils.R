pkgTest <- function(x)
  {
    if (!require(x,character.only = TRUE))
    {
      install.packages(x,dep=TRUE)
        if(!require(x,character.only = TRUE)) stop("Package not found")
    }
  }
# trimws() inbuilt base method for trimming spaces as of R 3.2.0
# returns string w/o leading whitespace
trim.leading <- function (x)  sub("^\\s+", "", x)

# returns string w/o trailing whitespace
trim.trailing <- function (x) sub("\\s+$", "", x)

# returns string w/o leading or trailing whitespace
trim <- function (x) gsub("^\\s+|\\s+$", "", x)

addLevel <- function(x, newlevel="DRV"){
    if(is.factor(x)) return(factor(x, levels=c(levels(x), newlevel)))
    return(x)
}
generateBarChart <- function (data, photoName, mainName, xLabel, count,  includeMargin=FALSE, horizontal=FALSE) {
    print(includeMargin)
    imageName = paste("report/", photoName, sep="")
    jpeg(imageName,width = 960, height = 960, units = "px", pointsize = 12,
         quality = 75,)
    if (includeMargin) {
        par(mar=c(5,12,4,2))
    }
    barplot(data, main=mainName,
            xlab=xLabel, col=rainbow(count), las=1,
            legend = rownames(data), beside=TRUE, horiz = horizontal)
    dev.off()
    return("Success")
}
