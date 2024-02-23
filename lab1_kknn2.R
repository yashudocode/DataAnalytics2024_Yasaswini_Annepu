install.packages("kknn")
library (kknn)
require(kknn)
data(ionosphere) #loads the built-in ionosphere dataset
View(ionosphere)
str(ionosphere)
summary(ionosphere)
head(ionosphere)
tail(ionosphere)
dim(ionosphere)
help(ionosphere)
# Split the Ionosphere dataset into a training set (ionosphere.learn) and a validation set (ionosphere.valid). 
#The first 200 rows are used for training, and the remaining rows are used for validation.
ionosphere.learn <- ionosphere[1:200,]
ionosphere.valid <- ionosphere[-c(1:200),]
#fits a k-nearest neighbors model to predict the class label (class) based on the other variables in the Ionosphere dataset.
#The kknn() function from the kknn package is used for this purpose.
fit.kknn <- kknn(class ~ ., ionosphere.learn, ionosphere.valid)
#creating a contingency table comparing the actual class labels (ionosphere.valid$class) with the predicted labels (fit.kknn$fit) for the validation set.
table(ionosphere.valid$class, fit.kknn$fit)

#Fitting the Model (kknn()):

# Specify the kernel types
kernel_types <- c("triangular", "rectangular", "epanechnikov", "optimal")

# Initialize an empty list to store the fitted models
fitted_models <- list()

# Train the k-nearest neighbors model for each kernel type
for (kernel in kernel_types) {
  # Fit the model
  fit <- kknn(class ~ ., ionosphere.learn, ionosphere.valid,
              kernel = kernel,
              k = 15,
              distance = 1)
  
  # Store the fitted model in the list
  fitted_models[[kernel]] <- fit
}

# Obtain predictions for each model
#The lapply() function is used to apply the fitted() function to each element (model) in the fitted_models list.
#This results in a list predictions containing the predicted class labels for each fitted model.
predictions <- lapply(fitted_models, fitted)

# Create contingency tables for each model
#Another lapply() function is used to apply an anonymous function to each element (set of predictions) in the predictions list.
#Inside the anonymous function, the table() function is used to create a contingency table comparing the predicted class labels with the actual class labels.
#This results in a list confusion_matrices containing the contingency tables for each fitted model.
confusion_matrices <- lapply(predictions, function(pred) table(pred, ionosphere.valid$class))

# Print the confusion matrices
#Finally, a loop is used to iterate over each kernel type in kernel_types.
#Inside the loop, the name of the current kernel type is printed using cat().
#Then, the corresponding confusion matrix (contingency table) is printed using print().
#This loop allows you to print the confusion matrices for each fitted model, along with their respective kernel types.
for (i in seq_along(kernel_types)) {
  cat("Kernel:", kernel_types[i], "\n")
  print(confusion_matrices[[i]])
  cat("\n")
}


# Initialize a list to store the fitted models
fitted_models1 <- list()

# Train the k-nearest neighbors model for each kernel type
for (kernel in kernel_types) {
  # Fit the model
  fit <- kknn(class ~ ., ionosphere.learn, ionosphere.valid,
              kernel = kernel,
              k = 15,
              distance = 2)
  
  # Store the fitted model in the list
  fitted_models1[[kernel]] <- fit
}

# Obtain predictions for each model
predictions <- lapply(fitted_models1, fitted)

# Create contingency tables for each model
confusion_matrices <- lapply(predictions, function(pred) table(pred, ionosphere.valid$class))

# Print the confusion matrices
for (i in seq_along(kernel_types)) {
  cat("Kernel:", kernel_types[i], "\n")
  print(confusion_matrices[[i]])
  cat("\n")
}
