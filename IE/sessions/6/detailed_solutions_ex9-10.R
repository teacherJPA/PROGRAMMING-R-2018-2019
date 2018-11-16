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






### [1] Replace "---FILL---" in the following R command to convert this
### character variable into a vector with one word per position.

words <- unlist(strsplit(book, " "));

# Here we use first the strsplit function to split the string "book" in several substrings using the 
# separator " ", i.e one whitespace character. As this function return a list by default, we use the unlist
# function to convert this list to a character vector. Check the value of 'words' by running:

head(words, 10);







### [2] Now get the top 10 more frequent words

top_words <- names(sort(table(words), decreasing = TRUE)[1:10])

# Okay, let's deconstruct this line. First, we get the table of frequencies of the vector 'words' by

temp1 <- table(words);
head(temp1, 20);

# Now we sort this table of frequencies in decreasing order, so the most frequent words appear first.

temp2 <- sort(temp1, decreasing = TRUE);
head(temp2, 20);

# And we select the first 10 words, which are the top 10 most frequent words also

temp3 <- temp2[1:10];
temp3;

# 'temp3' is a table object (run class(temp3) to check it), so it contains a list of values (in this case,
# words) and a list  frequencies. We want to keep from 'temp3' only the words (values) and not their 
# frequency. This is done by using the names() function:

top_words <- names(temp3);
top_words;

# If we put all this together we get our initial line

top_words <- names(sort(table(words), decreasing = TRUE)[1:10])
top_words;








### [3] Filter 'words' so only the values contained in these top 10 remain

words <- words[words %in% top_words];

# The 'x %in% y' operator, where x and y are vectors, returns a logical vector indicating the positions 
# where the value of x is contained in the variable 'y'. Of if we run

temp1 <- words %in% top_words;
temp1;

# we get a logical vector with a TRUE value in the positions where 'words' contains one of the values in
# 'top_words'. Now, if we use this logical vector to index the variable 'words'

words[temp1];

# we get the values of 'words' corresponding to one of the 'top_words' (because, again, temp1 is only TRUE
# in the positions where 'words' contains one of the values in 'top_words')









### [4] Finally, cast this character vector into a factor and plot a barplot with the
### top words frequencies

words <- as.factor(words);
plot(words);

# The casting to a factor is straightforward. Then, as we saw in sessions 2-3, if you run plot(x)
# where 'x' is a factor variable, R automatically creates a barplot graph. If you try to do this
# with 'words' as a character vector you get an error

words <- as.character(words);
plot(words);


# To get this result with a character vector you must use the barplot function on the table of frequencies

barplot(table(words));









### (***) EXERCISE 10: Read the R object "userbase.RData" provided with this exam. It represents a 
### database of clients of an airline, where each row corresponds to a flight purchase. Get the top 5
### users in terms of number of flights purchased via online channels. Take into account only flights
### bought after "2018-11-01". Get also the top 5 in terms of price per purchase.





### [1] Read the R object "userbase.RData"
dat <- readRDS("C:/Users/Falendor/Dropbox/Planes/proyectos/academia/IE/sessions/6/userbase.RData");

# You have to change the path passed to the readRDS() function for the path to the "userbase.RData" file
# that you have in your system. You cannot use the load() function as "userbase.RData" is not a 
# workspace/environment file, it is an R object file.









### [2] Take into account only flights bought after "2018-11-01"
dat <- dat[fecha_reserva >= as.Date("2018-11-01")];


# I made a mistake not translating some of the variable names to english, sorry about that =(. 
# In this case, fecha_reserva means 'booking_date' so it is the variable we want to filter. 
# Here i am using the ith dimension of the operations dt[i, j, by]. We remove 180 rows by doing this.







### [3] Get the top 5 users in terms of number of flights purchased via online channels
head(dat[canal_venta == "online", list(n_purchases = .N), by = "user"][order(n_purchases,
                                                                             decreasing = TRUE)], 5);


# Okay, let's go dimension by dimensions. First, we start with the ith dimension

temp1 <- dat[canal_venta == "online"];
nrow(temp1);         

# canal_venta means sales channel (sorry again) so this is the variable we want to filter to keep only the
# values with sales channel equal to online. Now, we move to the jth dimension. We want to compute the
# number of flights purchased, to this is done by

temp1[, list(n_purchases = .N)];


# Finally, the by dimension. In particular, we want to compute the number of purchases FOR EACH USER. 
# As you already know, "for each" means we are talking about the by dimension so

temp2 <- temp1[, list(n_purchases = .N), by = "user"];
temp2;


# Now we want to get the top 5 users, so we sort temp2 in decreasing order of 'n_purchases' by
# using the order() function

temp3 <- temp2[order(n_purchases, decreasing = TRUE)];
temp3;


# Finally, we keep only the top 5, i.e the first five rows

head(temp3, 5);


# Putting it all together:

head(dat[canal_venta == "online", list(n_purchases = .N), by = "user"][order(n_purchases,
                                                                             decreasing = TRUE)], 5);











### [4] Get also the top 5 in terms of price per purchase.
head(dat[canal_venta == "online", list(avg_price = mean(price)), by = "user"][order(avg_price,
                                                                                    decreasing = TRUE)], 5);


# This is exactly the same operation as in [3] but changing the .N operator for mean(price) to get this time
# the top 5 in terms of average price for purchase. We also change the 'n_purchases' name for 'avg_price'
# because it seems to be a more suitable name for this value, but this is only for presentation purposes.
# In fact, if we keep the 'n_purchases' name we get the same users and values:

head(dat[canal_venta == "online", list(n_purchases = mean(price)), by = "user"][order(n_purchases,
                                                                                    decreasing = TRUE)], 5);
