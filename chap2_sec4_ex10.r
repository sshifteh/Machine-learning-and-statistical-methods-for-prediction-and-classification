# An introduction to statistical learning with applications in R, Exercise 2.4.10
# This exercise is based on the Boston data set 

# Loading in the data set 
rm(list=ls(all=TRUE))
library(MASS)
# learn about the data set 
?Boston 
# The Boston data frame has 506 rows and 14 columns
head(Boston)
dim(Boston)
pairs(Boston)


# How many of the suburbs in this data set bound the Charles river?
dim(Boston[(Boston[,"chas"] == 1),])


# What is the median pupil-teacher ratio among the towns in this data set?
summary(Boston[,"ptratio"])
# 19.05

# Which suburb of Boston has lowest median value of owner- occupied homes?
Boston[(Boston[,"medv"] == min(Boston[,"medv"])),]

# In this data set, how many of the suburbs average more than seven rooms per dwelling?
dim(Boston[(Boston[,"rm"] > 7),])
# 64 suburbs 


