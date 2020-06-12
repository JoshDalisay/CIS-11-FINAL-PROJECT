;Group Name: 96' Bulls
;Group Members: Josh Louie Dalisay, Elheas Arroyo Desanti, Yassin Zaki
;CIS-11 Final
;Project: Bubble Sort

.ORIG x3000	

	LD R3, POINTER		;Array base address
	LD R2, COUNT		;Load #8 in R6 as COUNTER
	
	LEA R0, TXT		;load address of string
	PUTS			;ouput string to console
LOOP
	IN			;Takes input from user
	STR R0, R3, #0		
	ADD R3, R3, #1		;increment by1
	ADD R2, R2, #-1		;decrease by 1
	BRp LOOP

JSR SORT

SORT 	
	AND R3, R3, #0		;Clear R3
	LD R3, POINTER		;Reset the pointer value
	AND R4, R4, #0		;Clear R4
	LD R4, COUNT		;Reset counter value
	AND R5, R5, #0		;Clear R5
	LD R5, COUNT		;Reset counter value
	
	
OUT_LOOP
	ADD R4, R4, #-1		;Decrement counter
	ADD R5, R4, #0		;Copy to in loop
	LD R3, POINTER		;Set the pointer to the beginning of the array
	
IN_LOOP
	LDR R0, R3, #0		;Load first # using pointer, store to R0
	LDR R1, R3, #1		;Load second 3 using pointer, store to R1
	AND R2, R2, #0		;Clear R2
	NOT R2, R1		;Two's compliment
	ADD R2, R2, #1		;Negate 
	ADD R2, R0, R2		;Subtract (R0 - R2)
	BRnz SWAPPED		;Condition check. 	
	STR R1, R3, #0		;Second # now stored in first slot
	STR R0, R3, #1		;First # now stored in second slot

SWAPPED
	ADD R3, R3, #1		;Increment pointer to look at next set of elements
	ADD R5, R5, #-1		;Decrement inner-loop counter
	BRp IN_LOOP		
	BRzp OUT_LOOP		 		

;print out result
	LEA R0, LIST		;Address of string
	PUTS			;Display on console
	LD R0, POINTER
	PUTS

	JSR DECODE
	
DECODE	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #15
	ADD R0, R0, #3


HALT

;DATA Memory

TXT 	.STRINGZ "Input 8 numbers ranging from 0 - 100: "
LIST	.STRINGZ "The sorted list: "
POINTER	.FILL x4000
COUNT	.FILL #8
ASCII	.FILL #48

.END