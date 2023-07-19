#!/bin/bash

### Let's see an example for if-else...

echo "Do you love automobiles (y/n)" 
read automobiles       ## ---> We are using read command and taking the input from user.
if [ $automobiles == "y" ]; then  ##---> Here, the input we took from user, is supplied as a value/data to the variable "$automobiles", which we have declared in the expression. 
    echo "Yes, You're a Petrolhead!"
else 
    echo "oh..Sorry!! You're not a Petrolhead"
fi


### Good, Let's see an another example of it.

# echo "What is your age?" 
# read age

# if [ $age -ge 18 ]; then
#     echo "You're officialy a Major"
# else
#     echo "You're a minor and you still need to be in parental control"
# fi