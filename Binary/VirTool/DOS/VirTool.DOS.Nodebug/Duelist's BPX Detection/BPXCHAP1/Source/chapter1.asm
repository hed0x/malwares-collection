; for best performance, this file could be packed to prevent
; users from patching the protection. petite was used for
; testing purposes, worked just fine. i think next chapter
; i'll add a way to see if the file had been unpacked :) I've
; already some ideas like looking for the well known procdump
; signature and checking if the entrypoint has been changed to
; 401000 instead of the packer's ep. Stay tuned...

; try running this app without any break points set. It runs ok.
; now, close it, and set a breakpoint on a function which is in
; the apps' IT. Now [try] to run it, you get a gpf, how nasty :)
; Third time, unset any bpx, run the app, then after the window
; is being shown, set a bpx on a function from the IT. As soon
; as you leave softice, boom!, another gpf. "Damnit, this shit is
; buggy", would think all the newbies :)

.386
.MODEL FLAT, STDCALL

include windows.inc

extrn MessageBoxA 		:PROC
extrn SetTimer	 		:PROC
extrn GetModuleHandleA		:PROC
extrn ExitProcess		:PROC
extrn DialogBoxParamA		:PROC

.data

hinstance   			dd ?
currentimp  			dd ? 

.code

main:
    call scanimports			             ; check to see if we should continue running
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
    cmp eax, WM_INITDIALOG
    je setuptimer
    xor eax, eax
    ret
    setuptimer:
    mov eax, [esp+4]
    call SetTimer, eax, 101, 5, offset scanimports   ; set up the timer on the checking function
    ret

    scanimports:
    lea edi, main
    mov ecx, end-main+1
    call end					     ; loads CCh into eax. we store this after the end label
    repnz scasb		;------\		       because a CCh in the checked code would look like a bpx
    test ecx, ecx       ;       \------------------->  this searches for breakpoints inside the program's code
    jne bpxset	         			     ; if there is breakpoint in the program's code raise gpf
    lea eax, [imp+2]				     ; eax points to IAT (first function)
    mov dword ptr [currentimp], eax		     ; store the current function for later reference
    beginscan:
    mov eax, dword ptr [currentimp]		     ; current function is moved into eax
    cmp dword ptr [eax], 0			     ; if [eax] equals 0, then last function, stop checking
    je nobpx
    mov ecx, [eax]
    mov ecx, [ecx]				     ; ecx = offset of current function
    call end					     ; loads CCh into eax. we store this after the end label 
    cmp byte ptr [ecx], al			     ; because a CCh in the checked code would look like a bpx
    je bpxset
    add [currentimp], 6				     ; move up to the next function in the IAT
    jmp beginscan
    nobpx:
    ret
    bpxset:
    xor eax, eax				     ; a bpx was set, this code raises a gpf
    mov eax, [eax]				     ; «		 «		   «

    end:
    mov al, 0CCh				     ; again, after the end label to make sure our checker doesnt
    ret						     ; think this CCh is a breakpoint.

    imp:					     ; the program will put the IAT after this label, this way we
end main					     ; know where it begins.