# Here we are creating the first plot

setwd('D:/Files/Dropbox/Studies/Data Science/04 Expl Data Analysis/01 Homework')

# Donwloaded and saved the file using web browser, unzipped to the working directory

# Reading the full file as we have enough memory
data1 <- read.csv('household_power_consumption.txt', sep=';', na.strings='?') 
head(data1) # data looks fine

# Now let's get only the days that we need 
data2 <- data1[data1$Date == '2/1/2007' | data1$Date == '2/2/2007', ]
data2$theDate <- as.Date(data2$Date, format='%m/%d/%Y') # We are getting the dates in native format for future use
data2$theTime <- strptime(paste(data2$Date, data2$Time, ' '), format = '%m/%d/%Y%H:%M:%S')

# Creating the plot
with(data2,{  
  plot(theTime, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '') # ?plot
}) # ?hist

# Now exporting plot with RStudio or execute:

dev.copy(png,'plot2.png')
dev.off()
