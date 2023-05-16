# split data with all variables into training/test set
aData <- read.csv("processedDataFinal.csv")
aIdx <- sample(2, size=nrow(aData), replace=TRUE, prob=c(0.7, 0.3))
aTrain <- aData[aIdx==1,]
aTest <- aData[aIdx==2,] 

# split data with selected into training/test set
vData = read.csv('finalData.csv')
vIdx <- sample(2, size=nrow(vData), replace=TRUE, prob=c(0.7, 0.3))
vTrain <- vData[vIdx==1,]
vTest <- vData[vIdx==2,]

# create logistic regression model from all variables
logisticAll <- glm(HOSPITAL ~., data=aTrain, family="binomial")
summary(logisticAll)

# create logistic regression model from selected variables
logisticSel <- glm(HOSPITAL ~ ., data=vTrain, family="binomial")
summary(logisticSel)


# TEST LOGISTIC REGRESSION MODELS

# MODEL WITH ALL VARIABLES
# logistic model with all variables
logAllPreds <- ifelse(predict(logisticAll, newdata=aTest, type="response") > 0.5, 1, 0)
logAllPreds

# Confusion Matrix
confMatAll <- table(Prediction = logAllPreds, Hospitalized = aTest$HOSPITAL)
confMatAll

# Accuracy
logAllAccuracy <- mean(logAllPreds == aTest$HOSPITAL)
logAllAccuracy

aTP <- confMatAll[4]
aTN <- confMatAll[1]
aFP <- confMatAll[2]
aFN <- confMatAll[3]

# Sensitivity
aSensitivity <- aTP / (aTP + aFN)
aSensitivity

# Specificity
aSpecificity <- aTN / (aTN + aFP)
aSpecificity

# Recall
aRecall <- aTP / (aTP + aFN)
aRecall

# Precision
aPrecision <- aTP / (aTP + aFP)
aPrecision

# ROC curve



# MODEL WITH ONLY SELECTED VARIABLES
# logistic model with only important variables determined by variable selection
logSelPreds <- ifelse(predict(logisticSel, newdata=vTest, type="response") > 0.5, 1, 0)
logSelPreds

# confusion matrix
confMatSel <- table(Prediction = logSelPreds, Hospitalized = vTest$HOSPITAL)
confMatSel

# Model accuracy selected variables
logSelAccuracy <- mean(logSelPreds == vTest$HOSPITAL)
logSelAccuracy

sTP <- confMatSel[4]
sTN <- confMatSel[1]
sFP <- confMatSel[2]
sFN <- confMatSel[3]

# Sensitivity
sSensitivity <- sTP / (sTP + sFN)
sSensitivity

# Specificity
sSpecificity <- sTN / (sTN + sFP)
sSpecificity

# Recall
sRecall <- sTP / (sTP + sFN)
sRecall

# Precision
sPrecision <- sTP / (sTP + sFP)
sPrecision

