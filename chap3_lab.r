library(MASS)
library(ISLR)

fix(Boston)
names(Boston)
lm.fit = lm(medv~lstat, data =Boston)
summary(lm.fit)
names(lm.fit)
coef(lm.fit)

# To obtain a confidence interval for the coefficient estimates
confint(lm.fit) 

# To obtain conf.interval for prediction of y for a given value of x 
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval = "confidence")
predict(lm.fit, data.frame(lstat=c(5,10,15)), interval = "prediction")

# plot medv and lstat using least squares reg line 
# plot(lstat, medv) fungerer ikke 
plot(medv ~ lstat, data = Boston)
#abline(lm.fit)
# linjen over fungerer ikke 

plot(predict(lm.fit), residuals(lm.fit))

