#IF yu download taz file TO INSTALL 
install.packages("master.tar.gz", type = "source", repos = NULL)
#For perl xls package check "perl shit" on Pocket app
#else
install.packages("package_name")
require("package_name") or library(package_name)
#Read excel files in R
library(gdata)
perl<-"path to perl use which(perl)"
ds = read.xls("http://www.amherst.edu/~nhorton/r2/datasets/help.xlsx",
sheet=1)
#push data from R to SAS
tosas = data.frame(ds)
library(foreign)
write.dbf(tosas, "tosas.dbf")
#read from SAS to R
ds = read.dbf("dir_location/to_r.dbf")
#Complex text files
tmpds = read.table("custom_files/demo.dat")
id = tmpds$V1 #select first column,etc
datevar = as.Date(as.character(tmpds$V3), "%m/%d/%Y") #select date column
cost = as.numeric(substr(tmpds$V4, 2, 100)) #select currency column
ds = data.frame(id, initials, datevar, cost) #assemble the data
rm(tmpds, id, initials, datevar, cost) #remove unused variables
#manual data Entry
x = numeric(10)
data.entry(x)
#Creating Excel spreadsheets
library(WriteXLS)
HELP = read.csv("http://www.amherst.edu/~nhorton/r2/datasets/help.csv")
WriteXLS("HELP", ExcelFileName="custom_files/newhelp.xls")
.libPaths('path/to/your/r-libraries') #Change libraries location
#Create html formated output
library(prettyR)
htmlize("script.R", title="mytitle", echo=TRUE)
