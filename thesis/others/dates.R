# Populate missing dates n data func
populateMissingDates <- function(dataframe, levels) {
    levels <- levels[levels != ""]
    levels <- levels[order(as.Date(levels, format="%d/%m/%Y"))]
    index <- 1
    for (level in levels) {
        if (index != 1) {
            currentPosition <- which(dataframe$DATE == level)
            print (currentPosition)
            print (levels[index-1])
            previousPosition <- tail(which(dataframe$DATE == levels[index-1]), n=1)
            print (previousPosition)
            dataframe[previousPosition:currentPosition,]$DATE = level[index-1]
        }
        index <- index + 1
    }
    return(dataframe)
}
