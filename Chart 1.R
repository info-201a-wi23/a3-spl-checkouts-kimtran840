library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringr")

# Load dataset
spl_df <- read.csv("~/Desktop/INFO201code/a3-spl-checkouts-kimtran840/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Add combined date column
spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth,  "-01" ))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

# Compare books
books_2 <- spl_df %>%
  filter(Title %in% c("Lord of the Flies", "Fahrenheit 451")) 

# Plot
ggplot(data = books_2) + geom_line(aes(x = date,
                                       y = Checkouts,
                                       color = Title)) +
  labs(
    title = "Checkout trends of Fahrenheit 451 vs Lord of the Flies",
    x = "Checkout Date",
    y = "Number of Checkouts",
    color = "Book name"
  )

