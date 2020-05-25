install.packages("dplyr")
library(dplyr)

grafico_4 = read.table("household_power_consumption.txt", 
                       sep = ";",
                       nrows = 75000,
                       header = TRUE) 
grafico_4 = mutate_at(grafico_4, vars(Date), as.Date, format= "%d/%m/%Y")
grafico_4 = mutate_at(grafico_4, vars(Sub_metering_1, Sub_metering_2, Sub_metering_3, Global_active_power, Global_reactive_power, Voltage), as.numeric)
grafico_4 = grafico_4[!is.na(grafico_4$Date),]
grafico_4 = grafico_4[!is.na(grafico_4$Global_active_power),]
grafico_4 = grafico_4[!is.na(grafico_4$Global_reactive_power),]
grafico_4 = grafico_4[!is.na(grafico_4$Voltage),]
grafico_4 = grafico_4[!is.na(grafico_4$Sub_metering_1),]
grafico_4 = grafico_4[!is.na(grafico_4$Sub_metering_2),]
grafico_4 = grafico_4[!is.na(grafico_4$Sub_metering_3),]
grafico_4 = filter(grafico_4, Date > "2007-01-31" & Date < "2007-02-03")
num = c(1:2880)
grafico_4 = cbind(grafico_4, num)


png("plot4.png")

par(mfrow=c(2,2))

plot(grafico_4$num, grafico_4$Global_active_power, ylab="Global Active Power", xlab="", type = "l") 

plot(grafico_4$num, grafico_4$Voltage, ylab="Voltage", xlab="Datetime", type = "l")

plot(grafico_4$num, grafico_4$Sub_metering_1, ylab="Energy Sub metering", xlab="", type = "l", col = "black", pch = 1)
                        # segundo tratamiento 
                        lines(grafico_4$num,  grafico_4$Sub_metering_2,
                              col = "red",
                              type = "l",
                              pch = 1 )
                        
                        # tercer tratamiento    
                        lines(grafico_4$num,  grafico_4$Sub_metering_3,
                              col = "blue",
                              type = "l",
                              pch = 1 )
                        
                        # leyenda
                        legend(x = "topright", col = c("black", "red", "blue"),
                               lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(grafico_4$num, grafico_4$Global_reactive_power, ylab="Global_reactive_power", xlab="", type = "l")

dev.off()
