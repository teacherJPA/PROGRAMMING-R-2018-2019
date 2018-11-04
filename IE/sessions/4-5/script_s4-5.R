##################################### [1] DATA FRAMES ############################################


##################################### [1.1] CREATION ########################################
df <- data.frame(v1 = c(1, 2 ,3), v2 = c(11, 12, 13));
df;
class(df);
head(df, 2);

# Check environment!!! You can filter, sort, etc. the view
View(df);



############################## [1.2] DATA FRAME vs MATRIX ####################################
M <- matrix(c("Rex", "Tom", "Jerry", 1 ,2 ,3), nrow = 3, ncol = 2);
M;
class(M[,1]);
class(M[,2]);

df <- data.frame(name = c("Rex", "Tom", "Jerry"),
                 type = factor(c("dog", "cat", "mouse"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 15, 2));
df;
class(df[,2]);
class(df[,3]);

class(df[,1]);
df <- data.frame(name = c("Rex", "Tom", "Jerry"),
                 type = factor(c("dog", "cat", "mouse"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 15, 2), stringsAsFactors = FALSE);
class(df[,1]);

############################## [1.3] GET/SET STRUCTURE ####################################
nrow(df) # number of rows
ncol(df) # number of rows
dim(df) # gets the dimension of the matrix

# Get and modify colnames and row names;
colnames(df); 
rownames(df);
colnames(df) <- c("id", "age");
df;

# Get structure
str(df);


##################################### [1.4] INDEXATION ######################################
df;

##################################### [1.4.1] by integer ########################################
df[1,2];
df[2,3];
df[2,];
df[,3];
df[2, c(1,2)];
df[7]; ## ERROR!

##################################### [1.4.2] logical indexation #################################
index <- c(FALSE, FALSE, TRUE);
df[index,];
df[index, index];


countries <- c("Spain", "Russia", "Japan", "India", "Colombia");
populations <- c(46.5, 144.5, 126.8, 1339, 49.07);
countries_pop <- data.frame(country = countries, pop = populations);
countries_pop;
countries_pop[countries_pop[,2] < 50, 1];
which.max(countries_pop[,2]);
countries_pop[which.max(countries_pop[,2]), 1];


##################################### [1.4.3] by name #################################
colnames(countries_pop);
rownames(countries_pop);
countries_pop[, "country"];
countries_pop["3",];
countries_pop["3", "country"];
countries_pop[3, 1];
identical(countries_pop[3, 1], countries_pop["3", "country"]);


##################################### [1.4.4] by variable #################################
colnames(df);
df$name;
df$type;
df$age;
class(df$age);

##################################### [1.5] MODIFICATION ######################################
df <- data.frame(name = c("Rex", "Tom", "Jerry"),
                 type = factor(c("dog", "cat", "mouse"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 15, 2));
df;

##################################### [1.5.1] using integer indexation ########################################
df[1,3] <- 23;
df;
df[, 1] <- c("Simba", "Timon", "Pumba");
df;

##################################### [1.5.2] using logical indexation ########################################
df[df$age < 10, 3] <- 10;
df;

##################################### [1.5.3] using character indexation ########################################
df[,"age"] <- max(df$age);
df;


############################### [1.5.4] using variable name ###############################
df$age <- df$age -7;
df;
df$age[2] <- -2;
df;
df[df$age < 0,]$name <- "Baby";
df;


##################################### [1.6] EXPANSION ######################################
df;

############################### [1.6.1] add column ###############################

# Use cbind to add column
color <- c("yellow", "white", "brown");
df <- cbind(df, color);
df;

# Remove recently added column
old_df <- df;
df <- df[, -4];
df;

# Add column again by using data frame functionality
df$color <- c("yellow", "white", "brown");
df;

# ?cbind(df, new_variable) == df$new_variable <- value?
old_df;
df;
identical(old_df, df);
all.equal(old_df, df);
class(old_df$color);
class(df$color);

############################### [1.6.2] add row ###############################
# Use rbind to add column
new_animal <- c("Scar", "cat", 20, "red");
df <- rbind(df, new_animal);
df;

# Remove recently added column
df <- df[-nrow(df),];
df;

##################################### [1.7] OPERATIONS ######################################
df <- data.frame(name = c("Rex", "Tom", "Jerry"),
                 type = factor(c("dog", "cat", "mouse"), levels = c("dog", "cat", "mouse")),
                 age = c(3, 15, 2), stringsAsFactors = FALSE);

# Most operations don't make sense when computing for the entire data.frame. You should
# apply them to specific variables of the data.frame
mean(df);
mean(df$age);

sort(df);
sort(df$name);

# Nevertheless, there are exceptions
summary(df);
table(df);


############################## [1.8] PRE-LOADED DATASETS #################################
data();
data(iris);
class(iris);
data(mtcars);
class(mtcars);

##################################### [2] DATA TABLES ############################################

############################### [2.1] installation ###############################
install.packages("data.table");
library(data.table);


##################################### [2.2] CREATION ########################################
dt = data.table(
  name = c("Peter","William","John"),
  score = c(7, 9, 4),
  pass = c(TRUE, TRUE, FALSE)
);
class(dt);
class(dt$name);
class(dt$pass);
View(dt);
head(dt);

############################## [2.3] GET/SET STRUCTURE ####################################
nrow(dt) # number of rows
ncol(dt) # number of rows
dim(dt) # gets the dimension of the matrix

# Get and modify colnames and row names;
colnames(dt); 
rownames(dt);
colnames(dt) <- c("V1", "V2", "V3");
dt;

# Get structure
str(dt);


############################## [2.4] DATA FRAME TO DATA TABLE  ####################################
df = data.frame(
  name = c("Peter","William","John"),
  score = c(7, 9, 4),
  pass = c(TRUE, TRUE, FALSE)
);

# Two methods
dt_1 <- as.data.table(df);
dt_2 <- setDT(df);
identical(dt_1, dt_2);

# Are they equal??
df = data.frame(
  name = c("Peter","William","John"),
  score = c(7, 9, 4),
  pass = c(TRUE, TRUE, FALSE)
);
dt_1 <- as.data.table(df);
class(df);
dt_2 <- setDT(df);
class(df);


df <- as.data.table(matrix(rep(3,10^8), nrow = 10^4, ncol = 10^4));
system.time(dt_2 <- as.data.table(df));
system.time(dt_1 <- setDT(df));

rm(list = c("df", "dt_1", "dt_2"))
gc(verbose = TRUE); # Garbage collector!

############################## [2.5] DATA TABLE vs DATA FRAME ####################################
# Character, not factors, by default
df = data.frame(
  name = c("Peter","William","John"),
  score = c(7, 9, 4),
  pass = c(TRUE, TRUE, FALSE)
);

dt = data.table(
  name = c("Peter","William","John"),
  score = c(7, 9, 4),
  pass = c(TRUE, TRUE, FALSE)
);
class(df$name);
class(dt$name);

# No use of rownames
rownames(dt) <- c("a","b", "c");

# data.table is an enhanced version of data.frames, thanks to the dt[i, j, by] operations


############################## [2.6] dt[i, j, by]####################################
# Take DT, subset/reorder rows using i, then calculate j, grouped by by.

############################## [2.6.1] [i] ####################################
data(iris)
dt <- as.data.table(iris);

res_1 <- iris[iris$Sepal.Length >= 5.4 & iris$Petal.Length <= 2.0,];
res_1;
res_2 <- dt[dt$Sepal.Length >= 5.4 & dt$Petal.Length <= 2.0];
res_2;
res_3 <- dt[Sepal.Length >= 5.4 & Petal.Length <= 2.0];
res_3;


setDT(res_1);
identical(res_1, res_2);
identical(res_2, res_3);

dt_ordered <- dt[order(Sepal.Length, -Petal.Length)];
head(dt_ordered);


############################## [2.6.2] [,j] ####################################
### Get a column. 

# Standard method
dt[, "Sepal.Width"];
class(dt[, "Sepal.Width"]);

# List method
dt[, list(Sepal.Width)];
class(dt[, list(Sepal.Width)]);

# Return as a vector
dt[, Sepal.Width];
class(dt[, Sepal.Width]);

# Multiple columns
dt[, c("Sepal.Width", "Petal.Width")];
dt[, list(Sepal.Width, Petal.Width)];
dt[, Sepal.Width:Petal.Width];

# Multiple columns and rename
dt[, list(V1 = Sepal.Width, V2 = Petal.Width)];

# Remove columns
dt[, -c("Sepal.Width", "Petal.Width")];

### Compute.
dt[, mean(Sepal.Width)];
dt[, sum(Sepal.Width + Petal.Width)];
dt[, list(total_width = Sepal.Width + Petal.Width)];
dt[, sum(Sepal.Width + Petal.Width > 5)];



############################## [2.6.3] [i,j] ####################################
dt[Sepal.Length >= 5.4, list(Sepal.Length = Sepal.Length,
                             total_width = Sepal.Width + Petal.Width)];
dt[Sepal.Length >= 5.4, list(sum_width = sum(Sepal.Width + Petal.Width))];


# Number of rows matching i condition
nrow(dt[Sepal.Length >= 5.4]);
dt[Sepal.Length >= 5.4, list(nrows = length(Sepal.Width))];
dt[Sepal.Length >= 5.4, list(nrows = length(Sepal.Length))];
dt[Sepal.Length >= 5.4, list(nrows = .N)];




############################## [2.6.4] [j, by] ####################################
dt[, list(n = .N), by = "Species"];
dt[, list(avg_sepal_length = mean(Sepal.Length)), by = "Species"];


############################## [2.6.5] [i, j, by] ####################################

# One variable
dt[Sepal.Length > 5, list(n = .N), by = "Species"];
res <- dt[Sepal.Length > 5, list(n = .N), by = c("Species", "Sepal.Length")];

# Let's check the results!!!
View(res);

# Multiple variables
res <- dt[Sepal.Length > 5, list(n = .N, avg_sepal_widgt = mean(Sepal.Width)),
          by = c("Species", "Sepal.Length")];
View(res);

# New (computed) variables
res_1 <- dt[Sepal.Length > 5 , list(wide_sepal = Sepal.Width > 3), ];
res_1[, list(n = .N), by = "wide_sepal"]

dt[Sepal.Length > 5, list(n = .N), by = list(wide_sepal = Sepal.Width > 3)];

############################## [2.6.6] [i, j, keyby] ####################################
res_1  <- dt[Sepal.Length > 5, list(n = .N), by = "Sepal.Length"];
View(res_1);
res_2 <- dt[Sepal.Length > 5, list(n = .N), keyby = "Sepal.Length"];
View(res_2);
res_3 <- res_1[order(Sepal.Length)];
View(res_3);


########################### [2.6.7] Chaining [i, j, by] ##############################
res <- dt[Sepal.Length > 5, list(avg_sepal_width = mean(Sepal.Width)), by = "Species"];
res;
res[order(avg_sepal_width)];

dt[Sepal.Length > 5, list(avg_sepal_width = mean(Sepal.Width)), 
   by = "Species"][order(avg_sepal_width)]


########################### [2.6.8] .SD ##############################
dt <- data.table(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
              name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
              age = c(7, 3, 1, 11, 9, 5),
              owner_age = c(31, 29, 7, 28, 16, 15));
dt[, print(.SD), by = "type"];
dt[, print(.SD), by = "type", .SDcols = -"owner_age"];
dt[, summary(.SD), by = "type", .SDcols = -"name"];

dt[, list(mean(age), mean(owner_age)), by = "type"];
dt[, list(mean(.SD[,age]), mean(.SD[,owner_age])), by = "type"];

dt <- as.data.table(iris);
dt[, head(.SD, 2), by = "Species"];

########################### [2.6.9] RESIZING ##############################
dt <- data.table(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
                 name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
                 age = c(7, 3, 1, 11, 9, 5),
                 owner_age = c(31, 29, 7, 28, 16, 15));
dt[, print(rep(name, 2)), by = "type"];
dt[, rep(name, 2), by = "type"];





#################################### [3] LISTS ##############################

##################################### [3.1] CREATION ########################################
l <- list(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
          name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
          age = c(7, 3, 1, 11, 9, 5),
          owner_age = c(31, 29, 7, 28, 16, 15));
l;
class(l);



# Check environment!!
View(l);

############################## [3.2] GET/SET STRUCTURE ####################################
nrow(l) # number of rows
ncol(l) # number of rows
dim(l) # gets the dimension of the matrix

# Dimensions
length(l);

# Get and modify colnames and row names;
colnames(l); 
rownames(l);
names(l); 
names(l) <- c("V1", "V2", "V3", "V4");
l;

# Get structure
str(l);

############################## [3.3] LIST TO DATA.FRAME/DATA.TABLE  ####################################
l <- list(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
          name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
          age = c(7, 3, 1, 11, 9, 5),
          owner_age = c(31, 29, 7, 28, 16, 15));
l;
class(l);

# data.frame
df <- as.data.frame(l);
df;
class(df$name);
df <- as.data.frame(l, stringsAsFactors = FALSE);
df;
class(df$name);

# data.table
dt_1 <- as.data.table(l);
dt_2 <- setDT(l)
identical(dt_1, dt_2);


############################## [3.4] LIST vs DATA.FRAME/DATA.TABLE  ####################################

# PROS

# Variables of different length
dt <- data.table(v1 = c(1, 2), v2 = c(1, 2, 3, 4));
dt;
dt$v1;
l <- list(v1 = c(1, 2), v2 = c(1, 2, 3, 4));
l;
l$v1;

# Storing advanced R datatypes
structure <- summary(l);
structure;
dt <- data.table(name = "l", structure = structure);
dt;
new_l <- list(name = "l", structure = structure);
new_l;
new_l$structure;
identical(structure, new_l$structure);

# CONS
l[1, sum(l$age), by = "type"];

##################################### [3.5] INDEXATION ######################################
l <- list(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
          name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
          age = c(7, 3, 1, 11, 9, 5),
          owner_age = c(31, 29, 7, 28, 16, 15));
l;

##################################### [3.5.1] by integer ########################################

# Get sublist
l[1];
class(l[1]);

# Get value inside list
l[[1]];
class(l[[1]]);

# Get multiple positions
l[c(2,3)];
l[[2]][c(1,3)];
l[[c(2,3)]];

##################################### [3.5.2] logical indexation #################################
index <- c(FALSE, TRUE, TRUE, FALSE);
l[index];
l[[index]];


##################################### [3.5.3] by name #################################

# Sublist
l["name"]

# Values
l[["name"]]

##################################### [3.5.4] by variable #################################
l$name;

identical(l[["name"]], l$name)



##################################### [3.6] MODIFICATION ######################################
l <- list(type = c("cat","dog", "mouse", "dog", "cat", "dog"),
          name = c("Salem", "Rex", "Jerry", "Toby", "Misi", "Beast"),
          age = c(7, 3, 1, 11, 9, 5),
          owner_age = c(31, 29, 7, 28, 16, 15));
l;

##################################### [3.6.1] using integer indexation ########################################
l[[1]][3] <- "lion";
l;
l[2] <- list(c("Simba", "Timon", "Pumba", "Simba", "Timon", "Pumba"));
l;

##################################### [3.6.2] using logical indexation ########################################
l[[1]][l$age < 10] <- "baby";
l;

##################################### [3.6.3] using character indexation ########################################
l["age"] <- list(l[["age"]] + 1);
l;


############################### [3.6.4] using variable name ###############################
l$age <- max(l$age);
l;


##################################### [3.7] EXPANSION ######################################
l;
length(l);

# Concatenate new list
l <- c(l, list(new_v = c(TRUE, FALSE)));
l;
class(l);
length(l);

# by index
l[6] <- c("new_v2");
length(l);

# by variable name
l$new_v3 <- c("new_v3");
length(l);


##################################### [3.8] REDUCTION ######################################
l;
length(l);

# by index
l[2] <- NULL;
l;
length(l);

# by variable name
l$new_v3 <- NULL;
l;
length(l);
