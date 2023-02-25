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

dr_seuss <- spl_df %>%
            filter(Creator == "Dr. Seuss") %>%
            filter(Title %in% c("Green Eggs and Ham", "The Cat in the Hat", "How the Grinch Stole Christmas", "The Lorax", "One Fish Two Fish Red Fish Blue Fish"))

# Plot
ggplot(dr_seuss, aes(x = Title,
                     y = Checkouts,
                     fill = Title)) + geom_bar(stat = "identity") + scale_fill_manual(values=c("red", "orange", "yellow", "green", "blue")) + 
  
  labs(
    title = "Favorite Dr. Seuss Book Checkouts 2022-2023",
    x = "Book Titles",
    y = "Number of Checkouts")


