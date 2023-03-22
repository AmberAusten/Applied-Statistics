## Final Project
## Option 4: Stent data
## Amber 
## Give context 
# implications 
# this data 
# history vaccine polio 
# the medication background 
# according tot stat anayis, it does have a sig difference 
# likely medication is working 


# read in data
data<-read.csv("stent30.csv")

#install dplyr package 
install.packages("dplyr")
library(dplyr)

# separate data
treatment <-filter(data,group == "treatment")
control <-filter(data,group == "control")

# count strokes in each group
treatment_stroke<-filter(treatment, outcome == "stroke")
control_stroke<-filter(control, outcome == "stroke")

number_treatment_stroke<-length(treatment_stroke$outcome)
number_control_stroke<-length(control_stroke$outcome)

# count no events in each group
treatment_noevent<-filter(treatment, outcome == "no event")
control_noevent<-filter(control, outcome == "no event")

number_treatment_noevent<-length(treatment_noevent$outcome)
number_control_noevent<-length(control_noevent$outcome)

number_treatment_noevent

n_treatment <- (number_treatment_noevent+number_treatment_stroke)
n_control <- (number_control_noevent+number_control_stroke)


p_treatment <-number_treatment_stroke/n_treatment
p_control <-number_control_stroke/n_control

# 	2-sample test for equality of proportions with continuity correction

# prop.test(treatment stroke,control stroke 
# n treatment, n control)

prop.test(x=c(number_treatment_stroke, number_control_stroke),n = c(n_treatment, n_control)
          ,alternative = "two.sided")

# p value is small , so it is significant that the two groups are different. This is a high prob to reject the null hypothesis 
# the treatment has significantly more stroke number than the control 
# it is unlikely this is due to chance, stents are making patients worse and at a higher isk of stroke in this data. 


# somehow the treatment is working negatively
# confidence interval at 95% (0.03022,0.1498)

# X-squared = 9.0233, df = 1, p-value = 0.002666
# alternative hypothesis: two.sided
# 95 percent confidence interval: 
#  0.03022922 0.14987619
# sample estimates:
#   prop 1     prop 2 
# 0.14732143 0.05726872 

# since we have diff number 
library(ggplot2)
ggplot(data=data) + 
  geom_bar(mapping = aes(x = group, fill=outcome, position = "fill"))
data2 <- filter(data,outcome =="stroke")
#stacked 
data2
ggplot(data=data2) + geom_bar(mapping = aes(x=group,fill=outcome))
# to show how many strokes in each group 


# # of success rate in oe group vs success in another group
# success is the outcome we are iterested in 

data.frame(c("","C", "T"),c("S",number_control_stroke, number_treatment_stroke),c("NoEvent", number_control_noevent, number_treatment_noevent))
#table(c("","C", "T"),c("S",number_control_stroke, number_treatment_stroke),c("NoEvent", number_control_noevent, number_treatment_noevent))

matrix(c("a","b",2,4), nrow=2, ncol = 2)

table<-matrix(c("","C","T","S",number_control_stroke,number_treatment_stroke,"NoEvent",number_control_noevent, number_treatment_noevent),nrow=3, ncol=3)
write.table(table,file = "FinalTable")

# include table and write about proportions about the stroke

# statistically, if your pvalue is small enough, it is not due to chance
# there is something that is making your two groups different, something working or not working (stents not working) 
# contribute to the difference between the two groups 

# large p value means coul dbe due to chance ( like 10%) and likely

#do conclusion, "it is likely" the treatment is working negatively"
       
