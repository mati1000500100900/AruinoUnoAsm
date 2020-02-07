;
; dioderoll.asm
;

setup:	
	ldi r16, 0b11111111
	out DDRD, r16					; set PD0-PD7 (arduino 0-7) as output
	ldi r16, 1
loop:
	out PORTD, r16					; set PDx HIGH, rest of potrt LOW
	rcall delay					; wait 250ms
	rol r16						; shift r16 left, change to next diode
	rjmp loop

delay:
	ldi r17, 255
	ldi r18, 255
	ldi r19, 15					; set delay duration
waste:
	nop
	dec r17
	brne waste
	dec r18
	brne waste
	dec r19						; loop set amount of times
	brne waste					; in this case 256*256*15 for roughly 250ms delay
	ret
	
	