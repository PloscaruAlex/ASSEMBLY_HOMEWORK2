%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov     DWORD [ebp + 24], 0 ; i = 0
    jmp     section1

loop:
    mov     edx, DWORD [ebp + 24]
    mov     eax, esi
    add     eax, edx ; plain[i]
    movzx   eax, BYTE [eax] ; store just 1 char, and fill the rest with 0
    mov     edx, eax
    mov     eax, DWORD [ebp + 20] ; put the step in eax
    lea     ecx, [edx + eax] ; store in ecx the encrypted char
    mov     edx, DWORD [ebp + 24]
    mov     eax, edi
    add     eax, edx ; enc_string[i]
    mov     edx, ecx ; 
    mov     BYTE [eax], dl ; store the encrypted char which is found in dl, because is stored on one byte, at the addres in eax
    mov     edx, DWORD [ebp + 24]
    mov     eax, edi
    add     eax, edx
    movzx   eax, BYTE [eax]
    cmp     al, 90 ; if the encrypted char is an uppercase letter, jump to the end of the for
    jle     increment

    mov     edx, DWORD [ebp + 24]
    mov     eax, edi
    add     eax, edx
    movzx   eax, BYTE [eax]
    lea     ecx, [eax - 26] ; substract 26 from the encrypted char to transform it to an uppercase letter
    mov     edx, DWORD [ebp + 24]
    mov     eax, edi
    add     eax, edx
    mov     edx, ecx
    mov     BYTE [eax], dl
increment:
    add     DWORD [ebp + 24], 1 ; i++

section1:
    mov     eax, DWORD [ebp + 24]
    cmp     eax, ecx ; compare i to len
    jl      loop ; jump if less, if greater or equal do not jump

    mov     eax, esi
    add     eax, DWORD [ebp + 8]
    mov     ebx, edi
    add     ebx, DWORD [ebp + 8]
    movzx   eax, BYTE [eax]
    mov     BYTE [ebx], al ; add NULL to the end of enc_string

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
