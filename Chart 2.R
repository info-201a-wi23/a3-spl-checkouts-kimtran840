library("dplyr")
library("tidyverse")
library("ggplot2")
library("stringr")

# Load dataset
spl_df <- read.csv("~/Desktop/INFO201code/a3-spl-checkouts-kimtran840/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Add combined date column
spl_df <- spl_df %>% mutate(date = paste0(CheckoutYear, "-", CheckoutMonth,  "-01" ))

spl_df$date <- as.Date(spl_df$date, format = "%Y-%m-%d")

# Book
fav_child_book <- spl_df %>%
                  filter(Title %in% c("The Very Hungry Caterpillar", "The Cat in the Hat", "Charlotte's Web", "Brown Bear, Brown Bear, What Do You See?")) 

# Plot

ggplot(data = fav_child_book) + geom_point(aes(x = date,
                                               y = Checkouts, 
                                               color = Title)) +
  labs(
    title = "Favorite Childhood Books Checkout Trends",
    x = "Checkout Date",
    y = "Number of Checkouts",
    color = "Book Title"
)
                                                                   
