################################################################################
# Q1 
################################################################################

# setwd() to stored csv file 

# a)
data = read.csv("College.csv")
# print(data)

# b)
dim(data) # 777 rows and 19 columns 

# c)
fix(data)
View(data)
rownames(data)

# d)
rownames(data) = data[,1] # update rownames to col 1
View (data) 

# e)
data =data[,-1]  # removes col1 since now that info is set as rownames
View(data)

# f)
summary(data) # Five number summary of each numerical column 

# g)
Elite =rep("No",nrow(data )) # grabs all data objects with 'No' value
Elite [data$Top10perc >50]=" Yes" # select all data among no with top10perc > 50
Elite =as.factor (Elite)   # quantitative to qualitative
data =data.frame(data ,Elite) # Add col Elite with its data

summary(data) # 78 Elite university 

# h)
hist(data$Top10perc)
hist(data$Top25perc)
hist(data$F.Undergrad)
hist(data$Outstate)

################################################################################
# Q2
################################################################################

# a)
auto = read.csv("Auto.csv")

# b)
dim(auto) # 397 X 9

auto = read.csv("Auto.csv", header = TRUE, na.string = "?") # ? = missing value

# c)
auto = na.omit(auto) # remove rows with missing data 
# sum(!complete.cases(auto)) # [ 5 data points removed]

# d) 
quant = sapply(auto, is.numeric)
sapply(auto[,quant], range)

# There are totol of 8 Numerical cols 
# range(dataset$attributename,finite-TRUE)  # Range using range()
# mean(dataset$attribute) # Mean
# var(dataset$attribute)) # Variance
# sqrt(variance) # Standard Deviation


# e)
sapply(auto[,quant], mean) 
sapply(auto[,quant], sd)

# f) 
sapply(auto[-seq(10:85), quant], range)
sapply(auto[-seq(10:85), quant], mean)
sapply(auto[-c(10:85), quant], sd)

################################################################################
# Q3
################################################################################

"%&%" <- function(a,b) paste(substitute(a),substitute(b))
Hello %&% World
"Hello" %&% "World"

