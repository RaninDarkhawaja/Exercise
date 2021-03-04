setwd("C:/Users/darkra/Desktop/Exercise")
download.file(url = "https://ndownloader.figshare.com/files/2292169", destfile = "data_raw/portal_data_joined.csv")
library(tidyverse)
surveys <- read_csv("data_raw/portal_data_joined.csv")
view (surveys)
library(lubridate)
BRIGHT <- read.table("BRIGHT/Bright_imputed.txt", sep="\t", header=T)
select(BRIGHT, A2_gend, age, educ_level5, work2,race, Depress, diabetes)
BRIGHT_Subset <- data.frame(select(BRIGHT, A2_gend, age, educ_level5, work2,race, Depress, diabetes))
summary(BRIGHT_Subset$age)
# Data frame with people less than 50 years old
Age_less_50 <- data.frame(filter(BRIGHT_Subset, age < 50))
# Data frame with people who have high depression
high_depression <- BRIGHT_Subset %>% filter(Depress > 20)
high_depression <- data.frame(high_depression)
library(ggplot2)
ggplot(data = surveys, aes(x = weight, y = hindfoot_length)) +geom_point()
ggplot(data = BRIGHT_Subset, aes(x = age, y = Depress)) +geom_point()
# Create a new column in the surveys with weight in Kg
surveys %>%  mutate(weight_kg = weight / 1000)
# To create a second new column based on the first new column with the same call of mutate
surveys$surveys_weight <-surveys %>% mutate(weight_kg = weight/ 1000, weight_lb = weight_kg*2.2)
view(BRIGHT_Subset)
