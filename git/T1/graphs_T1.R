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


dfA = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T1/data_A.csv", 
              fileEncoding="UTF-8-BOM") %>% as.tibble %>%
  gather('vechicle', 'speed', -time)

dfA %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_A.pdf', width = 640/300, height = 1440/300)

dfA %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_A_back.pdf', width = 640/300, height = 1440/300)


dfB = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T1/data_B.csv", 
               fileEncoding="UTF-8-BOM") %>% as.tibble %>%
  gather('vechicle', 'speed', -time)

dfB %>% filter(vechicle %in% c('V1', 'V2', 'V3')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_B1.pdf', width = 640/300, height = 1440/300)

dfB %>% filter(vechicle %in% c('V1', 'V2', 'V3')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_B1_back.pdf', width = 640/300, height = 1440/300)

dfB %>% filter(vechicle %in% c('V4', 'V5', 'V6')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_B2.pdf', width = 640/300, height = 1440/300)

dfB %>% filter(vechicle %in% c('V4', 'V5', 'V6')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_B2_back.pdf', width = 640/300, height = 1440/300)

dfB %>% filter(vechicle %in% c('V7', 'V8', 'V9')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_B3.pdf', width = 640/300, height = 1440/300)

dfB %>% filter(vechicle %in% c('V7', 'V8', 'V9')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_B3_back.pdf', width = 640/300, height = 1440/300)



dfC = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T1/data_C.csv", 
               fileEncoding="UTF-8-BOM") %>% as.tibble %>%
  gather('vechicle', 'speed', -time)

dfC %>% filter(vechicle %in% c('V1', 'V2', 'V3')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_C1.pdf', width = 640/300, height = 1440/300)

dfC %>% filter(vechicle %in% c('V1', 'V2', 'V3')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_C1_back.pdf', width = 640/300, height = 1440/300)


dfC %>% filter(vechicle %in% c('V4', 'V5', 'V6')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'white', alpha = 0.75) +
  geom_smooth(col = 'white', se = FALSE) + 
  facet_grid(vechicle~.) +
  t1
ggsave('C:/Dropbox/temp/data_C2.pdf', width = 640/300, height = 1440/300)

dfC %>% filter(vechicle %in% c('V4', 'V5', 'V6')) %>%
  ggplot(aes(x = time, y = speed)) + 
  geom_point(col = 'transparent') + 
  geom_line(col = 'transparent') +
  facet_grid(vechicle~.) +
  t2
ggsave('C:/Dropbox/temp/data_C2_back.pdf', width = 640/300, height = 1440/300)

