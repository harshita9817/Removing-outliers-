# dataset for flowering-time
ft_df <- read.csv("SAP2021.csv")

# Calculate quartiles and IQR
Q1 <- quantile(data, 0.25)
Q3 <- quantile(data, 0.75)
IQR <- Q3 - Q1

# Define lower and upper bounds
lower_bound <- Q1 - 3 * IQR
upper_bound <- Q3 + 3 * IQR

# Remove outliers
filtered_data <- ft_df[ft_df >= lower_bound & ft_df <= upper_bound]

print("Original Data:", ft_df)
print("Data without outliers:", filtered_data)
