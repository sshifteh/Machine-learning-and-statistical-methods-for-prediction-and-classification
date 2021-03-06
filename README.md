# Machine-learning-and-statistical-methods-with-R


This folder contains projects from the book An Introduction to Statistical Learning with applications in R, by James, G. and others. 

*************************************
Project 1: In this project we will write scripts where we create data sets as vectors or load, examine and describe data sets in order to get familiar with the built-in methods and possibilities in R, the files are: 

chap2_sec4_ex7.r : We make our own data set 

chap2_sec4_ex9.r : We use the Auto data set from the ISLR library

chap2_sec4_ex10.r : We use the Bowton data set from the Mass library


********************************
Project 2 Linear regression: This chapter is concerned with prediction based on continues data sets and inferens analysis, that is decide whether there exists a relationship between the target and the predictors,
if so how strong is it? Which predictor affect the target the most and how precisely can we estimate the effect of each predictor? How well can we predict the target? Is there a linear relationship between the predictors and the target? Is there synergy effects? These are some of the questions that are adresses in these projects. 

The projects are: 

chap3_lab.r : We get familiar with some (a very small part) of the functionality for doing linear regression. 

chap3_sec7_ex8.r: We consider the Auto data set in the ISLR library in R to answer a series of questions about the predictors and perform a linear regression based on one predictor. 

chap3_sec7_ex9.r: Next we expand our project on the Auto data set to the multivariate case, including experiments with different transformations of the predictors. 

chap3_sec7_ex10.r: We consider the Carseat data set from the ISLR library and perform multivariate regression. 

chap3_sec7_ex14.r: This problem focuses on the collinearity problem



*******************************
Project 3 Classification: When the response is qualitative, logistic regression can be used. We will consider the logistic regression, linear discriminant analysis (LDA), quadratic discriminant analysis (QDA), and K-nearest neighbour (KNN).

chap4_logisticReg_lab.r: We get familiar with some of the methods in R for classification

chap4_sec7_ex10.r: We use the Weekly data set to predict the movements of the stock market using a logistic regression model and evaluating the results. 

chap4_sec7_ex11.r: We predict whether a given car gets high or low gas mileage based on the Auto data set. We create a training set and a test set and contrast the results from three different models, LDA, QDA and logistic regression. 
It will be beneficial to implement a KNN model in this project as well and test for different values of k. 



********************************
Project 4 Resampling: The data set "interacts" with the model and affect the results. Therefore we want to test and minimize the sensitivity of the model to the data set. To that end we can use resampling. Examples of resampling methods are leave one out cross validation (LOOCV), k-fold cross validation and bootstraping. 





