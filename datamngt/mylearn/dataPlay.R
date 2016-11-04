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
