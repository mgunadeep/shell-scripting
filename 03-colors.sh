#!bin/bash

### Presentation really matters a lot and who doesn't love a nice and colorful output? Now, we''ll see how to print both background and foreground text in colors.

# Colors       Foreground          Background

# Red               31                  41

# Green             32                  42

# Yellow            33                  43

# Blue              34                  44

# Magenta           35                  45

# Cyan              36                  46

### The syntax for printing the text in forecolor, is as follows
### echo -e "\e[colorcodem I love this color \e]0m"
echo -e "\e[36m I love this color \e[0m"

### If you want your background and also your text to print in color, the syntax for is
### echo -e "\e[backgrndcolorcode;foregrndcolorcodem I love this color \e]0m"
echo -e "\e[45;34m I love this color \e[0m"