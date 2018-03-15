# An introduction to statistical learning with applications in R, 
# Chapter 4 Lab: Logistic regression, 


library(ISLR)
names(Smarket)
dim(Smarket)
summary(Smarket)
pairs(Smarket)
cor(Smarket)
# Error: direction variable is qualitative 
cor(Smarket[,-9])


# Fitting a logistic regression model in order to predict Direction using Lag1 through Lag5 and Volume
glm.fits = glm(Direction ~ Lag1+Lag2+Lag3+Lag4+Lag5+Volume, data=Smarket, family=binomial)
summary(glm.fits)
# The smallest p-value here is associated with Lag1. Beta1 = -0.13, 
# The negative coefficient
# for this predictor suggests that if the market had a positive return yesterday, 
# then it is less likely to go up today.

# However, at a value of 0.15, the p-value is still relatively large, 
# and so there is no clear evidence of a real association between Lag1 and Direction



# Use the coef() function in order to access just the coefficients for this fitted model.
coef(glm.fits)


# The predict() function can be used to predict the probability that the market will go up, 
# given values of the predictors
glm.probs = predict(glm.fits, type="response")
glm.probs[1:10]


# create a vector of class predictions based on 
# whether the predicted probability of a market increase 
# is greater than or less than 0.5
contrasts(Direction)
glm.pred = rep("Down", 1250)
glm.pred[glm.probs > 0.5] = "Up"
table(glm.pred, Direction)
#FIXME 

train= (Year <2005)
Smarket .2005 = Smarket[!train,]
dim(Smarket .2005)






