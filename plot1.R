# COURSERA DATA SCIENCE
# EXPLORATORY DATA ANALYSIS

# COURSE PROJECT 1 - PLOT 1

## Loading Data

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

## Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(data_inp$Global_active_power), col="red",
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()