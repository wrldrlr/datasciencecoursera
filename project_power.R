##  project 1 of exploratory data analysis

        #  download and save data to default folder
        #  load enegry data get rid of missing values
        #  convert data to suitable formats
       
        
        power <-read.csv('household_power_consumption.txt',header = TRUE, sep = ";")
        power <- na.omit(power)                

        power$Date <-as.Date(power$Date, format='%d/%m/%Y')
        power$Global_active_power <- as.numeric(as.character(power$Global_active_power) )
        power$Global_reactive_power <- as.numeric(as.character(power$ Global_reactive_power) )
        power$Voltage <- as.numeric(as.character(power$ Voltage) )
        power$Global_intensity  <- as.numeric(as.character(power$Global_intensity ) )
        power$Sub_metering_1  <- as.numeric(as.character(power$Sub_metering_1 ) )
        power$Sub_metering_2 <- as.numeric(as.character(power$Sub_metering_2 ) )
         
        # extract data ofTWO  dates of interest, club date and time fields to  a new field called Time1
        
        powerDate <- power[power$Date %in%  as.Date(c('2007-02-01','2007-02-02')), ]
        powerDate$Time1 <-strptime( paste(powerDate$Date,powerDate$Time) , format="%Y-%m-%d %H:%M:%S") 
         
         
         
         
       
        ## plot and save  plot #1
        
        png(filename="plot1.png",width = 3.25, height= 3.25,units= "in",res= 480 , pointsize = 4,bg = 'transparent')
        hist(powerDate$Global_active_power ,col='red', xlab ='Global active power (kilowatts)',
             main='Global Active Power')
        dev.off()
         
       
        
        ## plot and save plot #2 
        
         
         
        png(filename="plot2.png",width = 3.25, height= 3.25,units= "in",res= 480 , pointsize = 4,bg = "transparent")
        plot(powerDate$Time1,powerDate$Global_active_power , ylab='Global active power(kilowatts)',
             xlab='day and time', type='l')
        dev.off()
        
        ## plot and save plot plot #3
        
        
        png(filename="plot3.png",width = 3.25, height= 3.25,units= "in",res= 480 , pointsize = 4,bg = "transparent") 
        plot(powerDate$Time1,powerDate$Sub_metering_1,  ylab='Global submetering',xlab=' day and time', type='l',col='black',lty =1)
        lines(powerDate$Time1,powerDate$Sub_metering_2,col='red',lty =1)
        lines(powerDate$Time1,powerDate$Sub_metering_3,col='blue',lty =1)
        legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
               col=c('black','red','blue'))
        dev.off()

        ## plot and save plot #4
        
        
        png(filename="plot4.png",width = 3.25, height= 3.25,units= "in",res= 480 , pointsize = 4,bg = "transparent")
        par(mfrow=c(2,2))  # plot 2 rows and 2 columns
        plot(powerDate$Time1,powerDate$Global_active_power , ylab='Global active power(kilowatts)',
             xlab='day and time', type='l')
        plot(powerDate$Time1,powerDate$Voltage , ylab='Voltage', xlab='day and time', type='l')

        plot(powerDate$Time1,powerDate$Sub_metering_1,  ylab='Global submetering',xlab=' Date and time', type='l',col='black',lty =1)
        lines(powerDate$Time1,powerDate$Sub_metering_2,col='red',lty =1)
        lines(powerDate$Time1,powerDate$Sub_metering_3,col='blue',lty =1)
        legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),
               col=c('black','red','blue'))
        
        plot(powerDate$Time1,powerDate$Global_reactive_power , ylab='Global_reactive_power', xlab='day and time', type='l')
        dev.off()
