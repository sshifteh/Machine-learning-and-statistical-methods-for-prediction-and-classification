# An introduction to statistical learning with applications in R, Exercise 2.4.9
# In this exercise we will get familiarized with R by exploring the Auto dataset 


# Task 1
# Cleaning memory
rm(list=ls(all=TRUE))

# Load the data and open it to have a look 
auto = read.csv("http://www-bcf.usc.edu/~gareth/ISL/Auto.csv", header=T, na.strings="?")
head(auto)
summary(auto)
# 9 features including name of the cars: all quantitative, except name (and origin in a way I think)  

# Examine for missing data 
apply(is.na(auto),2,sum)
# horsepower has 5 rows missing data
# remove the missing data 
auto = na.omit(auto)

# What is the range of each quantitative predictor?
sapply(Filter(is.numeric, auto), range)

# What is the mean and standard deviation of each quantitative predictor?
sapply(Filter(is.numeric, auto), mean)
sapply(Filter(is.numeric, auto), sd)

# Now remove the 10th through 85th observations.
auto.2 = auto[-(10:85),]
rownames(auto.2) = NULL

# What is the range, mean, and standard deviation of each predictor now.
sapply(Filter(is.numeric, auto), mean)
sapply(Filter(is.numeric, auto), sd)
sapply(Filter(is.numeric, auto), range)

# Using the full data set, investigate the predictors graphically.
pairs(auto)

# mpg has what looks like a lienar or exponential decaying relationship with displacement, horsepower and weight. 
# mpg has a growing relationship when a function of acceleration, year , origin
