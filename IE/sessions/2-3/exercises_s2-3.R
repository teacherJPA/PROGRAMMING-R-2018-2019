### These are optional exercises to help you fix important concepts and to allow students to go
### more in-depth into the details of some particular topics. 

### A new set of exercises will be uploaded after each session (or double session) and 
### reviewed at the beginning of the next one.

### One asterisk (*) means that the exercise covers basic concepts described during the session, i.e,
### it is basically a repetition of operations done during the class.
### Two asterisks (**) indicates an intermediate exercise, one that modifies operations
### or content explained during the class, in order to get a better understanding of some ideas.
### Three asterisks (***) mark an advanced exercise. These assignments will cover a new topic related 
### to the content of the session or will go into more detail about some of the most critical concepts.

######################################################################################################

# (*) Exercise 1: Check if the given variable 'random_number' is divisible by 
# 'random_dividend' using the modulo or remainder operator. Save the output in a logical 
# variable called 'divisible' (complete line 24). Read the documentation of floor() 
# and runif() if you want to learn more about these functions.

random_number <- floor(runif(1, 11, 100));
random_dividend <- floor(runif(1, 1, 10));

divisible <- ;



# (*) Exercise 2: You know that Nostradamus foretold the end of the world to 
# arrive in "2018-12-31 23:59:59". This datetime is saved in 'EOW' but is encrypted
# in a stange format. Could you convert this variable into the corresponding 
# R datetime variable and compute the seconds of life we have remaining?

EOW <- "59_31 2018A59-23/12";



# (*) Exercise 3: Create a numeric vector of length 10. Then filter this vector
# so the only remaining values in it are the ones between 2 and 5 (both included). 



# (*) Exercise 4: You have the following vector of random numbers 

random_v <- runif(10, -1, 1);

# Order this vector both in ascending and in descending order. Do this by using sort()
# first and then try to do the same using order().



# (*) Exercise 5: Use gsub function to change the expression "a thousand" for "ten
# millions" in the given variable 'text'.

text <- "One accurate measurement is worth more than a thousand expert opinions";



# (**) Exercise 6: You have the following list of planets in the Solar System

planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune");

# Convert this character vector into a single character variable where planet names are
# separated by the symbol '->'. Suggestion: Check the list of possible arguments in
# the paste() function documentation.



# (**) Exercise 7: Create a matrix with 2 rows and 4 columns with the same values
# as the planets vector from the previous exercise. Then select from the matrix only the 
# character values with the 'a' letter in them. 



# (**) Exercise 8:  You have the following matrix with a list of countries and their
# respective populations

countries <- c("Spain", "Russia", "Japan", "India", "Colombia");
populations <- c(46.5, 144.5, 126.8, 1339, 49.07 );
countries_pop <- matrix(c(countries, populations), ncol=2, nrow= length(countries), byrow = FALSE);
colnames(countries_pop) <- c("country", "population");

# Order the rows in 'countries_pop' in ascending order of population, i.e., the output 
# should be 

# country    population
# [1,] "Spain"    "46.5"    
# [2,] "Colombia" "49.07"   
# [3,] "Japan"    "126.8"   
# [4,] "Russia"   "144.5"   
# [5,] "India"    "1339"

# Use the order() function. Suggestion: Take into account that ordering a number
# interpreted as character is not the same as ordering numeric values.



# (***) Exercise 9: You have the following variable 'names' (a character vector of length 3).

names <- c("J3esus", "Mar1ia", "J0os4e");

# but the names in it are corrupted and numbers appear between the letters. You need to
# remove these numbers. Use only one call to gsub function and regular patterns to 
# remove them. Suggestion: Check help(regex) or stackoverflow to learn how regular
# expressions work in R.



# (***) Exercise 10: Load the object "quixote.RDA" given in the Session 2-3 Class
# Material using readRDS(). Then get the table of frequencies of the words 
# in 'quixote' using the table() function. Which one is the most frequent word?
# Suggestion: Read the documentations of readRDS() and table(). 

quixote <- readRDS("FILL!!!");