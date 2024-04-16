#Support Vector Regressor (SVR)
set.seed(123)
# to generate example data
help("rnorm")
x <- seq(0, 2*pi, length.out = 100)
y <- sin(x) + rnorm(100, sd = 0.2)

train_index <- sample(1:100, 70)
train_x <- x[train_index]
train_y <-y[train_index]
test_x <- x[-train_index]
test_y <- y[-train_index]

#SVM
library(e1071)
help("svm")
#epsilon in the insensitive-loss function (default: 0.1)
#cost of constraints violation (default: 1)
svr_model <- svm(train_y ~ train_x, kernel = "radial", epsilon = 0.1, cost = 1)

#Here, we are using a radial kernel, setting epsilon to 0.1, and cost to 1
# we can experiment with different values to see how thet affect the model
#we can use the trained model to make predictions on the test data:
predictions <- predict(svr_model, data.frame(train_x = test_x))
#plot the actual and predicted values :
plot(test_x, test_y, main = "SVR Example")
lines(test_x, predictions, col = "red")


#KNN Regressor
set.seed(123)
#creating example data set
x <- seq(0,2*pi, length.out = 100)
y <- sin(x) + rnorm(100, sd = 0.2)

#Next we can split the data into training and testing sets :
train_index <- sample(1:100, 70)
train_x <- x[train_index]
train_y <- y[train_index]
test_x <- x[-train_index] 
test_y <- y[-train_index]

# we can train a KNN regressor on the training data: 
library(class)
knn_model <- knn.reg(train_x, train_y, k = 5)
# Here, we're using a K value of 5.
# You can experiment with different values to see how they affect the model. 
# Finally, we can use the trained model to make predictions on the test data: 
predictions <- knn.reg(train_x, train_y, test_x, k = 5)
plot(test_x, test_y, main = "KNN Regressor Example") 
lines(test_x, predictions, col = "red")
# This should give you a plot of the actual and predicted values. 
# we  can further  adjust the value of K to try to get better predictions.

