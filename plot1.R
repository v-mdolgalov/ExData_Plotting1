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
with(data2,{  
  hist(Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
  }) 

# Now exporting plot with RStudio or by executing this:

dev.copy(png,'plot1.png')
dev.off()
