%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    mov     DWORD [ebp + 20], 0 ; i = 0
    jmp     section1

loop:
    mov     eax, DWORD [ebp + 20] ; i
    lea     edx, [eax * 4] ; distances is an array of ints, so the index needs to be multiplied by 4
    mov     eax, DWORD [ebp + 16] ; distances
    add     edx, eax ; distances[i]
    mov     eax, DWORD [ebp + 20] ; i
    lea     ecx, [eax * 4] ; points is an array of ints, so the index needs to be multiplied by 4
    mov     eax, DWORD [ebp + 8] ; points
    add     eax, ecx ; points[i]
    push    edx
    push    eax
    extern  points_distance ; needed for calling the points_distance function from another file
    call    points_distance ; call the function with the respective arguments pushed on stack first
    add     esp, 8
    add     DWORD [ebp + 20], 1 ; i++

section1:
    mov     eax, DWORD [ebp + 12] ; len
    sub     eax, 1 ; len - 1
    cmp     DWORD [ebp + 20], eax ; while i < len - 1
    jl      loop ; if the condition is true, continue the loop

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY