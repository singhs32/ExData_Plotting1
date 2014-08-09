plot3<- function()
{
        ## reading entire file
        data<-read.table("./household_power_consumption.txt", header = TRUE, sep=";",na.strings=c("NA","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))      
        ## subsetting the data to get data we are interested in
        dataofinterest<-subset(data,as.Date(data$Date,"%d/%m/%Y")%in%as.Date(c("2007-02-01","2007-02-02")))
        ## creating plot by coercing Date and Time data and plotting points for each type of metering separately
        with(dataofinterest,
             {
                     plot(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_1, type= "l",ylab="Energy sub metering",xlab="")
                     points(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_2, type= "l",col="Red")
                     points(strptime(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"),Sub_metering_3, type= "l",col="Blue")
                     legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("Black","Red","Blue"),lty=1,cex=0.6)
                })
        
        ## creating .png file
        dev.copy(png,"plot3.png",width=480,height=480)
        dev.off()
}