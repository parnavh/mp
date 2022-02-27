data segment
    array db 11h, 45h, 20h, 7fh
    counter db 04h
    odd_count db 00h
    even_count db 00h
data ends

code segment
start: assume cs: code, ds: data
    mov ax, data        ; load data segment
    mov ds, ax          ; set data segment
    mov cx, 0000h       ; set counter to 0
    mov dx, 0000h       ; set odd_count to 0
    mov cl, counter     ; load counter
    lea si, array       ; load array address
    up:
        mov al, [si]    ; load array element
        ror al, 01h     ; rotate left 1 bit
        jnc down        ; if carry flag is clear, go down
        inc dl          ; increment odd_count
    down:
        inc si          ; increment array address
        dec cl          ; decrement counter 
        jnz up          ; if counter is not zero, go up
    mov odd_count, dl   ; store odd_count
    mov al, counter     ; load counter
    sub al, dl          ; subtract odd_count from counter
    mov even_count, al  ; store even_count
    mov ax, 4c00h       ; set ax to 4c00h
    int 21h             ; call interrupt 21h to end the program
code ends
end start