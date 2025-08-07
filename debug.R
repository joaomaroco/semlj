data <- read.csv(
  "D:\\OneDrive - Ensino Lusófona\\ongoing\\jamoviR\\semlj-main\\semlj_jm\\data\\ordereditems.csv"
)

# Verify data
str(data) # Ensure item1, item2, item3 are numeric and group is factor
table(data$group) # Confirm two levels with sufficient observations

# Load required package
library(jmv)
library(semlj)
# Run multigroup SEM analysis with measurement invariance
results <- semlj::semljgui(
  data = data,
  donotrun = FALSE, # Set to FALSE to run the analysis
  varcov = NULL,
  endogenous = list(label = "F", vars = c("item1", "item2", "item3")),
  exogenous = list(label = "X", vars = c("item4", "item5", "item6")),
  multigroup = "group",
  measInvariance = FALSE, # Enable measurement invariance testing
  estimator = "MLR", # Use maximum likelihood estimation
)

# Optionally, print the info table to check for errors
print(results$info$asDF)

print(results$fit)
# Print the Measurement Invariance table
print(results$measInvariance$measInvarianceTable$asDF)
