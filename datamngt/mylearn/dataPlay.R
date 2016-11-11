with(ds, mean(cesd)) #Get mean from ds column cesd
mean(ds$cesd) #Get mean from ds column(Variable) cesd
sapply(ds, class)# return the names and classes
summary(ds) #overview of each distribution by column(variable)
comment(ds) = "This is the label for the data ds" #Leave a comment for the data
attributes(ds)$comment #retrieve comments for the data
library(dplyr)
ds=rename(ds, cesd=Kevo) #ds = rename(ds, new1=old1, new2=old2) rename variable names
stringds = as.character(ds$pcs1) #convert from numeric to  character
newengland = c("MA", "CT", "RI", "VT", "ME", "NH")
"NY" %in% newengland #check if NY is in newengland and return boolean
regexpr("abc", x)  #check if "abc"exists in data x
x = "oldpat123";substr(x, start=1, stop=6) = "newpat" #replace string within string
strsplit(x, "")#strip string into multiple strings
toupper(x) & tolower(x)#Convert string to upper or lower
library(dplyr)
smallds = subset(ds, ds$substance=="cocaine") #filter from ds from variable substance with value cocaine
ds = data.frame(y = c("abc", "def", "ghi"))#define variable as frame
x=c(5:7)#define a variable x
ds = mutate(ds, x) #add variable x to dataframe ds
x = c("I ask a favour", "Pardon my error", "You are my favorite") #defien variable
agrep("favor", x, max.distance=1) #find favour string in variable x
x = "oldpat123"
newstring = gsub("oldpat", "newpat", x)#replace string
x = c(0, 0, 1, 1, 2); x
x = factor(x, 0:2, labels=c("Control", "Low Dose", "High Dose")); x #Format values of variables
#with ds being a frame containing (wide) id,year,inc80,inc81,inc82
library(diplyr);library(readr);library(tidyr)
long = ds %>%gather(year, inc, inc80:inc82) %>%
    mutate(year = parse_number(year)) %>%arrange(id, year) #convert from wide to long
wide = long %>%mutate(year=paste("inc", year, sep="")) %>%
    spread(year, inc) #convert from long to wide

merged2 = merge(ds2, ds1, by="id", all=TRUE) #merge to data frames based on variable id
#general learnings from the data play chapter
with(newds, cesd[cesd > 56]) #from data frame newsds,in variable cesd show greater than 56
with(newds, cesd[1:10])#cesd 1 to 10
library(dplyr)
filter(newds, cesd > 56) %>% select(id, cesd)  #id and cesd greater than 57
