# COURSERA DATA SCIENCE
# EXPLORATORY DATA ANALYSIS

# COURSE PROJECT 1

## Loading Data
# Assuming that the file is in the working directory

data <- read.table("household_power_consumption.txt", head=T, sep=";",
                   stringsAsFactors = F)
head(data)

# Converting and Filtering Dates

data$Date2 <- as.Date(data$Date, "%d/%m/%Y")

data_inp <- data[
    data$Date2 == as.Date("2007-02-01") |
        data$Date2 == as.Date("2007-02-02")
    ,]

data_inp$Datetime <- strptime(paste(data_inp$Date, data_inp$Time, sep=" "), format ="%d/%m/%Y %H:%M:%S")
head(data_inp)
dim(data_inp)

# Converting "?" to NA values

data_inp[data_inp$Global_activepower == "?" ,3] <- NA
data_inp[data_inp$Global_reactive_power == "?" ,4] <- NA
data_inp[data_inp$Voltage == "?" ,5] <- NA
data_inp[data_inp$Global_intensity == "?" ,6] <- NA
data_inp[data_inp$Sub_metering_1 == "?" ,7] <- NA
data_inp[data_inp$Sub_metering_2 == "?" ,8] <- NA
data_inp[data_inp$Sub_metering_ == "?" ,9] <- NA

## Plot 4

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Graph 1
plot(data_inp$Datetime, as.numeric(data_inp$Global_active_power), type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Graph 2
plot(data_inp$Datetime, as.numeric(data_inp$Voltage), type="l",
     ylab="Voltage", xlab="datetime")

# Graph 3
plot(data_inp$Datetime, as.numeric(data_inp$Sub_metering_1), type="l",
     ylab="Energy sub metering", xlab="")
lines(data_inp$Datetime, as.numeric(data_inp$Sub_metering_2), col="red")
lines(data_inp$Datetime, as.numeric(data_inp$Sub_metering_3), col="blue")
legend("topright", 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1))

# Graph 4
plot(data_inp$Datetime, as.numeric(data_inp$Global_reactive_power), type="l",
     ylab="Global_reactive_power", xlab="datetime")

dev.off()