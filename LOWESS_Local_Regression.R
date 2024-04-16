#LOESS Example from :
#http://r-statistics.co/Loess-Regression-With-R.html
data(economics, package = "ggplot2")
#Creating index variable
economics$index <- 1:nrow(economics) 
economics <- economics[1:80, ] #retail 80rows for better graphical understanding
loessMod10 <- loess(uempmed~index, data = economics, span = 0.10) # 10% smoothing span
loessMod25 <- loess(uempmed~index, data = economics, span = 0.25) # 25% smoothing span
loessMod50 <- loess(uempmed~index, data = economics, span = 0.5) # 50% smoothing span
loessMod70 <- loess(uempmed~index, data = economics, span = 0.7) # 70% smoothing span
loessMod90 <- loess(uempmed~index, data = economics, span = 0.9) # 90% smoothing span

#Predicting Loess

smoothed10 <- predict(loessMod10)
smoothed25 <- predict(loessMod25)
smoothed50 <- predict(loessMod50)
smoothed70 <- predict(loessMod70)
smoothed90 <- predict(loessMod90)

# From above plot, you would notice that as the span increases, 
#the smoothing of the curve also increases.
# Coding for Plot
# Plot it
plot(economics$uempmed, x=economics$date, type="l", main="Loess Smoothing and Prediction", 
     xlab="Date", ylab="Unemployment (Median)")
lines(smoothed10, x=economics$date, col="red") 
lines(smoothed25, x=economics$date, col="green") 
lines(smoothed50, x=economics$date, col="blue")
lines(smoothed70, x=economics$date, col="orange")
lines(smoothed90, x=economics$date, col="yellow")

