x = numeric(10)
# create placeholder
for (i in 1:length(x)) {
x[i] = rnorm(1) # this is slow and inefficient!Sample for loop use x = rnorm(10) instead
}

ifelse(expression, x, y)#vector ifelse
x1 = rep(c(0,1), each=n/2) #repeat each number
x2 = rep(c(0,1), n/2) #repeat the concat
expand.grid(x1=1:3, x2=c("M", "F")) #generate all combinations of two or more vectors
browser()#create debugging breakpoint
debug(function) #debug the function to run one line at a time
try(expression, silent=FALSE)#similar to python try
stopifnot(expr1, ..., exprk)#runs the given expressions and returns an error message if all are not true
# calculate a t confidence interval for a mean
ci.calc = function(x, ci.conf=.95) {
    sampsize = length(x)
    tcrit = qt(1-((1-ci.conf)/2), sampsize - 1)
    mymean = mean(x)
    mysd = sd(x)
    return(list(civals=c(mymean-tcrit*mysd/sqrt(sampsize),
                         mymean+tcrit*mysd/sqrt(sampsize)), ci.conf=ci.conf))
}
x=rnorm(100)
ci.calc(x)
lci = ci.calc(x)$civals[1]#nifty way get only lower confidence interval
ci.calc(x, .90) #update confidence interval
system.time(expression)#get current system time
Sys.sleep(numseconds) #pause execution for numseconds
system("ls") #execute command in OS
list.files() #all files in current working history
#create temporary file
uniquefile = tempfile()
cat(x, "\n", file=uniquefile)
#redirect output


