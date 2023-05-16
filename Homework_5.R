# Q1.

# a)

tmpFn1 = function(xVec)
{
  xVec^(1:length(xVec))
}
tmpFn2 = function(xVec)
{
  n = length(xVec)
  (xVec^(1:n))/(1:n)
}

# b)

tmpFn3 = function(x, n)
{
  1 + sum((x^(1:n))/(1:n))
}

# Q2.

tmpFn = function(x)
{
  ifelse(x < 0, x^2 + 2*x + 3, ifelse(x < 2, x+3, x^2 + 4*x - 7))
}
tmp = seq(-3, 3, len=100)
plot(tmp, tmpFn(tmp), type="l")

# Q3.

tmpFn <- function(mat)
{
  mat[mat%%2 == 1] = 2 * mat[mat%%2 == 1]
  mat
}

# Q4. 

# a)

tsEwma = function(tsDat, m0=0, delta=0.7)
{
  n = length(tsData)
  mVec = rep(NA, n+1)
  mVec[1] = m0
  for(j in 2:(n+1)){
    mVec[j] = (1-delta)*tsDat[j-1] + delta*mVec[j-1]
  }
  ts(mVec[-1], start - start(tsDat), frequency = frequency((tsDat)))
}

# b)

tsEwma2 = function(tsDat, m0=0, delta=0.7)
{
  tsPars = tsp(tsDat)
  tsDat = c(tsDat)
  n = length(tsDat)
  mVec = rep(NA, n+1)
  mVec[1] = m0
  for(j in 2:(n+1)){
    mVec[j] = (1-delta)*tsDat[j-1] + delta*mVec[j-1]
  }
  ts(mVec[-1], start=tsPars[1], frequency = tsPars[3])
}




# Ran's Reponse to #4

#(b)
tsEwma2 <- function( tsDat, m0=0, delta=0.7)
{
  tsPars <- tsp(tsDat)
  tsDat <- c(tsDat)
  n <- length(tsDat)
  mVec <- rep(NA,n+1)
  mVec[1] <- m0
  for(j in 2:(n+1)){
    mVec[j] <- (1-delta)*tsDat[j-1] + delta*mVec[j-1]
  }
  ts(mVec[-1], start=tsPars[1], frequency=tsPars[3])
}


#for testing, can try like this
tmp <- ts(rnorm(400000), start=c(1960,3), frequency=12)
system.time(tsEwma2(tmp))
system.time(tsEwma(tmp)) 














