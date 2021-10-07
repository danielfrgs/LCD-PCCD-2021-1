library(ggplot2)
library(scales)
library(RColorBrewer)

str(mpg)
# Datos Multivariados

ggplot(mpg) + 
  geom_bar(aes(x = class), fill = 'blue') +
  xlab('Tipo de Auto') +
  ylab('Total')

ggplot(mpg, aes(x = displ)) + 
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = 'blue') + 
  geom_line(stat = 'density', col = 'gray50', size = 1.5) + 
  xlab('Desplazamiento del motor') + 
  ylab('Densidad')

ggplot(mpg, aes(x = displ)) + 
  geom_histogram(aes(y = ..density..), binwidth = 1, fill = 'blue') + 
  geom_line(stat = 'density', col = 'gray50', size = 1.5, bw = 'S3') + 
  xlab('Desplazamiento del motor') + 
  ylab('Densidad')
  

ggplot(data = mpg, aes(class, cty)) + 
  geom_boxplot(fill = 'aliceblue') +
  labs(title = 'Box Plot', x = 'Tipo de Vehiculo', y = 'Rendimiento')

ggplot(data = mpg, aes(class, cty)) +
  geom_violin(fill = 'aliceblue') +
  labs(title = 'Violin Plot', x = 'Tipo de Vehiculo', y = 'Rendimiento')

install.packages("tidyverse",dependencies = TRUE)
library(tidyverse)

install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr)

mpg_summary <- mpg %>%
  group_by(class) %>%
  summarize(mean_cty = mean(cty), 
            std_cty = sd(cty), 
            n_cty = n(),
            se = cd_cty/sqrt(n_cty),
            x_max = mean_cty+se,
            x_min = mean_cty-se)

mpg_summary$class <- reorder(mpg_summary$class, 
                            mppg_summaty$mean_cty)

mpg_summary
  