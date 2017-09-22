#Plotting Homework 1
setwd("~/Desktop/UCLA/Fall_2017/EEB_201/bootcamp")
#Assume that the heights of people from LA are normally distributed with a mean of 69 inches and a standard deviation of 10 inches.

#1 Write a function (called “get_heights”) in R to draw a sample of individuals (either 100 or 1000) from the population.
mean_heights<-c()
individuals <- 100
get_heights <- function(individuals){
  height<-rnorm(individuals,mean=69, sd=10);
  avH<<- mean(height) #2 Within your function, compute the average height from your “heights” vector.
  cat(avH)#3 Make your function return the average height.
  
}
get_heights(individuals)
  
#4 Use a “for” loop to call your “get_heights” function 1000 times, with taking a sample of size 100 from the population. Save the mean height from each replicate in a vector called “mean_heights_100”.
mean_heights_100<-c()
for (i in 1:1000){
  get_heights(individuals)
  mean_heights_100[i] <- avH
}

#5Use a “for” loop to call your “get_heights” function 1000 times, with taking a sample of size 1000 from the population. Save the mean height from each replicate in a vector called “mean_heights_1000”.
individuals <- 1000
mean_heights_1000<-c()
for (i in 1:1000){
  get_heights(individuals)
  mean_heights_1000[i] <- avH
}

#6 Plot a histogram of the distribution of the average heights for your sample size of 100 and 
#1000 individuals. The two sets of data should be plotted on the same axes. 
#Add a legend. Label the axes.
#Plot the data from the 100 samples in red and the data from the 1000 samples in blue.

bins<-seq(65,72.5,by=0.5)
counts_100<-hist(mean_heights_100,breaks=bins)$counts
counts_1000<-hist(mean_heights_1000,breaks=bins)$counts

pdf(file="plotHW1.pdf", width=6,height=6); #open the file
par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) #sets plotting area and margins
barplot(rbind(counts_100,counts_1000),col=c(2,4),beside=T,names.arg= seq(65,72,by=0.5),xlab="Height (inches)",ylab="Count")
legend(6,350,c("n=100","n=1000"),col=c(2,4),lwd=4)
dev.off()

