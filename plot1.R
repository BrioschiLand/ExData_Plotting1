#
# plot1.R
#
#

# Read data mergine date and time in a single column
hd <- read.table( "household_power_consumption.txt",
                  sep=";",
                  na.strings = "?",
                  header = TRUE )
hd <- hd[hd$Date %in% c( "1/2/2007", "2/2/2007" ),]
hd$DateTime <- strptime( paste( hd$Date, hd$Time, sep=" " ),
                         format = "%d/%m/%Y %H:%M:%S" )
hd$Date <- NULL
hd$Time <- NULL

# exercise
png( "figure/plot1.png",
     width = 480, height = 480 )
hist( hd$Global_active_power,
      col = "red",
      main ="Global Active Power",
      xlab = "Global Active Power (kilowatts)" )
dev.off()
