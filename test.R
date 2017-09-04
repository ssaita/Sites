library(rCharts)
x <- read.csv("20170829_1608.txt",header=F,as.is=T)
LT <-as.POSIXct(x$V1)
HHH<-(x$V2-2^15)/2^15*10.24/10*600
DDD<-(x$V2-2^15)/2^15*10.24/10*600
ZZZ<-(x$V2-2^15)/2^15*10.24/10*600
#p=par(mfrow=c(3,1)) 
p=hPlot(y ~ x,data=HHH)
#plot(LT,DDD,type="l")
#plot(LT,ZZZ,type="l")
#axis.POSIXct(1, at=seq(LT[1],LT[end]), format="%m/%d")
#p$set(width = 800, height = 600)
#p$save("outp01.html", cdn = TRUE)
#browseURL("outp01.html")
