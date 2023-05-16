
#-------------------------------------------------------------------------------
# Question #1
#-------------------------------------------------------------------------------

girls = 1000
mean_weight_girls = 100 #lbs
sd = 100
confidence_level = 1.96

# 95% Confidence Level
# Confidence Interval: Sample Mean ± Margin of Error

SE = sd/mean_weight_girls
# Correction
SE = sd/sqrt(girls)
Margin_of_Error = 1.96*SE

confidence_interval_upper_bound = mean_weight_girls + Margin_of_Error
confidence_interval_lower_bound = mean_weight_girls - Margin_of_Error
confidence_interval_lower_bound
confidence_interval_upper_bound

# I'm confident that there is 95% chance for the true mean weight of girls is within 98.04 - 101.96 lbs range.

#-------------------------------------------------------------------------------
# Question #2
#-------------------------------------------------------------------------------

vector.a = c(1:20) # or seq(1,20,1)
vector.a
vector.b = sort(vector.a, decreasing = TRUE) # or seq(20,1,-1)
vector.b
tmp = c(4,6,3)  # c
?rep
vector.d = rep(tmp, 10)
vector.d
vector.e = c(rep(4,10),rep(6,20),rep(3,30))
vector.e
vector.f = c(vector.a, (seq(19,1,-1)))
vector.f

#-------------------------------------------------------------------------------
# Question #3
#-------------------------------------------------------------------------------

# Given
set.seed(50)
xVec <- sample(0:999, 250, replace=T) # total 250 values each vector
yVec <- sample(0:999, 250, replace=T) 

# a)
yVec[-1] - xVec[-length(xVec)] # removed first value in yVec( y2 = first index) and removed last from xVec; (yn - xn-1)

# b)
sin(yVec[-length(yVec)]) / cos(xVec[-1]) # opposite from earlier, remove first value of xVec and last from yVec, then use sin and cos with mathematical operator

#c)

xVec_length <- length(xVec) # 250
xVec[-c(xVecLen-1,xVec_length)] + 2*xVec[-c(1,xVec_length)] - xVec[-c(1,2)] 
# xVec[-c(249,250)] ; here I'm removing last two index using [-c(..,..)] indexing
#  2*xVec[-c(1,250)] ; Multiplying 2 to xVec which removed first (so x2 => x1 position and last element to normalize into same size vector
# Last xVec[-c(1,2)]  ; to remove first two element to set x3 => x1
# Now put everything together using mathematical operators to get the result

# Correction:
xVec[-c(xVec_length-1,xVec_length)] + 2*xVec[-c(1,xVec_length)] - xVec[-c(1,2)] 

#d) 
sum(exp(-xVec[-1])/(xVec[-length(xVec)]+10)) 
# -xi + 1 , where i = 1, simply saying set x2 => x1 , so we remove the first element from the xVec
# Since we removed one value, to normalize the denominator, simply remove the last element, then add 10

#-------------------------------------------------------------------------------
# Question #3
#-------------------------------------------------------------------------------

# a)
yVec[yVec>600] 

# b)
(1:length(yVec))[yVec>600] # index position of values greater than 600

# c)
xVec[yVec>600]

# d)
sqrt(abs(xVec-mean(xVec))) # I believe there is a typo in the first index of the example it should be |(x1 - mean(x))|^ 1/2

# e)
sum( yVec>max(yVec)-200 ) # Values within 200 of max(yVec), so maximum value in y vector - 200. then count how many (sum) values are bigger than that value in yVec

# f)
sum(xVec%%2==0) # logical operator to get the reminder = o, so it means divisible

# g)
xVec[order(yVec)] 

# h)

h = NULL
for ( i in seq(from = 1, to = length(yVec), by = 3)) {
  h = append(h, yVec[i])
} 

# get the value of every third index from start to end => 1,4,7,...

h
































