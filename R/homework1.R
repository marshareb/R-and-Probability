# SOURCE: http://llc.stat.purdue.edu/2014/29000/projects/project1.html

# SKIPPED 1

# Get the geyser dataframe from MASS
library(MASS)

df <- geyser

# Problem 2a
# Find the average duration
mean(df$duration)

# Problem 2b
# Find the 10 longest durations
# Sort the data, and then grab the last ten digits
sort(df$duration, decreasing=TRUE)[1:10]

# Problem 2c
# Find the number of durations greater than 3
# Subset the dataframe for where duration is bigger than 3, transform it into a vector,
# then call length on that vector
length(subset(df, duration>3)$duration)

# **************************************************************************************

# Save the dataframe for mtcars in df
# mtcars is a default dataset, and so we don't need to call a library to get it
df2 <- mtcars

# Problem 3a
# Find the car(s) with the highest mpg
df2[order(df2$mpg, decreasing=TRUE),][1,]

# Problem 3b
# Find the car(s) with the highest horsepower
df2[order(df2$hp, decreasing=TRUE),][1,]

# Problem 3c 
# Find the car(s) with the shortest 1/4 mile time
df2[order(df2$qsec, decreasing=FALSE),][1,]

# Problem 3d
# Find the number of cars with manual transmission
length(subset(df2, am == 1)$mpg)


# Problem 3e 
# Find the number of cars with manual transmission and six cylinders
length(subset(subset(df2, am==1), cyl==6)$mpg)


# **************************************************************************************
# Problem 4a
# Grab the state data and save it in a dataframe df3
data(state)
df3 <- data.frame(state.x77)

# Keep this a matrix so that we get a dictionary
df4 <- state.x77
# Create a dictionary with population values
pop <- df4[,"Population"]
# Grab Indiana population
indpop <- pop["Indiana"]
# Grab Pennsylvania population
penpop <- pop["Pennsylvania"]

# Number of states
length(subset(subset(df3, Population > indpop), Population < penpop)$Population)
# Which states
subset(subset(df3, Population > indpop), Population < penpop)

# Problem 4b
area <- df4[,"Area"]
# Grab Indiana area
indarea <- area["Indiana"]
# Grab Pennsylvania area
penarea <- area["Pennsylvania"]

# Number of states
length(subset(subset(df3, Area > indarea), Area < penarea)$Population)
# Which states
subset(subset(df3, Area > indarea), Area < penarea)

# *******************************************************************************************

# Problem 5a
# Simulate a normal random variable

# CASE 1:
# 10 observations
sim1 <- rnorm(10, mean = 0, sd = 1)
# Get mean
mean1 <- sum(sim1)/10
# Variance
variance1 <- sum((sim1 - mean1)^2)/10
# Visualization
hist(sim1)

# CASE 2:
# 100 observations
sim2 <- rnorm(100, mean=0, sd=1)
# Get mean
mean2 <- sum(sim2)/100
# Variance
variance2 <- sum((sim2 - mean2)^2)/100
hist(sim2)

# CASE 3:
# 1000 observations
sim3 <- rnorm(1000, mean=0, sd=1)
# Get mean
mean3 <- sum(sim3)/1000
# Variance
variance3 <- sum((sim3 - mean3)^2)/1000
hist(sim3)

# ************************************************************************************
# Problem 6

countas <- function(ls){
  return(sum(sapply(strsplit(ls, ""), function(x) x=="a")[,1]))
}

# ***********************************************************************************
# Problem 7

# Grab the first index where a 3 occurs
firstthree <- function(ls){
  return((1:length(ls))[sapply(ls, function(x) x == 3)][1])
}

# Grab the third index where a 3 occurs
thirdthree <- function(ls){
  return((1:length(ls))[sapply(ls, function(x) x == 3)][3])
}

# *********************************************************************************** 
# Problem 8
# Find the five most occuring values in a list and the number of times they occur
topfive <- function(x){
  return(sort(table(x), decreasing=TRUE)[1:5])
}

# *********************************************************************************** 

# Problem 9 a
# Calculate Eulers number in one line
sum(sapply((0:100),function(x) 1/factorial(x)))

# Problem 9 b
# Calculate Pi in one line
sqrt(sum(sapply((1:100000), function(x) 1/x^2)) * 6)

# ***********************************************************************************

# Problem 10a
# Calculate the first 100 triangular numbers
sapply((1:100), function(x) x * (x+1)/2 )

# Problem 10b
# Calculate the first 100 tetrahedral numbers
sapply((1:100), function(x) x * (x+1) * (x+2)/6)
