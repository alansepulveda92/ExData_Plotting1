install.packages("dplyr")
library(dplyr)

grafico_1 = read.table("household_power_consumption.txt", 
                       sep = ";",
                       nrows = 75000,
                       header = TRUE)                                                   ##se lee y almacenan las primeras 75 mils filas
grafico_1 = mutate_at(grafico_1, vars(Date), as.Date, format= "%d/%m/%Y")               ##se cambia la clase de la columna fecha
grafico_1 = mutate_at(grafico_1, vars(Global_active_power), as.numeric)                 ##se cambia la clase de la columna Global Active Power
grafico_1 = grafico_1[!is.na(grafico_1$Date),]                                          ##se eliminan los NA.
grafico_1 = filter(grafico_1, Date > "2007-01-31" & Date < "2007-02-03")                ##se filtra por las fechas indicadas en el ejercicio                                                                         ##se agrega una columna

png("plot1.png")
hist(grafico_1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab = "Frequency", col = "red")                                                   ## se grafica las frecuencia de la variable Global Active Power
dev.off()

