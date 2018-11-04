##################################### [1] VARIABLE CLASSES ############################################

####################################### [1.1] numeric ##########################################

# Variable assignment
x <- 5;
y <- 2;
class(x);
class(y);


# Basic operations
x + y; # Addition
x - y; # Substraction
x * y; # Multiplication
x / y; # Division
x %/% y; # Integer division
x ^ y; # Exponentiation
x %% y; # Modulo

x < y; # Less than
x <= y; # Less than or equal to
x > y; # Greater than
x >= y; # Greater than or equal to
x == y; #	Exactly equal to
x != y; #	Not equal to


#######################################  [1.2] integer ####################################### 

# Variable assignment
x <- 5;
class(x);
x <- as.integer(5);
y <- 2L;
class(x);
class(y);

identical(as.integer(5), 5L);
identical(as.integer(5), 5);

# Basic operations
x + y; # Addition
x - y; # Substraction
x * y; # Multiplication
x / y; # Division
x %/% y; # Integer division
x ^ y; # Exponentiation
x %% y; # Modulo
x < y; # Less than
x <= y; # Less than or equal to
x > y; # Greater than
x >= y; # Greater than or equal to
x == y; #	Exactly equal to
x != y; #	Not equal to

# Operations between numerics and integers
z <- 3.5;
class(z);
x + z;
class(x + y);
class(x + z);



#######################################  [1.3] character ####################################### 

# Variable assignment
x <- "Jesus";
y <- "Prada";
class(x);
class(y);

# Basic operations
nchar(x); # Nº of characters in string
substr(x, 1, 2); # Get substring
substr(x, 3, 4); # Get substring
substr(x, 4, 5); # Get substring
substr(x, 4, 10); # Get substring (error?)
gsub("u", "ú", x); # Replace character
grepl("ra", y); # Search for pattern
paste('a','b','c') # Paste character with a specified separator
paste('a','b','c',sep='-') # Paste character with a specified separator
paste('a','b','c',sep=' ');
paste0('a','b','c');
identical(paste('a','b','c', sep=''), paste0('a','b','c'));


#######################################  [1.4] logical ####################################### 

# Variable assignment
x <- TRUE;
y <- FALSE;
class(x);
class(y);

# Basic operations
!x; # Not x
x | y; # x OR y
x & y; # x AND y


# Logical conditions
5 == 3;
class(5 == 3);
!(5 == 3);
5 != 3;
!(5 == 3) == (5 != 3);
5 > 3;
(5 == 3) | (5 == 5);
(5 == 3) & (5 == 5);


#######################################  [1.5] factor ####################################### 
x <- factor("class 1");
y <- factor("class 3");
class(x);
class(y);

x <- factor("class 1", levels= c("class 1", "class 2", "class 3"));
y <- factor("class 3", levels= c("class 1", "class 2", "class 3"));
class(x);
class(y);


# Basic operations
as.numeric(x); 
as.numeric(y);
y <- factor("class 3", levels= c("class 1", "class 3", "class 2"));
as.numeric(y);
y <- factor("class 3", levels= c("class 1", "class 2", "class 3"));


#######################################  [1.6] Variable Casting (Conversion) ####################################### 

# [1 -> 2] Numeric to integer
x <- 12.3;
class(x);
x <- as.integer(x);
x;
class(x);
x <- 7.6;
as.integer(x);
as.integer(round(x));
as.integer(floor(x));
as.integer(ceiling(x));

# [1 -> 3] Numeric to character
x <- 12.3;
x <- as.character(x);
x;
class(x);

# [1 -> 4] Numeric to logical
x <- 12.3;
x <- as.logical(x);
x;
class(x);
x <- 0;
as.logical(x);

# [1 -> 5] Numeric to factor
x <- 12.3;
x <- as.factor(x);
x;
class(x);
x <- 1
factor(x, levels = 1:10);


# [2 -> 1] Integer to numeric
x <- as.integer(7);
class(x);
x <- as.numeric(x);
x;
class(x);

