#Getting Started : Rstudio

install.packages("MASS")
library(MASS)
attach(Boston) #attaching a dataset Boston
?Boston
head(Boston) 
dim(Boston) #dimensions of dataset
names(Boston) #columns names
str(Boston) #shows structure of dataset
nrow(Boston) #displays no. of rows
ncol(Boston) #displays no. of columns
summary(Boston)
summary(Boston$crim) #displays the summary of crime column in the Boston dataset


install.packages("ISLR")
library(ISLR)
data(Auto)
head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
boxplot(Auto$mpg)
hist(Auto$mpg)

summary(Auto$horsepower) 
summary(Auto$weight)
fivenum(Auto$weight)
boxplot(Auto$weight) 
mean(Auto$weight)
median((Auto$weight))
