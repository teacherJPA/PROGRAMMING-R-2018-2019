# Basic operation
5
5+3

# Basic operation with assignments
# (check workspace pane at the top right)
x = 5;
x <- 5;
y <- 3;
result <- x + y;
print(result);

# Two assignments in one line (needs semicolon)
x <- 5; y <- 3;

# Two assignments without semicolon (error)
x <- 5 y <- 3;

# Save workspace
save.image("/home/falendor/Desktop/workspace.RData");

# Remove variables in workspace
rm(x);
rm(y);
rm(result);

# Remove all workspace  
rm(list = ls());

# Load workspace
load("/home/falendor/Desktop/workspace.RData");

# Plot (check plot tab at the bottom right)
plot(result);
plot(result,  pch = 19, col ="red")

# Install new package (check packages tab at the bottom right)
install.packages("Amelia")

# Help (check help tab at the bottom right)
help(plot);
?plot;
