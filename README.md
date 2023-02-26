Welcome to my readme file.
This readme file pertains to my implementation of Flex.
Once the following steps are completed, my program should write the tokens and their instances(lexemmes) found in "input_sourcecode.txt" to "output.txt"


How To Run My Program

Requirements: 
- You must have "sample.l", "output.txt", and  "input_sourcecode.txt" in the same directory.
- You must have flex installed.

Steps(the following commands are to be written in the terminal in this specific order):

1) $ flex sample.l
2) $ gcc lex.yy.c
3) $ ./a.out <input_sourcecode.txt>

Explanation of steps:
1) Step 1 runs flex on the sample.l file, producing a lexical code analyzer (lex.yy.c)
2) Step 2 compiles the lexical code analyzer and produces an "a.out" exe file
3) Step 3 runs the exe file(a.out) on "input_sourcecode.txt>


