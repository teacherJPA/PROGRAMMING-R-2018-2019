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

# (1) Exercise 1: Create a variable 'x' with the value 7, a variable 'y' with value equal to 3 and a 
# variable 'multiplication' equal to 'x' plus 'y'. Finally, print the result of 'multiplication'.
# What happens in the environment pane?.



# (*) Exercise 2: Save your workspace into a path of your choice, clear your current workspace
# and then load your stored workspace back. Perform all these operations both using Rstudio
# buttons and R commands (save.image, etc.).



# (*) Exercise 3: Create a variable 'x' with the value 73, a variable 'y' with value equal to
# "Hello world!" and then try to add these two variables. What happens?



# (*) Exercise 4: Install a new package into your system. Suggestion: Install errint or 
# Amelia package. 



# (*) Exercise 5: Change your pane layout in order to set your source window to be at your bottom
# right, your console at the top left, your environment pane at your bottom left and your
# miscellaneous pane (files, plots, etc.) at your top right. 



# (**) Exercise 6: Remove the package that you have previously installed in Exercise 4.
# Suggestion: Check the documentation of the install.packages function. In particular, 
# the 'See Also' section at the bottom.



# (**) Exercise 7: Create an R script with basic operations of your choice (it should include at least
# one print command). Run this script from your Windows/ Ubuntu / Mac terminal. Suggestion: Use the
# Rscript command.



# (**) Exercise 8: Call the garbage collector (gc command). Check its help documentation and also
# this stackoverflow thread for further understanding of how harbage collector works in R:
# https://stackoverflow.com/questions/8813753/what-is-the-difference-between-gc-and-rm



# (***) Exercise 9: Create three variables ('var1', 'var2', 'var3') with a value of your choice and 
# then clear two of these variables from the workspace in one command. Suggestion:  You can create
# a vector using the c() command, e.g. c('var1', 'var2'), and then pass this vector into the list
# argument of the rm function.



# (***) Exercise 10: Use sprintf to create a string with these format: "Hello NAME. My first R
# result is VALUE", where NAME and VALUE are actually the values of two variables you have 
# previously created. Suggestion:  help(sprintf);