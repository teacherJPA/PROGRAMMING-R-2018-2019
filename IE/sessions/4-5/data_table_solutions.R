library(data.table);
library(ggplot2);

# Exercise 1: Load the iris dataset, make it a data.table and name it iris_dt.
# Print mean of Petal.Length, grouping by Species from iris_dt.

iris_dt <-  as.data.table(iris);
iris_dt[, mean(Petal.Length), by = "Species"];


# Exercise 2: Load the diamonds dataset from ggplot2 package as dt (a data.table), 
# find mean price for each group of cut and color.

dt <- as.data.table(diamonds);
dt[, list(mean_price = mean(price)), by = c("cut", "color")]


# Exercise 3: Now count the number of rows in the dataset for each value of price/carat
# (you will have to create the variable price/carat first) and then sort the resulting 
# data.table in decreasing order in terms of count per group. Use chaining.

dt[, list(price_per_carat = price/carat),][, list(count = .N), by = price_per_carat][order(-count)];


# Exercise 4: Use the already loaded diamonds dataset and print the last two carat value
# of each cut.

dt[, list(last = tail(carat,2)), by = "cut"];


# Exercise 5: In the same data set, find median of the columns x,y,z per cut.

dt[, list(avg_x = median(x), avg_y = median(y), avg_z = median(z)), by= "cut"];



# Exercise 6: You have the following data.table

dt <- as.data.table(matrix(runif(10^2, 0, 1), nrow = 10, ncol = 10));

# Filter 'dt' to select only the rows from position 2 to position 8 and 
# create a variable 'V3_plus_V7' as the sum of the third and seventh column. Then
# get the total number of rows where 'V3_plus_V7' is greater than 1. Perform these 
# operations both using and not using chaining

# Without chaining
temp <- dt[2:8, list(V3_plus_V7 = V3 + V7)];
temp[V3_plus_V7 > 1, list(count = .N)];

# With chaining
dt[2:8, list(V3_plus_V7 = V3 + V7)][V3_plus_V7 > 1, list(count = .N)];


# Exercise 7: Load the airquality dataset as data.table. Compute the logarithm of wind
# rate for each month and for days greater than 15.

dt2 <- as.data.table(airquality);
dt2[Day > 15, log(Wind), by = "Month"];



# Exercise 8: In the same data set, for all the odd rows update Temp column by adding 10.
# Suggestion: Bear in mind that Temp is a numeric variable.

dt2[rep(c(TRUE,FALSE), length = nrow(dt2)), "Temp"] <- 
  dt2[rep(c(TRUE,FALSE), length = nrow(dt2)), list(Temp = Temp + 10L)];

# You could also use the := operator (this operator do not create a new data.table
# as a result, it modifies the original data.table instead).

dt2[, Temp := Temp + 10L];


# Exercise 9: Use the same airquality data.table that you have created previously from 
# airquality and delete Solar.R,Wind,Temp using a single expression.

dt2[, -c("Solar.R","Wind","Temp")]

# Exercise 10: Load the airquality dataset as data.table again. Create a data.table
# with two columns a,b which indicate temp in Celcius and Kelvin scale respectively.
# Use chaining.

# Celcius = (Temp-32)*5/9
# Kelvin = Celcius+273.15

dt2 <- as.data.table(airquality);

res_1 <- dt2[, list(a = (Temp-32)*5/9)][, list(a = a, b = a + 273.15)];

# This is equal to
res_2 <- dt2[, a := (Temp-32)*5/9][, b := a + 273.15][, c("a", "b")];

identical(res_1, res_2);
