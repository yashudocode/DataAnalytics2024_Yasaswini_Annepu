myData<-read.csv(file.choose(),header=TRUE)
View(myData)
attach(myData)
ContinentName
plot(ContinentName)
PopulationPerUnit
plot(PopulationPerUnit)
Area
plot(Area)
data()
help(data)
 
PopulationPerUnit
tf<-is.na(PopulationPerUnit)
P<-PopulationPerUnit[!tf]
summary(PopulationPerUnit)
fivenum(PopulationPerUnit,na.rm=TRUE)
stem(PopulationPerUnit)
hist(PopulationPerUnit)
hist(PopulationPerUnit,seq(30.,95.,1.0),prob=TRUE)
lines(density(PopulationPerUnit,na.rm=TRUE,bw="SJ"))
rug(PopulationPerUnit)
plot(ecdf(PopulationPerUnit),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(PopulationPerUnit); qqline(PopulationPerUnit)

ContinentName
summary(ContinentName) 

Area
plot(Area)
tf<-is.na(Area)
A<-Area[!tf]
summary(Area)

