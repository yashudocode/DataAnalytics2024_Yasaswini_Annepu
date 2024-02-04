#Read the csv file
multivariate <- read.csv(file.choose(),header=TRUE)
View(multivariate)
attach(multivariate)
names(multivariate)
multivariate

#Creating  some Scatterplots
plot(Income,Immigrant, main = "Scatterplot")
plot(Immigrant,Homeowners)

#Fitting Linear Models using "lm" function : it creates a linear regression model
help(lm)
mm<-lm(Homeowners~Immigrant)
mm
plot(Immigrant,Homeowners)
help(abline)
abline(mm)
abline(mm, col=2, lwd=3)

summary(mm)
attributes(mm)
mm$coefficients


HP<-Homeowners/Population
PD<-Population/area
mm<-lm(Immigrant~Income+Population+HP+PD)
summary(mm)

plot(Immigrant,Homeowners)

help(abline)
abline(mm)
abline(mm, col=2, lwd=3)

summary(mm)
attributes(mm)
mm$coefficients
