#PCA on wine dataset from UCI repo
#Read the data using the read.table()
#Read the documentation for the UCI wine dataset, in the documentation,
# Cvs stands for the "cultivars" (varieties) of the class of the wine,
# cultivar are similar to wine classes Pinot Noir,Shiraz,Muscat
# Goal is to identify the membership of the wine in 1 of 3 cultivars.
# There are 13 variables in the dataset such as Alcohol, Malic acid, Ash, Alkalinity of Ash, Magnesium, ...

wine_data <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep = ",")
# Header row is not available in the data, therefore, we need to add the variable names
head(wine_data)
# The first variable, which is the cultivar that is used to identify the Cv1, Cv2 and Cv3
# Cv1 represent the cultivar1, Cv2 represent the cultivar2 and Cv3 represent the cultivar3,
nrow(wine_data) 
# there are 178 rows
# Adding the variable names
colnames(wine_data) <- c("Cvs","Alcohol", "Malic_Acid", "Ash", "Alkalinity_of_Ash", "Magnesium", "Total_Phenols", "Flavanoids", "Non_Flavanoid_Phenols", "Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", "Proline")
head(wine_data) # to view the replaced header names

#Using the Heatmap() function, we can check the correlations,
# In the heatmap(), the "Dark Colors" represent the "Correlated"
# In the heatmap(), the "Light Colors" represent the "Not or less Correlated"
help("heatmap") # Read the heatmap() function Documentation in RStudio.
# Now we will use the heatmap() function to show the correlation among variables.
heatmap(cor(wine_data),Rowv = NA, Colv = NA)

# Goal is to identify the 3 varieties based on the chemical data on the wine dataset.
# In order to make it easy identify the 3 cultivars, we will declare 3 classes that represents each cultivar(Cv1, Cv2,Cv3) by using the factor() function in R
# Read the documentation in RStudio for the factor() function
help("factor")
#declaring the cultivar_classes using the factor() function each cultivar Cv1,Cv2,Cv3.
cultivar_classes <- factor(wine_data$Cvs)
cultivar_classes

#Now we will use PCA,
#The default built in function in R for PCA is prcomp() function
# Read the documentation of prcomp() function in Rstudio
help(prcomp)

#We will normalize the wine data to a common scale using scale() function so that the PCA process will not
# overweight variables that happen to have the larger values.
# Read the documentation of scale() function in RStudio.
help(scale)
# We will not normalize the Cvs variable (first colume) so we exclude the Cvs column with -1
wine_data_PCA <- prcomp(scale(wine_data[,-1]))
# we can use the summary() function on wine_data_PCA to see the cumulative proportion that each
#principal component(PC) contibutes,
summary(wine_data_PCA)

#Interpretation :
# We can see that PC1 gives the 36.2% cumulative contribution, which tells us that
# PC1 represents 36.2% variance of the data
# Therefore, we can choose to have 8 variables from the total of 13 (choosing 8 out of 13) with only about 8% of loss of cumulative contibution value.



