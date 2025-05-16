; anees khalil

BITS 32

section .data
    ; test case that the proffesor wanted us to add
    buf1:    db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
    len1     equ $ - buf1

    ; i created a second test case
    buf2:    db 0x3C,0x6A,0x7E,0x00,0xFF,0xB2,0x4D,0x19
    len2     equ $ - buf2

section .bss
    outArea: resb 80

section .text
global _start

_start:
    ; prints out the first test case
    mov esi, buf1       
    mov ecx, len1       
    mov edi, outArea    

print_buf1:
    ; upper bits
    mov al, [esi]       
    shr al, 4           ; al is 4
    call hexify_nib     ; conversion
    mov [edi], al      
    inc edi             

    ; lower bits
    mov al, [esi]       
    and al, 0x0F        ; all is 4
    call hexify_nib     ; conversion
    mov [edi], al       ; storing
    inc edi             

    ; incrememting a space
    mov byte [edi], ' ' ; write space
    inc edi

    ; going to next byte
    inc esi             
    loop print_buf1    

    ; adds new line at the end
    mov byte [edi-1], 0x0A

    
    mov edx, edi
    sub edx, outArea    
    mov ecx, outArea    
    mov ebx, 1          
    mov eax, 4          
    int 0x80


    ; second print case 
    mov esi, buf2       
    mov ecx, len2       
    mov edi, outArea    

print_buf2:
    mov al, [esi]
    shr al, 4
    call hexify_nib
    mov [edi], al
    inc edi

    mov al, [esi]
    and al, 0x0F
    call hexify_nib
    mov [edi], al
    inc edi

    mov byte [edi], ' '
    inc edi

    inc esi
    loop print_buf2

    mov byte [edi-1], 0x0A    

    mov edx, edi
    sub edx, outArea
    mov ecx, outArea
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; exiting
    mov eax, 1          
    xor ebx, ebx       
    int 0x80

;conversion
hexify_nib:
    cmp al, 10          
    jl  .make_digit     
    add al, 'A' - 10   
    ret

.make_digit:
    add al, '0'         
    ret
