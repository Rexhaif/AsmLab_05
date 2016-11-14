SECTION .bss
	bufWord: RESB 80
	bufRevers: RESB 80

SECTION .text
	GLOBAL _start
Print:
	mov edi, esi
	ReversLoop:
		;mov edx, 0
		pop ax
		mov [edi], ax
		inc edi
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
	
_start
	mov eax, 3
	mov ebx, 0
	mov ecx, bufWord
	mov edx, 80
	int 80h

	mov ecx, 80
	mov esi, bufWord
	mov ecx,0
    m: 
		 
		mov ax, BYTE [esi+ecx]
		;mov bx, 10
		cmp ax, 10
			je Print
		push ax
		inc ecx
		jmp m		
	
