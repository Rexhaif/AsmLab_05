SECTION .bss
bufWord: RESB 80
bufRevers: RESB 80


SECTION .text
GLOBAL _start

Print:
	mov edx, esi
	ReversLoop:

		pop ax
		mov [edx], al
		inc edx
	loop ReversLoop


	mov eax, 4
	mov ebx, 1
	mov ecx, bufWord
	mov edx, 80
	int 80h

	jmp End

End:
	mov eax, 1
	mov ebx, 0

	int 80h

_start:
	mov eax, 3
	mov ebx, 0
	mov ecx, bufWord
	mov edx, 80
	int 80h


mov esi, bufWord
mov ecx,0
m:
	mov al, [esi+ecx]
	cmp al, 10
	je Print
	push ax
	inc ecx
jmp m
