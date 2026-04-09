[org 0x7c00]

mov [BOOT_DRIVE], dl

mov ah, 0x0e
mov al, 'M'
int 0x10

mov bx, 0x1000
