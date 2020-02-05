;
; dioderoll.asm
;

setup:	
	ldi r16, 0b00111111
	out DDRB, r16					; set PB0-PB5 (arduino 8-13) as output
rewind:
	ldi r16, 0b00000001				; start from PB0 HIGH
loop:
	cpi r16, 0b01000000				; if register points at PB6 (arduino nc)
	breq rewind					; then start from PB0 again

	out PortB, r16					; set PBx HIGH, rest of potrt LOW

	rcall delay					; wait 250ms

	lsl r16						; shift r16 left, change to next diode
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
	