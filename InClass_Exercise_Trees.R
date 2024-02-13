#Call the NaiveBayes Classifier Package e1071, which auto calls the Class Package
library("e1071")
classifier<-naiveBayes(iris[,1:4],iris[,5])
table(predict(classifier,iris[,5]), iris[,5],dnn = list('predicted','actual'))
classifier$apriori
classifier$tables$Petal.Length
plot(function(x)dnorm(x,1.462,0.1736640),0,8,c0l="red",
     main="Petal length distribution for 3 different species")
curve(dnorm(x,4.260,0.4699110), add = TRUE, col = "blue")
curve(dnorm(x,5.552,0.5518947), add = TRUE, col = "green")


#Decision Trees
#Classification 
install.packages(rpart.plot)
library(rpart)
library(rpart.plot)

# We are using iris data set
iris
dim(iris) # checks dimensions of the iris dataset
str(iris)
summary(iris)
head(iris)

#creating a sample from the irirs datset
s_iris <- sample(150,100)
s_iris
length(s_iris)

#CReating testing and training sets

iris_train<-iris[s_iris,]
iris_test<-iris[-s_iris,]
dim(iris_train)
dim(iris_test)

#generate the decision tree model
decisiontreemodel<-rpart(Species~., iris_train, method = "class")
#decisiontreemodel<-rpart(Species.Length+Sepal.Width+Petal.Length+Petal.Width+Sepal, iris_train, method = "class")
decisiontreemodel

#plotting the decision tree model
rpart.plot(decisiontreemodel)