# [2 -> 3] Integer to character
x <- as.integer(7);
x <- as.character(x);
x;
class(x);

# [2 -> 4] Integer to logical
x <- as.integer(7);
x <- as.logical(x);
x;
class(x);
x <- as.integer(0);
as.logical(x);

# [2 -> 5] Integer to factor
x <- as.integer(7);
x <- as.factor(x);
x;
class(x);
x <- as.integer(1);
factor(x, levels = 1:10);


# [3 -> 1] Character to numeric
x <- "12.7";
class(x);
x <- as.numeric(x);
x;
class(x);
x <- "Hello world";
as.numeric(x);

# [3 -> 2] Character to integer
x <- "12.7";
x <- as.integer(x);
x;

# [3 -> 4] Character to logical
x <- "12.7";
x <- as.logical(x);
x;
class(x);
x <- "TRUE";
as.logical(x);

# [3 -> 5] Character to factor
x <- "12.7";
x <- as.factor(x);
x;
class(x);
x <- "cat";
x <- factor(x, levels = c("human", "dog", "cat"));
x;
as.numeric(x);


# [4 -> 1] Logical to numeric
x <- TRUE;
class(x);
x <- as.numeric(x);
x;
class(x);
x <- FALSE;
as.numeric(x);

# [4 -> 2] Logical to integer
x <- TRUE;
x <- as.integer(x);
x;

# [4 -> 3] Logical to character
x <- TRUE;
x <- as.character(x);
x;
class(x);

# [4 -> 5] Logical to factor
x <- TRUE;
x <- as.factor(x);
x;
class(x);
x <- FALSE;
x <- factor(x, levels = c(FALSE, TRUE));
x;
as.numeric(x);
x <- factor(TRUE, levels = c(FALSE, TRUE));
as.numeric(x);


# [5 -> 1] Factor to numeric
x <- factor("C2", levels = c("C1", "C2", "C3"));
class(x);
x <- as.numeric(x);
x;
class(x);
x <- factor("C1", levels = c("C1", "C2", "C3"));
as.numeric(x);

# [5 -> 2] Factor to integer
x <- factor("C2", levels = c("C1", "C2", "C3"));
x <- as.integer(x);
x;

# [5 -> 3] Factor to character
x <- factor("C2", levels = c("C1", "C2", "C3"));
x <- as.character(x);
x;
class(x);

# [5 -> 4] Factor to logical
x <- factor("C2", levels = c("C1", "C2", "C3"));
x <- as.logical(x);
x;
class(x);
x <- factor(TRUE, levels = c(FALSE, TRUE));
as.logical(x);



##################################### [2] DATES AND DATETIMES ############################################

# Sys.Date 
today <- Sys.Date();
today;
yesterday <- Sys.Date() - 1;
yesterday;

# Dates difference
diff <- today - yesterday;
diff;
as.numeric(diff);
diff <- difftime(today, yesterday, units = "hours");
as.numeric(diff);

# From character to date
birthday <- as.Date("1989-10-03");
diff <- as.numeric(difftime(today, birthday, units = "days"));
age <- diff / 365.25;

# Date format
birthday <- as.Date("03-10-1989");
diff <- as.numeric(difftime(today, birthday, units = "days"));
age <- diff / 365.25;
help(strptime);
birthday <- strptime("03-10-1989", format = "%d-%m-%Y");
diff <- as.numeric(difftime(today, birthday, units = "days"));
age <- diff / 365.25;


# Dates between range
seq(from = 1, to = 10, by = 1);
seq(from = 1, to = 5, by = 2);
seq(from = Sys.Date() - 6, to = today, by = 1);
seq(from = Sys.Date() - 6, to = today, by = 2);

# Extract information of a date
library(lubridate);
year(today);
month(today);
weekdays(today);

# Sys.time
now <- Sys.time();
now;
now - 20;

# Datetimes difference
start <- Sys.time();
end <- Sys.time();
diff <- end - start;
as.numeric(diff);
diff <- difftime(end, start, units = "mins");
as.numeric(diff);

