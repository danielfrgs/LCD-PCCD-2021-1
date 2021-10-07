install.packages('car')
install.packages("plot3D")
install.packages('rgl')

library(plot3D)
library(car)

#-------------------------------------------

install.packages('DAAG')

head(ais)

plot(ais$ssf, ais$pcBfat)

mujeres = which(ais$sex == 'f')
points(ais$ssf[mujeres], ais$pcBfat[mujeres], col='blue', pch=16)
points(ais$ssf[-mujeres], ais$pcBfat[-mujeres], col = 'red', pch=16)

install.packages('ggplot2')
install.packages('MASS')

library(MASS)
library(ggplot2)

plt <- ggplot(anorexia, aes(x = Prewt, y = Postwt)) + 
  geom_point(aes(shape=Treat, color=Treat), size=3) 

plt


plt <- plt + geom_smooth(aes(colour = Treat), method = 'lm')

plt