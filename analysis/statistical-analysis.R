# Constitutional AI Analysis - Statistical Procedures
# Paper: "The Limits of AI in Constitutional Scholarship" (SSRN 5496718)
# Author: Russell Bell

# Load required libraries
library(tidyverse)
library(psych)
library(irr)

# Load sample data (full datasets available upon request)
ai_claims <- read_csv("sample-data/ai-claims-sample.csv")
federal_cases <- read_csv("sample-data/federal-cases-sample.csv")

# === AI CLAIMS ACCURACY ANALYSIS ===

# Calculate accuracy rates by content type
accuracy_by_type <- ai_claims %>%
  group_by(content_type) %>%
  summarise(
    total_claims = n(),
    accurate = sum(accuracy_rating == 1),
    errors = sum(accuracy_rating == 0),
    accuracy_rate = round(accurate / total_claims * 100, 1)
  )

print("AI Claims Accuracy by Content Type:")
print(accuracy_by_type)

# Binomial test for significance
constitutional_accuracy <- binom.test(32, 34, p = 0.5)
biographical_accuracy <- binom.test(29, 42, p = 0.5)

print("Statistical significance tests:")
print(paste("Constitutional doctrine p-value:", round(constitutional_accuracy$p.value, 4)))
print(paste("Biographical details p-value:", round(biographical_accuracy$p.value, 4)))

# === FEDERAL CASES REPRESENTATION ANALYSIS ===

# Calculate disparity ratios
disparity_analysis <- federal_cases %>%
  group_by(demographic_primary) %>%
  summarise(
    documented_cases = n(),
    ai_represented = sum(ai_presence > 0),
    disparity_ratio = round(documented_cases / pmax(ai_represented, 1), 1)
  )

print("Federal Cases Disparity Analysis:")
print(disparity_analysis)

# Chi-square test for systematic bias
bias_contingency <- table(federal_cases$demographic_primary, 
                         federal_cases$ai_presence > 0)
bias_test <- chisq.test(bias_contingency)

print(paste("Chi-square test p-value:", round(bias_test$p.value, 4)))

# === INTERSECTIONAL BIAS ANALYSIS ===

# Note: Intersectional cases identified where demographic_primary = 4
intersectional_cases <- federal_cases %>%
  filter(demographic_primary == 4) %>%
  summarise(
    total = n(),
    ai_present = sum(ai_presence > 0),
    representation_rate = round(ai_present / total * 100, 1)
  )

print("Intersectional bias analysis:")
print(intersectional_cases)
