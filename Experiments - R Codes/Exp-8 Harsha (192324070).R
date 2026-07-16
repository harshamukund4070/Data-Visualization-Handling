library(ggplot2)
library(zoo)
data <- read.csv("Online_Learning_Activity.csv")

# Histogram
hist(data$Quiz_Score,
     col="lightblue",
     main="Quiz Score",
     xlab="Score")

# Boxplot
boxplot(Quiz_Score~Course,
        data=data,
        col="orange",
        main="Quiz Score by Course")

# Scatter Plot
ggplot(data,
       aes(Study_Time,
           Quiz_Score,
           size=Videos_Watched))+
  geom_point(alpha=0.6,color="blue")+
  labs(title="Study Time vs Quiz Score")

# Monthly Average
data$Login_Date <- as.Date(data$Login_Date)

data$Month <- format(data$Login_Date,"%Y-%m")

avg <- aggregate(Quiz_Score~Month,
                 data,
                 mean)

avg$MA <- rollmean(avg$Quiz_Score,
                   2,
                   fill=NA)

plot(avg$Quiz_Score,
     type="o",
     xaxt="n",
     xlab="Month",
     ylab="Average Score",
     main="Monthly Quiz Score")

axis(1,
     at=1:nrow(avg),̥
     labels=avg$Month)

lines(avg$MA,
      col="red",
      lwd=2)

