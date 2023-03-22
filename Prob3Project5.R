# Problem 3
# (i)
problem3<-read.csv('married-folks-anonymized-1.csv')

install.packages('plyr')

library(plyr)
count(problem3,"section")
p1<-53/(98)
p2<-45/(98)
n1<-53
n2<-45
phat<-((p1*n1)+(p2*n2))/(n1+n2) # phat
#zscore for difference of proportiona
zstar<-(p1-p2)/sqrt(phat*(1-phat)*((1/n1) + (1/n2))) # zscore #.81 is z score
#p-value = .2090 =  (area)


#(ii)
count(problem3,"answer")
phat<-50/98
po<-.2
n=98
x<-50
res<-prop.test(x=50,n=98,p=.2,correct=FALSE,alternative = "greater")
res

# pvalue is small, test is sig. can reject the null, p is greater than the general population so altenative is true
