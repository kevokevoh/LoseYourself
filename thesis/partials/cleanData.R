# load fatal data
fatal2015 <- read.csv(file='data/2015.csv', sep=',', header=TRUE, strip.white=TRUE)
fatal2016 <- read.csv(file='data/2016.csv', sep=',', header=TRUE, strip.white=TRUE)
fatal2017 <- read.csv(file='data/2017.csv', sep=',', header=TRUE, strip.white=TRUE)
fatal2018 <- read.csv(file='data/2018.csv', sep=',', header=TRUE, strip.white=TRUE)
# Format 2015 dates(One off!)
## dates <- as.Date(as.character(fatal2015$DATE), "%d/%m/%Y")
## fatal2015$DATE <- format(dates, format = "%m/%d/%Y")
## write.csv(fatal2015, file="data/new2015.csv")
fatal2015 <- fatal2015[!(fatal2015$VICTIM==""|is.na(fatal2015$VICTIM)),]
fatal2017[(fatal2017$VICTIM=="PL"),]$VICTIM= "PIL"
fatal2017[(fatal2017$VICTIM=="M/CY"),]$VICTIM= "MCY"
fatal2018 <- fatal2018[0:1420,]
fatal2018[(fatal2018$VICTIM=="PASS"),]$VICTIM= "PAS"
fatal2018[(fatal2018$VICTIM=="DR"),]$VICTIM= "DRV"
fatal2015 <- droplevels(fatal2015)
fatal2016 <- droplevels(fatal2016)
fatal2017 <- droplevels(fatal2017)
fatal2018 <- droplevels(fatal2018)
fatalities <- rbind(fatal2015, fatal2016, fatal2017, fatal2018)
fatalities <- fatalities[order(as.Date(fatalities$DATE, format="%m/%d/%Y")),]
motorcylcefatalities <- fatalities[fatalities$VICTIM=="MCY" | fatalities$VICTIM=="PIL",]
motorcylcefatalities <- droplevels(motorcylcefatalities)
motorcylcefatalities$VICTIM <- addLevel(motorcylcefatalities$VICTIM, "DRV")
motorcylcefatalities[(motorcylcefatalities$VICTIM=="MCY"),]$VICTIM = "DRV"
names(motorcylcefatalities)[14] <- "FATALITIES"
rownames(motorcylcefatalities) <- seq(length=nrow(motorcylcefatalities))

motorcylcefatalities[(motorcylcefatalities$FATALITIES==""),]$FATALITIES= "1"

motorcylcefatalities[(motorcylcefatalities$COUNTY=="BNGOMA"),]$COUNTY = "BUNGOMA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="WEBUYE"),]$COUNTY = "BUNGOMA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="ELGEIYO-MARAKWET"),]$COUNTY = "ELGEYO MARAKWET"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="HOMABAY"),]$COUNTY = "HOMA BAY"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="MURANG'A"),]$COUNTY = "MURANGA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TAITA TAVETA"),]$COUNTY = "TAITA-TAVETA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TRANZOIA"),]$COUNTY = "TRANS NZOIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TRAN NZOIA"),]$COUNTY = "TRANS NZOIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TRANS- NZOIA"),]$COUNTY = "TRANS NZOIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TRANS-NZOIA"),]$COUNTY = "TRANS NZOIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="TRANS ZOIA"),]$COUNTY = "TRANS NZOIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="UASIN NGISHU"),]$COUNTY = "UASIN GISHU"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="UASIN GISHU"),]$COUNTY = "UASIN GISHU"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="ELDORET"),]$COUNTY = "UASIN GISHU"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="UASINGISHU"),]$COUNTY = "UASIN GISHU"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="BUSAI"),]$COUNTY = "BUSIA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="KAKAMEA"),]$COUNTY = "KAKAMEGA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="BUTERE"),]$COUNTY = "KAKAMEGA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="NAIROBI COUNTY"),]$COUNTY = "NAIROBI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="KAYOLE"),]$COUNTY = "NAIROBI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="NYANDARAU"),]$COUNTY = "NYANDARUA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="KILFI"),]$COUNTY = "KILIFI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="KIRINYANGA"),]$COUNTY = "KIRINYAGA"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="MAKINDU"),]$COUNTY = "MAKUENI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="WEST POKOT"),]$COUNTY = "WEST-POKOT"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="KITU"),]$COUNTY = "KITUI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="MWINGI"),]$COUNTY = "KITUI"
motorcylcefatalities[(motorcylcefatalities$COUNTY=="SOTIK"),]$COUNTY = "BOMET"

