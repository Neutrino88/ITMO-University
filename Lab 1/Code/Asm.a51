CSEG AT 0
   JMP main

STRING: DB  'Tris programmator'
STRLEN: DB  $ - STRING

DSEG AT 60h
NEWSTR: DS  30

ch_r      EQU 'r'
ch_space  EQU ' '

CSEG AT 100h

main:
    MOV R0, #STRING
    MOV R1, #NEWSTR
    MOV DPTR, #0
loop:
    MOV  A, R0
    SUBB A, #STRLEN
    JZ   loope

    ; R0 -> A
    MOV  A, R0
    MOVC A, @A+dptr
    ; A -> R1
    MOV  @R1, A
    
    INC  R0
    INC  R1

    CLR  PSW.7
    SUBB A, #ch_r
    JNZ  loop
add_space:
    MOV  @R1, #ch_space
    INC  R1

    JMP  loop
loope:
    MOV  @R1, 0
    END
