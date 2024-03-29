# Chapter_4_Line_Graphs_R_Graphics

install.packages("gcookbook")
library(gcookbook)
library(ggplot2)
ls("package:gcookbook") #To view the list of functions in the package
data(package = "gcookbook") #To see the datasets included in the package
?ggplot
ggplot(BOD, aes(x=Time, y=demand)) + geom_line()
BOD #Biochemical Oxygen Demand dataset
BOD1 <- BOD # making a copy of the dataset
BOD1$Time <- factor(BOD1$Time) # converts the "Time" variable into a factor variable
# In R, Factors are used to represent categorical data
# When you convert a variable to a factor, R assigns each unique value in the variable a numeric code, and it retains the original labels as levels.
ggplot(BOD1, aes(x=Time, y=demand, group=1)) + geom_line()
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + ylim(0, max(BOD$demand))
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + expand_limits(y=0)
# Adding points to a line graph
ggplot(BOD, aes(x=Time, y=demand)) + geom_line() + geom_point()

ggplot(worldpop, aes(x=Year, y=Population)) + geom_line() + geom_point()
#same with log-y axis
ggplot(worldpop, aes(x=Year, y=Population)) + geom_line() + geom_point() + scale_y_log10()
