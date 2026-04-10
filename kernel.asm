[org 0x1000]

mov ah, 0x0e

mov si, title
call print_string
call newline

print_string:
lodsb
cmp al, 0
je done
mov ah, 0x0e
int 0x10
jmp print_string
done:
ret

newline:
mov al, 13
int 0x10
mov al, 10
int 0x10
ret