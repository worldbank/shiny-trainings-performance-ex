library(profvis)
library(microbenchmark)
library(arrow)
library(data.table)
library(readr)
library(ggplot2)

# benchmark various 
bnchmrk <- microbenchmark::microbenchmark(
  base = read.csv("input/covid_small.csv", stringsAsFactors = FALSE),
  tidy = read_csv("input/covid_small.csv"),
  dt   = fread("input/covid_small.csv"),
  arw  = read_csv_arrow("input/covid_small.csv")
)

# Plot results
autoplot(bnchmrk)
