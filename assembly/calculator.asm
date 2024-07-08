section .data
    prompt1 db 'Enter first number: ', 0
    prompt2 db 'Enter second number: ', 0
    result_msg db 'Result is: %d', 10, 0   ; %d formatı, yeni satır karakteri (10) ve null karakteri (0)
    format db '%d', 0   ; %d formatında bir tamsayıyı işaret eden null-terminated string

section .bss
    num1 resb 4
    num2 resb 4
    result resb 4

section .text
    extern _printf, _scanf
    global _main

_main:
    ; İlk sayıyı al
    push prompt1
    call _printf
    add esp, 4

    lea eax, [num1]
    push eax
    push format
    call _scanf
    add esp, 8

    ; İkinci sayıyı al
    push prompt2
    call _printf
    add esp, 4

    lea eax, [num2]
    push eax
    push format
    call _scanf
    add esp, 8

    ; Sayıları topla
    mov eax, [num1]
    add eax, [num2]
    mov [result], eax

    ; Sonucu yazdır
    push dword [result]
    push result_msg
    call _printf
    add esp, 8   ; 4 (result) + 4 (result_msg)

    ; Programdan çık
    mov eax, 0
    ret
