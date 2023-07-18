#!/bin/bash

### 'read' is a command, which takes the input from the user and later executes the script.

echo "what is your name?"
read name

echo "Hai...how are you, $name!"
sleep 1
echo "You look really good $name"
sleep 1
echo "Wanna hangout tomorrow, $name"

### here, in the above script the 'read' command takes the input, name from the user...and supplies it to the variable named--$name to print, whenever we called variable in the script.