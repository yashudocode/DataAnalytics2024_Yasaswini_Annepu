# Load the kknn package
library(kknn)
data(swiss)
View(swiss)
str(swiss)
summary(swiss)
dim(swiss)

#generates a pairs plot for a subset of the swiss dataset where the Education variable is less than 20, focusing on the relationships between Fertility, Education, and Catholic.
pairs(~ Fertility + Education + Catholic, data = swiss, subset = Education < 20, main = "Swiss data, Education < 20")

# Define the target variable and predictor variables
target_variable <- "Education"
predictor_variables <- c("Fertility", "Catholic")

# Split the dataset into training and testing sets
set.seed(123) # for reproducibility
train_indices <- sample(nrow(swiss), 0.7 * nrow(swiss)) # 70% for training
train_data <- swiss[train_indices, ]
test_data <- swiss[-train_indices, ]

# Perform k-nearest neighbors classification
#fit <- kknn(...): This line creates a k-nearest neighbors model and assigns it to the variable fit.
#as.formula(...): This function constructs a formula object that specifies the relationship between the target variable and predictor variables.
#paste(target_variable, "~", paste(predictor_variables, collapse = " + ")): This line constructs a formula string by concatenating the target variable (Education) with the predictor variables (Fertility and Catholic). The collapse argument of paste() joins the predictor variables with a " + " separator.
#train_data, test_data: These are the training and testing datasets used to fit the model and make predictions, respectively.
#k = 5: This specifies the number of nearest neighbors to consider when making predictions.
fit <- kknn(as.formula(paste(target_variable, "~", paste(predictor_variables, collapse = " + "))),
            train_data, test_data, k = 5)

# Obtain predictions
predictions <- fitted(fit)

# Evaluate the model
#mean(...) calculates the proportion of correct predictions by averaging the logical vector resulting from the comparison (predictions == test_data$Education), 
#where TRUE indicates a correct prediction and FALSE indicates an incorrect prediction.
accuracy <- mean(predictions == test_data$Education) #calculates the accuracy of the model by comparing the predicted values (predictions) with the actual values (test_data$Education) in the testing dataset.
print(paste("Accuracy:", accuracy))
