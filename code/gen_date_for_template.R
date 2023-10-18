library(nycflights13)
library(tidyverse)
write_csv(flights, "RJA_template/data/raw/flights.csv")
write_csv(weather, "RJA_template/data/raw/weather.csv")
