#kmeans is an unsupervised machine learning algorithm used for clustering data into k distinct groups based on similarity.
#It partitions the data into clusters such that observations within the same cluster are more similar to each other than to observations in other clusters.
#In R, the kmeans() function is used to perform k-means clustering. It takes as input a dataset and the desired number of clusters (k). Optionally, you can specify other parameters such as the initialization method, maximum number of iterations, and more.
#The kmeans() function iteratively assigns observations to clusters based on their proximity to the cluster centroids and updates the centroids until convergence.

#knn is used for supervised learning tasks like classification and regression,
#while kmeans is used for unsupervised learning tasks like clustering.

data(swiss)
dim(swiss)
head(swiss)
str(swiss)
summary(swiss)
#Performing kmean clustering
sclass <- kmeans(swiss[2:6], 3) 
#swiss[2:6] subsets the swiss dataset to include only columns 2 through 6, which are the variables used for clustering.
#These variables are typically the independent variables used to identify patterns or clusters in the data.
#The 3 specifies the number of clusters (k) that the algorithm should attempt to identify.
#In this case, k = 3 indicates that the algorithm should aim to partition the data into three clusters.
table(sclass$cluster, swiss[,1]) #creates a contingency table to summarize the clustering results. 
#sclass$cluster contains the cluster assignments assigned by the k-means algorithm to each observation in the swiss dataset. 
#Each observation is assigned to one of the k clusters.
#swiss[,1] selects the first column of the swiss dataset.
#This column typically contains the target variable or labels associated with each observation. 
#In this case, it's likely that Fertility is the first column, serving as a potential label for the cantons.
#table() generates a contingency table showing the counts of observations for each combination of cluster assignment and the first column of the swiss dataset. 
#This table provides insight into how the clusters align with the values of the first column (potentially Fertility) and allows for further analysis of the clustering results.
table(sclass$cluster, swiss[,2])
table(sclass$cluster, swiss[,3])
table(sclass$cluster, swiss[,4])
table(sclass$cluster, swiss[,5])
table(sclass$cluster, swiss[,6])

#Performing kmean clustering
sclass <- kmeans(swiss[, -1], 3)
# Visualizing the clusters (example for 2D plot)
plot(swiss[c("Fertility", "Education")], col = sclass$cluster, 
     main = "K-means Clustering of Swiss Dataset",
     xlab = "Fertility", ylab = "Education")
points(sclass$centers[, c("Fertility", "Education"), drop = FALSE], col = 1:3, pch = 8, cex = 2)
legend("topright", legend = 1:3, col = 1:3, pch = 8, title = "Cluster")

#sclass$centers[, c("Fertility", "Education"), drop = FALSE]: This extracts the cluster centers from the sclass object.
#sclass$centers contains the coordinates of the cluster centers identified by the k-means algorithm.
#[, c("Fertility", "Education"), drop = FALSE] subsets the cluster centers to include only the dimensions related to "Fertility" and "Education". The drop = FALSE argument ensures that the result remains a matrix even if it has only one column or row, preventing a subscript out of bounds error.
#col = 1:3: This sets the color of the points to be plotted. In this case, 1:3 indicates that there are three clusters, so each cluster is assigned a color from the palette defined by the numbers 1, 2, and 3.
#pch = 8: This sets the type of point marker to be used. pch = 8 specifies a solid circle marker.
#cex = 2: This sets the size of the points. cex = 2 doubles the size of the points compared to the default size.

#legend("topright", ...): This function adds a legend to the plot.
#"topright" specifies the position of the legend on the plot.
#legend = 1:3: This specifies the labels to be displayed in the legend. In this case, it represents the cluster numbers.
#col = 1:3: This assigns colors to the legend labels. The colors correspond to the colors used for the clusters in the plot.
#pch = 8: This specifies the type of point marker to be used in the legend. pch = 8 corresponds to a solid circle marker.
#title = "Cluster": This sets the title of the legend to "Cluster", indicating the meaning of the labels.
