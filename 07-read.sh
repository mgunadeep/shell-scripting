#!/bin/bash

### 'read' is a command, which takes the input from the user and later executes the script.

echo "What is your name?"
read name
echo "What is your age?"
read age

echo "Hello, $name...You are $age years old"

### here, in the above script the 'read' command takes the input, name and age by two prompts from the user...and supplies it to the variable named--$name and $age to print, whenever the variables are called in the script.