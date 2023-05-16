# forward variable selection

library(leaps)

vaxFinalV <- read.csv("processedDataFinal.csv")

forward <- regsubsets(HOSPITAL ~ ., data=vaxFinalV, method="forward", nvmax=13)
forwardSum <- summary(forward)


par(mfrow=c(1,3))
#plot of Cp:
plot(forwardSum$cp, xlab="Number of Variables", ylab="Cp", type = 'l')
points(which.min(forwardSum$cp), forwardSum$cp[which.min(forwardSum$cp)], col="red", cex=2, pch=20)
#plot of BIC:
plot(forwardSum$bic, xlab = "Number of Variables", ylab = "BIC", type = 'l')
points(which.min(forwardSum$bic), forwardSum$bic[which.min(forwardSum$bic)], col="red", cex=2, pch=20)
#plot of R square:
plot(forwardSum$adjr2, xlab = "Number of Variables", ylab = "R square", type = 'l')
points(which.max(forwardSum$adjr2), forwardSum$adjr2[which.max(forwardSum$adjr2)], col="red", cex=2, pch=20)


coef(forward, which.min(forwardSum$cp))
coef(forward, which.min(forwardSum$bic))
coef(forward, which.max(forwardSum$adjr2))
     
finalData <- subset(vaxFinalV, select=c(HOSPITAL, AGE_YRS, SEX, L_THREAT, 
                                        ER_VISIT, DISABLE, CUR_ILL, HISTORY,
                                        PRIOR_VAX, ALLERGIES, VAX_MANU,
                                        VAX_DOSE_SERIES))

View(finalData)
dim(finalData)
write.csv(finalData, file="finalData.csv", row.names=FALSE)
