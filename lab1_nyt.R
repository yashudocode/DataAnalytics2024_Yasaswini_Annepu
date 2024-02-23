#Reading a csv file nyt1.csv
nyt1<-read.csv(file.choose(),header = TRUE)
View(nyt1)
dim(nyt1)
str(nyt1)
summary(nyt1)
head(nyt1)

library(class)
help(class)
# We will be pre processing the data, split it into training and testing sets, perform k-nearest neighbors classification, and display the classification results. 
# The classification is based on the Age and Impressions features, with Gender as the target variable.

# Firstly, filtering  the dataframe nyt1 to include only rows where the Impressions, Clicks, and Age columns are all greater than 0.
nyt1<-nyt1[which(nyt1$Impressions>0 & nyt1$Clicks>0 & nyt1$Age>0),] #filters the dataframe nyt1 to include only rows where the Impressions, Clicks, and Age columns are all greater than 0.
nnyt1<-dim(nyt1)[1]		# shrink it down!, calculates the number of rows in the filtered dataframe nyt1 and stores it in the variable nnyt1.
sampling.rate=0.9 #setting the sampling rate to 90%, meaning that 90% of the data will be used for training, and the remaining 10% will be used for testing.
num.test.set.labels=nnyt1*(1-sampling.rate) #calculates the number of test set labels based on the sampling rate. It determines how many labels will be used for testing.
training <-sample(1:nnyt1,sampling.rate*nnyt1, replace=FALSE) #randomly samples 90% of the indices of the filtered dataframe nyt1 without replacement to create the training set.
train<-subset(nyt1[training,],select=c(Age,Impressions)) #subsets the nyt1 dataframe using the indices in the training set and selects only the Age and Impressions columns. This creates the training dataset.
testing<-setdiff(1:nnyt1,training) #creates a set of indices for the testing set by taking the difference between all indices and the indices in the training set.
test<-subset(nyt1[testing,],select=c(Age,Impressions)) #subsets the nyt1 dataframe using the indices in the testing set and selects only the Age and Impressions columns. This creates the testing dataset.
cg<-nyt1$Gender[training] #extracts the Gender column from the nyt1 dataframe for the rows corresponding to the training set indices. This will be used as the class labels for training.
true.labels<-nyt1$Gender[testing] #extracts the Gender column from the nyt1 dataframe for the rows corresponding to the testing set indices. These are the true class labels for testing.
classif<-knn(train,test,cg,k=5) #performs k-nearest neighbors classification using the knn function. It takes the training data (train), testing data (test), class labels for training (cg), and specifies k = 5 nearest neighbors.
classif #displays the classification results obtained from the k-nearest neighbors algorithm.
attributes(.Last.value) #displays the attributes of the last value, which is the classif object containing the classification results.

# Plot the actual vs. predicted classes
plot(true.labels, classif, 
     xlab = "True Labels", ylab = "Predicted Labels", 
     main = "Actual vs. Predicted Classes", 
     col = ifelse(true.labels == classif, "green", "red"))
#creates a scatter plot where the x-axis represents the true labels and the y-axis represents the predicted labels. 
#Points that are correctly classified will be plotted in green, while misclassified points will be plotted in red.
