data segment
    array  db 26h, 10h, 0d2h, 1ah, 2ch
    result db ?
data ends

code segment
    start:assume ds: data,  cs: code
        mov    ax, data             ; get address of data segment
        mov    ds, ax               ; set data segment
        mov    cx, 0005h            ; set counter with count of elements in array
        mov    bx, 0000h            ; initialize first pointer
        mov    al, 00h              ; initialize first number to be zero
        up:
            cmp    al, [array + bx] ; compare array element with current largest which is stored in al
            jnc    down             ; if not carry, go down
            mov    al, [array + bx] ; get array element
        down:
            inc    bx               ; increment array index pointer
            loop   up               ; loop till cl is zero
            mov    result, al       ; save result from al
    mov    ax, 4c00h                ; set ax to 4c00h
    int    21h                      ; call interrupt 21h to end the program
code ends
end start