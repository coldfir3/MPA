rm(list = ls())
library(tidyverse)

t2 = theme_minimal() + 
  theme(plot.background = element_rect(fill = "black"),
        text = element_text(colour = 'white'),
        axis.text = element_text(colour = 'white'),
        panel.grid = element_line(color = 'gray50', linetype = 2),
        legend.position = "none",
        axis.title.x = element_blank(),
        axis.title.y = element_blank(),
        plot.margin = unit(c(1,1,2,2), "lines"))

dfA1 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_A1.csv", 
               fileEncoding="UTF-8-BOM") %>% as.tibble
dfA2 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_A2.csv", 
                fileEncoding="UTF-8-BOM") %>% as.tibble
dfA <- rbind(mutate(dfA1, mass = 7900, power = 10*(1-0.1)^wheels),
             mutate(dfA2, mass = 5000, power = 5.3*(1-0.1)^wheels)) %>%
  mutate(acceleration = acceleration/253)# %>% select(-wheels)

dfA %>% ggplot(aes(x = wheels, y = acceleration, col = as.factor(mass))) +
  geom_point(alpha = 0.5) +
  geom_smooth(se = FALSE, method = 'lm') + t2 +
  scale_colour_brewer(type = "qua", palette = 'Set1')
ggsave('C:/Dropbox/temp/T2A1.pdf', width = 2560/600, height = 1440/600, dpi = 600)

dfA %>% ggplot(aes(x = power, y = acceleration, col = as.factor(mass))) +
  geom_point(alpha = 0.5) +
  geom_smooth(se = FALSE) + t2 +
  scale_colour_brewer(type = "qua", palette = 'Set1')
ggsave('C:/Dropbox/temp/T2A2.pdf', width = 2560/600, height = 1440/600, dpi = 600)

dfB1 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_B1.csv", 
                fileEncoding="UTF-8-BOM") %>% as.tibble
dfB2 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_B2.csv", 
                fileEncoding="UTF-8-BOM") %>% as.tibble
dfB <- rbind(mutate(dfB1, power = 10*1.5*(1-0.2)^10),     
             mutate(dfB2, power = 5.3*(1-0.2)^6)) %>%
  mutate(acceleration = acceleration/253)

dfB %>% ggplot(aes(x = mass, y = acceleration, col = as.factor(power))) +
  geom_point(alpha = 0.5) +
  geom_smooth(se = FALSE) + t2 +
  scale_colour_brewer(type = "qua", palette = 'Set1')
ggsave('C:/Dropbox/temp/T2B.pdf', width = 2560/600, height = 1440/600, dpi = 600)

model <- lm(acceleration ~ log(power) + log(mass), data = bind_rows(select(dfA, -wheels), dfB))
summary(model)


dfC1 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_C1.csv", 
                fileEncoding="UTF-8-BOM") %>% as.tibble
dfC2 = read.csv("D:/Creative Cloud Files/Projects/tests/power_mass_accel/T2/data_C2.csv", 
                fileEncoding="UTF-8-BOM") %>% as.tibble
dfC <- rbind(mutate(dfC1, power = 8*(1-0.175)^0),     
             mutate(dfC2, power = 8*(1-0.175)^4)) %>%
  gather('overloaded', 'acceleration', acceleration, acceleration_real) %>%
  mutate(acceleration = acceleration/253, overloaded = as.factor(overloaded))

dfC %>% ggplot(aes(x = mass, y = acceleration, col = as.factor(power), lty = overloaded)) +
  geom_point(alpha = 0.5) +
  geom_line() + t2 +
  scale_colour_brewer(type = "qua", palette = 'Set1')
ggsave('C:/Dropbox/temp/T2C.pdf', width = 2560/600, height = 1440/600, dpi = 600)







