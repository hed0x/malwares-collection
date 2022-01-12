;commant/uncomment this lines for cpuid/all/bios_rand using
;Example of using Npe32 (c) nec0mancer d-2001

CPUID_FLAGS	equ 1
;BIOS_FLAGS	equ 1

include win.inc
extrn	MessageBoxA:near
extrn   GlobalAlloc:near
extrn   ExitProcess:near
extrn   GlobalFree:near

        .586p
        .model flat
        .data

message_title  db 'Congratulations!',0

_mess          db 'Congratulations , NPE32 has worked!',0dh
               db 'Copyleft (c) 2001 necr0mancer.',0dh,0dh,0dh,0dh,0

err_title      db 'Error',0
err_mess       db 'Sorry , but error was happened',0dh,0
	

       .code

vircode:

ifdef INT3
        int 3
endif

        mov eax,offset _message
        jmp eax

        xor ecx,ecx					;some data
        xor ecx,ecx
        xor ecx,ecx
        xor ecx,ecx
        nop						;end control
xsize equ $-vircode

_start:                                 		

ifdef INT3
        int 3
endif
        push 10000
        push GMEM_FIXED
        call GlobalAlloc
        push eax

        mov edi,eax

;       get flags with CPUID | BIOS get | all!

ifdef CPUID_FLAGS
        mov eax,1
        cpuid
        xor eax,edx
else

ifdef BIOS_FLAGS
        out 70h,al
        in al,71h
        shl eax,8
        mov ecx,201
        loop $
        out 70h,al
        in al,71h
else
        mov ax,0ffffh			                ;generate all!
endif

endif

;NPE_main(
;      offset data
;      offset bufer
;      count_bytes
;      seed (nul if not 1st generation)
;      flags
;      )

;out:eax=count crypted bytes

        push eax	;flags
        push eax	;seed
	push xsize	;size
	push edi	;bufer
	push offset vircode  ;data

        call npe_main
        xchg eax,ecx
        jc fucked_error				;error!

        pop esi
        push esi

        mov edi,esi
        add edi,ecx

        mov ecx,100
        mov eax,12131415h
        rep stosd

        call esi               ;decrypt

ok_exit:

        call GlobalFree
        push    0
        call ExitProcess
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

fucked_error:

       push MB_ICONSTOP
       push offset err_title
       push offset err_mess
       push 0
       call MessageBoxA

       call GlobalFree
       push    0
       call ExitProcess

_message:
       push MB_ICONSTOP
       push offset message_title
       push offset _mess
       push 0
       call MessageBoxA



      jmp ok_exit
;include npe32.inc
include npe32bin.inc

end     _start