library(arrow)
library(dplyr)

# Open connection to .csv file
ds <- open_dataset("input/covid_small.csv", format = "csv")

# Create partitioned version of the dataset -------------------------------

ds %>%
  group_by(country_name) %>%
  write_dataset(path = "input/arrow", format = "feather")


# Read data subset ------------------------------------------------------
# Open connection to partitioned dataset
ds <- open_dataset("input/arrow", format = "feather")

df <- ds %>%
  filter(country_name == "China") %>%
  collect()
