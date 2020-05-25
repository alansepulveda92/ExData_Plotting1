install.packages("dplyr")
library(dplyr)

grafico_3 = read.table("household_power_consumption.txt", 
                       sep = ";",
                       nrows = 75000,
                       header = TRUE) 
grafico_3 = mutate_at(grafico_3, vars(Date), as.Date, format= "%d/%m/%Y")
grafico_3 = mutate_at(grafico_3, vars(Sub_metering_1, Sub_metering_2, Sub_metering_3), as.numeric)
grafico_3 = grafico_3[!is.na(grafico_3$Date),]
grafico_3 = grafico_3[!is.na(grafico_3$Sub_metering_1),]
grafico_3 = grafico_3[!is.na(grafico_3$Sub_metering_2),]
grafico_3 = grafico_3[!is.na(grafico_3$Sub_metering_3),]
grafico_3 = filter(grafico_3, Date > "2007-01-31" & Date < "2007-02-03")
num = c(1:2880)
grafico_3 = cbind(grafico_3, num)
str(grafico_3)




png("plot3.png")

plot(grafico_3$num, grafico_3$Sub_metering_1, ylab="Energy Sub metering", xlab="", type = "l", col = "black", pch = 1)

# segundo tratamiento 
lines(grafico_3$num,  grafico_3$Sub_metering_2,
       col = "red",
       type = "l",
       pch = 1 )

# tercer tratamiento    
lines(grafico_3$num,  grafico_3$Sub_metering_3,
       col = "blue",
       type = "l",
       pch = 1 )

# leyenda
legend(x = "topright", col = c("black", "red", "blue"),
        lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

