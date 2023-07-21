#!/bin/bash

# "Nested if conditionals" are like a series of questions that lead to different outcomes and you have to make decisions based on multiple conditions.
# These refers to the use of, 'multiple if statements' inside each other to create more complex decision-making structures.
# When a condition is true, it may lead to another set of conditions which should be evaluated,before proceeding any further, thus forming a hierarchical structure.

# Let's see an example for this...

#!/bin/bash

read -p "Enter your username: " username
read -sp "Enter your password: " password

if [ "$username" = "admin" ]; then   
    if [ "$password" = "secret" ]; then
        echo "Welcome, Admin!"
    else
        echo "Incorrect password for the admin account."
    fi
else
    echo "Invalid username."
fi
