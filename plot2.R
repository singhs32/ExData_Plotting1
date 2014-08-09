plot2<- function()
{
        ## reading entire file
        data<-read.table("./household_power_consumption.txt", header = TRUE, sep=";",na.strings=c("NA","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))      
        ## subsetting the data to get data we are interested in
        dataofinterest<-subset(data,as.Date(data$Date,"%d/%m/%Y")%in%as.Date(c("2007-02-01","2007-02-02")))
        ## creating plot by coercing Date and Time data
        with(dataofinterest,plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Global_active_power, type= "l",ylab="Global Active Power (kilowatts)",xlab=""))
        ## creating .png file
        dev.copy(png,"plot2.png",width=480,height=480)
        dev.off()
}