;
; Blinky.asm
;
; Created: 10/17/2025 10:36:56 AM
; Author : GAGHL
;
.include "tn13adef.inc"

.org 0x00
rjmp start

; Replace with your application code
start:
    ;ldi r16, (1 << PB1)
    ;out DDRB, r16

	ldi r16, 0xFF
	out DDRB, r16

MAIN_LOOP:
    ;sbi PORTB, PB1

	ldi r16, 0xFF
	out PORTB, r16
    rcall DELAY

    ;cbi PORTB, PB1

	ldi r16, 0x00
	out PORTB, r16
    rcall DELAY

    rjmp MAIN_LOOP

DELAY:
    ldi r18, 200
OUTER_LOOP:
    ldi r19, 200
INNER_LOOP:
    dec r19
    brne INNER_LOOP
    dec r18
    brne OUTER_LOOP
    ret
