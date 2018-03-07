plot4 <- function(){
    library(ggplot2)
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    
    ##read data with date 1/2/2007 | 2/2/2007
    subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
    ##format time to "2007-02-01 %H:%M:%S"
    subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    
    
    png("plot4.png", width=500, height=500)
    par(mfrow = c(2, 2)) 
    
    
    ##plot1
    plot(subdata$Time, as.numeric(subdata$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
    
    
    ##plot2
    plot(subdata$Time, as.numeric(subdata$Voltage), type="l", xlab="datetime", ylab="Voltage")
    
    
    #plot3
    plot(subdata$Time, as.numeric(subdata$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
    lines(subdata$Time, as.numeric(subdata$Sub_metering_2), type="l", col="red")
    lines(subdata$Time, as.numeric(subdata$Sub_metering_3), type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
    
    #plot4
    plot(subdata$Time, as.numeric(subdata$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()
}