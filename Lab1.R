#Reading a csv file
data_EPI<-read.csv(file.choose(),header=TRUE)
View(data_EPI)
#Replacing the default dataframe name
names(data_EPI) <- as.matrix(data_EPI[1, ])
data_EPI <- data_EPI[-1, ]
data_EPI[] <- lapply(data_EPI, function(x)type.convert(as.character(x)))
data_EPI 
View(data_EPI)
attach(data_EPI)
fix(data_EPI)
 
#Exploring various distributions
EPI
tf<-is.na(EPI)
E<-EPI[!tf]
summary(EPI)
fivenum(EPI,na.rm=TRUE)
stem(EPI)
hist(EPI)
hist(EPI,seq(30.,95.,1.0),prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw="SJ"))
rug(EPI)
plot(ecdf(EPI),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(EPI); qqline(EPI)

DALY
tf<-is.na(DALY)
D<-DALY[!tf]
summary(DALY)
fivenum(DALY,na.rm=TRUE)
stem(DALY)
hist(DALY)
lines(density(DALY,na.rm=TRUE,bw="SJ"))
rug(DALY)
plot(ecdf(DALY),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(DALY); qqline(DALY)

WATER_H
tf<-is.na(WATER_H)
W<-WATER_H[!tf]
summary(WATER_H)
fivenum(WATER_H,na.rm=TRUE)
stem(WATER_H)
hist(WATER_H)
hist(WATER_H, seq(30., 95., 1.0), prob=TRUE)
lines(density(WATER_H,na.rm=TRUE,bw="SJ"))
rug(WATER_H)
plot(ecdf(WATER_H),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(WATER_H); qqline(WATER_H)
 
#Compring distributions
boxplot(EPI,DALY)
qqplot(EPI,DALY)

ENVHEALTH
tf<-is.na(ENVHEALTH)
EH<-ENVHEALTH[!tf]
summary(ENVHEALTH)
fivenum(ENVHEALTH,na.rm=TRUE)
stem(ENVHEALTH)
hist(ENVHEALTH)
hist(ENVHEALTH, seq(30., 95., 1.0), prob=TRUE)
lines(density(ENVHEALTH,na.rm=TRUE,bw="SJ"))
rug(ENVHEALTH)
plot(ecdf(ENVHEALTH),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(ENVHEALTH); qqline(ENVHEALTH)

boxplot(EPI,ENVHEALTH)
qqplot(EPI,ENVHEALTH)

boxplot(ENVHEALTH,DALY)
qqplot(ENVHEALTH,DALY)

AIR_H
tf<-is.na(AIR_H)
EH<-AIR_H[!tf]
summary(AIR_H)
fivenum(AIR_H,na.rm=TRUE)
stem(AIR_H)
hist(AIR_H)
hist(AIR_H, seq(30., 95., 1.0), prob=TRUE)
lines(density(AIR_H,na.rm=TRUE,bw="SJ"))
rug(AIR_H)
plot(ecdf(AIR_H),do.points=FALSE, verticals = TRUE)
par(pty="s")
qqnorm(AIR_H); qqline(AIR_H)

ECOSYSTEM
tf<-is.na(ECOSYSTEM)
EC<-ECOSYSTEM[!tf]
summary(ECOSYSTEM)
fivenum(ECOSYSTEM,na.rm=TRUE)
stem(ECOSYSTEM)
hist(ECOSYSTEM)
lines(density(ECOSYSTEM,na.rm=TRUE,bw="SJ"))
rug(ECOSYSTEM)
plot(ecdf(ECOSYSTEM,do.points=FALSE, verticals = TRUE))
par(pty='s')
qqnorm(ECOSYSTEM); qqline(ECOSYSTEM)

AIR_E
tf<-is.na(AIR_E)
AE<-AIR_E[!tf]
summary(AIR_E)
fivenum(AIR_E,na.rm=TRUE)
stem(AIR_E)
hist(AIR_E)
lines(density(AIR_E,na.rm=TRUE,bw="SJ"))
rug(AIR_E)
plot(ecdf(AIR_E,do.points=FALSE, verticals=TRUE))
par(pty='s')
qqnorm(AIR_E); qqline(AIR_E)

WATER_E
tf<-is.na(WATER_E)
WE<-WATER_E[!tf]
summary(WATER_E)
fivenum(WATER_E,na.rm=TRUE)
stem(WATER_E)
hist(WATER_E)
lines(density(WATER_E,na.rm=TRUE,bw="SJ"))
rug(WATER_E)
plot(ecdf(WATER_E,do.points=FALSE, verticals=TRUE))
par(pty='s')
qqnorm(WATER_E); qqline(WATER_E)

BIODIVERSITY
tf<-is.na(BIODIVERSITY)
BD<-BIODIVERSITY[!tf]
summary(BIODIVERSITY)
fivenum(BIODIVERSITY,na.rm=TRUE)
stem(BIODIVERSITY)
hist(BIODIVERSITY)
lines(density(BIODIVERSITY,na.rm=TRUE,bw="SJ"))
rug(BIODIVERSITY)
plot(ecdf(BIODIVERSITY,do.points=FALSE, verticals=TRUE))
par(pty='s')
qqnorm(BIODIVERSITY); qqline(BIODIVERSITY)

CLIMATE
tf<-is.na(CLIMATE)
C<-CLIMATE[!tf]
summary(CLIMATE)
fivenum(CLIMATE,na.rm=TRUE)
stem(CLIMATE)
hist(CLIMATE)
lines(density(CLIMATE,na.rm=TRUE,bw="SJ"))
rug(CLIMATE)
plot(ecdf(CLIMATE,do.points=FALSE, verticals=TRUE))
par(pty='s')
qqnorm(CLIMATE); qqline(CLIMATE)

boxplot(CLIMATE,BIODIVERSITY)
qqplot(CLIMATE,BIODIVERSITY)
qqplot(BIODIVERSITY,CLIMATE)

#Conditional Filtering

EPILand<-EPI[!Landlock]
Eland<-EPILand[!is.na(EPILand)]
hist(Eland)
hist(Eland,seq(30., 95., 1.0),prob=TRUE)

High_Population_Density<-EPI[!(is.na(High_Population_Density))]
summary(High_Population_Density)
fivenum(High_Population_Density,na.rm=TRUE)
stem(High_Population_Density)
hist(High_Population_Density)
lines(density(High_Population_Density,na.rm=TRUE,bw="SJ"))
rug(High_Population_Density)
plot(ecdf(High_Population_Density,do.points=FALSE, verticals=TRUE))
par(pty='s')
qqnorm(High_Population_Density); qqline(High_Population_Density)


EPI_South_Asia<-EPI[EPI$EPI_regions == "South Asia"] # $ operator cannot be used for atomic vectors(1D arraysthat can hold elements of same datatype 
EPI_South_Asia<-subset(EPI, EPI_regions == "South Asia")
summary(EPI_South_Asia)
fivenum(EPI_South_Asia)
hist(EPI_South_Asia)

