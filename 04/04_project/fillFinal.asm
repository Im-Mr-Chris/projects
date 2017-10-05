// projects/04/fill/fill.asm
// C.Celaya

(SCREEN) 		// 16384 value
	@8192 		// total number of screen addressess, counter
	D=A 		// Set A inside D
	@address 	// starting address
	M=D 		// address of screen
	@CHECKKBD 	// check 
	0;JMP

(CHECKKBD)  	// Check if (KBD) > 0	
	@24576 		// Get (KBD) value (@24576)
	D=M  		// Set M inside D	
	@WHITE 		// Goto here if @24576 = 0
	D;JEQ		// Jump if equal to				
	@BLACK 		// Goto here if @24576 > 0
	0;JMP 		

(WHITE)  
	@16384	 	// screen
	D=A 		// Set A inside D	
	@address 	// GOTO here, set to zero for WHITE
	D=D+M 		// Continue to blank next pixel
	A=D
	M=0
	@EMPTY
	0;JMP

(BLACK)  		// Goto from (CHECKKBD)
	@16384
	D=A 		
	@address 	// GOTO here, set to zero for BLACK
	D=D+M 		// Continue to fill next pixel
	A=D
	M=-1
	@EMPTY
	0;JMP

(EMPTY)
	@address  	// GOTO here, 
	M=M-1 		// decrement from this @address
	D=M
	@SCREEN 	// 16384
	D;JLT 		// restart loop if @address < 0
	@CHECKKBD 	// check again for key press
	0;JMP 		//






		// Label symbols

// (SCREEN)  		-screen memory map   
// (WHITE)    		-white screen loop
// (BLACK)  		-black screen loop
// (EMPTY) 			-set zero's while counting
// (CHECKKBD)		-check keyboard value


		// A-Instructions

// @8192    		-total screen addressess, counter
// @address  		-starting address
// @CHECKKBD   
// @WHITE  	 		-GOTO from (CHECKKBD) when (KBD) > 0
// @BLACK 			-GOTO from (CHECKKBD) when (KBD) < 0
// @16384 			-GOTO SCREEN
// @EMPTY 			-GOTO for decrement @ address
// @24576   		-GET ASCII value


		// C-Instructions

// M=-1     		-negate M
// D=A    	 		-store A into D
// D=M     			-store M into D
// M=D      		-store D into M
// 0;JMP    		-jump
// D;JMP 			-Jump
// D;JEQ    		-Jump if ==         
// D;JLT   			-just if <




















