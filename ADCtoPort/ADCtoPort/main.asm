;
; ADCtoPort.asm
;
; Created: 10/23/2025 6:34:40 PM
; Author : GAGHL
;
.include "m32adef.inc"

.org 0x00
	rjmp start

; Replace with your application code
start:
	ldi r16, 0xFF
	out DDRB, r16
	
	ldi r16, (1<<REFS0)|(1<<ADLAR)
	out ADMUX, r16

	ldi r16, (1<<ADEN)|(1<<ADSC)|(1<<ADATE)|(1<<ADPS2)|(1<<ADPS1)
	out ADCSRA, r16

	;ldi r16, 0x00
	;out SFIOR, r16

MAIN_LOOP:
	sbic ADCSRA, ADIF
	rjmp MAIN_LOOP

	in r16, ADCH
	out PORTB, r16

	sbi ADCSRA, ADIF
	rjmp MAIN_LOOP
