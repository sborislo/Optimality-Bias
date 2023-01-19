#name is who you are saying hello to, hellos is ways want to say hello, amount is how many times to say hello
hello_world <- function(name, hellos, amount, exclamation) { #name is string, languages is vector, amount is numeric
  iterations <- amount #iterations for for loop
  manners <- hellos #ways to say hello in for loop
  for (i in 1:iterations) { #say hello iterations times
    for (hello in manners) { #say hello in each way
      if(exclamation==TRUE) {
        print(paste(hello," ", name, "!", sep="")) #with exclamation
      }
      else {
        print(paste(hello, name)) #without exclamation
      }
    }
  }
}

hello_world(name="Sam", hellos=c("Yo", "Howdy", "Hey", "Wassup"), amount=3, exclamation=TRUE) #test of function
