data segment
    Block1 db 10 dup (0abh) ; source block in which value is stored
data ends

extra segment
    Block2 db 10 dup (?)    ; extra block to which value will be transfered
extra ends

code segment
    start:assume ds: data, cs: code, es:extra
        mov    ax, data     ;move data segment to ax
        mov    ds, ax       ;set data segment to ax
        mov    bx, extra    ;move extra segment to bx
        mov    es, bx       ;set extra segment to bx
        mov    cx, 0004h    ;set cx to 4
        lea    si, Block1   ;set si to address of block1
        lea    di, Block2   ;set di to address of block2
        cld                 ;clear direction flag
        rep    movsw        ;move words from si to di
    mov ax, 4c00h           ;set ax to 4c00h
    int 21h                 ;call interrupt 21h and end the program
code ends
end start