ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
dateandtime <- paste(ifile[,1], ifile[,2]) # paste dates and times
time <- strptime(dateandtime, format="%d/%m/%Y %H:%M:%S") # convert to R-time
png("plot3.png") # open canvas
# plot lines
plot(time, ifile$Sub_metering_1, type="l", xlab="", ylab="Energy sub metring")
lines(time, ifile$Sub_metering_2, col="red")
lines(time, ifile$Sub_metering_3, col="blue")
# add legend
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"))
dev.off() # close plotting
