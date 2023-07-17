#!/bin/bash 

# What is a function? 
# Function is used to capture any repititive block and can be used on need basics.

# When to use funcions?
# Whenever you want to use a piece of code 'n' number of times, rather than writing that n number of times, you can declare it as a "function" and can call it on need basis

# Declaring a function is as follows,

### Start of the function named-'Example'
Example() {
    echo "I'm a function named Example"
    echo "I'm executing this function"
    echo "The Example function is completed"  
}
Example   ###--> This is how, you can call a function...whose name is 'Example'
### End of the function named-'Example'

# Now, lets see another function named-'Status'
Status() {                                                     
    echo -e "Good Morning and today's date is \e[32m $(date +%F)  \e[0m"
    echo -e "Number of opened sessions : \e[32m $(who | wc -l) \e[0m"    
    echo -e "Load Average on the system from last 1 minute is $(uptime | awk -F , '{print  $3}' | awk -F : '{print $2}')"
}
Status   ###--> Calling 'Status' function
### End of the function named-'Status'


### You can also call a function, from within a function. Let's see how it can be done.
Status () {
    echo "calling the Example function from within the Status function"
    Example
}
Status
 
 
 
 

