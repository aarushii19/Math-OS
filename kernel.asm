

[org 0x1000]

mov ah, 0x0e


mov si, title
call print_string
call newline

mov si, menu
call print_string
call newline

mov ah, 0
int 0x16
mov b1, a1

mov ah, 0x0e
int 0x10
call newline

mov si, msg1
call print_string

mov ah, 0
int 0x16
mov c1, a1

mov ah, 0x0e
int 0x10
sub c1, '0'
call newline

mov si, msg2
call print_string

mov ah, 0
int 0x16
mov dl, al

mov ah, 0x0e
int 0x10
sub dl, '0'
call newline

cmp bl, '1'
je add_op

cmp bl, '2'
je sub_op

cmp bl, '3'
je mul_op

cmp bl, '4'
je div_op

jmp end

add_op:
add c1, d1
jmp print_result

sub_op:
sub cl, dl
jmp print_result

mul_op:
mov al, cl
mul dl
mov cl, al
jmp print_result

div_op:
mov al, cl
mov ah, 0
div dl
mov cl, al
jmp print_result

print_result:
add cl, '0'

mov si, result_msg
call print_string

mov al, cl
mov ah, 0x0e
int 0x10


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

end:
jmp $
