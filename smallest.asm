data segment
    array db 95h, 18h, 94h, 27h
    count db 04h
    smallest db ?
data ends

code segment
start: assume cs: code, ds: data
    mov ax, data            ; load data segment
    mov ds, ax              ; set data segment
    lea si, array           ; load address of array
    mov cl, count           ; load count
    mov al, [si]            ; load first element and initialize it to be the smallest
    inc si                  ; increment si and
    dec cl                  ; decrement cl because we took care of first element already

    up:
        cmp al, [si]        ; compare current element with smallest
        jc down             ; if current element is larger, go down
        mov al, [si]        ; else, load current element
    down:
        inc si              ; increment si and
        dec cl              ; decrement cl to move to the next element
        jnz up              ; if we haven't reached the end of the array, go up
    
    mov smallest, al        ; store smallest

    mov ax, 4c00h           ; set ax to 4c00h
    int 21h                 ; call interrupt 21h to end the program
code ends
end start