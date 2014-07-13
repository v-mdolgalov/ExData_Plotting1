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

# let's switch output to .png file (with default resolution 480x480
png('plot3.png', bg = "transparent")

# Creating the plot
with(data2,{  
  plot(theTime, Sub_metering_1, type = 'l', ylab = 'Energy sub metering', xlab = '');
  lines(theTime, Sub_metering_2, type = 'l', col='red');
  points(theTime, Sub_metering_3, type = 'l', col='blue');
  legend('topright', col=c('black', 'red', 'blue'), lty=1, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
}) 

# close plot png file
dev.off()

# If we got the plot on screen we can export it executing this:

dev.copy(png,'plot3.png')
dev.off()
