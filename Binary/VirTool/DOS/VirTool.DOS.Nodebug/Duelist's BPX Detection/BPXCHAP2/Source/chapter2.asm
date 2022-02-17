.386
.MODEL FLAT, STDCALL

include windows.inc

extrn GetModuleHandleA		:PROC
extrn MessageBoxA 		:PROC
extrn SetTimer	 		:PROC
extrn ExitProcess		:PROC
extrn DialogBoxParamA		:PROC
extrn GetWindowTextA		:PROC

.data

impnumber			equ 6	; you MUST change this to reflect number of imports since
					; we need to know how many are there BEFORE compiling...

idd_main			equ 100
idc_msgbox			equ 101
idc_gettxt			equ 102

hinstance   			dd ?
currentimp  			dd ?

caption				db "BPX Detection Series - Chapter II",0
wndtxt				db "There is no breakpoint set on MessageBoxA... :)",0
wndtxt2				db 25 dup (?)

funcpointer			db 4*impnumber dup (?)		; we store the pointers to the new addresses of the functions
								; here (during IAT hooking)

.code

main:
    jmp nopackchk					; i jump over this code, which checks if the program
							; has been unpacked, coz i want u to be able to test
							; it without pain in the ass and coz it was tested
							; only with petite

    lea ebx, main					; eax contains entrypoint
    and ebx, 0FFFFh					; we rip off the image base

    lea edi, main-1000h					; start of pe header
    mov ecx, 1000h+1					; size of pe header
    mov eax, 00004550h					; 'PE'
    repnz scasd				
    mov eax, [edi+28h]					; location of 'PE' + 28h = ep

    cmp eax, ebx					; we compare the orginal ep with the one in the header,
    je bpxset	
  
    nopackchk:   

    call hookimports					; IAT hooking, this is what u need to checkout...
    call GetModuleHandleA, 0 
    mov hinstance,eax
    call DialogBoxParamA, hinstance, 100, 0, offset dlgproc, 0
    close:
    call ExitProcess, eax

    dlgproc:
    mov eax, [esp+8]
    cmp eax, WM_DESTROY
    je close
    cmp eax, WM_CLOSE
    je close
    cmp eax, WM_COMMAND
    je cmd_msg
    msgdone:
    xor eax, eax
    ret
    cmd_msg:
    mov eax, [esp+12]
    cmp eax, idc_msgbox
    je msgbox
    cmp eax, idc_gettxt
    jne msgdone
    mov eax, [esp+4]
    call GetWindowTextA, eax, offset wndtxt2, 25	  ; example buttons trigger this code
    jmp msgdone 
    msgbox:
    call MessageBoxA, 0, offset wndtxt, offset caption, 0 ; example buttons trigger this code
    jmp msgdone    

    impcalled:
    db 12*impnumber dup (90h)				  ; the space in the exe were the new code for each called function
							  ; will be stored, will look like this for each of the functions:
							  ; 1. call detectbpx 2. call realfunction 3. ret -> if bpx is set,
							  ; then step 2 is never reached. (al the thing takes 12 bytes)

    hookimports:
    lea eax, [imp+2]					  ; first function in the IT
    mov dword ptr [currentimp], eax
    lea ecx, impcalled					  ; space for us to store the new IT
    lea esi, funcpointer				  ; pointer for the functions in the new IT
    beginhook:
    mov dword ptr [esi], ecx				  ; move the pointer to the function into the functions' pointers' array
    mov eax, dword ptr [currentimp]
    cmp dword ptr [eax], 0				  ; check if this is the last import
    je hookingdone

    mov byte ptr [ecx], 0E8h				  ; E8h is the first byte in a call

    lea ebx, detectbpx					  ; we wanna call detect bpx... the format of a call is:
    sub ebx, ecx					  ; e8xxxxxxxx, where xxxxxxxx is the diference between
    sub ebx, 5						  ; the callers' offset (minus 5) and the call.

    mov [ecx+1], ebx					  ; this makes sure the call to detect bpx is done
    mov ebx, [eax-2]					  ;\
    mov [ecx+5], ebx					  ;\ these 4 lines copy the jmp (call) to the imported
    mov ebx, [eax]					  ;\ functions directly from the IT to this new IT...
    mov [ecx+7], ebx					  ;\
    mov byte ptr [ecx+11], 0C3h				  ; this line puts a ret on the end

    mov [eax], esi					  ; updates the old IT with the pointer to the new function
    add [currentimp], 6				          ; on to the next imported function
    add ecx, 12						  ; each function takes 12 bytes in the reserved space, on to the next 12.
    add esi, 4						  ; next 4 bytes in the functions' pointers' array
    jmp beginhook
    hookingdone:
    ret

    detectbpx:
    mov eax, [esp]					  ; since we made a call, esp is where is should return to. since
    mov ecx, [eax+2]					  ; when it rets it comes to the real call, and the first 2 bytes
    mov ecx, [ecx]					  ; indicate the jump, we just gotta get the other 4 after them.
    cmp byte ptr [ecx], 0CCh				  ; checks if a breakpoint is set, this is already covered stuff
    je bpxset
    ret

    bpxset:
    xor eax, eax				     	  ; a bpx was set, this code raises a gpf
    mov eax, [eax]				     	  ; «		 «		   «

    imp:					     	  ; the program will put the IAT after this label, this way we
end main					          ; know where it begins.