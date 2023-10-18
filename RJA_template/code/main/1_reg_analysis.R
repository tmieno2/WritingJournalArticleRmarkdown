#--- packages ---#
library(fixest)

#--- load the data for regression ---#
reg_data <- readRDS("data/processed/reg_data.rds")

#--- regression analysis ---#
reg_results_1 <- feols(dep_delay ~ temp + precip + wind_speed, data = reg_data)

reg_results_2 <- feols(dep_delay ~ temp + precip + wind_speed | month + origin, data = reg_data)

reg_results_3 <- feols(dep_delay ~ temp + precip + wind_speed | month + origin, cluster = ~ origin, data = reg_data)

#--- combine ---#
reg_list <- list(reg_results_1, reg_results_2, reg_results_3)

#--- save ---#
saveRDS(reg_list, "results/reg_results.rds")
