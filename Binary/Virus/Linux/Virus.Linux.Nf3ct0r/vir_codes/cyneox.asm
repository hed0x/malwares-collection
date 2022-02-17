BITS 32
global _start

_start:
         push dword 0x0
	 pushf 
	 pusha
	 
	 push dword 0x20200a3a
	 push dword 0x3a3a206b
	 push dword 0x742e786f
	 push dword 0x656e7963
	 push dword 0x2e777777
	 push dword 0x203A3A3A
	 mov eax,4
	 mov ebx,1
	 mov ecx,esp
	 mov edx,6*4
	 
	 add esp,6*4
	 int 0x80

	 popa
	 popf

	 ret
