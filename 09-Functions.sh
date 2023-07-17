#!/bin/bash 

# What is a function? 
# Function is used to capture any repititive block and can be used on need basics.

# When to use funcions?
# Whenever you want to use a piece of code 'n' number of times, rather than writing that n number of times, you can declare it as a "function" and can call it on need basis

# Declaring a function 

example() {
    echo "I am a simple function with name example"
    echo "I am executing the example function"
    echo "example function is completed"

    echo "Calling Status Function"
    status
}

status() {                                                     
    echo -e "Good Morning and todays date is \e[32m $(date +%F)  \e[0m"
    echo -e "Number of opened sessions : \e[32m $(who | wc -l) \e[0m"    
    echo -e "Load Average on the system from last 1 minute is $(uptime | awk -F , '{print  $3}' | awk -F : '{print $2}')"
}

# This is how you can call a function 
example 

# calling status function
status