### This is partial exam 1 of PROGRAMMING R.

### This exam consists of ten questions with three levels of difficulty, ranging from
### basic (*) to advance (***). Each question is worth 1 point.

### In the exercises where a final answer is requested (these questions will be indicated by
### the expression "(QUESTION X)", where X is the corresponding number of the question), 
### please fill the line "### ANSWER TO X:", which you will find at the end of the exercise 
### where QUESTION X was formulated, with the corresponding answer (there can be more than
### one QUESTION in the same exercise).

### Good luck!
######################################################################################################
library(data.table);

### (*) EXERCISE 1: Create a variable of each one of the classes or data types we have
### seen during the course (feel free to choose its value). 
#### Do not use casting, create a new variable for each data type instead.

# 1.1 Numeric
v <- 3;

# 1.2 Integer
v <- 3L;

# 1.3 Character
v <- "3";

# 1.4 Logical
v <- TRUE;

# 1.5 Factor
v <- factor("dog");

# 1.6 Date (use as.Date or strptime)
v <- as.Date("2018-11-08");

# 1.7 Datetime/POSIXct (use as.POSIXct or strptime)
v <- as.POSIXct("2018-11-08 15:30:00");

# 1.8 Vector
v <- c(1, 2, 3);

# 1.9 Matrix
v <- matrix(1:4, nrow = 2, ncol = 2, byrow = TRUE);

# 1.10 Data.frame
v <- data.frame(v1 = c(1, 2), v2 = c("1", "2"));

# 1.11 Data.table
v <- data.table(v1 = c(1, 2), v2 = c("1", "2"));

# 1.12 List
v <- list(v1 = c(1, 2), v2 = c("1", "2"));


### (*) EXERCISE 2: You have the following vector:

v1 <- c(0, 1, 2);


### This vector belongs to one of the five basic variable classes we have seen during the
### course, which one? (QUESTION 1). 
### Cast 'v1' to each one of the other 4 variable classes in such a way that you create a new variable
### with each casting: v2, v3, v4 and v5.
### Then create a matrix with 'v1' as its first column, 'v2' as its second column, etc.
### To which R class belong each column of this matrix? (QUESTION 2).

# Castings
v2 <- as.integer(v1);
v3 <- as.character(v1);
v4 <- as.logical(v1);
v5 <- as.factor(v1);

# Create matrix
M <- matrix(c(v1, v2, v3, v4, v5), nrow = 3, ncol = 5); 
class(M[,1]);

### ANSWER TO 1: numeric
### ANSWER TO 2: character 



### (*) EXERCISE 3: You have the following data.frame:

