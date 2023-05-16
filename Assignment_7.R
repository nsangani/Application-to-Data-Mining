# install and load required packages
install.packages("DAAG")
library(lattice)
library(DAAG)

cflog <- log(cfseal[, c("heart", "weight")])
names(cflog) <- c("logheart", "logweight")

# Task 1: Below this comment line, you need to make a scatterplot
# for logheart and logweight.

X = cflog$logweight # Independent
Y = cflog$logheart # Dependent

plot(X,Y, xlab='logweight', ylab='logheart')
# abline(lm(Y~X),col="red") # Regression line

# Task 2: Below this comment line, you need to train a lm model

model1 =lm(formula=Y~X)
model1

# Below this line, draw a abline for trained model in the plot
abline(model1)

#Task 3: Below this comment line, draw the summary of the model.
# You may use a proper function to get this summary, and from the
# summary, what do you find (write your answer statement in comment block.)?

summary(model1)


# y = 1.126x + 1.204 # linear model
# As weight increases by one unit, height positively increases by 1.126 unit with intercept of 1.204
# 
# residual:
# min  = -0.31487
# max = 0.32051
# 
# pval (significance value) is very significant with *** < 0.001
# coefficient of determination (variance of weight on height) is 0.9381  (high, meaning model is better fit for the data)
# 
# Risidual SE is 0.1796 # Observed - predicted
# # It shows that we underestimated our prediction, thus the actual weight is little higher than predicted. 




