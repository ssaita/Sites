x <- read.csv("20170829_1608.txt",header=F,as.is=T)
LT <-as.POSIXct(x$V1)
HHH<-(x$V2-2^15)/2^15*10.24/10*600
DDD<-(x$V2-2^15)/2^15*10.24/10*600
ZZZ<-(x$V2-2^15)/2^15*10.24/10*600
p=par(mfrow=c(3,1)) 
plot(LT,HHH,type="l",xlab="LT",ylab="H[nT]",xaxt="n")
axis.POSIXct(1, at=LT, format="%H:%M:%S")
plot(LT,DDD,type="l",xlab="LT",ylab="D[nT]",xaxt="n")
axis.POSIXct(1, at=LT, format="%H:%M:%S")
plot(LT,ZZZ,type="l",xlab="LT",ylab="Z[nT]",xaxt="n")
axis.POSIXct(1, at=LT, format="%H:%M:%S")
