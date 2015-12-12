plot1 <- function(saveit = TRUE) {
  library(data.table)
  dset <- data.table(fread('hpc.txt')) #Trimmed file to only contain 2007-02-01 -> 2007-02-02
  dset$Date <- as.Date(dset$Date,"%d/%m/%Y")
  if (saveit) png('plot1.png',width=480,height=480)
  hist(dset$Global_active_power,col='red',main = 'Global Active Power',xlab='Global Active Power (kilowatts)')
  if (saveit) dev.off()
}  