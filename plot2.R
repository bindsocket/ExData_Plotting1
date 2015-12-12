plot2 <- function (saveit = TRUE) {
  library(data.table)
  dset <- data.table(fread('hpc.txt')) #Trimmed file to only contain 2007-02-01 -> 2007-02-02
  xrange <- 1:length(dset$Time)
  ylabels <- seq.int(0,max(ceiling(dset$Global_active_power)),2)
  xlabels <- c('Thu','Fri','Sat')
  xlen <- length(xrange)
  if (saveit) png('plot2.png',width=480,height=480)
  plot(xrange,dset$Global_active_power,type='l',ylab='Global Active Power (kilowatts)',xlab='',lab=c(3,4,3),axes=FALSE,frame.plot=TRUE)
  axis(1,at=c(0,max(xrange)/2,max(xrange)),labels=c("Thu","Fri","Sat"))
  axis(2,at=ylabels,labels=ylabels)
  if (saveit) dev.off()
}