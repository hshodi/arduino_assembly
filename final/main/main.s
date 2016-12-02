              .global setup
              .global loop
              
              
setup:
              .EQU DDRB, 0x04
              .EQU PORTB, 0x03
              SBI DDRB, 5
              SBI DDRB, 4
              SBI DDRB, 3
              
loop:
              SBI PORTB, 5
              SLEEP
              CBI PORTB, 5
              SBI PORTB, 4
              SLEEP
              CBI PORTB, 4
              SBI PORTB, 3
              SLEEP
              CBI PORTB, 3
