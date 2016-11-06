        	#include "avr/io.h"
  	        #define delay 500
  				
  
  	        .global setup
          	.global loop
setup:
	sbi _SFR_IO_ADDR(DDRB), DDB5
        sbi _SFR_IO_ADDR(DDRB), DDB4
        sbi _SFR_IO_ADDR(DDRB), DDB3
        ldi r31, 0
        ldi r30, 1
	ret
      
loop:
	push r28
	push r29
	call millis
	ldi r28, lo8(nextSwitchAfterMillis)
	ldi r29, hi8(nextSwitchAfterMillis)
	ld r18, y+
	ld r19, y+
	ld r20, y+
	ld r21, y+
	ld r17, y
	sub r18, r22
	sbc r19, r23
	sbc r20, r24
	sbc r21, r25
	brcc tooEarly
	inc r17
	andi r17, 1
	st y, r17
	sbi _SFR_IO_ADDR(PORTB), PORTB5
        cbi _SFR_IO_ADDR(PORTB), PORTB4
        cbi _SFR_IO_ADDR(PORTB), PORTB3
        brne PARTE_1
        
	rjmp ledSwitched

PARTE_1:
       cbi _SFR_IO_ADDR(PORTB), PORTB3
       cbi _SFR_IO_ADDR(PORTB), PORTB5
       sbi _SFR_IO_ADDR(PORTB), PORTB4
       

       

        
        
ledSwitched:
	ldi r17, lo8(delay)
	add r22, r17
	ldi r17, hi8(delay)
	adc r23, r17
	ldi r17, hlo8(delay)
	adc r24, r17
	ldi r17, hhi8(delay)
	adc r25, r17
	st -y, r25
	st -y, r24
	st -y, r23
	st -y, r22
tooEarly:
	pop r29
	pop r28
	ret
	
	.data	

nextSwitchAfterMillis:
	.long 0

ledStatus:
        .byte 0








