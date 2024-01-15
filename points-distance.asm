%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here

    movzx   edx, WORD [ebx] ; points[0].x
    movzx   ecx, WORD [ebx + 4] ; points[1].x
    cmp     dx, cx
    je      firstY ; if points have same x, check for y
    jle     secondX ; if the first x is less then the second jump, else continue

firstX:
    movsx   edx, dx
    movsx   ecx, cx
    sub     edx, ecx ; calculate the distance and store in edx
    jmp     rez ; jump to end

firstY:
    movzx   edx, WORD [ebx + 2] ; points[0].y
    movzx   ecx, WORD [ebx + 6] ; points[1].y
    cmp     dx, cx
    jle     secondY ; if the first y is less then the second jump, else continue
    movsx   edx, dx
    movsx   ecx, cx
    sub     edx, ecx ; calculate the distance and store in edx
    jmp     rez ; jump to end

secondY:
    movsx   ecx, cx
    movsx   edx, dx
    sub     ecx, edx ; calculate the distance
    mov     edx, ecx ; store it in edx
    jmp     rez ; jump to end

secondX:
    movsx   ecx, cx
    movsx   edx, dx
    sub     ecx, edx ; calculate the distance
    mov     edx, ecx ; store it in edx
    jmp     rez ; jump to end

rez:
    mov eax, [ebp + 12] ; the address where the result needs to be stored
    mov DWORD [eax], edx ; move the distance calculated to the address


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY