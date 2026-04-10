[org 0x1000]

mov ah, 0x0e

mov si, title
call print_string
call newline