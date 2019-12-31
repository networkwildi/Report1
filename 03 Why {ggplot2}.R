#  03. Why {ggplot2}?

airbnb_raw <- read_csv("airbnb_texas_rental.csv") 
view(airbnb_raw)
glimpse(airbnb_raw)

library(readr)
airbnb_texas_rental <- read_csv("airbnb_texas_rental.csv")
View(airbnb_texas_rental)


library(lubridate)
airbnb_raw %>% 
  mutate(
    date_of_listing = parse_date_time(date_of_listing, orders = "by")
  )

airbnb_raw %>% 
  pull(bedrooms_count) %>% 
  unique

airbnb_raw %>% 
  mutate(bedrooms_count = if_else(bedrooms_count == "Studio",
                                  "0.5", bedrooms_count),
         bedrooms_count = as.numeric(bedrooms_count))

airbnb_raw %>% 
  mutate(bedrooms_count = if_else(bedrooms_count == "Studio", 
                                  0.5, as.numeric(bedrooms_count)))
airbnb_raw %>%
  mutate(
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)))

airbnb_raw<- read_csv("airbnb_texas_rental.csv") %>% 
  view()
glimpse(airbnb_raw)

airbnb_rav %>% 
  mutate(
    date_of_listing = parse_date_time(date_of_listing, orders = "by")
  )

airbnb_raw %>% 
  pull(bedrooms_count) %>% 
  unique

airbnb_raw %>% 
  mutate(bedrooms_count = if_else(bedrooms_count == "Studio",
                                  "0.5", bedrooms_count),
         bedrooms_count = as.numeric(bedrooms_count))

airbnb_raw %>% 
  mutate(bedrooms_count = if_else(bedrooms_count == "Studio", 0.5, as.numeric(bedrooms_count)))

# funktioniert nicht
airbnb_raw %>%
  mutate(
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)))
airbnb_raw %>% 
  pull(average_rate_per_night) %>% 
  unique %>% 
  length

airbnb_raw %>% 
  filter(!(str_detect(average_rate_per_night, "^\\$[:digit:]+$")))

airbnb_raw %>% 
  mutate(average_rate_per_night = if_else(average_rate_per_night == "$60","No Price",average_rate_per_night)) %>% 
  filter(!(str_detect(average_rate_per_night, "^\\$[:digit:]+$")))

airbnb <- airbnb_raw %>% 
  mutate(
    date_of_listing =
      parse_date_time(date_of_listing, orders="by"),
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)),
    average_rate_per_night =
      as.numeric(str_replace(average_rate_per_night, "\\$", "")))

```
library(dplyr)
library(stringr)
library(lubridate)

airbnb <- airbnb_raw %>%
  mutate(
    date_of_listing = 
      parse_date_time(date_of_listing, orders="bY"),
    bedrooms_count = if_else(bedrooms_count == "Studio",
                             0.5, as.numeric(bedrooms_count)),
    average_rate_per_night = 
      as.numeric(str_replace(average_rate_per_night, "\\$", "")))
```



library(ggplot2)
library(rvest)
library(magrittr)
library(curl)
library(httr)
library(purrr)
library(xml2)
library(jsonlite)
library(RPostgres)
library(RPostgreSQL)
library(RSQLite)
library(rlang)
library(DBI)
library(datapasta)
library(readxl)
library(xlsx)
library(openxlsx)
library(tidyr)
library(tibble)
library(readr)
library(dplyr)
library(lubridate)
library(janitor)
library(stringr)
rlang::last_error()
rlang::last_trace()
setwd("~/R")
