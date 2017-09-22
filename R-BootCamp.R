library (ape)
library (geiger)
library (ggplot2)
setwd("~/Desktop/UCLA/Fall_2017/EEB_201/bootcamp")

#9.1.0.0.1 Exercise
#What do the %% and %/% operators do?
  ##For double arguments, %% can be subject to catastrophic loss of accuracy if x is much larger than y, and a warning is given if this is detected.
  ##%% and x %/% y can be used for non-integer y, e.g. 1 %/% 0.2, but the results are subject to representation error and so may be platform-dependent. Because the IEC 60059 representation of 0.2 is a binary fraction slightly larger than 0.2, the answer to 1 %/% 0.2 should be 4 but most platforms give 5.

#9.1.1.0.1 Exercise
#What happens when the length of the longer vector is not a multiple of that of the shorter?
  ## It will warn you that the longer vector is not a multiple of the shorter vector. It will "recycle" the shorter vector, by repeating the values in the same order until it is of equal length of the longer vector.

#9.1.2.0.1 Exercise
#Use seq to create the vector v=(1 5 9 13), and to create a vector going from 1 to 5 in increments of 0.2 .
v <- seq(1,13,4)
v2 <- seq(1,5,0.2)

#9.1.2.0.2 Exercise
#What happens when to is less than from in seq? What result does 3:1 give? This is one of the first “gotchas” R newbies run into.
seq(3:1) # gives you the same result as seq(1:3) and seq(1,3) [1] 1 2 3
seq(3,1) # counts down [1] 3 2 1

#9.1.3.0.1 Exercise
#If you enter v <- z[seq(1,5,2)], what will happen? Make sure you understand why.
z <- c(1,3,5,7,9,11); z[3]
v <- z[seq(1,5,2)] #creates a new vector (v) that will contain the 1st 3rd and 5th number [seq(1,5,2)] in the vector of z

#9.1.3.0.2 Exercise
#Write a one-line command to extract a vector consisting of the second, first, and third elements of z in that order.
v<- z[c(2,1,3)]

#9.1.3.0.3 Exercise
#What happens when I set the value of an element that doesn’t exist? For example, try
z[9] <- 11 #adds NA as place holders for the epmty positions (position 7 & 8)

#9.1.3.0.4 Exercise
#Write code that computes values of y=(x−1)(x+1) for x=1,2,⋯,10, and plots y versus x with the points plotted and connected by a line.
x<- seq(1,10)
y <- (x-1)/(x+1)
plot(x,y)
lines(x,y)

#9.1.3.0.6 Exercise
#The sum of the geometric series 1+r+r^2+r^3+...+r^n approaches the limit 1/(1−r) for r<1 as n→∞. Take r=0.5 and n=10, 
#and write a one-line command that creates the vector G=(r0,r1,r2,...,rn).Compare the sum (using sum()) of this vector to the limiting value 1/(1−r) Repeat for n=50.
G <- 0.5^(seq(0,10))
limit <- 1/(1-0.5)
limit-sum(G)
G50 <- 0.5^(seq(0,50))
limit-sum(G50)

#9.1.5.0.1 Exercise
#What would happen if instead of setting lowLight you replaced Light by saying Light <- Light[Light<50]? Why would that be the wrong thing to do in the above example?
Light <- c(20,20,20,20,21,24,44,60,90,94,101)
rmax <- c(1.73,1.65,2.02,1.89,2.61,1.36,2.37,2.08,2.69,2.32,3.67)
lowLight <- Light[Light<50]
lowLightrmax <- rmax[Light<50]
lowLight
   ##you are writing over your full and coplerte data set with only a subset of that data Light[Light<50]


#9.1.5.0.2 Exercise
#runif(n) is a function that generates a vector of n random, uniformly distributed numbers between 0 and 1. 
#Create a vector of 20 numbers, then find the subset of those numbers that is less than the mean. More on runif and related functions soon.
numbers<- runif(20)
mnum <- mean(numbers)
lessmean<- numbers[numbers<mnum]

#9.1.5.0.3 Exercise
#Find the positions of the elements that are less than the mean of the vector you just created (e.g. if your vector were (0.1 0.9 0.7 0.3) the answer would be (1 4)).
position<-which(numbers<mnum)

