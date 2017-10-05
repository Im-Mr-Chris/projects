@a			// point to a for first value
M=0   		// set ALM output M to 0
@b			// point to b for second value
M=1   		// set ALM output M to 1
(LOOP)		// start of loop
@b   		// point to b register
D=M   		// set the value of D into M
@R0  		// load Register 0
D=D-M 		// decrement by 1 for the loop counter
@END 		// start of END location
D;JGT  		// jump to END if if (i-R0) > 0
@R1 		// point to register 1
D=M   		// set the value of D (D=R1) into M
@a			// point to a register
M=D+M 		// add D+M from (D=R1)
@b 			// point to b register
M=M+1 		// increment by 1 for loop counter
@LOOP
0;JMP  		// jump to loop
(END)		// mark the END
@END		// point to END register
0;JMP		// Infinite Loop



// File name: projects/04/Mult.asm
// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

