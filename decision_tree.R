# load the data


mData = read.csv('processedDataFinal.csv')
# View(mData)
dim(mData) # 4112 14

# Split train and test 
aIdx <- sample(2, size=nrow(mData), replace=TRUE, prob=c(0.7, 0.3))
mData_train <- mData[aIdx==1,]
mData_test <- mData[aIdx==2,]

# Dimension of train and test data
dim(mData_test) # 1218 14
dim(mData_train) # 2894 14

# import library for decision tree construction
library(rpart)
library(rpart.plot)

# Decision tree model 
set.seed(123)
dtm = rpart(HOSPITAL~., mData_train, method="class")
rpart.plot(dtm, type=5, extra=106, main="Classification Tree")

# Prediction of Hospitalization using test data
pred = predict(dtm, mData_test, type = "class")

# Confusion matrix of results
confMatSel = table(mData_test$HOSPITAL,pred)

sTP <- confMatSel[4]
sTN <- confMatSel[1]
sFP <- confMatSel[2]
sFN <- confMatSel[3]

# Sensitivity
sSensitivity <- sTP / (sTP + sFN)
sSensitivity

# Accuracy
aAccuracy <- (sTP+sTN)/(sTP+sTN+sFP+sFN)
aAccuracy

# Specificity
sSpecificity <- sTN / (sTN + sFP)
sSpecificity

# Recall
sRecall <- sTP / (sTP + sFN)
sRecall

# Precision
sPrecision <- sTP / (sTP + sFP)
sPrecision


# Pruning the Decision Tree

# Selection of cp value using least cross-validated error to prune the tree
printcp(dtm)

# Plot of Complexity parameter(cp)
#plotcp(dtm)

# Optimal Tree size using complexity parameter and least cross validation error
# Tp avoid any overfitting of the data 
ptree = prune(dtm,cp= dtm$cptable[which.min(dtm$cptable[,"xerror"]),"CP"])
ptree = rpart.plot(ptree,type=5, extra=106, main="Pruned Classification Tree")