df <- data.frame(name = c("Rex", "Tom", "Jerry", "Bobby"),
                 type = factor(c("dog", "cat", "mouse", "dog"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 5, 2, 7));


### Use numeric indexation to get the value of column 'name' in the second row.

df[2, 1];


### Use logical indexation to get the rows where 'type' is equal to dog. Do not create
### the logical index manually, it should be the output of a logical operator (>, <, ==, !=, etc.)
index <- c(TRUE, FALSE, FALSE, TRUE)
df[df[, colnames(df) == "type"] == "dog",];


### Use indexation by name to get the age of Jerry. You can select the row of 'df' 
### corresponding to Jerry using any indexation method, but the age column must be 
### selected using indexation by name.

df[3, "age"];


### Use indexation by variable ($ operator) in combination with logical indexation
### to get the name of the animals with age less than five.

df[df$age < 5, ]$name;



### (*) EXERCISE 4: A new prediction by Nostradamus has been recently discovered stating: 
### 'A machine learning algorithm will rule the world by 2018-11-08 16:50:00'.
### The date and time of this forecast is stored in the following variable

singularity <- "8AI50...18->000:16,11";


### You want to know how many minutes are left until this machine learning god
### comes to life. Write the R commands required to get this number.

singularity <- strptime(singularity, format = "%eAI%M...%y->%S0:%H,%m");
artificial_god <- difftime(singularity, Sys.time(), units = "mins");
as.numeric(artificial_god);



### (*) EXERCISE 5: You have the following dummy machine learning model:

model <- glm(Species ~ ., data = iris, family = "binomial");

### According to what we saw in class, which data type do you think is most suited to store 'model'
### (for instance, think about which R data type allows you to recover the original value of
### 'model' using the $ operator): a matrix, a data.table or a list? (QUESTION 3). 
### Create a variable of the data type you selected in the previous question containing 'model'. 

l <- list(model = model);
l$model;

### ANSWER TO 3: List.



### (**) EXERCISE 6: Convert the mtcars dataset (preloaded in R) into a data.table variable named 'dt'.
### Then count the number of cars (rows) with 6 cylinders using only one command with the format 
### dt[i, j, by] (maybe you do not need to use all of the three dimensions or indexes).

### EXPECTED OUTPUT (the name of the columns can be different in your output, but not their value):
#    n
# 1: 7

help(mtcars);

dt <- as.data.table(mtcars);
dt[cyl == 6, list(n = .N)];


### (**) EXERCISE 7: Using again 'dt', compute the maximum weight for each value of gear.
### Use only one command with the format dt[i, j, by] (maybe you do not need to use all of the three
### dimensions or indexes).

### EXPECTED OUTPUT (the name of the columns can be different in your output, but not their value):
#      gear max_w
# 1:    4   3.440
# 2:    3   5.424
# 3:    5   3.570


dt[, list(max_w = max(wt)), by = "gear"];



### (**) EXERCISE 8: Using only one command with the format dt[i, j, by] (maybe you do not need to use 
### all of the three dimensions or indexes) compute, for each possible number of cylinders,
### the number of cars with automatic transmission and the number of cars with manual
### transmission. Take into account only cars with more than 3 gears.

### EXPECTED OUTPUT (the name of the columns can be different in your output, but not their value):
#     cyl    automatic  manual
# 1:   6         2        3
# 2:   4         2        8
# 3:   8         0        2

dt[gear > 3, list(automatic = sum(am == 0),
                  manual = sum(am == 1)), by = "cyl"];



### (***) EXERCISE 9: You have the following text corresponding to the 
### "Don Quijote de la Mancha" book.

book <- "In a village of La Mancha, the name of which I have no desire to call to mind, 
there lived not long since one of those gentlemen that keep a lance in the lance-rack, 
an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef 
than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon
or so extra on Sundays, made away with three-quarters of his income. The rest of it went 
in a doublet of fine cloth and velvet breeches and shoes to match for holidays, while on 
week-days he made a brave figure in his best homespun. He had in his house a housekeeper 
past forty, a niece under twenty, and a lad for the field and market-place, who used to 
saddle the hack as well as handle the bill-hook. The age of this gentleman of ours was 
bordering on fifty; he was of a hardy habit, spare, gaunt-featured, a very early riser 
and a great sportsman. They will have it his surname was Quixada or Quesada (for here 
there is some difference of opinion among the authors who write on the subject), although
from reasonable conjectures it seems plain that he was called Quexana. This, however, is 
of but little importance to our tale; it will be enough not to stray a hair's breadth from
the truth in the telling of it."

### Replace "---FILL---" in the following R command to convert this
### character variable into a vector with one word per position.

# words <- unlist(strsplit("---FILL---"));

words <- unlist(strsplit(book, " "));

### Now get the top 10 more frequent words

top_words <- names(sort(table(words), decreasing = TRUE)[1:10])

### Filter 'words' so only the values contained in these top 10 remain

words <- words[words %in% top_words];

### Finally, cast this character vector into a factor and plot a barplot with the
### top words frequencies

words <- as.factor(words);
plot(words);



### (***) EXERCISE 10: Read the R object "userbase.RData" provided with this exam. It represents a 
### database of clients of an airline, where each row corresponds to a flight purchase. Get the top 5
### users in terms of number of flights purchased via online channels. Take into account only flights
### bought after "2018-11-01". Get also the top 5 in terms of price per purchase.


# Read the R object "userbase.RData"
dat <- readRDS("/Users/Falendor/Desktop/IE/sessions/6/userbase.RData");

# Take into account only flights bought after "2018-11-01"
dat <- dat[fecha_reserva >= as.Date("2018-11-01")];

# Get the top 5 users in terms of number of flights purchased via online channels
head(dat[canal_venta == "online", list(n_purchases = .N), by = "user"][order(n_purchases,
                                                                             decreasing = TRUE)], 5);

# Get also the top 5 in terms of price per purchase.
head(dat[canal_venta == "online", list(avg_price = mean(price)), by = "user"][order(avg_price,
                                                                                    decreasing = TRUE)], 5);