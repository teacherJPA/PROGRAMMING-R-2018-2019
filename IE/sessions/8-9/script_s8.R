library(data.table);
################################### [0] NORMAL FLOW ############################################

x <- 1;
x <- x + 2;
x <- x - 1;
print(x);


################################### [1] IF-ELSE CLAUSE ############################################

################################### [1.1] IF ############################################

x <- 1;

if (x < 10){
  x <- x + 2;
  x <- x*2;
}

print(x);


################################### [1.2] IF - ELSE ############################################

x <- 1;

if (x < 0){
  x <- x + 2;
} else {
  x <- x - 1;
}

print(x);


################################### [1.3] IF - ELSE IF - ELSE ############################################

x <- 1;

if (x < 0){x <- x + 2} else if (x < 1){x <- x - 5} else{x <- x - 1}

print(x);


################################### [2] FOR CLAUSE ############################################


############################### [2.1] NO USE OF ITERATOR VALUE ########################################
x <- 1;

v <- c()
for (iterator in 1:10){
  print(x);
  x <- x + 1;
  print("-----");
}
print(x);


############################### [2.2] USING ITERATOR VALUE ########################################
v <- c("a", "b", "c");
iterators_list <- c();
for (iterator in v){
  iterators_list <- c(iterators_list, iterator);
  print(iterator);
  print("-----");
}

x <- 1;

for (iterator in 1:10){
  print(x);
  iterator <- as.integer(iterator);
  x <- x + iterator;
  print("-----");
}
print(x);


############################### [2.3] USING a LIST AS ITERATOR #######################################

length(iterator_list);

for (iterator in iterator_list){
  for (iterator2 in iterator){
    print(iterator2);
    print("-----");
  }
}

x <- 1;
iterator_list <- list(it1 = c(1, 2), it2 = c(1, 2, 3));

for (iterator in 1:8){
  iterator <-  1;
  print(x);
  x <- x + sum(iterator);
  print("-----");
}
print(x);


################################### [3] WHILE CLAUSE ############################################


################################# [3.1] USING LOGICAL CONDITION ######################################
x <- 1;

while (x < 100){
  print(x);
  x <- x + 1;
  print("-----");
}
print(x);

################################# [3.2] USING FLAG ######################################
x <- 1;
flag <- TRUE;

while (flag){
  print(x);
  x <- x + 1;
  if (x == 14){
    flag <- FALSE;
  }
  print("-----");
}
print(x);


################################### [3.3] INFINITE LOOP ############################################
x <- 1;

while (TRUE){
  print(x);
  x <- x + 1;
  print("-----");
}
print(x);

x <- 1;
flag <- TRUE;

while (flag){
  print(x);
  x <- x + 3;
  if (x >= 14){
    flag <- FALSE;
  }
  print("-----");
}
print(x);


################################### [4] REPEAT/BREAK/NEXT ############################################

################################### [4.1] REPEAT ############################################

x <- 1;

repeat{
  print(x);
  x <- x + 1;
  print("-----");
  if (x == 7){
    break;
  }
}
print(x);

# Equivalent to
x <- 1;

while (x != 7){
  print(x);
  x <- x + 1;
  print("-----");
}
print(x);


################################### [4.2] BREAK ############################################

# For loop
for (iterator in 1:10){
  print(iterator);
  print("-----");
  if (iterator == 5){break};
}

x <- 1;

# While loop
n_iteration <- 1;
max_iteration <- 100;
while (x != 7){
  print(n_iteration);
  x <- x + 4;
  print("-----");
  if (n_iteration > max_iteration){break};
  n_iteration <- n_iteration + 1;
}
print(x);

################################### [4.3] NEXT ############################################

# For loop
for (iterator in 1:10){
  if (iterator == 5 | iterator == 7){next};
  print(iterator);
  print("-----");
}

x <- 1;


# Infinite while loop again!
while (x != 7){
  print(x);
  if (x == 5){next};
  x <- x + 1;
  print("-----");
}
print(x);



################################### [5] VECTORIZATION ############################################

df <- data.frame(v1 = 1:10, v2 = 11:20, v3 = 21:30);
df;

big_df <- as.data.frame(matrix(1:10^8, nrow = 10^4));
dim(big_df);
big_df[1:2, 1:10];
################################### [5.1] USING FOR LOOP ############################################

### df
for (column in 1:3){
  values <- df[, column];
  print(mean(values));
}

# Equivalent to
for (column in colnames(df)){
  values <- df[, column];
  print(mean(values));
}

### big_df
res <- c();
system.time({for (column in 1:ncol(big_df)){
  values <- mean(big_df[, column]);
  res <- c(res, values);
}});
class(res);
################################### [5.2] USING APPLY ############################################

help(apply);

### df
apply(df, 2, mean); # By column
apply(df, 1, mean); # By row

### big_df
system.time(res <- apply(big_df, 2, mean));
class(res);

################################### [5.3] USING LAPPLY ############################################

help(lapply);

### df
lapply(df, mean);

### big_df
system.time(res <- lapply(big_df, mean));
class(res);

################################### [5.4] USING SAPPLY ############################################

help(sapply);

### df
sapply(df, mean);

### big_df
system.time(res <- sapply(big_df, mean));
class(res);
