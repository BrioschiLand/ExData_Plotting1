#
# plot2.R
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
png( "plot2.png" )
plot( hd$DateTime, hd$Global_active_power,
      ylab = "Global Active Power (kilowatts)",
      xlab = "",
      xaxt = "n",
      type = "l" )
axis.Date( side = 1, hd$DateTime, format = "%a" )
dev.off()

