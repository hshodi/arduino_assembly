              .global setup
              .global loop
                    
setup:
              .EQU DDRB, 0X04
              .EQU PORTB, 0X03
              sbi DDRB, 5
              sbi DDRB, 4


loop:         
              sbi PORTB, 5
              nop
              SBI PORTB, 4              
              nop
              call loop
              