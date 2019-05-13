rm(list = ls())
library(tidyverse)
t1 = theme_void() +
  theme(panel.spacing = unit(1.85, "lines"),
        plot.margin = unit(c(0.15,-0.5,1.85,2.5), "lines"))
t2 = theme_minimal() + 
  theme(plot.background = element_rect(fill = "black"),
        text = element_text(colour = 'white'),
        axis.text = element_text(colour = 'white'),
        panel.grid = element_line(color = 'gray50', linetype = 2),
        panel.spacing = unit(1.85, "lines"),
        plot.margin = unit(c(0.15,-1,0,0.5), "lines"))


df = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T3/data_T3.csv", 
               fileEncoding="UTF-8-BOM") %>% as.tibble %>%
  gather('vechicle', 'speed', -time)

df %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_T3.pdf', width = 640/300, height = 1440/300)

df %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_T3_back.pdf', width = 640/300, height = 1440/300)
