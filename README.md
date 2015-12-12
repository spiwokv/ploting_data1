# Data_ploting1

I have used bash commands to retrieve relevant lines to load data to my old laptop:

```
egrep Date household_power_consumption.txt > selected.txt
egrep ^"1/2/2007" household_power_consumption.txt >> selected.txt
egrep ^"2/2/2007" household_power_consumption.txt >> selected.txt
```

Then I used these codes to create plots 1, 2, 3 and 4:

### plot 1

```
ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
png("plot1.png") # open canvas
# plot a histogram with default bins and red bars
hist(ifile$Global_active_power,
     xlab="Global Active Power (kilowats)", ylab="requency",
     main="Global Active Power", col="red")
dev.off() # close plotting
```

### plot 2

```
ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
dateandtime <- paste(ifile[,1], ifile[,2]) # paste dates and times
time <- strptime(dateandtime, format="%d/%m/%Y %H:%M:%S") # convert to R-time
png("plot2.png") # open canvas
# plot lines
plot(time, ifile$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowats)")
dev.off() # close plotting
```

### plot 3

```
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
```

### plot 4

```
ifile <- read.table("selected.txt", header=T, sep=";") # read in
head(ifile) # do a check
dateandtime <- paste(ifile[,1], ifile[,2]) # paste dates and times
time <- strptime(dateandtime, format="%d/%m/%Y %H:%M:%S") # convert to R-time
png("plot4.png") # open canvas
par(mfrow=c(2,2)) # swich to 2x2 plot
# make plot number 1
plot(time, ifile$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowats)")
# make plot number 2
plot(time, ifile$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
# make plot number 3
plot(time, ifile$Sub_metering_1, type="l", xlab="", ylab="Energy sub metring")
lines(time, ifile$Sub_metering_2, col="red")
lines(time, ifile$Sub_metering_3, col="blue")
# add legend
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black","red","blue"), bty="n")
# make plot number 4
plot(time, ifile$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")
dev.off() # close plotting
```
