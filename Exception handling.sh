#!/bin/bash

# we have to deal with the exceptions, while scripting in bash. So, we do keep using exit codes, conditional-statements. Here are some shell commands that might be a help in need.

set -x ##-->debug mode.
# Displays the respective command before the output. If you're dealing with a very huge script, it is manually 
# impossible to write "echo" commands for all. So, we use this instead. 

set -e
# Exits or Stops the script, then and there itself when there is an error. But, this has a small limitation, if you're 
# using a pipe (|), this takes last ending command and executes the script, even if the command before the (|) throws an error.

# To encounter this, we have 
set -o pipeline
# If there are any errors after the pipe(|), it exits the script without going any further.  