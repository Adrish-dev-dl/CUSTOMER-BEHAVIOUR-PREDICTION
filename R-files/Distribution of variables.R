d <- read.csv('/cloud/project/dataset.csv')
View(d)
summary(d) #no missing values
install.packages('ggplot2')
library(ggplot2)
ggplot(d,aes(x=d$CreditScore))+geom_histogram(bin_width=20) #negatively skewed
ggplot(d,aes(x=d$EstimatedSalary))+geom_histogram(bin_width=40) #normally distributed
ggplot(d,aes(x=d$Balance))+geom_histogram(bin_width=20)
ggplot(d,aes(x=d$Tenure))+geom_histogram(bin_width=20)
