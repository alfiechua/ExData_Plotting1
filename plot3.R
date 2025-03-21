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

# Generate line plot
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", xaxt = "n")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

# Add legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

# Identify tick positions for "Thu", "Fri", "Sat"
tick_positions <- c(min(data$DateTime), 
                    min(data$DateTime) + 86400,  # +1 day in seconds
                    min(data$DateTime) + 2 * 86400)  # +2 days

# Add custom x-axis
axis(1, at = tick_positions, labels = c("Thu", "Fri", "Sat"))

# Copy to the PNG file
dev.copy(png, "plot3.png", width = 480, height = 480)

# Save the file
dev.off()
