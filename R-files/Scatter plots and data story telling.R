exited<-as.character(d$Exited)
credit_card<-as.character(d$HasCrCard)

#TRENDS  
ggplot(d,aes(x=d$Age,y=d$Balance,color=d$Gender))+geom_point()+geom_smooth(method='lm')+facet_wrap(~d$Geography) #A slightly positive trendline is observed
ggplot(d,aes(x=d$EstimatedSalary,y=d$Balance,color=exited))+geom_point(alpha=0.4)+geom_smooth(method='lm')+facet_wrap(~d$Geography) #Trendline of balance vs estimated salary is uniform for the no of perople exited. There is no observable trend.
ggplot(d,aes(x=d$Age,y=d$Balance,color=exited))+geom_point(alpha=0.4)+geom_smooth(method='lm')+facet_wrap(~d$Geography) #trendline of age vs balance for categorical variable exited to be predicted. As observed no of people not exiting (0) are between (20-40)yrs in age and has balance between (100000-150000).
ggplot(d,aes(x=d$EstimatedSalary,y=d$CreditScore))+geom_point()+geom_smooth(method='lm')+facet_wrap(~d$Geography)

#Credit card holders (bar plots)
ggplot(d,aes(fill=Gender,x=credit_card,y=d$EstimatedSalary))+geom_bar(position='stack',stat='identity')+facet_wrap(~d$Geography) #estimated salary of people having credit card is higher .Gender division is almost equal
ggplot(d,aes(fill=Gender,x=exited,y=d$EstimatedSalary))+geom_bar(position='stack',stat='identity')+facet_wrap(~d$Geography) #People with higher estimated salary has not exited.
ggplot(d,aes(fill=Gender,x=exited,y=d$Balance))+geom_bar(position='stack',stat='identity')+facet_wrap(~d$Geography) #People with higher balance has not exited. 
ggplot(d,aes(fill=Gender,x=exited,y=d$CreditScore))+geom_bar(position='stack',stat='identity')+facet_wrap(~d$Geography)#people with higher credit score has not exited. Thus we can conclude that people with higher credit score has higher balance and has not exited.

#Box plot analysis
ggplot(d,aes(x=exited,y=d$Tenure,color=d$Geography))+geom_boxplot()+coord_flip()+facet_wrap(~d$Gender)
ggplot(d,aes(x=exited,y=d$CreditScore,color=d$Geography))+geom_boxplot()+coord_flip()+facet_wrap(~d$Gender)
ggplot(d,aes(x=exited,y=d$Balance,color=d$Geography))+geom_boxplot()+coord_flip()+facet_wrap(~d$Gender) 
ggplot(d,aes(x=exited,y=d$Tenure,color=d$Gender))+geom_boxplot()+coord_flip()+facet_wrap(~d$Geography) #The median tenure is almost same in case of people who exited and a little lower in the case of males (spain) who exited. But the difference can be spotted region wise.
ggplot(d,aes(x=exited,y=d$CreditScore,color=d$Gender))+geom_boxplot()+coord_flip()+facet_wrap(~d$Geography)#The median credit score is almost same in case of people who exited and a little lower in the case of males who exited. No major difference region wise. Outliers detected which are [< Q1-1.5*(Q3-Q1)]
ggplot(d,aes(x=exited,y=d$Balance,color=d$Gender))+geom_boxplot()+coord_flip()+facet_wrap(~d$Geography)#The median balance for 'exited' is almost same for all regions. But for no exited category median balance in female is observed tobe lower.

