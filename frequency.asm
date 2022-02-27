data segment
    block   db 22h, 35h, 04h, 04h, 45h, 04h
    counter db 06h
    check   db 04h
    count   db 00h
data ends

code segment
    start: assume ds: data, cs: code
        mov    ax, data         ; load data segment
        mov    ds, ax           ; set data segment
        mov    cl, counter      ; load counter
        mov    al, check        ; load check value
        mov    bl, count        ; load count value
        lea    si, block        ; load block address
        checkval:
            cmp    al, [si]     ; compare check value with block
            jnz    down         ; if not equal, go down
            inc    bl           ; if equal, increment count
        down:
            inc    si           ; go to next byte
            dec    cl           ; decrement counter
            jnz    checkval     ; if counter not zero, go to checkval
        mov    count, bl        ; store count value
        mov ax, 4c00h           ; set ax to 4c00h
        int 21h                 ; call interrupt 21h to end the program
code ends
end start