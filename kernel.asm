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

