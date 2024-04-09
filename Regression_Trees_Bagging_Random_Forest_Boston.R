# Fitting a Regression Trees
library(MASS)
library(tree)
set.seed(1)
head(Boston)
train = sample(1:nrow(Boston), nrow(Boston)/2)
# medv = median value of owner occupied homes in \$1000s
tree.boston = tree(medv~., Boston, subset = train)
summary(tree.boston)
# Note that the output summary() indicates that only three of the variables have been
# used to constructing the tree. In the context of a regression tree,
# the deviance is simply the sum of squared errors for the tree.

#Regression Tree
tree(formula = medv~., data = Boston, subset = train)

#we now plot the tree
plot(tree.boston)
text(tree.boston, pretty = 0)
# The variable "lstat" measure the percentage of the individuals with lower socioeconomics status.
# The tree indicates that the lower values of lstat corresponds to more expensive house.

# Now we use the cv.tree() function to see whether pruning the tree will
# improve performance.
cv.boston = cv.tree(tree.boston)
plot(cv.boston$size, cv.boston$dev, typ = 'b')
#In this case, the most complex tree is selected by cross-validation.
# However, if we wish to prune the tree, we could do so as follows,
#using the prune.tree() function

prune.boston = prune.tree(tree.boston, best = 5)
plot(prune.boston)
text(prune.boston, pretty = 0)
# In keeping with the cross-validation results,
# we use the unpruned tree to make predictions on the test set.
yhat = predict(tree.boston, newdata=Boston[-train, ])
boston.test = Boston[-train, "medv"]
plot(yhat, boston.test)
#adding the abline()
abline(0,1)
mean((yhat-boston.test)^2)


#Baggibg and Random Forest Example
library(randomForest)
set.seed(1)
bag.boston = randomForest(medv~., data=Boston, subset = train, mtry = 13, importance = TRUE)
bag.boston
# The argument mtry=13 indicates that all 13 predictors should be considered 
# for each split of the tree—in other words, that bagging should be done.
# How well does this bagged model perform on the test set?
yhat.bag = predict(bag.boston ,newdata=Boston[-train ,])
plot(yhat.bag, boston.test)
# adding the abline()
abline(0,1) 
mean((yhat.bag-boston.test)^2)
set.seed(1)
rf.boston = randomForest(medv~., data = Boston, subset =train, 
                         mtry = 6, importance = TRUE)
yhat.rf = predict(rf.boston, newdata = Boston[-train, ])
mean((yhat.rf-boston.test)^2)

# Using the importance() function, we can view the importance of each variable.
importance (rf.boston)
# Two measures of variable importance are reported.
#The former is based upon the mean decrease of accuracy in predictions on 
# the out of bag samples when a given variable is excluded from the model. 
#The latter is a measure of the total decrease in node impurity that results
# from splits over that variable, averaged over all trees.

# In the case of regression trees, the node impurity is measured by the training RSS,
# and for classification trees by the deviance.
# Plots of these importance measures can be produced using the varImpPlot() function. 
varImpPlot (rf.boston)




