source("code/main/0_process_data.R")
source("code/main/1_reg_analysis.R")
source("code/main/2_make_tables_figures.R")
rmarkdown::render("writing/manuscript_to_word.rmd")
