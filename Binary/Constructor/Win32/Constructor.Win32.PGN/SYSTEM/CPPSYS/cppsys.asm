
                        p386
                        model   flat

_TEXT                   segment dword public use32 'CODE'
_TEXT                   ends
_DATA                   segment dword public use32 'DATA'
                        dd      0         ; fucken fucken fucken tlink32 !!!
_DATA                   ends
_BSS                    segment dword public use32 'BSS'
data_end:
_BSS                    ends
_BSSEND                 SEGMENT PUBLIC DWORD USE32 PUBLIC 'BSS'
bss_end:                label   byte
_BSSEND                 ENDS

DGROUP                  group   _DATA,_BSS,_BSSEND

_TEXT                   segment dword public use32 'CODE'

start:
                        pusha
                        mov     edi, offset DGROUP: data_end
                        mov     ecx, offset DGROUP: bss_end
                        sub     ecx, edi
                        jecxz   @@1             ; alredy have 'DD 0'
                        xor     eax, eax
                        cld
                        rep     stosb
@@1:                    popa

                        ; void __cdecl EntryPoint(DWORD)
                        extrn   EntryPoint:PROC
                        jmp     EntryPoint

_TEXT                   ends
                        end     start

