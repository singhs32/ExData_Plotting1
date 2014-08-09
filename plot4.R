plot4<- function()
{
       ## reading entire file
        data<-read.table("./household_power_consumption.txt", header = TRUE, sep=";",na.strings=c("NA","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))      
        ## subsetting the data to get data we are interested in
        dataofinterest<-subset(data,as.Date(data$Date,"%d/%m/%Y")%in%as.Date(c("2007-02-01","2007-02-02")))
        ##setting global parameter to chart the graphs in 2*2 matrix in columnar way
        par(mfcol = c(2,2), mar=c(4,4,1,1))

        ##creating first graph
        with(dataofinterest,plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Global_active_power, type= "l",ylab="Global Active Power (kilowatts)",xlab=""))
        ## creating 2nd graph in column
        with(dataofinterest,
             {
                     plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_1, type= "l",ylab="Energy sub metering",xlab="")
                     points(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_2, type= "l",col="Red")
                     points(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_3, type= "l",col="Blue")
                     legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"),lty=1,bty="n",cex=0.60)
                })
        ##creating 3rd graph
        with(dataofinterest,plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Voltage, type= "l",xlab="datetime"))
        ##creating 4th graph
        with(dataofinterest,plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Global_reactive_power, type= "l",xlab="datetime"))
        
        ## creating .png file
        dev.copy(png,"plot4.png",width=480,height=480)
        dev.off()
}