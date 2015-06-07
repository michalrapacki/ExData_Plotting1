#getting classes to improve efficiency 
initial <- read.table("./household_power_consumption.txt", header=T, sep=";", nrows = 100)
classes <- sapply(initial, class)

#reading data file
tabAll <- read.table("./household_power_consumption.txt", header=T, sep=";", colClasses = classes, na.strings = "?")

#subsetting two requested days
data<-tabAll[tabAll$Date=="1/2/2007" | tabAll$Date=="2/2/2007",]
rm(tabAll)

#conveting classes as suggested in project description
data$Time<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#opening PNG file with a width of 480 pixels and a height of 480 pixels
png(file="./plot3.png")

#constructing the plot
with(data,plot(Time,Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
    #adding lines
    with(data,lines(Time,Sub_metering_1))
    with(data,lines(Time,Sub_metering_2, col="red"))
    with(data,lines(Time,Sub_metering_3, col="blue"))
    #adding a legend
    legend("topright", lty="solid", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()