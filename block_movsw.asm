data segment
    block1 db 10 dup (08h)
data ends

extra segment
    block2 db 10 dup (?)
extra ends

code segment
start: assume cs: code, ds: data, es: extra
    mov ax, data        ; move data segment into cs
    mov ds, ax          ; set ds to data segment
    mov ax, extra       ; move extra segment into cs
    mov es, ax          ; set es to extra segment

    mov cx, 0005h       ; set cx to 5
    lea si, block1      ; set si to address of block1
    lea si, block2      ; set si to address of block2
    cld                 ; clear direction flag
    rep movsw           ; move words from si to di
    mov ax, 4c00h       ; set ax to 4c00h
    int 21h             ; call interrupt 21h to end the program
code ends
end start