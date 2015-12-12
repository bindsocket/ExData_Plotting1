plot3 <- function (saveit = TRUE) {
  library(data.table)
  dset <- data.table(fread('hpc.txt')) #Trimmed file to only contain 2007-02-01 -> 2007-02-02
  xseq <- 1:length(dset$Time)
  xrange <- c(min(xseq),max(xseq))
  xlabels <- c('Thu','Fri','Sat')
  maxMaxSubMetering <- max(max(dset$Sub_metering_1),max(dset$Sub_metering_2),max(dset$Sub_metering_3))
  yrange <- c(0,maxMaxSubMetering)
  ylabels <- seq.int(0,maxMaxSubMetering,10)
  if (saveit) png('plot3.png',width=480,height=480)
  plot(xrange,yrange,type='n',axes=FALSE,frame.plot=TRUE,ylab='Energy sub metering',xlab='')
  lines(xseq,dset$Sub_metering_1,col='black')
  lines(xseq,dset$Sub_metering_2,col='red')
  lines(xseq,dset$Sub_metering_3,col='blue')
  axis(1,at=c(0,max(xrange)/2,max(xrange)),labels=c("Thu","Fri","Sat"))
  axis(2,at=ylabels,labels=ylabels)
  legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
  if (saveit) dev.off()
}