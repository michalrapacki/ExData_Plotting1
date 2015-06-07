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
png(file="./plot2.png")

#constructing the plot
with(data,plot(Time,Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
    #adding a line
    with(data,lines(Time,Global_active_power))

dev.off()