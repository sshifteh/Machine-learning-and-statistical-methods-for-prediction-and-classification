
# An introduction to statistical learning with applications in R, Exercise 3.7.9
# Multiple linear regression on the Auto data set 

# a) Produce a scatterplot matrix which includes all of the variables in the data set. 
library(ISLR)
pairs(Auto)

# b) Compute the matrix of correlations between the variables. 
numeric.columns = sapply(Auto, is.numeric)
cor.matrix = cor(Auto[ ,numeric.columns])
print(cor.matrix)

# c) perform a multiple linear regression with mpg as the response 
# and all other variables except name as the predictors
lm.fit=lm(mpg ~ . -name, data = Auto)
summary(lm.fit)

# c) i) Is there a relatinship between the predictor and the response? 
# High F value -> Yes there is 
# In terms of if the model fits well, the R^2 = 0.8 high so yes, however it might be unreliable.
# But the adjusted R squares = 0.8, so that is a good sign. 
# Some predictors are more important than others based on p- and t-values. 

# ii) Which predictors appear to have significant relationship to the response? 
# weight, year and origin 

# iii) What does the coefficient for the year variable suggest?
# there is a positive relationship between year and mpg, 
# as the cars become newer the mps is higher 
# the older cars have less mpg. So old cars are less efficient, perhaps?
# it is not entirely linear, each year the mpg increases with an estimated 0.75 units of mpg


# d) produce diagnostic plots of the linear regression fit. 
plot(lm.fit)

# e) fit the linear regression models with interaction effects 
lm.fit2=lm(mpg ~ . -name + weight:year, data = Auto)
summary(lm.fit2)

anova(lm.fit, lm.fit2)
lm.fit3 = lm(mpg ~ . -name + weight*origin + weight*year, data = Auto )
summary(lm.fit3)

# Try a few different transformations of the variables, such as log(X), √X, X2.
lm.fit4 = lm(mpg ~ . - name + sqrt(weight), data= Auto)
summary(lm.fit4)


# log(weight) gives poorer F  scores compared with  weight:year
# sqrt(weight) give better F scores than fit2 
# weight*weight give poorer F scores than fit2
