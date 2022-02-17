;@ECHO OFF
;GOTO MAKE
Comment .

-----------------------------------------------------------------------------------------
  Invisibility
  ------------
  
  Hiding a process
  
  project start: 23th June (after a night angle session)
  
  by yoda

-----------------------------------------------------------------------------------------

.

.586p
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE

INCLUDE     \masm32\include\kernel32.inc
INCLUDE     \masm32\include\user32.inc

INCLUDELIB  \masm32\lib\kernel32.lib
INCLUDELIB  \masm32\lib\user32.lib

INCLUDE     \masm32\include\windows.inc
INCLUDE     KMD\String.INC
INCLUDE     Common.ASM
INCLUDE     Invisibility9x.ASM
INCLUDE     InvisibilityNt.ASM

;------------CONST-----------------------------------------------------------------------
.CONST
szTryPls                               DB "Try to find a 'Invisibility.exe' process in a task list !", 0
szTryPls2                              DB "Try again !", 0
szTryPlsCap                            DB "INVISIBILITY", 0
szHideErr                              DB "An error occurred !", 0
szErr                                  DB "Error", 0
szNUL                                  DB 0

;------------DATA------------------------------------------------------------------------
.DATA
bNT                                    DD ?

;------------CODE------------------------------------------------------------------------
.CODE
ASSUME FS : NOTHING

;
; Return type: BOOL (TRUE if a NT OS is present else FALSE)
;
IsNT PROC USES ECX EDX
	INVOKE GetVersion
	SHR    EAX, 31
	XOR    EAX, 1
	RET
IsNT ENDP

Main:
;	int     3
	
	call    GetCurrentProcessId
	mov     ebx, eax                                                       ; EBX -> current PID
	call    IsNT
	mov     bNT, eax
	test    eax, eax
	jz      @F
	; NT OS
	push    ebx
	call    HideMyProcessNt
	xchg    eax, ecx
	jecxz   Exit
	jmp     hook_done
  @@:
	; non-NT OS
	push    ebx
	call    HideMyProcess9x	
	test    eax, eax
	jnz     @F
	push    MB_ICONERROR
	push    offset szErr
	push    offset szHideErr
	push    0
	call    MessageBoxA
	jmp     Exit	
  hook_done:  

  @@:
	;
	; control -> user
	;
	push    MB_ICONINFORMATION
	push    offset szTryPlsCap
	push    offset szTryPls
	push    0
	call    MessageBoxA
	
	;
	; unhooking
	;
	cmp     bNT, FALSE
	jz      @F
	; NT
	call    UnhideMyProcessNt
  	jmp     unhook_done
  @@:	
  	; 9x
	call    UnhideMyProcess9x
  unhook_done:
	
	push    MB_ICONINFORMATION
	push    offset szTryPlsCap
	push    offset szTryPls2
	push    0
	call    MessageBoxA	
  Exit:
	invoke  ExitProcess, 0
End Main


:MAKE

\MASM32\BIN\ML /nologo /c /coff /Gz /Cp /Zp1 Invisibility.BAT
\MASM32\BIN\LINK /nologo /OUT:Invisibility.exe /OPT:NOREF /SECTION:.text,REW /SUBSYSTEM:WINDOWS /MACHINE:IX86 Invisibility.obj

DEL *.OBJ

ECHO.
PAUSE
CLS