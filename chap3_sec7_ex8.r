# An introduction to statistical learning with applications in R, Exercise 3.7.8
# We consider the auto data set to perform linear regression 

# Clean up the memory before we start.
rm(list=ls(all=TRUE))

# Load library
library(ISLR)

# Perform a simple linear regression with mpg as the response and horsepower as the predictor
lm.fit = lm(mpg ~ horsepower, data = Auto)
summary(lm.fit)

#a) i) is there a relationship betweem the predictor and response? 
# Yes beacause the predictor, horsepower, has a very low p -value and high t-value (abs value). 

#a) ii) How strong is the relationship between the predictor and the response 
# R**2 close to 1 is sign of a good model fit. However its more complicated than just that. 
summary(lm.fit)$r.squared
# R^2 = 0.6059483
RSS = sum((Auto[,"mpg"] - lm.fit$fitted.values)^2)
RSE = sqrt(RSS/(392-2))
RSE.percent = RSE/mean(Auto[,"mpg"])
# Or do it in a semi-automatic way.
RSE = summary(lm.fit)$sigma
RSE.percent = RSS/mean(Auto[,"mpg"])
print(RSE)
print(RSS)

# RSE = 4.905757
# RSS = 9385.916

#a) iii) Is the relationship between the predictor and the response positive or negative? 
# Negative mpg = 39.9 - 0.16 horsepower

#a) iv) What is the predicted mpg associated with a horsepower of 98? 
print(39.9-0.16*98)
# 24.22

# What are the associated 95 % confidence and prediction intervals?
predict(lm.fit, data.frame(horsepower = 98), interval = "confidence", level=0.95)
predict(lm.fit, data.frame(horsepower = 98), interval = "prediction", level=0.95)

# b) plot response and predictor and the least squares reg line 
plot(x = Auto[,"horsepower"], y =Auto[,"mpg"], xlab="horsepower", ylab = "mpg")
