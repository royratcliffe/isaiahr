library(fpp3)

us_retail_employment <- us_employment %>%
  filter(year(Month) >= 1990, Title == "Retail Trade") %>%
  select(-Series_ID)

usethis::use_data(us_retail_employment, overwrite = TRUE)
