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
