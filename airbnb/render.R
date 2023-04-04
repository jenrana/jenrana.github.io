library(tidyverse)

city <- unique(airbnb$city)

reports <- tibble(
  output_file = stringr::str_c("output/", city, "-airbnb.html"),
  params = map(city, ~list(city = .))
)

reports %>%
  pwalk(rmarkdown::render, input = "airbnb/parameter.qmd")