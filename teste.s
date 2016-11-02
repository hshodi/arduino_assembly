			#include "avr/io.h"
			#include "teste.h"
			.global asminit	
			.global led		
asminit:
			sbi 4, 5
			ret

turnoff:
			cbi 5, 5
			ret

led:
			cpi r24, 0x00
			breq turnoff
			sbi 5, 5
			ret