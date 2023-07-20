# shell-scripting
This repo is created to make novices more familiar, about automation using the shell-scripting. Shell is nothing, but an interpretor and it is native to linux, so it doesn't need any extra layer for translation, unlike other languages. There are different shells in linux like Bash, zsh, fish. Depending upon your personal preference, you can choose any one. 

Things to remember, whn you're scripting:-
```
* When you develop something, ensure you run it twice before you confirm it as, 'WORKING'.
* Ensure, you remove the duplicate pieces of code.
* 'Validation'--should be given a very high priority. 
* Try to 'parameterize' the script and as much as possible, and make your dynamic.
```
Exit Status:- Every command, that you execute..will return some status code and based on that code, we can decide whether the command is success/failure/partially completed, and the command to see the exit code of the previous command is echo $?

```
  In Linux, exit codes range from 0 to 255.

  0     : Exit Code means, command completed successfully.
 1-255  : Either partially completed or failed.
```
