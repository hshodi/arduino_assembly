          .global setup
          .global loop

setup:
          sbi 0x04, 5      ; DDRB 5 = pin 13
          sbi 0x04, 4
          sbi 0x04, 3
          ldi r29, 0
          ldi r30, 1
          ldi r31, 1
          ret
loop:
          sbi 0x03, 5      ; write PINB5 -> 1 (toggle)
          cpse r31, r29    ; (toggle again)
          rjmp PORTA_4
          rjmp loop        ; used an rjmp, not ret
          
PORTA_4:
          cbi 0x04, 5
          sbi 0x03, 4
          inc r29
          ret

