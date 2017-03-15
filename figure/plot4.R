consume <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";",  na.strings = "?" )
consumedata <- consume[which(consume$date %in% c('1/2/2007', '2/2/2007')),]
consumedata$datetime <- with(consumedata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))




png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(consumedata, plot(Global_active_power ~ datetime, type = "o", pch = '', xlab ='', sub = '', 
                       ylab = "Global Active Power"))
with(consumedata, plot (Voltage ~ datetime, type = 'o', pch = '' ))
with(consumedata, plot(Sub_metering_1 ~ datetime, type = "o", pch = '', col='black' , xlab='', sub='', ylab = "Energy Sub Metering"))
with(consumedata, lines(Sub_metering_2 ~ datetime, type = "o", pch = '', col='red'))
with(consumedata, lines(Sub_metering_3 ~ datetime, type = "o", pch = '', col='blue'))
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red','blue'),lty = 1, cex = .5,bty='n')
with(consumedata, plot(Global_reactive_power ~ datetime, type = 'o', pch = '' ))
dev.off()

