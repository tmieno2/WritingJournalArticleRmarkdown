#!===========================================================
# ! Visual illustration of the data
# !===========================================================
#--- read the data ---#
reg_data <- readRDS("data/processed/reg_data.rds")

g_delay <-
  ggplot(reg_data) +
  geom_boxplot(aes(y = dep_delay, x = carrier)) +
  facet_grid(origin ~ .) +
  xlab("Departure Delay") +
  ylab("Carrier")

#--- for WORD ---#
ggsave("results/figures/delay_box.png", g_delay, dpi = 600, width = 6, height = 5)

#--- for PDF ---#
ggsave("results/figures/delay_box.pdf", g_delay, width = 6, height = 5)

# !===========================================================
# ! Regression table
# !===========================================================
library(modelsummary)

#--- create regression results table ---#
reg_table <-
  readRDS("results/reg_results.rds") %>%
  modelsummary(
    stars = TRUE,
    gof_omit = "IC|Log|Adj|F|Pseudo|Within|RMSE"
  )

saveRDS(reg_table, "results/tables/reg_table.rds")

