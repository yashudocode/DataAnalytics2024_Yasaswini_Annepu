# ISLR Package (ISRL 7th Edition Textbook )
# KMeans example with Iris dataset
# KMeans is an Unsupervised technique 
library(ISLR)
head(iris)
str(iris)
#loading the ggplot2 package
library(ggplot2)

# visually inspecting the three factors: Species clusters with a plot
plot1 <- ggplot(iris, aes(Petal.Length,Petal.Width, color=Species))
print(plot1 + geom_point(size=3))

# set seed for the random numbers
set.seed(101)
# Read the documentation for KMeans in R-Studio
help("kmeans")

irisClusters <- kmeans(iris[,1:4], 3, nstart = 20) # nstart is the number of random start
print(irisClusters)
table(irisClusters$cluster,iris$Species)
# plotting the clusters
library(cluster)
help("clusplot")
clusplot(iris,irisClusters$cluster, color = TRUE, shade = TRUE, labels = 0, lines = 0)
#color = TRUE: This parameter indicates whether to color the points according to their cluster assignment.
#When set to TRUE, each cluster will be assigned a different color.

#shade = TRUE: If set to TRUE, the function will add ellipses around the clusters to illustrate the cluster shapes.

#labels = 0: This parameter controls the display of point labels. Setting it to 0 means no labels will be shown.

#lines = 0: This parameter controls the display of reference lines. Setting it to 0 means no reference lines will be shown.

clusplot(iris,irisClusters$cluster, color = TRUE, shade = TRUE, labels = 1, lines = 1)
#labels = 1: When labels is set to 1, it instructs the function to display point labels for each observation in the plot.
#These labels typically correspond to row names or index numbers of the data points. 
#This can be useful for identifying individual observations in the plot.

#lines = 1: Similarly, when lines is set to 1, it tells the function to display reference lines on the plot. 
#These reference lines typically represent the cluster centers or centroids.
#They can provide additional insight into the spatial distribution of the clusters and their relationships to each other.

