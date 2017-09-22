X <- read.csv('ChlorellaGrowth.csv',comment.char='#')
# using '#' as a comment character allows us the CSV file to be self-documenting
X$LOGlight<- log(X$light)
X$LOGrmax<-log(X$rmax)

par(cex=1.5,cex.main=0.9)
plot(rmax~light,data=X,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=16) 
# xlab and ylab are x and y axis labels, pch is "plotting character"
# cex is 'character expansion' - cex=1.5 increases symbol & label sizes by 50%
# cex.main sets the character expansion for the main title of the plot 

title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~light)
summary(fit); abline(fit) 

# Next we get the regression equation to 'display itself' on the graph
c1 <- round(fit$coef[1],digits=3) 	# intercept	
c2 <- round(fit$coef[2],digits=3) 	# slope
text(50,3,paste("rmax=",c1,"+",c2,"light")) 

par(mfcol=c(2,1))

plot(rmax~light,data=X,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=16) 
title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~light)
summary(fit); abline(fit) 

plot(LOGrmax~LOGlight,data=X,xlab="log light intensity (uE/m2/s)",ylab="log maximum growth rate (1/d)",pch=16) 
title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~LOGlight)
summary(fit); abline(fit) 

par(mfcol=c(1,2))

plot(rmax~light,data=X,xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=16) 
title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~light)
summary(fit); abline(fit) 

plot(LOGrmax~LOGlight,data=X,xlab="log light intensity (uE/m2/s)",ylab="log maximum growth rate (1/d)",pch=16) 
title(main="Data from Fussmann et al. (2000) system")
fit <- lm(rmax~LOGlight)
summary(fit); abline(fit) 