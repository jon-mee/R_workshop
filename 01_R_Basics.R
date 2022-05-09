#=======================================================================
#-----------------------(1.1) The Command Line--------------------------
#=======================================================================

#R lets you talk to your computer. The classic programmer's starting sript:
print("Hello world")

#R can do anything your basic, scientific, or graphic calcularor can

#basic math
2+3
2/3
2*3
2^3
((2+3)*4^4-8)/6
pi^2
1e2
1e-2

#math functions
exp(1)
log10(10)
log(exp(1))
sqrt(9)
 
#plot equations
curve(x^2)
curve(x^2, xlim=c(-10,10))

#Note how I'm using the hash symbol to write comments.
#Running this line in R will have no effect!

#=======================================================================
#-------------(1.2) Defining objects and assigning values---------------
#=======================================================================

#Now, lets open a new script...
#CTRL-R (PC) or COMMAND-ENTER (Mac) sends code
#from the script to console
#If no text is selected, sends one line
#Otherwise, sends all selected text

a=4
a
#spaces or tabs (and even new lines) between elements don't matter
a = 4
a   =
  4
a
#There's another way!
a <- 4
a + 3

#Pretty much anything can be assigned to an object:
normal <- function(the.mean,the.sd) {
  curve((1/(sqrt(2*pi*the.sd^2)))*exp(-((x-the.mean)^2)/(2*the.sd^2)),xlim=c(the.mean-4*the.sd,the.mean+4*the.sd),ylab="Density",main=paste("Normal Distribution with mean = ",the.mean," and sd = ",the.sd,sep=""))
}
normal(0,1)

## naming convention for objects stored in R
## cannot start with a number
## all one word, or one string of characters
my cat="Chesney"
my.cat  =  "Chesney"

#Watch out for case-sensitivity
My.cat

#=======================================================================
#----------------------------(2.1) Vectors------------------------------
#=======================================================================

mylist.is.a.vector <- c(1,2,3,4,5,6,7,8,9,10)
mylist.is.a.vector <- c(1:10)
length(mylist.is.a.vector)
min(mylist.is.a.vector)
max(mylist.is.a.vector)
mean(mylist.is.a.vector)

temperatureF <- c(52.3, 67, 91, 45, 55, 49)
temperatureC <- (temperatureF - 32) * 5/9

list.two <- c(4,34,9,78,NA,32,NA,43)
list.two[4]
list.two[c(3,6)]
is.na(list.two)
!is.na(list.two)
which(!is.na(list.two))
list.two.without.na <- list.two[which(!is.na(list.two))]
mean(list.two)
mean(list.two,na.rm=TRUE)
mean(list.two.without.na)

data.frame(V1=c(1,2,3,4,5),V2=c("a","b","c","d","e"))
dd <- data.frame(V1 = c(1,2,3,4,5),V2 = c("a","b","c","d","e"))
colnames(dd)
colnames(dd) <- c("Numbers","Letters")
dd[1,1]
dd[1,2]
dd[,1]
mean(dd[,1])
dd$Numbers
dd$Letters
mean(dd$Numbers)
subset(dd, Numbers > 3)
subset(dd, Numbers >= 3)
subset(dd, Numbers == 3)
subset(dd, Numbers != 3)

#=======================================================================
#------------------------(2.2) Reading Files----------------------------
#=======================================================================

#To import data into R, you need to tell R to "read" a file...
#Try with the fish data (Chrosomus_length):
fish <- read.csv(file.choose(),header=TRUE)