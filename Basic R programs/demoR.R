# RStudio R script demo

# declare single variable and assign number to it
x <- 5

# check value of x by printing it
x

# do math operations with this variable x
x+2  # output = 7
x*3  # output = 15 
x/4  # output = 1.25
x^2  # output = 25

# R objects that contain list of elements of the 
# same type is called a vector.
# declare a vector by using the c() concatenate function.
age <- c(56,32,28,29,71)

# check the number of elements in vector
length(age)

# get the mean, max, and min of vector
mean(age)
max(age)
min(age)

# add all elements of vector
sum(age)

# an alternate way of finding the mean
sum(age) / length(age)


# VECTOR MATH IN R

# we can do math operations on all elements of a 
# vector at once. For example, let's add 1 to every
# data element to age:
age    # print current value
age+1  # print value of each element + 1

# now multiply each element of vector by 2:
age    # print current value
age*2  # print value of each element + 1


# check the data type
typeof(age)
string <- "Hi I am a string"
typeof(string)

# round numbers
round(4.756,1)
round(4.756,2)
round(4.756,0)

# logical boolean operators
typeof(TRUE)
typeof(FALSE)

earthFlat <- FALSE
earthFlat


# IF conditional statements
# version 1
if (5>61) "Yup, 5 is greater than 61" else "Nope, 5 is not greater than 61"

# version 2
if(5>61){
  "Yup, 5 is greater than 61"
} else{
  "Nope, 5 is not greater than 61"
}


# subsetting
# subsetting is the practice of selecting and excluding
# elements from an R object.
# for example, create a new variable called older and
# assign it the values of age if they are greater
# than 30:
age
older <- age[age>30]
older

# return logicals (booleans) of whether elements
# meet a specific criteria
age<30

# check if element matches exact value
match <- age[age == 56]
match


