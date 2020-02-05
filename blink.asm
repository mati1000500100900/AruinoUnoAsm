;
; blink.asm
;

setup:	
	ldi r16, 0b00100000		
	out DDRB, r16				; set PB5 (aduino 13) as output
loop:
	ldi r16, 0b00100000
	out PORTB, r16				; set PB5 HIGH
	
	rcall delay				; wait 500ms
	
	clr r16
	out PORTB, r16				; set PB5 LOW
	
	rcall delay				; wait 500ms
	rjmp loop

delay:
	ser r17
	ser r18
	ldi r19, 30				; set delay duration
waste:
	nop
	dec r17
	brne waste
	dec r18
	brne waste
	dec r19					; loop set amount of times
	brne waste				; in this case 256*256*30 for roughly 500ms delay
ret
	