#Install party packages
install.packages("party")
library(party)
#Using the swiss dataset
swiss
dim(swiss)
str(swiss)
summary(swiss)
head(swiss)
View(swiss)

pairs(~ Fertility + Education + Catholic, data = swiss, subset = Education < 20, main = "Swiss data, Education < 20")
require(party)
swiss_ctree <- ctree(Fertility ~ Agriculture + Education + Catholic, data = swiss)
plot(swiss_ctree)


