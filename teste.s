			#include "avr/io.h"
			#include "teste.h"
			.global asminit	
			.global led		
setup:
			sbi 4, 5
			ret

turnoff:
			cbi 5, 5
			ret

loop:
			cpi r24, 0x00
			breq turnoff
			sbi 5, 5
			ret