# From character to datetime
birthday <- as.POSIXct("1989-10-03 03:10:17 CEST");
diff <- as.numeric(difftime(today, birthday, units = "days"));
age <- diff / 365.25;


# Datetime format
help(strptime);
birthday <- strptime("1989/10/03 03:10:17", format = "%Y/%m/%d %H:%M:%S");
diff <- as.numeric(difftime(today, birthday, units = "days"));
age <- diff / 365.25;




##################################### [3] VECTORS ############################################


##################################### [3.1] VECTOR CREATION ########################################

##################################### [3.1.1] c() function ########################################
v1 <- c(1, 2 , 3);
class(v1);
length(v1);

u <- c("a", "b", "c", "d");
class(u);
length(u);
letters;

u <- c("a", "b", 7, "d");
class(u);
u;

x <- c('A','B','A','C','B','A');
class(x);
plot(x);
x <- factor(x,levels = c('A','B','C'));
class(x);
plot(x);
##################################### [3.1.2] : operator ########################################
v2 <- 1:3;
identical(v1, v2);
v2 <- as.numeric(1:3);
identical(v1, v2);
v2 <- 1:10; 
v2;
v2 <- 5:-3; 
v2;

##################################### [3.1.3] seq function ########################################

v3 <- seq(from = 1, to = 3, by = 1);
identical(v1, v3);
v3 <- seq(from = 5, to = 23, by = 2);
v3;
v3 <- seq(from = 5, to = 23, length.out = 5);
v3;

##################################### [3.2] VECTOR INDEXATION ######################################
v <- c("v1", "v2", "v3", "v4", "v5");
v;

##################################### [3.2.1] by integer ########################################
v[4];
v[c(1,3)];
v[13];
v[-2];

##################################### [3.2.2] logical indexation #################################
index <- c(FALSE, FALSE, TRUE, FALSE, FALSE);
v[index];
index <- c(TRUE, FALSE, TRUE, FALSE, TRUE);
v[index];

u <- c(1, 7, 3, 12, 2);
u;
u[u < 5];
u < 5;
index <- c(TRUE, FALSE, TRUE, FALSE, TRUE);
identical(index, u < 5);

countries <- c("Spain", "Russia", "Japan", "India", "Colombia");
populations <- c(46.5, 144.5, 126.8, 1339, 49.07 );
countries[populations < 50];
which.max(populations);
countries[which.max(populations)];


##################################### [3.2.3] by name #################################
v <- c("v1" = 3, "v2" = 5, "v3" = 7, "v4" = 9);
v;
names(v);
v["v3"];
v[c("v1", "v3")];


##################################### [3.3] VECTOR MODIFICATION ######################################
v <- c("v1" = 3, "v2" = 5, "v3" = 7, "v4" = 9, "v5" = -1);
v;  
##################################### [3.3.1] using integer indexation ########################################
v[1] <- 4;
v;
v[c(2, 3)] <- v[c(2, 3)] + 1;
v;

##################################### [3.3.2] using logical indexation ########################################
v[v < 0] <- 0;
v;
v <- v[v >5];
v;

##################################### [3.3.3] using name indexation ########################################
v["v3"] <- max(v);
v;


##################################### [3.4] COMMON VECTOR OPERATIONS ######################################
v <- c(3, 17, 5, 11);
v;

##################################### [3.4.1] max/min/sum ######################################
max(v);
min(v);
which.max(v);
which.min(v);
sum(v);

##################################### [3.4.2] statistics ######################################
mean(v);
median(v);
summary(v);
quantile(v, probs = c(0.25, 0.5, 0.75));
sd(v);
var(v);

##################################### [3.4.3] sort/order ######################################
sort(v);
sort(v, decreasing = TRUE);
order(v);
identical(sort(v), v[order(v)]);

##################################### [3.4.4] repeat ######################################
v;
rep(v, 3);

##################################### [3.4.5] vector equivalence ######################################
u <- c(3, 4, 5, 6);
v == u;
v > u;
v[v > u];

