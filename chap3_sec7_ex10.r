
# An introduction to statistical learning with applications in R, Exercise 3.7.10 
# About the Carseat dataset 

# a) Fit a multiple regression model to predict Sales using Price, Urban, and US
library(IRSL)
lm.fit = lm(Sales~Price+Urban+US, data=Carseats)
summary(lm.fit)

#b) UrbanYes is not significant and it has a negative relationship with Sales
attach(Carseats)
constrasts(Urban)

#c) see paper sheet 

#d) urban predictor 

#e)On the basis of your response to the previous question, fit a
#smaller model that only uses the predictors for which there is
#evidence of association with the outcome.
lm.fit2=lm(Sales ~ Price + US, data = Carseats)
summary(lm.fit2)

#f) How well do the models in (a) and (e) fit the data?
anova(lm.fit, lm.fit2)
# not well 

#g) Using the model from (e), obtain 95% confidence intervals for the coefficient(s).
confint(lm.fit2)

#h)
#FIXME plotting not working 
plot(lm.fit2)

