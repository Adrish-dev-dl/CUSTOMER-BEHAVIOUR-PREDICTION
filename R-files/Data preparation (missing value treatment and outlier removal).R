install.packages('dplyr', repos = 'https://cloud.r-project.org')
library(dplyr)
#Select the coloumns for the final dataset
final_data<-select(d,-'RowNumber',-'CustomerId',-'Surname')
View(final_data)
summary(final_data)
#Filter outliers from the required variables
#Credit Score
final_data<-filter(final_data,final_data$CreditScore>(584.0-(1.5*134)))
final_data<-filter(final_data,final_data$Balance>(100000-(1.5*27644))&final_data$Balance<(127644+(1.5*27644)))
summary(final_data)
ggplot(final_data,aes(x=final_data$exited,y=final_data$Balance,color=final_data$Gender))+geom_boxplot()+coord_flip()+facet_grid(~final_data$Geography)
ggplot(final_data,aes(x=final_data$exited,y=final_data$CreditScore,color=final_data$Gender))+geom_boxplot()+coord_flip()+facet_grid(~final_data$Geography)
ggplot(final_data,aes(x=final_data$CreditScore))+geom_histogram(bin_width=20)
ggplot(d,aes(x=d$EstimatedSalary))+geom_histogram(bin_width=40)

#Variable correlations. We will consider numeric variables for this 
corr_var<-select(final_data,-'IsActiveMember',-'HasCrCard',-'Gender',-'Geography')
install.packages('corrplot',dependencies = TRUE)
pairs(final_data)
pairs(corr_var)
summary(corr_var)
corrplot::corrplot(cor(corr_var))
