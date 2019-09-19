	AREA	AsmTemplate, CODE, READONLY
	IMPORT	main

; sample program makes the 4 LEDs P1.16, P1.17, P1.18, P1.19 go on and off in sequence
; (c) Mike Brady, 2011 -- 2019.

	EXPORT	start
start

IO1DIR	EQU	0xE0028018
IO1SET	EQU	0xE0028014
IO1CLR	EQU	0xE002801C
IO1PIN  EQU 0xE0028010
 
	LDR R1,=IO1DIR
	LDR R2,=0x000f0000	;select P1.19--P1.16
	STR R2,[R1]		;make them outputs
	LDR R1,=IO1SET
	STR R2,[R1]		;set them to turn the LEDs off
	LDR R2,=IO1CLR
	LDR R0, =0 		;index of button
	LDR R8, =0		;num
	LDR R7, =0		;total
	LDR R11, = 0		;operator tracker
; r1 points to the SET register
; r2 points to the CLEAR register

chooseButton
	LDR R4, = IO1PIN
	LDR R4, [R4]
	LDR R5, =0x00F00000 ;select P1.20--P1.23
	AND R4, R5, R4		;get control of buttons
	CMP R4, #0x00F00000		;has a button been pressed
	BEQ chooseButton
	
buttons
	STMFD sp!, {R4, R8}			;start of subroutine
	CMP R4, #0x00E00000		;has p20 been pressed
	BEQ increase
	CMP R4, #0x00D00000		;has p21 been pressed
	BEQ decrease
	CMP R4, #0x00B00000	;has p22 been pressed
	BEQ addpressed
	;BEQ add1
	CMP R4, #0x00700000	;has p23 been pressed
	;BEQ sub1
	BEQ subpressed
	;B chooseButton
addpressed
	LDR R10, =1
	CMP R11, #0		;check if first num of sum
	MOVEQ R7, R8
	MOVEQ R8, #0	
	MOVEQ R11, R10	
	BEQ timer
	CMP R11, #1
	BEQ add1
	CMP R11, #2
	BEQ sub1
	
subpressed
	LDR R10, =2
	CMP R11, #0
	MOVEQ R7, R8
	MOVEQ R8, #0
	MOVEQ R11, R10
	BEQ timer
	CMP R11, #1
	BEQ add1
	CMP R11, #2
	BEQ sub1
	
;num++	
increase
	ADD R8, R8, #1		;num++
	;MOV R8, R7			;num1 = num2
	MOV R0, #20			;index =20
	LDR R3, = 0x00400000	;time delay
	MOV R9, R8
	B timer

;num--	
decrease
	SUB R8, R8, #1		;num--
	MOV R0, #21			;index =21
	LDR R3, = 0x00400000	;time delay
	MOV R9, R8
	B timer
	
;add	
add1	
	MOV R11, R10
	MOV R12, R7
	ADDS R7, R8, R7			;total = total+num
	MOV  R8, #0
	MOV R0, #22			;index =22
	LDR R3, = 0x00400000	;time delay
	MOV R9, R7
	B timer
		

	
;sub
sub1
	MOV R11, R10
	SUBS R7, R7, R8 		;total = total-num
	MOV  R8, #0				;move num to be output
	MOV R0, #23			;index =23
	LDR R3, = 0x00400000	;time delay
	MOV R9, R7
	B timer
	

	

timer
	SUBS R3, R3, #1
	BNE timer
	LDR R4, = IO1PIN
	LDR R4, [R4]
	LDR R5, =0x00F00000 ;select P1.20--P1.23
	AND R4, R5, R4		;get control of buttons
	CMP R4, #0x00B00000	;has p22 been long pressed
	BEQ clear
	CMP R4, #0x00700000	;has p23 been long pressed
	BEQ clearAll
	CMP R4, #0x00E00000		;has p20 been long pressed
	LDR R3, = 0x00400000	;time delay
	MOVEQ R0, #-20			;index =-20
	BEQ timer
	CMP R4, #0x00D00000		;has p21 been long pressed
	MOVEQ R0, #-21			;index =-21
	LDR R3, = 0x00400000	;time delay
	BEQ timer
cleared
	BL lightboard
	B endsub
	
clear
	MOV R7, R12		;get count n-1
	MOV R8, #0		;clear input
	MOV R9, #0		;clear display
	MOV R0, #-22	;index =-22
	B cleared
	
clearAll
	MOV R7, #0
	MOV R8, #0
	MOV R9, #0
	MOV R0, #-23	;index =-23
	B cleared

	
endsub	
	LDMFD sp!, {R4}		;end of subroutine
	B chooseButton
	
lightboard
	STMFD sp!, {R7, R11}
	LDR R11, = 0x000F0000		;get control of LEDs
	STR R11, [R1]				;turn off LEDs				; move number to new 
	MOV R9, R9, lsl #16			;get number into position to light
	STR R9, [R2]	;turn on LEDs
	LDMFD sp!, {R7, R11}
	BX lr
stop	B	stop

	END