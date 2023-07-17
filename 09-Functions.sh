#!/bin/bash 

# What is a function? 
# Function is used to capture any repititive block and can be used on need basics.

# When to use funcions?
# Whenever you want to use a piece of code 'n' number of times, rather than writing that n number of times, you can declare it as a "function" and can call it on need basis

# Declaring a function 

example() {
    echo "I'm a function named example"
    echo "I am executing the example function"
    echo "The example function is completed"  
}
example    # This is how you can call a function, whose name is 'example'


# Now, lets see another function named status.
status() {                                                     
    echo -e "Good Morning and todays date is \e[32m $(date +%F)  \e[0m"
    echo -e "Number of opened sessions : \e[32m $(who | wc -l) \e[0m"    
    echo -e "Load Average on the system from last 1 minute is $(uptime | awk -F , '{print  $3}' | awk -F : '{print $2}')"
}
status   # calling 'status' function



### You can also call a function, from within the function. Let's see how it can be done.
status () {
    echo "calling the example from status function"
    example
}
status
 
 
 
 

