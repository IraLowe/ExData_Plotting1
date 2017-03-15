consume <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";",  na.strings = "?" )
consumedata <- consume[which(consume$date %in% c('1/2/2007', '2/2/2007')),]
consumedata$datetime <- with(consumedata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "Plot2.png", width = 480, height = 480)
with(consumedata, plot(Global_active_power ~ datetime, type = "o", pch = '', xlab ='', sub = '',
                       ylab = 'Global Active Power (Killowatts'))
dev.off()


