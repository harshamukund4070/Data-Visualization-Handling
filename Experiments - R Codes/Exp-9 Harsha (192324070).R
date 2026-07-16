q1 <- c("A","B","C")
q2 <- c("B","A","A")
q3 <- c("C","D","B")

# 1. Grouped Bar Chart
barplot(table(q1),
        beside=TRUE,
        col="lightgreen",
        main="Question 1 Responses")

# 2. Stacked Bar Chart
response <- rbind(table(q1),
                  table(q2),
                  table(q3))

barplot(response,
        beside=FALSE,
        col=rainbow(3),
        legend=rownames(response),
        main="Survey Responses")

# 3. Table
data.frame(Q1=q1,
           Q2=q2,
           Q3=q3)̥