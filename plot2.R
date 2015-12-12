ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
dateandtime <- paste(ifile[,1], ifile[,2]) # paste dates and times
time <- strptime(dateandtime, format="%d/%m/%Y %H:%M:%S") # convert to R-time
png("plot2.png") # open canvas
# plot lines
plot(time, ifile$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowats)")
dev.off() # close plotting
