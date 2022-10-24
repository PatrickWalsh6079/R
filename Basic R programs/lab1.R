# Group member names: Patrick, Hannah, Kelsey, Mark, Blessy

#1.	Use the command line in R-Studio to add together all of the numbers between 1 and 10 (inclusive). Take note of the result. Remember, every student should type and run the code on their own copy of R-studio.
1+2+3+4+5+6+7+8+9+10

#2.	Now create a vector of data that contains the numbers between 1 and 10 (inclusive). 
#Here is a line of code to do that:
myNumbers <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)


#3.	Now add together all of the numbers that are in the vector myNumbers. 
#   There is a built-in function within R that can do this for you in one step: 
#   Take a guess as to the name of that function and run it on myNumbers. 
#   Check your result against the results of question 1.
sum(myNumbers)

#4.	R can do a powerful operation called “vector math” in which a calculation runs on 
#   every element of a vector. Try vector math on myNumbers by adding 10 to each element of 
#   myNumbers, and storing the result in myNewNumbers. Print out myNewNumbers.
myNewNumbers <- myNumbers + 10

#5.	Efficiently calculate a sum of the numbers between 11 and 20 (inclusive), using 
#   techniques from the problems above. Hint: use c(11:20)
sum(c(11:20))

#6.	Calculate a sum of all of the numbers between 1 and 100 (inclusive), using techniques 
#from the problems above.
sum(c(1:100))


###################
#End of breakout 1
##################


#7.	Make sure you have a variable myNumbers, that is a vector 
# of 10 numbers (1,2,3,4,5,6,7,8,9,10)


#8.	Add the following commands to the end of your code file and run each one:
 

#9.	Add a comment to each of the lines of code in your file explaining what it does. 
#The comment character is “#”. 


#10.	Explain the  output of the following command:
trueFalse <- myNumbers > 5
# Goes through each element in the vector 'myNumbers' and checks if each element is greater than
# 5. If the element is greater than 5, it prints 'TRUE', otherwise, it prints 'FALSE'.


#11.	Explain the  output of the following command:
bigNum <- myNumbers[myNumbers > 5]
myNumbers[trueFalse]
bigNum

# the variable bigNum checks the vector myNumbers and prints out the value of each element that is greater than 5. It does
# this by using indexing inside the square brackets [] either by checking > 5 or by using the variable trueFalse, which does
# the same operation.

#12.	Whenever you need R to explain what a command does and how it works, use 
#the ? command or the help() command. Add and run these commands:
?mean
help("mean")


