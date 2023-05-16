# str(iris)
# View(iris)

install.packages('party')
install.packages('grid')
install.packages('mvtnorm')
install.packages('modeltools')
install.packages('stats4')
install.packages('strucchange')
install.packages('zoo')
install.packages('sandwich')
install.packages("rpart.plot")

library(grid)
library(mvtnorm)
library(modeltools)
library(stats4)
library(strucchange)
library(zoo)
library(sandwich)
library(party)
library(rpart)

# Train and test split
set.seed(1234)
ind = sample(2, nrow(iris), replace = T, prob = c(0.7, 0.3))
trainData = iris[ind==1,]
trainData = iris[ind==2,]

# make the decision tree based on label Species
myFormula = Species~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_rpart = rpart(myFormula, data = trainData, control = rpart.control(minsplit = 10))

attributes(iris_rpart)

# Summary and prediction
summary(iris_rpart)
print(iris_rpart)

print(iris_rpart$cptable)

# Plot

# plot(iris_rpart)
# text(iris_rpart, use.n=T, cex=.7)

rpart.plot::rpart.plot(iris_rpart)













