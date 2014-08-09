plot1<- function()
{
        ## reading entire file
        data<-read.table("./household_power_consumption.txt", header = TRUE, sep=";",na.strings=c("NA","?"),colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))      
        ## subsetting the data to get data we are interested in
        dataofinterest<-subset(data,as.Date(data$Date,"%d/%m/%Y")%in%as.Date(c("2007-02-01","2007-02-02")))
        ## creating histogram
        with(dataofinterest,hist(Global_active_power,col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
        ## creating .png file
        dev.copy(png,"plot1.png",width=480,height=480)
        dev.off()
}