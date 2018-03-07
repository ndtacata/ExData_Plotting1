plot2 <- function(){
    library(ggplot2)
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    #print(head(data, 2))
    
    ##get all data from 2007-02-01 and 2007-02-02
    subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
    ##format time to "2007-02-01 %H:%M:%S"
    subdata$Time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    ##print(head(subdata, 5))
    
    ##plot data and save result in png
    png('plot2.png', width=500, height=500)
    plot(subdata$Time,as.numeric(as.character(subdata$Global_active_power)),main = "Global Active Power Vs Time", type="l",xlab="",ylab="Global Active Power (kilowatts)") 
    dev.off()
    
}