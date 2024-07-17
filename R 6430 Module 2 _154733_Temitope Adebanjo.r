# I loaded the necessary libraries
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}
library(readr)

# The zip file was defined and likewise the output directory
zip_file <- "Employee_Profile.zip"
output_dir <- "Employee_Profile"

# Unzip the file
unzip(zip_file, exdir = output_dir)

# List files in the output directory
files <- list.files(output_dir, full.names = TRUE)
print(files)

# Read and display the CSV file
for (file in files) {
  employee_data <- read_csv(file)
  for (i in seq_len(nrow(employee_data))) {
    cat("EmployeeName:", employee_data$EmployeeName[i], "\n")
    cat("JobTitle:", employee_data$JobTitle[i], "\n")
    cat("BasePay:", employee_data$BasePay[i], "\n")
    cat("OvertimePay:", employee_data$OvertimePay[i], "\n")
    cat("OtherPay:", employee_data$OtherPay[i], "\n")
    cat("Benefits:", employee_data$Benefits[i], "\n")
    cat("TotalPay:", employee_data$TotalPay[i], "\n")
    cat("\n")  # Add a blank line between employees
  }
}
