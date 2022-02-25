data segment
    block  db 12h, 8h, 30h, 77h, 14h, 5h
    count  db 06h
    oddno db 00h
data ends

code segment
    start: assume ds: data, cs: code
        mov    ax, data     ; load data segment
        mov    ds, ax       ; set data segment
        mov    cl, count    ; load count
        mov    dl, oddno    ; load oddno
        lea    si, block    ; load values in block
        up:
            mov al, [si]    ; load value from block where si is pointing
            ror al, 01h     ; rotate right once for least significant bit to transfered i.e. the last bit which says whether the number is even or odd
            jnc  down       ; if not carry, go down
            inc dl          ; else, increment oddno
        down:
            inc si          ; increment si to go to next value in block
            dec cl          ; decrement count to decrease number of times to loop
            jnz up          ; if count not zero, go up
            mov oddno, dl   ; store oddno
    mov ax, 4c00h           ; set ax to 4c00h
    int 21                  ; call interrupt 21h to end the program
code ends
end start