library(profvis)
library(microbenchmark)
library(arrow)
library(data.table)
library(fst)
library(ggplot2)

# benchmark various 
bnchmrk <- microbenchmark::microbenchmark(
  dt_csv       = fread("input/covid_small.csv"),
  arw_parquet  = arrow::read_parquet("input/covid_small.parquet"),
  arw_feather  = arrow::read_feather("input/covid_small.feather"),
  fst          = fst::read_fst("input/covid_small.fst"),
  times = 20
)

# Plot results
autoplot(bnchmrk)
