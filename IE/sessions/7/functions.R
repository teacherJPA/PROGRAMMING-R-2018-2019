my_hello_world <- function(){
  print("Hello world");
}


my_fun <- function(name, number = 100, ...){
  arguments <- list(...);
  print(sprintf("Hello %s. Is %d yout favourite number?", name, number));
  
  if (class(arguments$word1) == "character"){
    print(sprintf("PD: %s the %dth of %s", arguments$word1, number, arguments$word2));
  }
}