#--- packages ---#
library(tidyverse)

#--- read datasets ---#
# The working directory is set to the root project folder
flights <- read_csv("data/raw/flights.csv")
weather <- read_csv("data/raw/weather.csv")

#--- transform datasets ---#
flights_avg <-
  flights %>%
  select(year, month, day, dep_delay, carrier, origin)

#--- aggregate hourly to daily  ---#
weather_daily <-
  weather %>%
  group_by(month, day, origin) %>%
  summarize(
    wind_speed = mean(wind_speed),
    temp = mean(temp),
    precip = mean(precip)
  )

#--- merge datasets ---#
reg_data <- left_join(flights_avg, weather_daily, by = c("month", "day", "origin"))

saveRDS(reg_data, "data/processed/reg_data.rds")
