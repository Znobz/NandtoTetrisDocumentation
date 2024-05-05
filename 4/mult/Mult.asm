// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.
@0
D=A
@R2
M=D  //Sets R2 to 0

@R1
D=M
@END
D;JEQ

@i   //Sets i pointer to the value of R1
M=D

(MUL)//Multiplication function
@R0
D=M
@R2
M=M+D
@i
M=M-1
D=M
@MUL
D;JGT//Adding until i reaches 0

(END)//End of multiplicatuon
@END
0;JMP
