# split data into training/test set
mData = read.csv('processedData.csv')
View(mData)
idx <- sample(2, size=nrow(mData), replace=TRUE, prob=c(0.7, 0.3))
train <- mData[idx==1,]
test <- mData[idx==2,]

typeof(train$HOSPITAL)

# logistic regression models for prediction hospitalization
logModel1 <- glm(train$HOSPITAL ~ AGE_YRS, data=train, family="binomial")
summary(logModel1)

logModel2 <- glm(train$HOSPITAL ~ AGE_YRS + SEX, data=train, family="binomial")
summary(logModel2)

logModel3 <- glm(train$HOSPITAL ~ AGE_YRS + STATE + SEX, data=train, family="binomial")
summary(logModel3)
