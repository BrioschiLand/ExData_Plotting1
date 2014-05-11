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
