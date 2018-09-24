yearlyCount <- table(cleanedMotorCycleData$YEAR, cleanedMotorCycleData$FATALITIES)

## yearFrame <- as.data.frame(yearlyCount)
## yearFrame$TOTAL <- with(yearFrame, as.integer(Var2) * as.integer(Freq))
## uniqueTotals <- aggregate(TOTAL ~ Var1, data=yearFrame, FUN=sum)
## colnames(uniqueTotals)[colnames(uniqueTotals)=="Var1"] <- "Year"
## totals <- as.integer(uniqueTotals$TOTAL)
## years <- as.character(uniqueTotals$Year)
## barplot(totals,
##         main = "Yearly MotorCycle Totals",
##         xlab = "Years",
##         ylab = "Deaths",
##         names.arg = years,
##         col = rainbow(4)
##         )

quarterCount <- table(cleanedMotorCycleData$FATALITIES, cleanedMotorCycleData$YEAR.QUARTER)
photoName <- 'quarterCount.jpg'
mainName <- "Motorcycle Deaths distributed quarterly"
xLabel <- "Yearly Quarters"
count = 4
generateBarChart(quarterCount, photoName, mainName, xLabel, count)

DayCountFive <- table(cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2015",]$FATALITIES, cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2015",]$DAY)
photoName <- '2015DayCount.jpg'
mainName <- "2015 Motorcycle Deaths distributed by Day"
xLabel <- "Days"
count = 4
generateBarChart(DayCountFive, photoName, mainName, xLabel, count)

DayCountSix <- table(cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2016",]$FATALITIES, cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2016",]$DAY)
photoName <- '2016DayCount.jpg'
mainName <- "2016 Motorcycle Deaths distributed by Day"
xLabel <- "Days"
count = 4
generateBarChart(DayCountSix, photoName, mainName, xLabel, count)

DayCountSeven <- table(cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2017",]$FATALITIES, cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2017",]$DAY)
photoName <- '2017DayCount.jpg'
mainName <- "2017 Motorcycle Deaths distributed by Day"
xLabel <- "Days"
count = 4
generateBarChart(DayCountSeven, photoName, mainName, xLabel, count)

DayCountEight <- table(cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2018",]$FATALITIES, cleanedMotorCycleData[cleanedMotorCycleData$YEAR=="2018",]$DAY)
photoName <- '2018DayCount.jpg'
mainName <- "2018 Motorcycle Deaths distributed by Day"
xLabel <- "Days"
count = 4
generateBarChart(DayCountEight, photoName, mainName, xLabel, count)

DayCountAverage <- table(cleanedMotorCycleData$FATALITIES, cleanedMotorCycleData$DAY)
photoName <- 'AverageDayCount.jpg'
mainName <- "Average Motorcycle Deaths distributed by Day"
xLabel <- "Days"
count = 4
generateBarChart(DayCountAverage, photoName, mainName, xLabel, count)

countyDeaths <- table(cleanedMotorCycleData$FATALITIES, cleanedMotorCycleData$COUNTY)
photoName <- 'CountyCount.jpg'
mainName <- "Average Motorcycle Deaths distributed by COUNTY"
xLabel <- ""
includeMargin = TRUE
count = 4
horizontal = TRUE
generateBarChart(countyDeaths, photoName, mainName, xLabel, count, includeMargin, horizontal)

stationDeaths <- colSums(table(cleanedMotorCycleData$FATALITIES, cleanedMotorCycleData$BASE.SUB.BASE))
orderedStations <- stationDeaths[order(stationDeaths,decreasing=T)]
Top50Stations <- orderedStations[1:50]
photoName <- 'Top50Stations.jpg'
mainName <- "Top 50 Station Deaths"
xLabel <- ""
includeMargin = TRUE
count = 50
horizontal = TRUE
generateBarChart(Top50Stations, photoName, mainName, xLabel, count, includeMargin, horizontal)

stationsLength <- length(orderedStations)
Bottom30Stations <- orderedStations[(stationsLength - 30 ):stationsLength]
photoName <- 'Bottom30Stations.jpg'
mainName <- "Bottom 30 Station Deaths"
xLabel <- ""
includeMargin = TRUE
count = 30
horizontal = TRUE
generateBarChart(Bottom30Stations, photoName, mainName, xLabel, count, includeMargin, horizontal)