v != u & v > u;
v != u && v > u;
v == u & v < 5;
v == u && v < 5;

##################################### [3.4.6] operations between vectors ######################################
u + v;
u - v;
u * v;
u / v;
u %*% v;
sum(u*v);



##################################### [4] MATRICES ############################################


##################################### [4.1] MATRIX CREATION ########################################
v <- c(1,2,3,4,5,6);
M <- matrix(v, nrow = 3, ncol = 2);
M;
M <- matrix(v, nrow = 3, ncol = 2, byrow = TRUE);
M;

# Check environment!!!

nrow(M) # number of rows
ncol(M) # number of rows
dim(M) # gets the dimension of the matrix
t(M)	# Transpose
nrow(M) # number of rows
ncol(M) # number of rows
dim(M) # gets the dimension of the matrix
##################################### [4.2] MATRIX INDEXATION ######################################


##################################### [4.2.1] by integer ########################################
M <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE);
M[1,2];
M[2,3];
M[2,];
M[,3];
M[2, c(1,2)];
M[7]

##################################### [4.2.2] logical indexation #################################
index <- c(FALSE, FALSE, TRUE);
M[index,];
M[index, index];

M < 6;
M[M < 6];


countries <- c("Spain", "Russia", "Japan", "India", "Colombia");
populations <- c(46.5, 144.5, 126.8, 1339, 49.07 );
countries_pop <- matrix(c(countries, populations), ncol=2, nrow= length(countries), byrow = FALSE);
countries_pop;
as.numeric(countries_pop[,2]);
countries_pop[as.numeric(countries_pop[,2]) < 50, 1];
which.max(as.numeric(countries_pop[,2]));
countries_pop[which.max(as.numeric(countries_pop[,2])), 1];


##################################### [4.2.3] by name #################################
colnames(countries_pop) <- c("country", "population");
rownames(countries_pop) <- c("row1", "row2", "row3", "row4", "row5");
countries_pop;
countries_pop[, "country"];
countries_pop["row3",];
countries_pop["row3", "country"];
countries_pop[3, 1];
identical(countries_pop[3, 1], countries_pop["row3", "country"]);

##################################### [4.3] MATRIX MODIFICATION ######################################
M <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE);
colnames(M) <- c("V1", "V2", "V3");
M;  
##################################### [4.3.1] using integer indexation ########################################
M[1,3] <- 23;
M;
M[2,] <- c(10, 11, 12);
M;

##################################### [4.3.2] using logical indexation ########################################
M[M < 10] <- 0;
M;

##################################### [4.3.3] using character indexation ########################################
M[,"V3"] <- max(M);
M;


##################################### [4.4] COMMON MATRIX OPERATIONS ######################################
M <- matrix(c(7, 2, 5, 3), nrow = 2, ncol = 2, byrow = TRUE);
colnames(M) <- c("V1", "V2");
M;  

##################################### [4.4.1] max/min/sum ######################################
max(M);
min(M);
which.max(M);
which.min(M);
sum(M);

##################################### [4.4.2] statistics ######################################
mean(M);
median(M);
summary(M);
quantile(M, probs = c(0.25, 0.5, 0.75));
sd(M);
var(M);
rowMeans(M);
colMeans(M);
rowSums(M);
colSums(M);

##################################### [4.4.3] sort/order ######################################
sort(M);
order(M);
identical(sort(M), M[order(M)]);


##################################### [4.4.4] matrix equivalence ######################################
N <- matrix(c(1, 2, 3, 4), nrow = 2, ncol = 2, byrow = TRUE);
M
N
M == N;
M[M == N]
M > N;
M[M > N]

##################################### [4.4.5] operations between matrices ######################################
M + N;
M - N;
M * N;
M / N;
M %*% N;
cbind(M,N)	# Combine matrices(vectors) horizontally (same number of rows)
rbind(M,N)	# Combine matrices(vectors) vertically (same number of columns)
M + 2;
M + c(1,2);
