#!/bin/bash

### 'read' is a command, which takes the input from the user and later executes the script.

echo "What is your name?"
read name
echo "What is your age?"
read age

echo "Hello, $name...You are $age years old"

### here, in the above script the 'read' command takes the input, name and age by two prompts from the user...and supplies it to the variable named--$name and $age to print, whenever the variables are called in the script.


### You can also use 'read' command without an echo, and with an option -p. It prompts the user for the specific input. Let's see, how a read command works with a prompt.

# read -p  "What is your age?" age

# echo "You are $age years old"

### We are using read command, to take input from the user and we are storing that in variable named age, and later in the script while using the echo command we're calling that variable with $age.
