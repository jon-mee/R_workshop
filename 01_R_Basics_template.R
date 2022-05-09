#=======================================================================
#-----------------------(1.1) The Command Line--------------------------
#=======================================================================

#R lets you talk to your computer. The classic programmer's starting sript:

#R can do anything your basic, scientific, or graphic calcularor can

#basic math

#math functions

#plot equations

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

#spaces or tabs (and even new lines) between elements don't matter

#There's another way!

#Pretty much anything can be assigned to an object:
normal <- function(the.mean,the.sd) {
  curve((1/(sqrt(2*pi*the.sd^2)))*exp(-((x-the.mean)^2)/(2*the.sd^2)),xlim=c(the.mean-4*the.sd,the.mean+4*the.sd),ylab="Density",main=paste("Normal Distribution with mean = ",the.mean," and sd = ",the.sd,sep=""))
}

## naming convention for objects stored in R
## cannot start with a number
## all one word, or one string of characters

#Watch out for case-sensitivity

#=======================================================================
#----------------------------(2.1) Vectors------------------------------
#=======================================================================

my.list.is.a.vector

#=======================================================================
#------------------------(2.2) Reading Files----------------------------
#=======================================================================

#To import data into R, you need to tell R to "read" a file...
