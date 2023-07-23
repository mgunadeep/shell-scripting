#!bin/bash

# What is a CASE???
# Case is like an if-statement, but it's more like a switcher.
# Instead of using Elif conditionals, we can simply use the 'case'...so that depending upon the commands, it can switch the properties or actions for that varibale real quick.
# Depending upon the variable declared in the case, we can get all the statistics/properties that will be mentioned as commands, under that declared variable.

# The syntax for the 'case' is...

# case  $var in 
#     opt1) command1 
#           command2 
#           ;;

#     opt2) command1 ;;

# esac

# In the beginning of some video games, the player should select a character to play/enter the game, so that he can get all that assaigned properties for that character. 
# So, now Let's implement this scenario in our script by using the 'case'

name="Guna"
echo "hello $name Select your preferred Charcter type
    1-Samurai
    2-Falcon
    3-Theaussurus
read type

case $type in
    1) type = Samurai
       health = 20
       power = 25
       weapon = 20
       ;;

    2) type = Falcon
       health = 18
       fly = 30
       flame = 35
       ;;

    3) type = Theaussurus
       health = 30
       bite = 20
       throw = 40
       ;;
