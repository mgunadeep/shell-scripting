#!/bin/bash

# "Nested if conditionals" are like a series of questions that lead to different outcomes and you have to make decisions based on multiple conditions.
# These refers to the use of, 'multiple if statements' inside each other to create more complex decision-making structures.
# When a condition is true, it may lead to another set of conditions which should be evaluated,before proceeding any further, thus forming a hierarchical structure.
# If there are several multiple conditions or statements that are to be processed/validated before proceeding any futher, then we give the nested conditionals power to our script. So, that the script can make decisions accordingly.

# Let's see an example of 'authentication script' for this nested conditionals...
# Here, we used an if-else condition, inside an if-else condition.

#!/bin/bash

# read -p "Enter your username: " username      
# read -sp "Enter your password: " password
# echo

# if [ "$username" = "admin" ]; then         
#     if [ "$password" = "secret" ]; then    # For this has to be true, The above mentioned 'if statement for username' should definitely has to be true.
#         echo "Welcome, Admin!"             # If both the above mentioned 'if statements for username and password' are true/valid, then only it prints this welcome message.
#     else
#         echo "Incorrect password for the admin account."  # 'if statement for password' is failed, then it comes to execute the conditions in else. i.e it prints the incorrect password.
#     fi
# else
#     echo "Invalid username."
# fi


# Lets see an another example for it ...

echo "Is it raining outside (y/n)?"
read rain

if [ raining = $rain ]; then
    echo "Take your umbrella, when you're going out"
else 
    echo "Enjoy the sunshine outside"
fi