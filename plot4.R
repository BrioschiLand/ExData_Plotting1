#
# plot1.R
#
#

# Read data mergine date and time in a single column
hd <- read.table( "household_power_consumption.txt",
                  sep=";",
                  na.strings = "?",
                  nrows = 1000,
                  header = TRUE )
hd$DateTime <- strptime( paste( hd$Date, hd$Time, sep=" " ),
                         format = "%d/%m/%Y %H:%M:%S" )
hd$Date <- NULL
hd$Time <- NULL

# exercise
png( "plot1.png" )
hist( hd$Global_active_power,
      col = "red",
      main ="Global Active Power",
      xlab = "Global Active Power (kilowatts)" )
dev.off()

plot( hd$DateTime, hd$Global_active_power,
      ylab = "Global Active Power (kilowatts)",
      xlab = "",
      xaxt = "n",
      type = "l" )
axis.Date( side = 1, hd$DateTime, format = "%a" )


plot( hd$DateTime, hd$Sub_metering_1,
      ylab = "Energy sub meering",
      xlab = "",
      xaxt = "n",
      col = "black",
      type = "l" )
points( hd$DateTime, hd$Sub_metering_2,
        col = "red",
        type = "l" )
points( hd$DateTime, hd$Sub_metering_3,
        col = "blue",
        type = "l" )
axis.Date( side = 1, hd$DateTime, format = "%a" )
legend( "topright",
        legend = c( "Sub_metering_1",
                    "Sub_metering_2",
                    "Sub_metering_3" ) )
