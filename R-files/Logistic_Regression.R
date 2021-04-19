summary(final_data)
model_glm<-glm(final_data$Exited~.-final_data$Geography-final_data$Gender-final_data$Tenure-final_data$HasCrCard-final_data$EstimatedSalary,data=final_data,family='binomial')
summary(model_glm) #high AIC=low performance 
y<-predict(model_glm,final_data,type='response')
View(y)
install.packages("pROC",dependencies =TRUE )
library(pROC)
plot(roc(final_data$Exited,y),print.thres='best')
#CREATE A NEW COLOUMN FOR PREDICTED VALUES
for (i in c(1:5900))
{
  if (y[i]>0.233)
  {
    final_data[i,12]=1
  }
  else
  {
    final_data[i,12]=0
  }
}
summary(final_data)
final_data$V12<-as.factor(final_data$V12)
final_data$Exited<-as.factor(final_data$Exited)
install.packages('caret',dependencies =TRUE)
library(caret)
confusionMatrix(final_data$Exited,final_data$V12)
summary(final_data$Exited)
