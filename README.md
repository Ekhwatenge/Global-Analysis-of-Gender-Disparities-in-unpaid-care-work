# Global-Analysis-of-Gender-Disparities-in-unpaid-care-work
We use R to analyze from the UN Women Data Hub. The data is cleaned and summarised  with insights into trends over time and regional differences of disparities in unpaid care work.
# Table of Contents
- Introduction
- Requirements
- Usage
- Analysis Overview
# Introduction
We aim to provide an understanding of how unpaid work varies across different countries and regions using data from the UN Women Data Hub on proportions of time spent on unpaid activities.
# Requirements
To run this script, you need:
- R installed on your system.
- The following libraries:
- tidyverse
- lubridate
You can install these libraries using:
r
- install.packages("tidyverse")
- install.packages("lubridate")
# Usage
- Clone this repository.
- Ensure you have a CSV file named "UN Women Data Hub map-export.csv" in your working directory.
- Run the R script (script.R) in your preferred environment (e.g., RStudio).
# Example Use Case
If your CSV file is named differently or located elsewhere, modify the read_csv line accordingly:
r
- data <- read_csv("path/to/your/file.csv")
# Analysis Overview
The analysis includes:
- Data Cleaning
Selects relevant columns (country, year, value).
Converts year and value columns to numeric format.
- Summary Statistics
  Calculates average, minimum, maximum, and median values for proportions across all observations.
- Top Countries by Proportion
Identifies top five countries with the highest proportion of time spent on unpaid work.
  - Trend Over Time
Computes average proportion per year.
Visualizes trend over years using a line plot.
  - Regional Analysis
Assigns countries to predefined regions (e.g., Latin America, Europe).
Calculates average proportion by region.
visualizes regional comparison using bar charts.
# Feel free to contribute or modify this code as needed!
