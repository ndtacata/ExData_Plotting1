plot1 <- function(){
    library(ggplot2)
    data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    #print(head(data, 2))
    
    ##get all data from 2007-02-01 and 2007-02-02
    subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
    
    ##print(head(subdata, 2))
    
    ##produce histograph and save to png file
    png("plot1.png", width=500, height=500)
    hist(as.numeric(as.character(subdata$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
    dev.off()
    
}