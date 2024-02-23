# Outlier Examples
# Cars dataset is built in the RStudio
cars
dim(cars)
cars1 <- cars[1:30,] # first 30 rows of the original cars dataset
head(cars1)
summary(cars1$speed)
summary(cars1$dist)
#Now we will introduce some additional data points that are outliers
cars_outliers <- data.frame(speed = c(19,19,20,20,20), dist = c(190,186,210,220,218)) # introduced the outliers manually
head(cars_outliers)
cars2<- rbind(cars1, cars_outliers) # binds the outliers to the cars1 dataset and saves in cars2
head(cars2)
dim(cars2)
# we can observe the dimensions of cars1 was initially (30,2) which has now changed to cars2 (35,2)
help(par) #par can be used to set or query graphical parameters. Parameters can be set by specifying them as arguments to par in tag = value form, or by passing them as a list of tagged values.
#Plotting with the outliers
par(mfrow=c(1,2))
plot(cars2$speed, cars2$dist, xlim=c(0,28), ylim=c(0,230), main="With Outliers",xlab="speed", ylab="dist",
pch="*",col="red",cex=2)
abline(lm(dist~speed, data=cars2), col="blue",lwd=3,lty=2)

#Plot of original data without outliers. Note the change in slope (angle) of best fit line
plot(cars1$speed, cars1$dist, xlim=c(0,28),ylim=c(0,230), main="Outliers removed \n A much better fit ! ",
     xlab="speed",ylab="dist",pch="*",col="red",cex=2)
abline(lm(dist~speed, data=cars1), col="blue",lwd=3,lty=2)

