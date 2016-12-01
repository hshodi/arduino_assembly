                    .global setup
                    .global loop
                    
setup:
              .EQU DDRB, 0X04
              .EQU PORTB, 0X03
              sbi DDRB, 5
              sbi DDRB, 4
              
r24_init:
              ldi r24, 255
              

loop:

              sbi PORTB, 5
              cbi PORTB, 5
              SBI PORTB, 4
              RCALL r24_init
              dec r24
              cpi r24, 0
              
              
              
turnoff:
              cbi PORTB, 5
              ldi r23, 255
              dec r23
              ret
              
