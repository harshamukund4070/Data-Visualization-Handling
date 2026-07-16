# Dataset
age <- c(28,35,42)
gender <- c("Female","Male","Female")
income <- c(50000,60000,75000)

# 1. Bar Chart
barplot(age,
        names.arg=1:3,
        col="skyblue",
        xlab="Customer",
        ylab="Age",
        main="Customer Ages")

# 2. Pie Chart
pie(table(gender),
    col=c("pink","lightblue"),
    main="Gender Distribution")

# 3. Table
data.frame(Age=age,
           Gender=gender,
           Income=income)̥