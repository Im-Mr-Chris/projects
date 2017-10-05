// projects/04/fill/fill.asm
// C.Celaya

(SCREEN) 		// 16384
	@8192 		// total number of screen addressess, counter
	D=A 		// Set A inside D
	@address 	// starting address
	M=D 		// address of screen
	@CHECKKBD 	// check 
	0;JMP
(CHECKKBD)  	// Check if (KBD) > 0	
	@24576 		// Get (KBD) value (@24576)
	D=M  		// Set M inside D	
	@WHITE 		// Goto here if (KBD) < 0
	D;JEQ		// Jump if equal to				
	@BLACK 		// Goto here if (KBD) < 0
	0;JMP 			
(WHITE)  
	@16384	 	// screen
	D=A 		// Set A inside D	
	@address
	D=D+M
	A=D
	M=0
	@EMPTY
	D;JMP
(BLACK)  		// Goto from (CHECKKBD)
	@16384
	D=A 		
	@address 	// load the screen address
	D=D+M 		
	A=D
	M=-1
	@EMPTY
	0;JMP
(EMPTY)
	@address
	M=M-1 		// decrement @address
	D=M
	@SCREEN 	// 16384
	D;JLT 		// restart loop if @address < 0
	@CHECKKBD
	0;JMP
