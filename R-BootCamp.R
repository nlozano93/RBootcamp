library (ape)
library (geiger)
library (ggplot2)

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
