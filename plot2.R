install.packages("dplyr")
library(dplyr)

grafico_2 = read.table("household_power_consumption.txt", 
                       sep = ";",
                       nrows = 75000,
                       header = TRUE) 
grafico_2 = mutate_at(grafico_2, vars(Date), as.Date, format= "%d/%m/%Y")
grafico_2 = mutate_at(grafico_2, vars(Global_active_power), as.numeric)
grafico_2 = grafico_2[!is.na(grafico_2$Date),]
grafico_2 = grafico_2[!is.na(grafico_2$Global_active_power),]
grafico_2 = filter(grafico_2, Date > "2007-01-31" & Date < "2007-02-03")
num = c(1:2880)
grafico_2 = cbind(grafico_2, num)

png("plot2.png")

plot(grafico_2$num, grafico_2$Global_active_power, ylab="Global Active Power (Kilowatts)", xlab="", type = "l")
dev.off()



