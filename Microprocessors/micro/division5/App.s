	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C

	LDR R5, =NUMBER			
	LDR R1, [R5]			;1049
	LDR R6, =POWER	
	LDR R9, =STORE
	
	LDR R7, =0			;COUNT
	
	CMP R1,#0			;IF NEGATIVE
	BGT pos
	LDR R10 , =0XFFFFFFFF	;MASK
	EOR R1, R1, R10			;XOR
	ADD R1, R1, #1			;2'S COMPLEMENT
	
pos	
	LDR R2, [R6, R7]		;10^N
	SUBS R1, R1, R2
	CMP R1, #0
	BLT undo

undo
	ADD R7, R7, #4
	ADD R1, R1, R2
	LDR R2, [R6, R7] 
	SUBS R1, R1, R2
	CMP R1, #0
	BLT undo
	
	ADD R1, R1, R2
	MOV R10, #0		;KEEP TRACK OF ARRAY BEING FILLED
	MOV R7, #0
	
setupfor	
	LDR R2, [R6, R7]	;load correct divisor
	LDR R8, =0	;i = 1
for
	CMP R1, R2
	BLT endfor	;num > div
	
	SUB R1, R1, R2	;num - div
	ADD R8, R8, #1	;i++
	
	B for
endfor
	
	STRB R8, [R9]	;store number in array
	ADD R9, R9, #1
	ADD R10, R10, #1	;INCREASE AS NUMBER IS ADDED TO ARRAY
	
	ADD R7, R7, #4	;get next divisor
	
	CMP R10, #4
	BLT setupfor
	B lightboard
	
lightboard
	LDR R2, =STORE
	;LDR R2, [R1]
	
	LDR R3,=IO1DIR
	LDR R5, =0x000f0000	;select P1.19--P1.16
	STR R5, [R3]		;make them outputs
	LDR R3, =IO1SET
	STR R5, [R3]		;set them to turn the LEDs off
	LDR R4, =IO1CLR
	
	CMP R2, #0		;if negative
	BGT psign
	
	LDR R9, =0x000b0000		;'-'
	STR R9, [R4]			;turn on LED
	LDR R6, =10000000		;time delay

psign
	LDR R9, =0x000a0000		;'+'
	STR R9, [R4]			;turn on LED
	LDR R6, =10000000		;time delay
	
dloop0						;time delay
	SUBS R6, R6, #1
	BNE dloop0
	
	STR R5, [R3]			;turn off LED
	
	LDR R8, =0	;i=0		
ploop
	LDRB R7, [R2]			;goes through STORE
	ADD R2, R2, #1			;i++
	
	CMP R7, #0
	MOVEQ R7, #0xf
	
	ADD R8, R8, #1
	MOV R7, R7, lsl #16			;get number into position to light
	
	

	STR R7, [R4]	;turn on LEDs
; r3 points to the SET register
; r4 points to the CLEAR register

	LDR R6, =10000000		;time delay
	
dloop
	SUBS R6, R6, #1			;time delay
	BNE dloop
	
	STR R5, [R3]		;set them to turn the LEDs off
	
	LDR R6, =10000000		;time delay
	

	
dloop2
	SUBS R6, R6, #1		;time delay
	BNE dloop2
	
	CMP R8, #4
	BLT ploop
	
	B lightboard
	
	
	
stop	B	stop

lessthanN

	AREA 	TestData, DATA, READWRITE
		
STORE	DCD	0, 0, 0, 0, 0
		
NUMBER	DCD 1049
	
POWER   DCD 1000, 100, 10, 1
	
	END