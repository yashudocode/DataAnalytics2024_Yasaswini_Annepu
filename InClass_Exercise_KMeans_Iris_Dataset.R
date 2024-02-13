#iris dataset is from UCI ML repository

library(ggplot2) # we will use ggplot2 to visualize the data
head(iris)
str(iris) # take a look at the structure of the iris data using str() function in R.
# dataset has 150 observations equally distributed observations among
# the three species: Setosa, Versicolor and Verginica.

summary(iris) # summary statistics of all 4 variables Sepal.Length,Sepal.Width,Petal.Length,Petal.Width
help("sapply")
sapply(iris[,-5], var)
summary(iris)
#Plot Sepal.Length Vs Sepal.Width using ggplot
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, col = Species)) + geom_point()
# Plot Petal.Length Vs Petal.Width using ggplot
ggplot(iris,aes(x = Petal.Length, y = Petal.Width, col = Species)) + geom_point()
#kmeans clustering
#read the documentation for kmeans() function
# https://stat.ethz.ch/R-manual/R-devel/library/stats/html/kmeans.html
set.seed(300) #gives a set of random 300 numbers which we can use for comparing
k.max<-12

# tot.withinss = Total within-cluster sum of square
# iter.max = the maximum number of iterations allowed
# nstart = if centers is a number, how many random sets should be chosen.
wss<- sapply(1:k.max,function(k){kmeans(iris[,3:4],k,nstart = 20,iter.max = 20)$tot.withinss})
wss 
plot(1:k.max,wss,type = "b", xlab = "Number of cluster(k)",ylab = "Within cluster sum of squares")
icluster<-kmeans(iris[,3:4],3,nstart = 20)
table(icluster$cluster,iris$Species)
# In the table we can see that most of the observations have been clustered correctly
# however, 2 of the versicolor have been put in the cluster with all the virginica
# and 4 of the verginica have been put in cluster 3 which mostly has versicolor.


