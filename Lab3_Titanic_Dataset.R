#Installing titanic package
install.packages("titanic")
library(titanic)

data(Titanic)
dim(Titanic)
str(Titanic)
summary(Titanic)
head(Titanic)
View(Titanic)

library(rpart)
library(party)
library(cluster)

#converting dataset to a dataframe
Titanic_df <- as.data.frame(Titanic)
Titanic_df$Survived <- factor(Titanic_df$Survived)

# 1. rpart: Recursive Partitioning and Regression Trees
# Fitting an rpart model
rpart_model <- rpart(Survived ~., data = Titanic_df)

#Plotting the rpart tree
plot(rpart_model)
text(rpart_model)

# 2. ctree: Conditional Inference Trees
# Fitting a ctree model

ctree_model <- ctree(Survived ~., data = Titanic_df)

#Plotting ctree
plot(ctree_model)

# 3. hclust: Hierarchical clustering
# Performing  hierarchical clustering
hclust_model <- hclust(dist(Titanic_df))

#plotting the dendogram
plot(hclust_model)








