# Exploratory Data Analysis - plot1.R

# EDGAR OMAR SILVA V
#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

# Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.


exercise="D:/censo 2010/data/household_power_consumption.txt"

# Lee los datos desde 2007-02-01 hasta 2007-02-02

skipLines = (66637 - 2 + 1)
readLines = (69517 - 66638 + 1)
colclasses = c("character", "character", "numeric")
colnames = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Leer en los datos y establece la clase de la columna de datos y tipo de carácter

power_cnsm <- read.table(exercise, header = TRUE, sep=";", na.strings="?", skip=skipLines, nrows=readLines, col.names = colnames, colClasses=colclasses)

# Crea el archivo de formato .PNG
png("plot1.png", width = 480, height = 480) 

# establecer la familia de fuentes en el dispositivo de png.
par(mar = c(4, 4, 2, 2), family="serif")

# Dibuja el histograma
with(power_cnsm, hist(Global_active_power, main = "Global Active Power EOSV", xlab = "Global Active Power (kilowatts)", col = "red", ty=1))
# Cierre
dev.off()