#9.1.5.0.4 Exercise
#Specify two ways to take only the elements in the odd positions (first, third, …) of a vector of arbitrary length.
#Option 1
nn <- length(numbers) #find how many values are in your vector
pos<- seq(1,n,2) #create sequence of odd positions in your vector
result <- numbers[pos] #extract the values that are listedin your sequece

#Option 2
result <- numbers[seq(1,n,2)]
result

#9.2.1.0.1 Exercise
#Use a command of the form X <- matrix(v,nrow=2,ncol=4) where v is a data vector, to create the following matrix X:
X <- matrix(c(1,2,1,2,1,2,1,2),nrow=2,ncol=4)

#9.2.1.0.2 Exercise
#Use rnorm and matrix to create a 5×7 matrix of Gaussian random numbers with mean 1 and standard deviation 2.
Y<- matrix(c(rnorm(35,1,2)), nrow=5,ncol=7)

#9.2.2.0.1 Exercise
#Verify that rbind(C,D) works, cbind(C,C) works, but cbind(C,D) doesn’t. Why not?
  #you cannot column bind becasue there are not = amounts of rows

#9.3.0.0.1 Exercise
#What happens when we set the dimension attribute on a vector? For example:
x <- seq(1,27) #makes vector
dim(x) <- c(3,9)#adds demesions
is.array(x)#yes it creates an array
is.matrix(x)#yes it makes a matrix

#9.6.0.0.1 Exercise
#Download the hurricanes.csv file. Examine the resulting data frame by printing it and using the str command. Note the class type of each variable.
data.url <- "http://kingaa.github.io/R_Tutorial/hurricanes.csv"
hurricanes <- read.csv(data.url,comment.char='#')

#11.0.0.0.1 Exercise
#Make a copy of Intro2.R under a new name, and modify the copy so that it does linear regression of algal growth rate on the natural log of light intensity, LogLight=log(Light), and plots the data appropriately. You should end up with a graph that resembles the following.

source("ModifiedIntro.R")
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")
X <- read.csv("ChlorellaGrowth.csv",comment.char='#')

#11.0.0.0.2 Exercise
#Run Intro2.R, then enter the command plot(fit) in the console and follow the directions in the console. Figure out what just happened by entering ?plot.lm to bring up the help page for the function plot.lm() that carries out a plot() command for an object produced by lm(). 
#(This is one example of how R uses the fact that statistical analyses are stored as model objects. fit “knows” what kind of object it is (in this case an object of type lm), and so plot(fit) invokes a function that produces plots suitable for an lm object.) 
source("Intro2.R")
plot(fit)
  #R produced a series of diagnostic plots showing residuals. This allows for extreme points (the most likely candidates for “outliers”) to be identified according to their sequence in the data set.

#11.0.0.0.3 Exercise
#Create a plot of growth rate versus light intensity with the x-axis running from 0 to 120, and the y-axis running from 1 to 4.
attach(X)
plot(rmax~light, xlim=c(0,120), ylim=c(1,4))

#11.0.0.0.4 Exercise
  #On different R script

detach(X)

#11.0.0.0.5 Exercise
#Use ?par to read about other plot control parameters that can be set using par(). Then draw a 2×2set of plots, each showing the line y=5x+3
#with x running from 3 to 8, but with 4 different line styles and 4 different line colors.
?par
X<-seq(0,10)
Y<-(5*X)+3


par(mfcol=c(2,2))
plot(Y~X, lty=5, col="grey", xlim=c(3,8))
lines(Y~X, lty=5, col="grey")
plot(Y~X, lty=2, col="red",xlim=c(3,8))
lines(Y~X, lty=2, col="red")
plot(Y~X, lty=3, col="blue",xlim=c(3,8))
lines(Y~X, lty=3, col="blue")
plot(Y~X, lty=4, col="green",xlim=c(3,8))
lines(Y~X, lty=4, col="green")

#11.0.0.0.6 Exercise
#Modify one of your scripts so that at the very end it saves the plot to disk. 
?dev.print
dev.copy(png,'myplot.png')



