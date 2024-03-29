#PCA with iris dataset
data("iris")
head(iris)
# creating another dataset from iris dataset that contains the columns from 1 to 4
irisdata1 <- iris[,1:4]
irisdata1
head(irisdata1)
#Read the documentation for the princomp() function in RStudio
help("princomp")
principal_components <- princomp(irisdata1, cor = TRUE, score = TRUE)
# cor = a logical value indicating whether the calculation should
#use the correlation matrix or the covariance matrix
#(The correlation matrix can only be used if there are no constant variables)
#score = a logical value indicating whether the score on
#each principal component should be calculated
summary(principal_components)
# in the summary you can see that it has four principal components, it is because 
#the input data has 4 different features

# with first 2 components capturing almost 95.8% of the data, we can eliminate
#components 3 and 4 because they cover only 4% of the data 
#the reduction from 4 to 2 components refers to dimensionality reduction.

# using the plot() function, we can plot the principal components
plot(principal_components)

#plotting the principal_components using the line in plot() functions
plot(principal_components, type = "l")
#using the biplot() function we can plot the components
# Read the documentation for the biplot() function in the RStudio
help("biplot")
biplot(principal_components)
dim(irisdata1)