pkgTest("lubridate")
require("lubridate")
motorcylcefatalities$YEAR.QUARTER <- with(motorcylcefatalities, quarter(mdy(motorcylcefatalities$DATE), with_year = TRUE))
motorcylcefatalities$DAY <- with(motorcylcefatalities, wday(mdy(motorcylcefatalities$DATE), label = TRUE))
motorcylcefatalities$YEAR <- with(motorcylcefatalities, year(mdy(motorcylcefatalities$DATE)))

motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="BURET"),]$BASE.SUB.BASE = "BURETI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="BURU BURU"),]$BASE.SUB.BASE = "BURUBURU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="HOMABAY"),]$BASE.SUB.BASE = "HOMA BAY"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="KABARAS"),]$BASE.SUB.BASE = "KABRAS"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MAGUMU"),]$BASE.SUB.BASE = "MAGUMO"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MOIS BRIDGE"),]$BASE.SUB.BASE = "MOI'S BRIDGE"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MOISBRIDGE"),]$BASE.SUB.BASE = "MOI'S BRIDGE"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MURANG'A"),]$BASE.SUB.BASE = "MURANGA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MWIGA"),]$BASE.SUB.BASE = "MWEIGA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="NAMAGA"),]$BASE.SUB.BASE = "NAMANGA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="NAROMORU"),]$BASE.SUB.BASE = "NARO MORU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="NARUMORU"),]$BASE.SUB.BASE = "NARO MORU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="G.V.A.I.S"),]$BASE.SUB.BASE = "G.V.A.I.S."
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MOGTIO"),]$BASE.SUB.BASE = "MOGOTIO"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MTOTO ANDEI"),]$BASE.SUB.BASE = "MTITO ANDEI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MTITO-ANDEI"),]$BASE.SUB.BASE = "MTITO ANDEI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="chuka"),]$BASE.SUB.BASE = "CHUKA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="DTEO EMBAKAZI"),]$BASE.SUB.BASE = "DTEO EMBAKASI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="DTO EMBAKASI"),]$BASE.SUB.BASE = "DTEO EMBAKASI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="EMBAKAZI"),]$BASE.SUB.BASE = "EMBAKASI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="EMBAKSI"),]$BASE.SUB.BASE = "EMBAKASI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="DTO INDO AREA"),]$BASE.SUB.BASE = "DTEO INDO AREA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MAIMAHIU"),]$BASE.SUB.BASE = "MAI MAHIU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MAAI-MAIHU"),]$BASE.SUB.BASE = "MAI MAHIU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MARAGWA"),]$BASE.SUB.BASE = "MARAGUA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="KITIRIRI"),]$BASE.SUB.BASE = "KIRITIRI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="LEISAMIS"),]$BASE.SUB.BASE = "LAISAMIS"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="OL KALOU"),]$BASE.SUB.BASE = "OLKALOU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="OLKALAO"),]$BASE.SUB.BASE = "OLKALOU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="OLKALOU"),]$BASE.SUB.BASE = "OLKALOU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MALNDI"),]$BASE.SUB.BASE = "MALINDI"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="ATHI-RIVER"),]$BASE.SUB.BASE = "ATHI RIVER"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="UGUNZA"),]$BASE.SUB.BASE = "UGUNJA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="TRANSMARA"),]$BASE.SUB.BASE = "TRANS MARA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="WANGURA"),]$BASE.SUB.BASE = "WANGURU"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="KANDOLE"),]$BASE.SUB.BASE = "KONDELE"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="KERONGUYA"),]$BASE.SUB.BASE = "KERUGOYA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="KEROGOYA"),]$BASE.SUB.BASE = "KERUGOYA"
motorcylcefatalities[(motorcylcefatalities$BASE.SUB.BASE=="MWEGA"),]$BASE.SUB.BASE = "MWEIGA"

motorcylcefatalities <- droplevels(motorcylcefatalities)

cleanedMotorCycleData <- motorcylcefatalities[,c(2,4,5,11,13,14,15,16)]
write.csv(cleanedMotorCycleData, file="data/cleanMotorCycleData.csv", row.names = FALSE)

