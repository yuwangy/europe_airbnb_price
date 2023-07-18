# Load the required libraries
library(dplyr)
library(readr)

# Read the CSV file into a data frame
amsterdam_weekdays <- read_csv("https://raw.githubusercontent.com/yuwangy/europe_airbnb_price/main/amsterdam_weekdays.csv")

# Overview of the data
head(amsterdam_weekdays) # View the first few rows
summary(amsterdam_weekdays) # Summary statistics of the columns
str(amsterdam_weekdays) # Structure of the data frame

# Perform specific analyses

# 1. Average price per room type
avg_price <- amsterdam_weekdays %>%
  group_by(room_type) %>%
  summarize(avg_price = mean(realSum))

# 2. Number of listings in each neighborhood
neighborhood_counts <- amsterdam_weekdays %>%
  group_by(neighbourhood) %>%
  summarize(listing_count = n()) %>%
  arrange(desc(listing_count))

# 3. Hosts with the highest number of listings
top_hosts <- amsterdam_weekdays %>%
  group_by(host_id, host_name) %>%
  summarize(listing_count = n()) %>%
  arrange(desc(listing_count)) %>%
  head(10)

# 4. Average reviews per month by neighborhood group
avg_reviews <- amsterdam_weekdays %>%
  group_by(neighbourhood_group) %>%
  summarize(avg_reviews_per_month = mean(reviews_per_month))

# Print the results
print(avg_price)
print(neighborhood_counts)
print(top_hosts)
print(avg_reviews)


