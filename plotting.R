#Plotting in R

##Base Plots##
library(datasets)
data(cars)
with(cars, plot(speed, dist))

library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")

#pch - plotting symbol | lty - line type
#lwd - line width      | col - plotting color
#xlab - character string for x-axis label
#ylab - character string for y-axis label
#las - orientation of the axis labels on the plot
#bg - backgroun color
#mar - margin size     | oma - outer margin size
#mfrow - number of plots per row, column (plots are filled row-wise)
#mfcol - number of plots per row, column (plots are filled column-wise)

par("lty") #descubro qual o tipo de linha do padrão
par("mar") #descubro o mar padrão

#plot - makes a scatterplot
#lines - add lines to a plot
#points - add points to a plot
#text - add text labels to a plot using specified x, y coordinates
#title - add annotatios for x, y axis labels
#mtext - add arbitrary text to the margins of the plot
#axis - adding axis ticks/labels

library(datasets)
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City") #add a title

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", type = "n"))
with(subset(airquality, Month == 5), points(Wind, Ozone, col = "blue"))
with(subset(airquality, Month != 5), points(Wind, Ozone, col = "red"))
legend("topright", pch = 1, col = c("blue", "red"), legend = c("May", "Other Months"))

with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20)) #plot with regression line
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

par(mfrow = c(1,2)) #2 gráficos numa linha
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
})

par(mfrow = c(1,3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) #3 gráficos numa linha
with(airquality, {
    plot(Wind, Ozone, main = "Ozone and Wind")
    plot(Solar.R, Ozone, main = "Ozone and Solar Radiation")
    plot(Temp, Ozone, main = "Ozone and Temperature")
    mtext("Ozone and Weather in New York City", outer = TRUE) #title for the plot
})

#the bottom is the margin 1, the left is the margin 2, up margin 3, and right margin 4
example(points) #mostra os símbolos com os quais o R trabalha




##Lattice System##
#Good for panel plots (many plots on a screen)
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1))






##ggplot2 System##
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
