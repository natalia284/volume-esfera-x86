;%include "io.inc"

extern printf 
extern scanf 

section .data 

f db '%f',0xa, 0
fl db '%.2f', 0xa, 0  
quatro dd 4 
tres dd 3


section .bss 
raio RESD 1 
vol RESQ 1


section .text
global main
main:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    push raio 
    push f 
    call scanf 
    add esp, 8 
    
    
    ;Ve=4×π×r3/3
    
    calcula_volume:
    
    finit
    fld DWORD[raio] ;st1 
    fmul st0, st0 
    fld DWORD[raio] ;st0
    fmul st0, st1
    fldpi ;st0
    fmul st0, st1
    fild DWORD[quatro] ;st0
    fmul st0, st1 ; numerador 
    fild DWORD[tres]
    fdiv st1, st0 
    fstp st0
    fst QWORD[vol]
    
    ; mostrar volume 
    
    push DWORD[vol + 4]
    push DWORD[vol]
    push fl 
    call printf 
    add esp, 12
