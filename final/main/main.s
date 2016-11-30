                    .global setup
                    .global loop
                    
setup:
              .EQU PORTB, 5
              .EQU DDRB, 4
              SBI 5, 5
              
loop:
              sbi 5,5
