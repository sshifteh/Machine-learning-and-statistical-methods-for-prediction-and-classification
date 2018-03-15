# An introduction to statistical learning with applications in R, Exercise 3.7.14
# This problem focuses on the collinearity problem


# a) creating a linear model in which y is a function of x1 and x2. 
set.seed(1)
x1 = runif(100)
x2 = 0.5*x1+rnorm(100)/10
y = 2+2*x1+0.3*x2+rnorm(100)
lm.fit = lm( y ~ x1+ x2)
summary(lm.fit)

# b) What is the correlation between x1 and x2? 
cor(x1,x2)

# d) Fitting a least squares regression to predict y using only x1.
lm.fit2=lm(y ~ x1)
summary(lm.fit2)

# e) Fitting a least squares regression to predict y using only x2.
lm.fit3=lm(y ~ x2)
summary(lm.fit3)

anova(lm.fit, lm.fit2, lm.fit3)
