data segment
    block1 db 10 dup (08h)
data ends

extra segment
    block2 db 10 dup (?)
extra ends

code segment
start: assume cs: code, ds: data, es: extra
    mov ax, data        ; move data segment
    mov ds, ax          ; set data segment
    mov ax, extra       ; move extra segment
    mov es, ax          ; set extra segment

    mov cx, 0010h       ; set cx to 10  
    lea si, block1      ; set si to block1
    lea si, block2      ; set si to block2
    cld                 ; clear direction flag
    rep movsb           ; copy block1 to block2
    mov ax, 4c00h       ; set ax to 4c00h
    int 21h             ; call interrupt 21h to end the program
code ends
end start