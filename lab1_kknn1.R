install.packages("kknn")
library(kknn)
require(kknn) #The require() function is similar to library(), but it returns a logical value indicating whether the package is available or not.
#It's not necessary to use require() after already loading the package with library().

data(iris) #loads the built-in Iris dataset 
m <- dim(iris)[1] #calculates the number of rows in the Iris dataset 
#dim(iris) returns the dimensions of the dataset as a vector, and [1] extracts the number of rows.
val <- sample(1:m, size = round(m/3), replace = FALSE, 
	prob = rep(1/m, m)) #creates a validation set by randomly sampling approximately one-third of the rows from the Iris dataset (iris) without replacement.
#The sample() function is used for random sampling, and round(m/3) calculates the size of the sample. The prob argument specifies the probability of selecting each row, which is equal for each row in this case.
iris.learn <- iris[-val,]
iris.valid <- iris[val,] #splits the Iris dataset into a training set (iris.learn) and a validation set (iris.valid).
#Rows selected by val are used for validation, while the rest are used for training.
iris.kknn <- kknn(Species~., iris.learn, iris.valid, distance = 1,
	kernel = "triangular") #fits a k-nearest neighbors model to predict the species (Species) based on the other variables (features)
# The kknn() function from the kknn package is used for this purpose. 
#The distance argument specifies the distance metric to be used (in this case, Euclidean distance with distance = 1). 
#The kernel argument specifies the weighting kernel to be used in the k-nearest neighbors algorithm (in this case, the triangular kernel).
summary(iris.kknn)
fit <- fitted(iris.kknn) #obtains the predicted species labels for the validation set based on the fitted k-nearest neighbors model.
table(iris.valid$Species, fit) #creates a contingency table comparing the actual species labels (iris.valid$Species) with the predicted labels (fit) for the validation set.
pcol <- as.character(as.numeric(iris.valid$Species)) #converts the species labels in the validation set (iris.valid$Species) to numeric values and then converts them to character strings.
pairs(iris.valid[1:4], pch = pcol, col = c("green3", "red")[(iris.valid$Species != fit)+1])
#creates a matrix of scatterplots for pairwise combinations of the first four variables (features) in the validation set (iris.valid[1:4]).
#The points in the scatterplots are colored based on the actual species labels, with green representing one species and red representing another species. 
#Points that are misclassified by the k-nearest neighbors model are highlighted in a different color.

