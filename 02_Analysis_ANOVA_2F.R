rm(list=ls(all=TRUE)) 

#Load data
tomato<-read.csv(file.choose(),header=TRUE)
names(tomato)
class(tomato$Fertilizer)
tomato$Fertilizer <- factor(tomato$Fertilizer,levels=c("Low","Medium","High"))

#Is the data normal?
par(mfrow=c(3:2))
tapply(tomato$Biomass, tomato$Myco:tomato$Fertilizer,hist)
tapply(tomato$Biomass, tomato$Myco:tomato$Fertilizer,shapiro.test) #mostly, except maybe No Mycorrhizae:Low
#try a sqrt transformation
par(mfrow=c(3:2))
tapply(sqrt(tomato$Biomass), tomato$Myco:tomato$Fertilizer,hist)
tapply(sqrt(tomato$Biomass), tomato$Myco:tomato$Fertilizer,shapiro.test) #all normal now

#Plot data 1
par(mfrow=c(1,1))
plot(tomato$Fertilizer:tomato$Myco, sqrt(tomato$Biomass))

#Plot data 2
se <- function(x) {
  sd(x,na.rm=TRUE)/sqrt(length(which(!is.na(x))))
}

biomass.means <- tapply(sqrt(tomato$Biomass), tomato$Myco:tomato$Fertilizer,mean)
biomass.se <- tapply(sqrt(tomato$Biomass), tomato$Myco:tomato$Fertilizer,se)

plot(biomass.means[c(1,4)] ~ c(1,2),type="n",ylim=c(0.4,1),xlim=c(0.5,2.5),xaxt="n",xlab="",ylab=expression(sqrt("Biomass")))
points(c(0.9,1.9),biomass.means[c(1,4)],col="black",pch=19,cex=2)
lines(c(0.9,1.9),biomass.means[c(1,4)],col="black")
arrows(x0=c(0.9,1.9,0.9,1.9),y0=c(biomass.means[c(1,4)],biomass.means[c(1,4)]),y1=c(biomass.means[c(1,4)],biomass.means[c(1,4)])-2*c(biomass.se[c(1,4)],-biomass.se[c(1,4)]),angle=90,length=0.1)
points(c(1,2),biomass.means[c(2,5)],col="blue",pch=19,cex=2)
lines(c(1,2),biomass.means[c(2,5)],col="blue")
arrows(x0=c(1,2,1,2),y0=c(biomass.means[c(2,5)],biomass.means[c(2,5)]),y1=c(biomass.means[c(2,5)],biomass.means[c(2,5)])-2*c(biomass.se[c(2,5)],-biomass.se[c(2,5)]),angle=90,length=0.1,col="blue")
points(c(0.9,1.9),biomass.means[c(3,6)],col="green",pch=19,cex=2)
lines(c(0.9,1.9),biomass.means[c(3,6)],col="green")
arrows(x0=c(0.9,1.9,0.9,1.9),y0=c(biomass.means[c(3,6)],biomass.means[c(3,6)]),y1=c(biomass.means[c(3,6)],biomass.means[c(3,6)])-2*c(biomass.se[c(3,6)],-biomass.se[c(3,6)]),angle=90,length=0.1,col="green")
legend("topleft",pch=19,lty=1,col=c("green","blue","black"),legend=c("high fertilizer","medium fertilizer","low fertilizer"))
axis(1,at=c(1,2),labels=c("Mycorrhizae","No Mycorrhizae"))

#ANOVA
library(car)
model<-glm(sqrt(tomato$Biomass)~tomato$Fertilizer*tomato$Myco)
par(mfrow=c(2,2))
plot(model) 
par(mfrow=c(1,1))
Anova(model,type="III",test.statistic="F") #There is a significant effect of fertilizer and a significant interaction between fertilizer and mycorrhizae

#Tukey's test
TukeyHSD(aov(model))
