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
	LDR R8, =0		;num1
	LDR R7, =0		;num2
	LDR R6, =0		;operator
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
	STMFD sp!, {R4, R8}	
	CMP R4, #0x00E00000		;has p20 been pressed
	BEQ increase
	CMP R4, #0x00D00000		;has p21 been pressed
	BEQ decrease
	CMP R4, #0x00B00000	;has p22 been pressed
	BEQ add1
	;CMP R4, #0x00700000	;has p23 been pressed
	;BEQ sub1
	;B chooseButton

;num++	
increase
	ADD R7, R7, #1		;num2++
	MOV R8, R7			;num1 = num2
	MOV R0, #20			;index =20
	LDR R3, = 0x00400000	;time delay
	B timer

;num--	
decrease
	SUB R8, R8, #1		;num--
	MOV R0, #21			;index =21
	LDR R3, = 0x00400000	;time delay
	B timer
	
;add	
add1	
	CMP R6, #0		;if(op==0)
	BEQ setplus
	CMP R6, #'-'		;if(op=='-')
	BEQ subadd
	ADDS R7, R8, R7			;num1 = num1-num2
	MOV  R8, R7
	LDR R6, = '+'
	MOV R0, #22			;index =22
	LDR R3, = 0x00400000	;time delay
	B timer
		
setplus				;set op to +
	ADDS R7, R8, R7		;num1 = num1-num2
	MOV  R8, R7
	LDR R6, ='+'
	LDR R3, = 0x00400000	;time delay
	B timer
	
subadd				; if(op == '-')
	SUBS R7, R8, R7	; num1 = num1-num2
	MOV  R8, R7
	LDR  R6, ='+'	; op = +
	LDR R3, = 0x00400000	;time delay
	B timer
	
;sub
;sub1
;	CMP R6, #0		;if(op==0)
;	BEQ setminus
;	CMP R6, #'+'		;if(op=='-')
;	BEQ addsub
;	SUBS R7, R8, R7			;num1 = num1-num2
;	MOV  R8, R7				;move num to be output
;	LDR R6, = '-'
;	MOV R0, #23			;index =23
;	LDR R3, = 0x00400000	;time delay
;	B timer
	
;setminus			;set op to -
;	SUBS R7, R8, R7		;num2=num1-num2
;	MOV R8, R7
;	LDR R6 ='-'
;	LDR R3, = 0x00400000	;time delay
;	B timer 
	
;addsub		; if(op=='+')
;	ADDS R7, R8, R7	;num1=num1+num2
;	MOV R8, R7
;	LDR R6 ='-'		;op=-
;	LDR R3, = 0x00400000	;time delay
;	B timer 
	
; if(23)
;	op = '-'
; elseif(op=='+')
;	num1 = num1+num2
;   op='-'
; else
;	num1 = num1+num2
;   op = '-'

timer
	SUBS R3, R3, #1
	BNE timer
	BL lightboard
	B endsub
	
;add1	
; if(22)
;  if (op==0)
;	  op = '+'	
;  elseif (op=='+')
;	  num1 = num1 + num2
;	  op='+'	
;  else
;     num1 = num1-num2
;	  op = '+'



	
endsub	
	LDMFD sp!, {R4}
	B chooseButton
	
lightboard
	STMFD sp!, {R8}
	LDR R11, = 0x000F0000		;get control of LEDs
	STR R11, [R1]				;turn off LEDs
	MOV R9, #0
	MOV R9, R8					; move number to new 
	MOV R9, R9, lsl #16			;get number into position to light
	STR R9, [R2]	;turn on LEDs
	LDMFD sp!, {R8}
	BX lr
stop	B	stop

	END