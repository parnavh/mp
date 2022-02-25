data segment
    block   db 22h, 35h, 04h, 04h, 45h, 04h
    counter db 06h
    check   db 04h
    count   db 00h
data ends

code segment
    start:   assume ds: data, cs: code
        mov    ax, data
        mov    ds, ax
        mov    cl, counter
        mov    al, check
        mov    bl, count
        lea    si, block
        checkval:
            cmp    al, [si]
            jnz    down
            inc    bl
        down:
            inc    si
            dec    cl
            jnz    checkval
            mov    count, bl
        mov ax, 4c00h
        int 21h
code ends
end start