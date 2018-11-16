#################################### [0] WHAT IS AN R FUNCTION? ###################################
# Function call
gsub(pattern = "Python", replacement = "R", x = "I love Python");

# Function code
View(gsub);

# Function documentation
help(gsub);

# Function arguments
args(gsub);

# Use tab for info on function arguments
gsub()

#################################### [1] LOAD LIBRARIES ###################################

# Install library
install.packages("errint");

# Load library (to make functions available for your code)
library(errint);

# Check library content (from Rstudio)


# Check library content (from CRAN)


# Check content of a function
best_distribution;
View(best_distribution);
View(table);


#################################### [2] CREATE FUNCTION ###################################

#################################### [2.1] NO ARGUMENTS ###################################
my_fun <- function(){
  print("Hello world");
}

my_fun();

### Check Environment!!!

############################### [2.2] FIXED ARGUMENTS WITHOUT DEFAULTS ############################
my_fun <- function(name, number){
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
}

my_fun();
my_fun("John");
my_fun("Evey", 5);
my_fun(5, "Evey");
my_fun(number = 5, name = "Evey");


############################### [2.3] FIXED ARGUMENTS WITH DEFAULTS ############################
my_fun <- function(name, number = 100){
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
}

my_fun();
my_fun("John");
my_fun("Evey", 5);


############################### [2.4] DINAMIC ARGUMENTS WITH DEFAULTS ############################
my_fun <- function(name, number = 100, ...){
  arguments <- list(...);
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
  print(arguments);
}

my_fun("Evey", 5);
my_fun("Evey", 5, var1 = 1, var2 = c("a", "b"));


my_fun <- function(name, number = 100, ...){
  arguments <- list(...);
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
  
  if (class(arguments$word1) == "character"){
    print(sprintf("PD: %s the %dth of %s", arguments$word1, number, arguments$word2));
  }
}

my_fun("Evey", 5);
my_fun("Evey", 5, word1 = "Remember", word2 = "November");



#################################### [3] SOURCE FUNCTIONS ###################################

rm(list = ls());

#################################### [3.1] USING RSTUDIO ###################################

my_hello_world();
my_fun("Evey", 5, word1 = "Remember", word2 = "November");

#################################### [3.2] USING R COMMAND ###################################
source('C:/Users/Falendor/Dropbox/Planes/proyectos/academia/IE/sessions/7/functions.R')



#################################### [4] FUNCTION SCOPE ###################################

# A variable created inside a function is not visible outside that function
my_fun <- function(){
  a <- 3;
  print(a);
}

my_fun();

# Unless we use the <<- operator
my_fun <- function(){
  a <<- 3;
  print(a);
}

my_fun();

# You can also access these variables by returning them as an output
my_fun <- function(){
  a <- 3;
  return(a);
}

# Even with several variables
my_fun <- function(){
  a <- 3;
  b <- "second argument"
  return(list(a = a, b = b));
}


# What happens if you use <- instead of = to pass arguments to a function?
my_fun <- function(name, number){
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
}

my_fun(name = "Evey", number = 5);
my_fun(name <- "Evey", number <- 5);

my_fun(number <- 5, name <- "Evey");
number <- 5;
name <- "Evey";
my_fun(number, name);
my_fun(name = number, number = name)
