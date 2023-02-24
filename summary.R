library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringr")

# Load dataset
spl_df <- read.csv("~/Desktop/INFO201code/a3-spl-checkouts-kimtran840/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Add combined date column
spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth,  "-01" ))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

# Max checkouts for 2 books
books_2_max <- books_2 %>%
  group_by(Title) %>%
  filter(Title %in% c("Fahrenheit 451", "Lord of the Flies")) %>%
  summarize(max_checkouts = max(Checkouts, na.rm = TRUE)) 

# Max checkouts date(s) for 2 books 
books_2_date <- books_2 %>%
  filter(Title == "Lord of the Flies") %>%
  filter(Checkouts == max(Checkouts)) %>%
  pull(date)

books_2_date2 <- books_2 %>%
  filter(Title == "Fahrenheit 451") %>%
  filter(Checkouts == max(Checkouts)) %>%
  pull(date)

# Average checkouts for 3 of my favorite childhood books
books_3_mean <- fav_child_book %>%
  group_by(Title) %>%
  filter(Title %in% c("Brown Bear, Brown Bear, What Do You See?", "The Cat in the Hat", "The Very Hungry Caterpillar")) %>%
  summarize(mean_checkouts = mean(Checkouts, na.rm = TRUE))


# Total checkouts of my favorite Dr. Seuss books
dr_seuss_total_checkouts <- dr_seuss %>%
  group_by(Title) %>%
  filter(Title %in% c("Green Eggs and Ham", "The Cat in the Hat", "How the Grinch Stole Christmas", "The Lorax", "One Fish Two Fish Red Fish Blue Fish")) %>%
  summarize(total_checkouts = sum(Checkouts, na.rm = TRUE))

  
# Min checkouts for 2 books
books_2_min <- books_2 %>%
    group_by(Title) %>%
    filter(Title %in% c("Fahrenheit 451", "Lord of the Flies")) %>%
    summarize(min_checkouts = min(Checkouts, na.rm = TRUE))