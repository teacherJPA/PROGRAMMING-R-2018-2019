### NOTE: Before trying to solve these exercises, install the library ggplot2.
### If you find any problem while doing this, send me an email to jprada@faculty.ie.edu.

install.packages("ggplot2");

# Exercise 1: Load the iris dataset, make it a data.table and name it iris_dt.
# Print mean of Petal.Length, grouping by Species from iris_dt.



# Exercise 2: Load the diamonds dataset from ggplot2 package as dt (a data.table), 
# find mean price for each group of cut and color.



# Exercise 3: Now count the number of rows in the dataset for each value of price/carat
# (you will have to create the variable price/carat first) and then sort the resulting 
# data.table in decreasing order in terms of count per group. Use chaining.



# Exercise 4: Use the already loaded diamonds dataset and print the last two carat value
# of each cut.



# Exercise 5: In the same data set, find median of the columns x,y,z per cut.



# Exercise 6:  You have the following data.table

dt <- as.data.table(matrix(runif(10^2, 0, 1), nrow = 10, ncol = 10));

# Filter 'dt' to select only the rows from position 2 to position 8 and 
# create a variable 'V3_plus_V7' as the sum of the third and seventh column. Then
# get the total number of rows where 'V3_plus_V7' is greater than 1. Perform these 
# operations both using and not using chaining



# Exercise 7: Load the airquality dataset as data.table, Now I want to find Logarithm of wind
# rate for each month and for days greater than 15.



# Exercise 8: In the same data set, for all the odd rows update Temp column by adding 10.
# Suggestion: Bear in mind that Temp is a numeric variable.



# Exercise 9: Use the same airquality data.table that you have created previously from 
# airquality and delete Solar.R,Wind,Temp using a single expression.



# Exercise 10: Load the airquality dataset as data.table again. Create a data.table
# with two columns a,b which indicate temp in Celcius and Kelvin scale respectively.
# Use chaining.

# Celcius = (Temp-32)*5/9
# Kelvin = Celcius+273.15



