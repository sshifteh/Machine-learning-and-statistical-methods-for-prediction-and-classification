# An introduction to statistical learning with applications in R, Exercise 3.7.13
# In this exercise we will create some simulated data and will fit simple linear regression models to it.

# a) Representing a feature X 
set.seed(1)
x=rnorm(100, mean=0,sd=1)

# b) 
eps = rnorm(100, mean=0, sd=0.25)

#c) 
y = -1 +0.5*x+eps
length(y)
#100
#b0 = -1, b1 = 0.5 in this model 

#d) 
plot(x,y)

#e)
lm.fit = lm(y ~ x)
summary(lm.fit)


#f) in terminal 

#g) 
lm.fit2 = lm.fit(y~x+I(x^2))
summary(lm.fit2)
