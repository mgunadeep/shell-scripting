#!/bin/bash

### Let's see an example for if-else...

echo "Do you love automobiles (y/n)"
read automobiles
if [ $automobiles == "y" ]; then
    echo "Yes, You're a Petrolhead!"
else 
    echo "oh..Sorry!! You're not a Petrolhead"
fi