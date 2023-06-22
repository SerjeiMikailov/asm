section .data

newline_char:   db 10
codes:         db '0123456789abcdef'

demo1:         dq 0x1122334455667788
demo2:         db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

section .text
global _start

print_newline:
        mov rax, 1
        mov rdi, 1
        mov rsi, newline_char
        mov rdx, 1
        syscall
        ret

print_hex:
        mov rax, rdi
        mov rcx, 16
iterate:
        push rax
        shr rax, 4
        and al, 0xf
        movzx rsi, al
        add rsi, codes
        mov rax, 1
        mov rdi, 1
        mov rdx, 1
        syscall
        pop rax
        loop iterate
        ret

_start:
        mov rdi, [demo1]
        call print_hex
        call print_newline

        mov rdi, demo2
        call print_hex
        call print_newline

        mov eax, 60
        xor edi, edi
        syscall

