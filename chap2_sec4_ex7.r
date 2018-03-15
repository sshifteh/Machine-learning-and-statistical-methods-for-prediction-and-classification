
# An introduction to statistical learning with applications in R, Exercise 2.4.7

# Clean memory
rm(list=ls(all=TRUE))

# Read data
train.data = data.frame(
  x.1 = c(0,2,0,0,-1,1),
  x.2 = c(3,0,1,1,0,1),
  x.3 = c(0,0,3,2,1,1),
  y = c(r,,r,r,g,g,r)
)

# Test point
test.point=data.frame(x.1=0, x.2=0,x.3=0,y=NA)

# Compute Euclidean distance
train.data[,"dist.to.test.data"] = sapply(1:nrow(train.data), function(i) {sqrt(sum((train.data[i,1:3] - test.point[,1:3])^2))})
train.data



