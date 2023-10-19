install.packages("readxl")
library(readxl)
# dataset for flowering-time
ft_df <- read_excel("SAPMerged2021_v2.3.xlsx")
#Removing additional columns
head(ft_df)
ft_df$...12<-NULL
ft_df$...13<-NULL

# Remove rows with NA values in the 'DaysToFlower' column
ft_df2<- subset(ft_df, !is.na(DaysToFlower))

# Calculate Q1 and Q3 for the 'days_to_flower' column
Q1 <- quantile(ft_df2$DaysToFlower, 0.25)
Q3 <- quantile(ft_df2$DaysToFlower, 0.75)

# Calculate IQR for the 'days_to_flower' column
IQR <- Q3 - Q1

# Determine lower and upper bounds to identify outliers
lower_bound <- Q1 - 3 * IQR
upper_bound <- Q3 + 3 * IQR

# Remove rows with 'DaysToFlower' values outside the lower and upper bounds
ft_df3 <- ft_df2[ft_df2$DaysToFlower >= lower_bound & ft_df2$DaysToFlower <= upper_bound, ]

#to save the file in the directory(set the working directory if required to change)
write.csv(ft_df, "Original Data.csv", row.names = FALSE)
write.csv(ft_df3, "Data without outliers.csv", row.names = FALSE)
