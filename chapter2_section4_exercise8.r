# An introduction to statistical learning with applications in R, Exercise 2.4.8
# In this exercise we will get familiarized with R by exploring the College dataset 
# The College data set has 777 observations on universities and colleges in the US, 
# There are 18 features 

# Task 1: ********************
# Starting with a clean memory 
rm(list=ls(all=TRUE))
# Read in the dataset from the website 
college = read.csv("http://www-bcf.usc.edu/~gareth/ISL/College.csv", header = T)
# Looking at the data set in a spreadsheet 
fix(college)



# Task 2: ******************** 
# Set the 1rst column to be the row names 
rownames(college)=college[,1]
# next remove the row name column
college = college[,-1]
fix(college)



# Task 3: *******************
# Creating a numerical summary of the data set 
summary(college)

# Produce a scatterplot matrix of the first ten columns or variables of the data
pairs(college[,1:10])

# produce side-by-side boxplots of Outstate versus Private
college[,"Private"] = as.factor(college[,"Private"])
plot(college[,"Private"], college[,"Outstate"])

# Create a new qualitative variable, called Elite, by binning the Top10perc variable.
# We are going to divide universities into two groups based on whether or not the proportion
# of students coming from the top 10% of their high school classes exceeds 50 %.

Elite=rep("No",nrow(college))
# Q: is there colleges with 50 students coming from the top 10% of their high school class ?
Elite[college$Top10perc >50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college ,Elite)

summary(college)

# produce side-by-side boxplots of Outstate versus Elite
plot(college[,"Elite"],college[,"Outstate"])

#produce some histograms with differing numbers of bins for a few of the quantitative variables.
hist(college[,"F.undergrad"], breaks = 100)
hist(college[,"P.Undergrad"], breaks = 100)



