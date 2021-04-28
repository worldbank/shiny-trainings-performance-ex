library(profvis)
library(readr)
library(ggplot2)

df <- read_csv("input/covid_small.csv")

ggplot(df, aes(x = date, y = total_confirmed, group = country_code, color = country_code)) +
  geom_line() +
  facet_wrap(~country_code)