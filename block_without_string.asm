data segment
    block1 db 10 dup (08h)
    count db 10
data ends

extra segment
    block2 db 10 dup (?)
extra ends

code segment
start: assume cs: code, es: extra, ds: data
    mov ax, data            ; move data segment into cs
    mov ds, ax              ; set ds to data segment
    mov ax, extra           ; move extra segment into es
    mov es, ax              ; set es to extra segment

    lea si, block1          ; load address of block1 into si
    lea di, block2          ; load address of block2 into di
    mov cl, count           ; load count into cl

    up:
        mov al, [si]        ; move byte from si to al
        mov es:[di], al     ; move al to es:di
        inc si              ; increment si
        inc di              ; increment di
        dec cl              ; decrement count
        jnz up              ; loop if count is not zero i.e. there are elements left to copy

    mov ax, 4c00h           ; set ax to 4c00h
    int 21h                 ; call interrupt 21h to end the program
code ends
end start