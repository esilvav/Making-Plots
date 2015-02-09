# Making-Plots
# Tarea 1
# Exploratory Data Analysis - plot2.R

require("dplyr")
exercise="D:/censo 2010/data/household_power_consumption.txt"

# Lee los datos desde 2007-02-01 hasta 2007-02-02

skipLines = (66637 - 2 + 1)
readLines = (69517 - 66638 + 1)
colclasses = c("character", "character", "numeric")
colnames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage","Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Leer en los datos y establece la clase de la columna de datos y tipo de carácter

power <- read.table(exercise, header = TRUE, sep=";", na.strings="?", skip=skipLines,nrows=readLines, col.names = colnames, colClasses=colclasses)

power = mutate(power, datetime = as.POSIXct(strptime(paste(Date, Time, sep=" ", overlaps=""),"%d/%m/%Y %H:%M:%S")))

# Crea el archivo de formato .PNG
png("plot2.png", width = 480, height = 480) 

# establecer la familia de fuentes en el dispositivo de png.
par(mar = c(4, 4, 2, 2), family="serif")

# Realiza el grafico de lineas
with(power_cnsm,
    plot(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", 
         type="l", xlab = ""))

# Close the device
dev.off()
