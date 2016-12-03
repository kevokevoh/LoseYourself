library(mosaic)
y = xpnorm(1.96, mean=0, sd=1);y #get graphical pdf (probability that the random variable is less than the first argument)
y = pnorm(1.96, mean=0, sd=1);y #just pdf
y = qnorm(.975, mean=0, sd=1);y #use normal distribution
x = runif(20, min=10, max=30) #Uniform random variables
x1 = rnorm(10) #normal random variables
x2 = rnorm(n, mean=mu, sd=sigma) #with custom mean and sigma
library(MASS)
mu = rep(0, 3) #reproduce 0,three times
Sigma = matrix(c(3, 1, 2, 1, 4, 0, 2, 0, 5), nrow=3) #create 3 by 3 matrix
xvals = mvrnorm(1000, mu, Sigma) #generate multivariate normal random variables
head(xvals)
meal=apply(xvals, 2, mean) #mean of each of the three rows
library(tmvtnorm)
x = rtmvnorm(10, meal, Sigma) #truncate multivariate normal random variables
x = rexp(10, rate=2) #exponential random variables
#Mathematical functions
minx = min(x)
maxx = max(x)
meanx = mean(x)
modx = x1 %% x2
stddevx = sd(x)
absolutevaluex = abs(x)
squarerootx = sqrt(x)
etothex = exp(x)
xtothey = x^y
naturallogx = log(x)
logbase10x = log10(x)
logbase2x = log2(x)
logbasearbx = log(x, base=42)
#trigonometric functions
sinpi = sin(pi)
cos0 = cos(0)
tanval = tan(pi/4)
acosx = acos(x)
asinx = asin(x)
atanx = atan(x)
atanxy = atan2(x, y)
#special functions
betaxy = beta(x, y)
gammax = gamma(x)
factorialn = factorial(n)
nchooser = choose(n, r)
library(gtools)
nchooser = length(combinations(n, r)[,1])
npermr = length(permutations(n, r)[,1])
#integer functions
nextintx = ceiling(x)
justintx = floor(x)
round2dec = round(x, 2)
roundint = round(x)
keep4sig = signif(x, 4)
movetozero = trunc(x)

all.equal(0.1428571, 1/7, tolerance=0.0001)#compare float point variables
(0+1i)^2 #complex numbers support
library(mosaic)
D(x^2 ~ x) #diferentiate x^2
plotFun(D(x^2 ~ x)) #plot derivatives
antiD(2*x ~ x) #intergrate
A = matrix(c(1, 2, 3, 4), nrow=2, ncol=2, byrow=TRUE) #create matrix
B = A + A #add matrix
transA = t(A);transA #transpose matrix
dim(A) #matrix dimensions
Asquared = A %*% A #matrix multiplication
Ainv = solve(A) #matrix inverse
newmat = A * A #component wisemultiplication ie each a multiply itself
A = matrix(1:12, nrow=3, ncol=4, byrow=TRUE)
Asub = A[2:3, 3:4] #create submatrix
diagMat = diag(A) #diagonal vector from the matrix
c(A) #create vector from matrix
Aev = eigen(A) #eigen values and vectors
Aeval = Aev$values #specific values
Aevec = Aev$vectors#specific vectors
svdres = svd(A) #singular value decomposition
U = svdres$u
Q = svdres$d
V = svdres$v
#diagonal matrix
A = matrix(c(1, 2, 3, 4), nrow=2, ncol=2, byrow=TRUE)
diagMat = diag(c(1, 4))
diagMat = diag(diag(A));diagMat
