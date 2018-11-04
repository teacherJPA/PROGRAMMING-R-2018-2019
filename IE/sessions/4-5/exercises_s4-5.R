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

# (*) Exercise 1: You have the following matrix

countries <- c("Spain", "Russia", "Japan", "India", "Colombia");
populations <- c(46.5, 144.5, 126.8, 1339, 49.07 );
countries_pop <- matrix(c(countries, populations), ncol=2, nrow= length(countries), byrow = FALSE);
colnames(countries_pop) <- c("country", "population");
countries_pop

# You want to sort the matrix so the first row corresponds to the most populated country,
# the second row row to the second most populated one, etc. You try to achieve this goal
# by using the following command

ordered <- countries_pop[order(countries_pop[, "population"]),]
ordered;

# Is the output correct? Try now to create a data.frame from countries and populations
# and carry out the same R operation. What happens now? 



# (*) Exercise 2: You have the following variables

countries_pop <- data.frame(country = c("Portugal", "Costa Rica", "Italy",
                                        "Venezuela", "Japan"));
continents <- c("America", "America", "Asia", "Europe", "Europe");

# Reorder the vector 'continents' using indexation so the value of each position
# corresponds to the continent where each value of 'countries_pop$country' is located. Then
# add the vector 'continents' to the data.frame 'countries_pop' using the $ operator.



# (*) Exercise 3: You are working on a pet store and have available the following data.frame
# corresponding to some of the animals in your shop.

df <- data.frame(name = c("Rex", "Tom", "Jerry", "Bobby"),
                 type = factor(c("dog", "cat", "mouse", "dog"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 5, 2, 7));
df;

# A new law in your country requires pet stores to give a list of all the names and types
# of the animals in their shops which are older than four years old. Get this list as a
# data.frame using any of the indexations methods seen during the course and store the result
# in a variable called 'official_list'. Remember to keep only the columns name and type.



# (*) Exercise 4: Two new animals have arrived to your store.

new_pets <-data.frame(name = c("Salem", "Algernon"),
                      type = factor(c("cat", "mouse"), levels = c("dog", "cat", "mouse")),
                      age = c(2, 59));
new_pets;


# Some error must have ocurred when setting the age of Algernon, as its real age is the same
# as Salem's age. Could you please correct this information in 'new_pets'? Do not insert
# the value 2 manually.



# (*) Exercise 5: Add 'new_pets' to 'df'. Suggestion: help(rbind).



# Create a vector 'colors' where you set the colors of all the pets in the store (feel free
# to choose the values of 'colors'). Add this new vector to df. Suggestion: help(cbind).



# (**) Exercise 6: A woman came to your shop today looking for its lost dog, called

lost_dog <- sample(c("Rexie", "Rex", "T-Rex"), 1);

# Use an R command to look for this name into your database 'df' and
# save the result into a logical variable called 'found', with a value of TRUE if
# 'lost_dog' is contained in 'df' variable name and FALSE otherwise. Suggestion: help(match).



# (**) Exercise 7: You have the following list of planets of the Solar System

planets <- "Mercury-Venus-Earth-Mars-Jupiter-Saturn-Uranus-Neptune";

# Create a list from planets with only one variable containing a character vector
# with all the planet names. Suggestion: Use strplit after checking its documentation.



# (**) Exercise 8:  You have the following list

l <- list(v1 = c("a", "b", "c"), 
          v2 = c("d", "e", "f"), 
          v3 = c("p", "r", "o", "g", "r", "a", "m", "m", "i", "n", "g", "R"));
l;

# Remove from this list the variables containing the "a" letter. Suggestion: Use
# grepl and l[FILL] <- NULL where FILL is a suitable index. 



# (***) Exercise 9: You have the following data.tables

dt_1 <- data.table(name = c("Rex", "Salem", "Algernon"),
                   type = c("dog", "cat", "mouse"));
dt_2 <- data.table(name = c("Rex", "Salem", "Algernon"),
                   age = c(3, 2, 2));

# Join these two data tables using the merge function. The expected output is:

# name  type age
# 1: Algernon mouse   2
# 2:      Rex   dog   3
# 3:    Salem   cat   2

# Suggestion: ?merge.



# (***) Exercise 10: Load the dataset mtcars. Create a data.table with the last 5
# observations of each possible value of 'cyl', i.e, we want to get the five last cars
# in the mtcars dataset with 4 cylinders, the last five with 6 cylinders, etc.
# Suggestion: Use .SD and the function tail.


