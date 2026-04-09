[org 0x7c00]

mov [BOOT_DRIVE], dl

mov ah, 0x0e
mov al, 'M'
int 0x10

mov bx, 0x1000
mov ah, 0x02
mov al, 2
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [BOOT_DRIVE]
int 0x13
jc error

mov al, 'K'
int 0x10

jmp 0x0000:0x1000

error:
mov al, 'E'
int 0x10
jmp $

BOOT_DRIVE db 0

times 510-($-$$) db 0
dw 0xaa55
