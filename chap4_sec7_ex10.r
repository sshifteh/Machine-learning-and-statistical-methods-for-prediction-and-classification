# An introduction to statistical learning with applications in R, Exercise 4.7.10
# Using the Weekly data set, which is part of the ISLR package.


# a) Producing some numerical and graphical summaries of the Weekly data.
rm(list=ls(all=TRUE))
library(ISLR)
summary(Weekly)
pairs(Weekly)
cor(subset(Weekly, select = -Direction))


# b) Performing a logistic regression with Direction as the response 
# and the five lag variables plus Volume as predictors
glm.fit = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data = Weekly, family = binomial)
summary(glm.fit)
# the Lag2 predictor appear to be significant 


# c) Computing the confusion matrix and overall fraction of correct predictions

y.hat.p = predict(glm.fit, type = "response")
y.hat = rep("Down", length(y.hat.p))
y.hat[y.hat.p > 0.5] = "Up"
table(y.hat, Weekly[,"Direction"])

#y.hat  Down  Up
#Down   54  48
#Up    430 557

# The confusion matrix tells us that 54 observations are true positive, and 557 are true negative (diagonal values)
# whereas 430+48 are predicted in the wrong category (off-diagonal values)

# d) We split the Training data to be observations from period 1990 - 2008,
# and the Test data from observations between 2009 - 2010 
# the only predictor we use in predicting the target is Lag2

Weekly.train = Weekly[(Weekly[,"Year"]<2009),  ]
rownames(Weekly.train) = NULL
Weekly.test = Weekly[!(Weekly[,"Year"]<2009),]
rownames(Weekly.test) = NULL

# We decide that we will use a logistic regression model to start at least 
glm.fit = glm(Direction ~ Lag2, data = Weekly.train, family = binomial)

# We want to use the predictions on the test data set to create a confusion matrix 

y.estimated.1 = predict(glm.fit, Weekly.test, type = "response")
y.estimated = rep("Down", length(y.estimated.1))
# All predictions are considerd Down unless the values are above 0.5 on the sigmoid curve 
y.estimated[y.estimated.1 > 0.5] = "Up"
# Confusion matrix
table(y.estimated, Weekly.test[, "Direction"])
#y.estimated Down Up
#Down   17 13
#Up     26 48

# Prediction accuracy with the testset
mean(y.estimated == Weekly.test[,"Direction"])
# 0.625
#FIXME Which formula is this? 



# Next we want to perform the same evaluations on different models 
# LDA: 
# Obs we have the same split of train and test data sets because we want to compare models
library(MASS)
# train the model using lda 
lda.fit = lda(Direction ~ Lag2, data = Weekly.train)
# evaluate the model using the test data set 
y.estimated.1 = predict(lda.fit, Weekly.test)
y.estimated = y.estimated.1$class
# confusion matrix
table(y.estimated, Weekly.test[, "Direction"])

#y.estimated Down Up
#Down    9  5
#Up     34 56

# in some ways it is better, in others worse 
# accuracy 
mean(y.estimated == Weekly.test[,"Direction"])
# 0.625
# Same accuracy as logistic regression.


# QDA: 
qda.fit = qda(Direction ~ Lag2, data = Weekly.train)
y.estimated.1 = predict(qda.fit, Weefkly.test)
y.estimated = y.estimated.1$class
table(y.estimated, Weekly.test[,"Direction"])
#y.estimated Down Up
#Down    9  5
#Up     34 56
mean(y.estimated == Weekly.test[, "Direction"])
# 0.625
# Conclusion: No better than lda or log.reg


# KNN with k = 1: that is the alg look at one neighbour and based on that one neighbour 
# decides what class the query point belongs to
# KNN with k = 1 will give high varians I think in general  
library(class)
y.estimated = knn(train = as.matrix(Weekly.train[,"Lag2"]),
            test = as.matrix(Weekly.test[,"Lag2"]),
            cl = Weekly.train[,"Direction"],
            k = 1)
table(y.estimated, Weekly.test[, "Direction"])
#y.estimated Down Up
#Down   21 30
#Up     22 31

# This looks more like the gma model for logistic reg. 
mean(y.estimated == Weekly.test[, "Direction"])
# 0.5 
# This method has the highest accuracy. 

# Lets try a different value of k 
y.estimated = knn(train = as.matrix(Weekly.train[,"Lag2"]),
                    test = as.matrix(Weekly.test[,"Lag2"]),
                    cl = Weekly.train[,"Direction"],
                    k = 5)

table(y.estimated, Weekly.test[, "Direction"])
mean(y.estimated == Weekly.test[, "Direction"])
#y.estimated Down Up
#Down   15 21
#Up     28 40  
#accuracy= 0.5288462

