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

# echo "Is it raining outside? (y/n)"
# read rain

# if [ $rain == y ]; then
#     echo "Take your umbrella, when you're going out"
# else 
#     read -p "Is it sunny outside? (y/n)" sunny
#         if [ $sunny == y ]; then
#                echo "Enjoy the sunshine and have a lovely day"
#         else 
#                echo "Check for the weather forecast"
#         fi
# fi


# Let's see another nested conditionals using elif conditionals, inside the if-else conditionals

echo "Enter your marks"
read mark 
if [ $mark -ge 90 ]; then   
    echo "Congrats! You have secured A+ grade"
elif [ $mark -ge 89 ]; then
    echo "Good! You have scored A grade"
elif [ $mark -ge 75 ]; then
     echo "Scope for improvement, You have scored B grade"
elif [ $mark -ge 60 ]; then
    echo "Work very hard, You have scored C grade"

else 
    echo "You have failed, not at all acceptable"
fi


# NOTE:- What is the difference between a elif and nested-if conditionals???
# ==> In nested-if conditionals, both the parent-if and nested-if statements..should definitely has to be true, in order to-->proceed any futher or, to execute-->the next conditions in the script.
# ==> While in the elif(else-if) conditionals, we're not saying that..both the first 'if statement' and the 'elif statement' has to be true, But..instead we are saying...if the first or above mentioned 'if statement' doesnot evaluate true, and it is false..Well, Here's an another chance...elif execute the expression with-in me, and then go for my next command.  