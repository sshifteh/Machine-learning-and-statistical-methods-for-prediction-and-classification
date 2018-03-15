# An introduction to statistical learning with applications in R, Exercise 4.7.11
# In this problem, we will develop a model to predict whether 
# a given car gets high or low gas mileage based on the Auto data set

# a) Create a binary variable, mpg01, that contains a 1 if mpg contains a value above its median, 
# and a 0 if mpg contains a value below its median

rm(list=ls(all=TRUE))
library(ISLR)
Auto[,"mpg01"] = rep(0, length(Auto[,"mpg"]))
Auto[(Auto[,"mpg"] > median(Auto[,"mpg"])), "mpg01"] = 1
head(Auto)
#fix(Auto)

# b) Which of the other features seem most likely to be useful in predicting mpg01?
cor(subset(Auto, select = -name))
# mpg has highest correlation with displacement (-0.81), weight (-0.83), horsepower (-0.78) and cylinders (-0.78)

# c) Splitting the data set into a training and a test set 
set.seed(2017)
Auto.train.index = sample.int(n = nrow(Auto), size = round(nrow(Auto)/2))
Auto.train = Auto[Auto.train.index,]
rownames(Auto.train) = NULL
Auto.test = Auto[-Auto.train.index,]
rownames(Auto.test) = NULL



# LDA: 
lda.fit = lda(mpg ~ displacement+weight+horsepower+cylinders, data = Auto.train) 
y.estimated.1 = predict(lda.fit, Auto.test)
y.estimated = y.estimated.1$class

table(y.estimated, Auto.test[,"mpg01"])
1 - mean(y.estimated == Auto.test[,"mpg01"])



# QDA: 
qda.fit = qda(mpg ~ displacement+weight+horsepower+cylinders, data = Auto.train)
y.estimated.1 = predict(qda.fit, Auto.test)
y.estimated = y.estimated.1$class
table(y.estimated, Auto.test[,"mpg01"])
1 - mean(y.estimated == Auto.test[,"mpg01"])


# Logistic regression: 
glm.fit = glm(mpg01 ~ cylinders + displacement + horsepower + weight, data = Auto.train, family = binomial)
y.estimated.1 = predict(glm.fit, Auto.test, type = "response")
y.estimated = rep(0, length(y.estimated.1))
y.estimated[y.hat.p > 0.5] = 1
table(y.estimated, Auto.test[,"mpg01"])
1 - mean(y.estimated == Auto.test[,"mpg01"])

#y.estimated   0   1
#           0 101  95

# test error = 0.4846939



# FIXME DO knn for diff k values. 
