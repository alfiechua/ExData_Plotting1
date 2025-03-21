# Import Data
library(readr)
household_power_consumption <- read_csv("Data Science Specialization Coursera Course/Exploratory Data Analysis/household_power_consumption.txt")
View(household_power_consumption)

#Subset Data
load_data <- function() {
  # Read the dataset
  data <- read.table("Data Science Specialization Coursera Course/Exploratory Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  
  # Convert Date and Time columns
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
  
  # Subset data for the required two-day period (Feb 1-2, 2007)
  data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  return(data)
}

# Generate histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Copy to the PNG file
dev.copy(png, "plot1.png", width = 480, height = 480)

# Save the file
dev.off()

