
include                 IOAVFILT.INC
include                 ..\..\INCLUDE\consts.inc
include                 ..\IOHOOKER\IOHOOKER.INC

                        extrn   Event:PROC

                        public  HandleEvent

                        p386
                        model   flat
                        locals  __
                        jumps

                        .data

                        dd      ?

                        .code

HandleEvent:
                        cmp     dword ptr [esp+4], EV_IOHOOKER_ON_CONNECT
                        je      __check

__return_0:             xor     eax, eax
                        retn

__check:                pusha

                        mov     edx, [esp+32+8] ; user_param == stack frame
                        mov     ecx, [edx+4]    ; arg2 = sockaddr
                        mov     eax, [ecx+4]    ; sin_addr

                        and     eax, 00FFFFFFh  ; x.x.x.*

                        lea     edi, ip_suxC
                        mov     ecx, ip_suxC_entries
                        cld
                        repnz   scasd
                        je      __return_1

                        and     eax, 0000FFFFh  ; x.x.*.*

                        lea     edi, ip_suxB
                        mov     ecx, ip_suxB_entries
                        cld
                        repnz   scasd
                        je      __return_1

                        popa

                        xor     eax, eax        ; return 0
                        retn

__return_1:             push    0
                        push    EV_IOAVFILT_BLOCKED
                        call    Event
                        add     esp, 8

                        popa

                        mov     eax, 1
                        retn

ip_suxC:

db 167,216,243,0        ; www.fsecure.com
db 193,230,245,0        ; www.rav.ro
db 193,247,150,0        ; www.avp.ch
db 193,4,210,0          ; melona.complex.is
db 193,71,68,0          ; www.norman.no
db 193,80,242,0         ; www.ikarus.at
db 193,82,145,0         ; calgary.virusbtn.com
db 193,87,241,0         ; www.eset.sk
db 194,102,118,0        ; ftp0.rav.ro
db 194,108,145,0        ; www.anet.cz
db 194,135,30,0         ; www.dials.ru
db 194,203,134,0        ; s-utsire.sophos.com
db 194,30,32,0          ; www.pandasoftware.com
db 195,116,5,0          ; www.mks.com.pl
db 195,170,248,0        ; www.kasperskylabs.com
db 195,2,65,0           ; ftp.avp.ru
db 195,2,83,0           ; www.avp.ru
db 198,85,228,0         ; www.stiller.com
db 203,89,233,0         ; www.vet.com.au
db 205,178,21,0         ; www.zonelabs.com
db 206,204,104,0        ; www.symantec.com
db 206,204,212,0        ; www.symantec.com
db 207,188,145,0        ; www.moosoft.com
db 207,227,40,0         ; www.grisoft.com
db 207,230,123,0        ; quickheal.com
db 207,8,185,0          ; www.wildlist.org
db 208,226,13,0         ; www.netpro.com
db 208,226,167,0        ; www.symantec.com
db 208,234,234,0        ; abpro200.commandcom.com
db 209,11,8,0           ; www.aks.com
db 209,130,127,0        ; www.irisav.com
db 209,130,48,0         ; www.emdent.com
db 209,132,17,0         ; www.chekware.com
db 212,20,224,0         ; www.calluna.com
db 212,29,228,0         ; www.invircible.com
db 212,60,168,0         ; www.dataprot.com
db 216,122,141,0        ; www.avp.com
db 216,122,8,0          ; www.avp.com
db 216,33,21,0          ; antivirus.com
db 216,33,22,0          ; antivirus.com
db 216,35,137,0         ; www.symantec.com

db 212,5,107,0          ; avp
db 212,5,80,0           ; avp
db 213,197,144,0        ; avp
db 212,5,110,0          ; avp

ip_suxC_entries         equ     ($-ip_suxC)/4

;----------------------------------------------------------------------------

ip_suxB:

db 161,69,0,0           ; www.nai.com
db 155,64,0,0           ; symantec

ip_suxB_entries         equ     ($-ip_suxB)/4

;----------------------------------------------------------------------------

                        end
