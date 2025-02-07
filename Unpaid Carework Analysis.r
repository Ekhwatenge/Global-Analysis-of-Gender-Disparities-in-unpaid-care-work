# Load necessary libraries
library(tidyverse)
library(lubridate)

# Read the CSV file
data <- read_csv("UN Women Data Hub map-export.csv")

# Data cleaning and preparation
data_clean <- data %>%
  select(country = `REF_AREA Description`, 
         year = TIME_PERIOD, 
         value = OBS_VALUE) %>%
  mutate(year = as.numeric(year),
         value = as.numeric(value))

# Basic summary statistics
summary_stats <- data_clean %>%
  summarise(
    avg_proportion = mean(value, na.rm = TRUE),
    min_proportion = min(value, na.rm = TRUE),
    max_proportion = max(value, na.rm = TRUE),
    median_proportion = median(value, na.rm = TRUE)
  )

print(summary_stats)

# Top 5 countries with highest proportion
top_countries <- data_clean %>%
  arrange(desc(value)) %>%
  head(5)

print(top_countries)

# Trend over time
time_trend <- data_clean %>%
  group_by(year) %>%
  summarise(avg_value = mean(value, na.rm = TRUE)) %>%
  arrange(year)

print(time_trend)

# Trend over time  visualization
ggplot(time_trend, aes(x = year, y = avg_value)) +
  geom_line() +
  geom_point() +
  theme_minimal() +
  labs(title = "Average Proportion of Time Spent on Unpaid Work Over Years",
       x = "Year",
       y = "Average Proportion (%)")

# Top 10 countries visualization
top_10 <- data_clean %>%
  arrange(desc(value)) %>%
  head(10)

ggplot(top_10, aes(x = reorder(country, value), y = value)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  theme_minimal() +
  labs(title = "Top 10 Countries: Proportion of Time Spent on Unpaid Work",
       x = "Country",
       y = "Proportion (%)")

# Regional analysis 
data_clean <- data_clean %>%
  mutate(region = case_when(
    str_detect(country, "Latin America|Mexico|Peru|Argentina|Bolivia") ~ "Latin America",
    str_detect(country, "Europe|Belgium|France|Germany") ~ "Europe",
    TRUE ~ "Other"
  ))

regional_summary <- data_clean %>%
  group_by(region) %>%
  summarise(avg_value = mean(value, na.rm = TRUE))

print(regional_summary)

# Visualization: Regional comparison
ggplot(regional_summary, aes(x = region, y = avg_value)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Average Proportion of Time Spent on Unpaid Work by Region",
       x = "Region",
       y = "Average Proportion (%)")

