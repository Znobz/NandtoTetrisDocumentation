// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@8191   //Sets n equal to the number of bytes needed to fill the entire screen
D=A
@n
M=D

@SCREEN //Section paints the screen white if keyboard is not pressed
D=A
@ptr1
M=D

@KBD      //Checks if the keyboard is pressed
D=A
@address  //pointer to keyboard
M=D

//Section of the code keeps the screen white by default until a key is pressed
(LIGHT)	  
@i
D=M
@ptr1
A=M+D
D=A
D=D-A
M=D
@i
M=M+1
D=M
@n
D=D-M
@LIGHT
D;JLE

@0	//After brightening the screen, i is set to zero
D=A
@i
M=D
(END2)
@address
A=M
D=M
@DARK
D;JNE	//Jumps to dark if KBD is pressed
@END2
0;JMP	//Else, it will continuously check if it has been pressed

//Section of the code darkens the screen if it is detected that the keyboard has a key pressed
(DARK)
@i
D=M
@ptr1
A=M+D
M=M-1
@i
M=M+1
D=M
@n
D=D-M

@DARK
D;JLE
@0	//After blackening the screen, i is set to zero
D=A
@i
M=D
(END1)
@address
A=M
D=M
@LIGHT
D;JEQ	//Jumps to light section if KBD is not pressed
@END1
0;JMP   //Else, it continuously checks if it is pressed or not





















