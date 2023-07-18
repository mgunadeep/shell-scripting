#!/bin/bash

### 'read' is a command, which takes the input from the user and later executes the script.

echo "What is your name?"
read name
echo "What is your age?"
read age

echo "Hello, $name...You are $age years old"
### here, in the above script the 'read' command takes the input, name from the user...and supplies it to the variable named--$name to print, whenever we called variable in the script.