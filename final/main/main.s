                    .global setup
                    .global loop
                    
setup:
              .EQU DDRB, 0X04
              .EQU PORTB, 0X03
              sbi DDRB, 5
              sbi DDRB, 4
              
r24_init:
              ldi r24, 255
              ret

loop:

              RCALL r24_init
              sbi PORTB, 4
              sbi PORTB, 5
              dec r24
              cp r24, 0
              breq turnoff
              
turnoff:
              cbi PORTB, 4
              cbi PORTB, 5
              ldi r23, 255
              dec r23
              cpse r23, 0
              
