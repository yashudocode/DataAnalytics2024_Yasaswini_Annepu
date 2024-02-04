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

EPI
summary(EPI)
boxplot(EPI)
fivenum(EPI,na.rm = TRUE)
stem(EPI)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw=1.))
rug(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
lines(density(EPI,na.rm=TRUE,bw="SJ"))

xn<-seq(30,95,1)
qn<-dnorm(xn,mean=63,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.4*qn)
ln<-dnorm(xn,mean=44,sd=5,log=FALSE)
lines(xn,.26*ln)

shapiro.test(data_EPI$EPI)


DALY
summary(DALY)
fivenum(DALY,na.rm = TRUE)
stem(DALY)
hist(DALY)
hist(DALY, seq(0,100,1.0),prob=TRUE)
lines(density(DALY,na.rm=TRUE,bw=1))
rug(DALY)

xn<-seq(0,100,1)
qn<-dnorm(xn,mean=60,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.4*qn)
ln<-dnorm(xn,mean=45,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.26*ln)

shapiro.test(data_EPI$DALY)

boxplot(EPI,DALY)


GEO_subregion
summary(GEO_subregion)
table(GEO_subregion)

EPI_regions
summary(EPI_regions)
table(EPI_regions)

CLIMATE
summary(CLIMATE)
fivenum(CLIMATE,na.rm=TRUE)
stem(CLIMATE)
hist(CLIMATE)
hist(CLIMATE,seq(0,100,1.0),prob=TRUE)
lines(density(CLIMATE,na.rm=TRUE,bw=1))
rug(CLIMATE)
hist(CLIMATE,seq(0,100,1.0),prob=TRUE)
lines(density(CLIMATE,na.rm=TRUE,bw="SJ"))

xn<-seq(0,100,1)
qn<-dnorm(xn,mean=60,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.4*qn)
ln<-dnorm(xn,mean=45,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.26*ln)

shapiro.test(data_EPI$CLIMATE)

Population07
summary(Population07)
table(Population07)

PopulationDensity07
summary(PopulationDensity07)
table(PopulationDensity07)

BIODIVERSITY
summary(BIODIVERSITY)
fivenum(BIODIVERSITY,na.rm=TRUE)
stem(BIODIVERSITY)
hist(BIODIVERSITY)
hist(BIODIVERSITY,seq(0,100,1.0),prob=TRUE)
lines(density(BIODIVERSITY,na.rm=TRUE,bw=1))
rug(BIODIVERSITY)
hist(BIODIVERSITY,seq(0,100,1.0),prob=TRUE)
lines(density(BIODIVERSITY,na.rm=TRUE,bw="SJ"))

xn<-seq(0,100,1)
qn<-dnorm(xn,mean=60,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.4*qn)
ln<-dnorm(xn,mean=45,sd=5,log=FALSE)
lines(xn,qn)
lines(xn,.26*ln)

shapiro.test(data_EPI$BIODIVERSITY)
