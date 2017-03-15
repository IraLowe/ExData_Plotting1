consume <- read.table("household_power_consumption.txt" , header = TRUE, sep = ";",  na.strings = "?" )
consumedata <- consume[which(consume$date %in% c('1/2/2007', '2/2/2007')),]
consumedata$datetime <- with(consumedata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))



png(filename = "Plot3.png", width = 480, height = 480)
with(consumedata, plot(Sub_metering_1 ~ datetime, type = "o", pch = '', col='black' , xlab='', sub='', ylab = "Energy Sub Metering"))
with(consumedata, lines(Sub_metering_2 ~ datetime, type = "o", pch = '', col='red'))
with(consumedata, lines(Sub_metering_3 ~ datetime, type = "o", pch = '', col='blue'))
legend("topright", legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red','blue'),lty = 1, grange[2])
dev.off()

