
# DELETE THIS NOTE 28112018

# Removing unnecessary items and checking my working directory
rm(list = ls())
getwd()
# 1. Setting the working directory
setwd("C:/Users/noamg/OneDrive/Documents/Studies/Big Data/Datasets")
# Being paranoid about the working directoy set up
getwd()

# 2. Listing the files inside the folder
list.files()

# 3. Uploading the housing data set
pf<-read.csv("housing.csv")

# 4. 
# Number of columns in the DS
num_columns<-ncol(pf)
num_columns
# Number of rows
num_rows<-nrow(pf)
num_rows

# 5.  All variables in the DS
names(pf)

# 6. Summary of the DS
summary(pf)

# 7. Calculating and presenting the average of the sale price var
avg_sale_price<-mean(pf$SalePrice)
avg_sale_price

# 8. Showing the summary of the sale price var
summary(pf$SalePrice)

# 9. Calculating the 0.95 quantile of sale price var
quantile(pf$SalePrice, probs = 0.95)

# 10. Presenting a sequence of quantiles between 0-1
# by jumps of 0.05, and saving it into a variable
seq_0_1_005 = seq(0, 1, 0.05)
seq_0_1_005

# 11. Calculating the sale price by the sequence of quentiles 
quantile(pf$SalePrice, probs = seq_0_1_005)

# 12. Calculating the average sale price by the year it was sold
by(pf$SalePrice, pf$YrSold, mean)

# 13. Calculating the lot area by the year it was sold
by(pf$LotArea, pf$YrSold, mean)

# 14. Presenting correlation between lot area and lase price
cor(pf$LotArea, pf$SalePrice)

# 15+16. Showing the count of each value inside sale condition variable
table(pf$SaleCondition)

# 17. Presenting a two-way table of sale condition vs year is was sold 
# and daving it into a variable
my_table<-table(pf$SaleCondition, pf$YrSold)
my_table

# 18. Presenting a two-way table of frequency sale condition vs year is was sold   
#not sure this is what they wanted
prop.table(my_table, 1)

# 19. Creating a new DS that consists of houses built after 1980 solely
pf_after1980<-subset(pf, YearBuilt > 1980)

# 20. Calculating the correlation between lot area and lase price
# for houses built after 1980
cor(pf_after1980$LotArea, pf_after1980$SalePrice)

# 21. Calcultating the average value of lot frontage ignoring NA values for:
# Original DS
mean(pf$LotFrontage, na.rm=TRUE)
# New DS: Excluding houses build after3 1980
mean(pf_after1980$LotFrontage, na.rm=TRUE)

# 22. Adding a new variable to pf_after1980 that indicates if LotFrontage
# is eual to NA
pf_after1980$isLotFrontageNa = ifelse(is.na(pf_after1980$LotFrontage), TRUE, FALSE)

# 23. Calculating the correlation between sale price and lot frontage
# excluding the NA values for LotFrontage
cor(pf_after1980$SalePrice[pf_after1980$isLotFrontageNa == F],
    pf_after1980$LotFrontage[pf_after1980$isLotFrontageNa == F])



