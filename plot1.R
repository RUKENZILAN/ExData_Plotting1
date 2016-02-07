#Setting the working directory 

setwd("C:/Users/RZilan/Documents/R/week1/Exp_Data_Assignment1/")

## Loading the data


filename <- "./exdata/household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
dim(data) 
attach(data)
## Data of 2 days are taken
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)
dim(newData) 
attach(newData)

#Plotting the PNG file

png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "white")
hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))
dev.off()