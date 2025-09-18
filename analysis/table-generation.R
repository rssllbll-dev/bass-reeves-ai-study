# Table Generation for Constitutional AI Paper
# Generates Tables 1 and 2 from the manuscript

library(knitr)
library(kableExtra)

# === TABLE 1: AI Accuracy Across Content Types ===

table1_data <- data.frame(
  "Content Type" = c("Constitutional Doctrine", "Historical/Biographical", 
                    "Legal Citations", "Total"),
  "Total Claims" = c(34, 42, 51, 127),
  "Accurate" = c(32, 29, 44, 105),
  "Fabricated/Error" = c(2, 13, 7, 22),
  "Accuracy Rate" = c("94%", "69%", "87%", "83%"),
  stringsAsFactors = FALSE
)

# Generate Table 1
kable(table1_data, 
      caption = "Table 1. AI accuracy across content types (N = 127 claims)",
      format = "markdown")

# === TABLE 2: Federal Court Documentation Analysis ===

table2_data <- data.frame(
  "Demographic Characteristics" = c("African American Lawmen", 
                                   "Indigenous Involvement",
                                   "Women Historical Figures", 
                                   "Intersectional Cases"),
  "Court Documentation" = c(156, 89, 67, 34),
  "AI Representation" = c(23, 7, 6, 2),
  "Disparity Ratio" = c("6.8:1", "12.7:1", "11.2:1", "17.0:1"),
  "Statistical Significance" = c("p < 0.001", "p < 0.001", 
                                "p < 0.001", "p < 0.001"),
  stringsAsFactors = FALSE
)

# Generate Table 2
kable(table2_data,
      caption = "Table 2. Federal court documentation analysis",
      format = "markdown")

# Save tables as CSV for external use
write.csv(table1_data, "analysis/table1_ai_accuracy.csv", row.names = FALSE)
write.csv(table2_data, "analysis/table2_disparity.csv", row.names = FALSE)
