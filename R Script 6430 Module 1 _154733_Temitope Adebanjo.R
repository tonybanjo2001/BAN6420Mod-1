generate_workers <- function() {
  set.seed(123)  # Set seed for reproducibility
  workers <- data.frame(
    ID = 1:400,
    name = sample(c("Itumeleng Musharu", "Puleng Mamatela", "Kgomotso Mbongo", "Nomafuze Tabane", "Nomile Shiba", "Dorah Dlamini"), 400, replace = TRUE),
    email = NA,
    phone = sample(1000000000:9999999999, 400, replace = TRUE),
    gender = sample(c("Male", "Female"), 400, replace = TRUE),
    employment_level = NA,
    salary = sample(2000:100000, 400, replace = TRUE),
    department = sample(c("IT", "Sales and Advertising", "Digital Marketing", "Finance", "Customer Service", "Operations", "Legal", "Human Resources"), 400, replace = TRUE),
    job_title = sample(c("Software Engineer", "Sales Representative", "Digital Marketing Specialist", "Financial Analyst", "Customer Support Agent", "Operations Manager", "Legal Counsel", "HR Coordinator", "Systems Administrator", "Account Executive", "SEO Specialist", "Accountant", "Customer Experience Manager", "Supply Chain Analyst", "Paralegal", "Talent Acquisition Specialist", "Data Scientist", "Sales Manager", "Content Marketing Manager", "Financial Controller", "Technical Support Specialist", "Logistics Coordinator", "Contract Administrator", "Employee Relations Manager", "Network Engineer", "Business Development Representative", "Social Media Manager", "Risk Analyst", "Customer Success Manager", "Quality Assurance Specialist", "Compliance Officer", "Training and Development Specialist", "UI/UX Designer", "Inside Sales Representative", "Email Marketing Specialist", "Budget Analyst", "Call Center Representative", "Inventory Manager", "Intellectual Property Specialist", "Compensation and Benefits Analyst"), 400, replace = TRUE)
  )
  
  workers$email <- paste0(gsub(" ", "", workers$name), "@coffeeshop.com")
  return(workers)
}

update_worker_details <- function(workers) {   
  workers <- within(workers, {
    employment_level[salary > 10000 & salary < 20000] <- 'A1'
    employment_level[salary > 7500 & salary < 30000 & gender == 'Female'] <- 'A5-F'
  })
  return(workers)
}

print_workers <- function(workers) {
  for (i in 1:nrow(workers)) {
    worker <- workers[i,]
    cat(paste0(
      "Employee ID: ", worker$ID, "\n",
      "Name: ", worker$name, "\n",
      "Email: ", worker$email, "\n",
      "Phone: ", worker$phone, "\n",
      "Gender: ", worker$gender, "\n",
      "Employment Level: ", worker$employment_level, "\n",
      "Department: ", worker$department, "\n",
      "Job Title: ", worker$job_title, "\n",
      "Salary: $", format(worker$salary, big.mark = ",", scientific = FALSE), "\n\n"
    ))
  }
}

main <- function() {
  workers <- generate_workers()
  workers <- update_worker_details(workers)
  print_workers(workers)
}

main()

