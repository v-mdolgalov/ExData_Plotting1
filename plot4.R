# Here we are creating the plot

setwd('D:/Files/Dropbox/Studies/Data Science/04 Expl Data Analysis/01 Homework')

# Donwloaded and saved the file using web browser, unzipped to the working directory

# Reading the full file as we have enough memory
data1 <- read.csv('household_power_consumption.txt', sep=';', na.strings='?') # ?read.csv
head(data1)
data1$theDate <- as.Date(data1$Date, format='%d/%m/%Y') # ?as.Date ?paste2
data1$theTime <- strptime(paste(data1$Date, ' ', data1$Time), format = '%d/%m/%Y %H:%M:%S')
head(data1)

# Now let's get only the days that we need 
data2 <- data1[data1$theDate == '2007-02-01' | data1$theDate == '2007-02-02', ]
nrow(data2)

# Creating the plot
png('plot4.png', bg = "transparent", width = 500, height = 500 ) # ?plot
par(mfrow = c(2, 2))
with(data2,{  
  plot(theTime, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = ''); # ?plot
  plot(theTime, Voltage, type = 'l', xlab = 'Datetime');
  plot(theTime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '');
  lines(theTime, Sub_metering_2, type = 'l', col='red');
  points(theTime, Sub_metering_3, type = 'l', col='blue');
  legend('topright', col=c('black', 'red', 'blue'), lty=1, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),box.lwd = 0,box.col = "transparent", bg = "transparent", bty = 'no') #?legend
  plot(theTime, Global_reactive_power, col = '#3F3F3F', type = 'l', xlab = 'Datetime', ylab = 'Global Reactive Power', lwd = 0.1);
}) 
dev.off()
# Now exporting plot with RStudio or by executing this (if the plot was shown on the screen):

dev.copy(png,'plot4.png')
dev.off()
