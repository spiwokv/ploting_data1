ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
png("plot1.png") # open canvas
# plot a histogram with default bins and red bars
hist(ifile$Global_active_power,
     xlab="Global Active Power (kilowats)", ylab="requency",
     main="Global Active Power", col="red")
dev.off() # close plotting
