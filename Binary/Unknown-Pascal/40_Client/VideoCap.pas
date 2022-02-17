   unit VideoCap;

   interface

   uses Windows, Dialogs, Controls, SysUtils, StdCtrls, MMSystem, AviCap;

   const
       MAXVIDDRIVERS = 10;
       MS_FOR_15FPS  = 66;
       MS_FOR_20FPS  = 50;
       MS_FOR_30FPS  = 33;
       MS_FOR_25FPS  = 40;     // rate in msec

   type
     TCapStatusProc = procedure(Sender: TObject) of object;

   var
     ghCapWnd                : THandle;
     gCapVideoArea           : TWinControl;
     gCapVideoDriverName     : string;
       gdwCapNofMaxVideoFrame  : DWord;
     gCapVideoFileName       : string;
     gCapSingleImageFileName : string;
     gCapVideoInfoLabel      : TLabel;
       gCapStatusProcedure     : TCapStatusProc;

       procedure CapSetVideoArea( Container: TWinControl );
       procedure CapSetVideoFileName( FileName : string );
       procedure CapSetSingleImageFileName( FileName : string );
       procedure CapSetInfoLabel( InfoLabel : TLabel );
       procedure CapSetStatusProcedure( StatusProc : TCapStatusProc );

       function  CapOpenDriver : Boolean;
     function  CapInitDriver( Index : Integer ): Boolean;
       procedure CapCloseDriver;
     procedure CapShow;
       procedure CapSetCapSec( NofMaxVideoFrame : Integer );
     procedure CapStart;
     procedure CapStop;
     function  CapHasDlgVFormat  : Boolean;
     function  CapHasDlgVDisplay : Boolean;
     function  CapHasDlgVSource  : Boolean;
     procedure CapDlgVFormat;
     procedure CapDlgVDisplay;
     procedure CapDlgVSource;
     procedure CapSetVideoOverlay;
     procedure CapSetVideoLive;
     procedure CapGrabSingleFrame;

   implementation

   (*---------------------------------------------------------------*)
   (*--- C A P - V I D E O  D R I V E R  ---*)
   (*---------------------------------------------------------------*)

   (*---------------------------------------------------------------*)
   procedure CapSetVideoArea( Container: TWinControl );
   begin
     gCapVideoArea  := Container;
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetVideoFileName( FileName : string );
   begin
       gCapVideoFileName := FileName;
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetSingleImageFileName( FileName : string );
   begin
       gCapSingleImageFileName := FileName;
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetInfoLabel( InfoLabel : TLabel );
   begin
       gCapVideoInfoLabel := InfoLabel;
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetStatusProcedure( StatusProc : TCapStatusProc );
   begin
       gCapStatusProcedure := StatusProc;
   end;

   (*---------------------------------------------------------------*)
   (* -- Video For Windows Status Callback Function --- *)
   (*---------------------------------------------------------------*)
   function StatusCallbackProc(hWnd : HWND; nID : Integer; lpsz : LongInt): LongInt; stdcall;
   var
       TmpStr     : string;
     dwVideoNum : Integer;
   begin
       //  hWnd:           Application main window handle
       //  nID:            Status code for the current status
       //  lpStatusText:   Status text string for the current status

       TmpStr := StrPas(PChar(lpsz));
       gCapVideoInfoLabel.Caption := TmpStr;
       gCapVideoInfoLabel.Refresh;

       if nID = IDS_CAP_STAT_VIDEOCURRENT then
       begin
           dwVideoNum := StrToInt( Copy(TmpStr, 0, Pos(' ', TmpStr)-1));
           if dwVideoNum >= gdwCapNofMaxVideoFrame then
       begin
               capCaptureAbort(ghCapWnd);
               if @gCapStatusProcedure <> nil then gCapStatusProcedure(nil);
           end;
       end;
       Result := 1;
   end;


   (*---------------------------------------------------------------*)
   function CapOpenDriver : Boolean;
   var
     Retc             : LongInt;
       DriverIndex      : Integer;
     DriverStarted    : boolean;
       achDeviceName    : array [0..80] of Char;
     achDeviceVersion : array [0..100] of Char;
       achFileName      : array [0..255] of Char;
   begin
       Result := FALSE;
       if gCapVideoArea = nil then exit;

       Result      := TRUE;

           // Create the Video Capture Window
       ghCapWnd := capCreateCaptureWindow( PChar('KruwoSoft'),
                 WS_CHILD or WS_VISIBLE, 0, 0,
                 gCapVideoArea.Width, gCapVideoArea.Height,
                 gCapVideoArea.Handle, 0);
     if ghCapWnd <> 0 then
     begin
               // Install Status-Callback-Function
         retc := capSetCallbackOnStatus(ghCapWnd, LongInt(0));
       if retc <> 0 then
       begin
             retc := capSetCallbackOnStatus(ghCapWnd, LongInt(@StatusCallbackProc));
           if retc <> 0 then
           begin
                       // Open Installed Video Driver
           DriverIndex := 0;
           repeat
                       DriverStarted := CapInitDriver( DriverIndex );
             if NOT DriverStarted then DriverIndex := DriverIndex + 1;
                   until (DriverStarted = TRUE) OR (DriverIndex >= MAXVIDDRIVERS);

                       // Keep Name of Video Driver
                   if capGetDriverDescription( DriverIndex,
                                       achDeviceName,    80,
                                           achDeviceVersion, 100 ) then
                   begin
                       gCapVideoDriverName := string(achDeviceName);
                   end;

                       // Set Capture FileName
               StrPCopy(achFileName, gCapVideoFileName);
                   retc := capFileSetCaptureFile(ghCapWnd, LongInt(@achFileName));
               if retc = 0 then
           begin
               showmessage(gCapVideoDriverName+': Error in capFileSetCaptureFile');
           end;
           exit;
         end;
           end;
       end;
       Result := FALSE;
       CapCloseDriver;
     ghCapWnd := 0;
   end;

   (*---------------------------------------------------------------*)
   function CapInitDriver( Index : Integer ): Boolean;
   var
     Retc             : LongInt;
       CapParms         : TCAPTUREPARMS;
   begin

       Result := FALSE;
       if ghCapWnd = 0 then exit;

           // Connect to Video Capture Driver
     if capDriverConnect(ghCapWnd, Index) <> 0 then
     begin
       retc := capCaptureGetSetup(ghCapWnd, LongInt(@CapParms), sizeof(TCAPTUREPARMS));
           if retc <> 0 then
       begin
   //            CapParms.dwRequestMicroSecPerFrame := 40000;    // 25 FPS Requested capture rate
   //        CapParms.dwRequestMicroSecPerFrame := 100000;    // 10 FPS Requested capture rate
               CapParms.dwRequestMicroSecPerFrame := 66667;    // 15 FPS Requested capture rate
               CapParms.fLimitEnabled    := FALSE;
           CapParms.fCaptureAudio    := FALSE;     // NO Audio
           CapParms.fMCIControl      := FALSE;
               CapParms.fYield           := TRUE;
           CapParms.vKeyAbort        := VK_ESCAPE;
           CapParms.fAbortLeftMouse  := FALSE;
           CapParms.fAbortRightMouse := FALSE;

               retc := capCaptureSetSetup(ghCapWnd, LongInt(@CapParms), sizeof(TCAPTUREPARMS));
         if retc = 0 then exit;
       end;
           Result := TRUE;
       end;
   end;

   (*---------------------------------------------------------------*)
   procedure CapCloseDriver;
   begin
       if ghCapWnd <> 0 then
     begin
         capSetCallbackOnStatus(ghCapWnd, LongInt(0));
         capDriverDisconnect( ghCapWnd );
           DestroyWindow( ghCapWnd ) ;
           ghCapWnd := 0;
       end;
   end;

   (*---------------------------------------------------------------*)
   procedure CapShow;
   begin
       if ghCapWnd = 0 then exit;

       // Start Video overlay by default
       capPreviewScale(ghCapWnd, 1);
     capPreviewRate(ghCapWnd, MS_FOR_25FPS);
       capOverlay(ghCapWnd, 0);
       capPreview(ghCapWnd, 1);
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetCapSec( NofMaxVideoFrame : Integer );
   begin
       gdwCapNofMaxVideoFrame := DWord( NofMaxVideoFrame );
   end;

   (*---------------------------------------------------------------*)
   procedure CapStart;
   begin
       if ghCapWnd = 0 then exit;
           // Start video capture to file
       capCaptureSequence( ghCapWnd );
   end;

   (*---------------------------------------------------------------*)
   procedure CapStop;
   begin
       if ghCapWnd = 0 then exit;
           // Stop video capture to file
       capCaptureAbort(ghCapWnd);
   end;

   (*---------------------------------------------------------------*)
   function  CapHasDlgVFormat  : Boolean;
   var
     CDrvCaps : TCapDriverCaps;
   begin
       Result := TRUE;
       if ghCapWnd = 0 then exit;

       capDriverGetCaps(ghCapWnd, LongInt(@CDrvCaps), sizeof(TCapDriverCaps));
     Result := CDrvCaps.fHasDlgVideoFormat;
   end;

   (*---------------------------------------------------------------*)
   function  CapHasDlgVDisplay : Boolean;
   var
     CDrvCaps : TCapDriverCaps;
   begin
       Result := TRUE;
       if ghCapWnd = 0 then exit;

       capDriverGetCaps(ghCapWnd, LongInt(@CDrvCaps), sizeof(TCapDriverCaps));
     Result := CDrvCaps.fHasDlgVideoDisplay;
   end;

   (*---------------------------------------------------------------*)
   function  CapHasDlgVSource  : Boolean;
   var
     CDrvCaps : TCapDriverCaps;
   begin
       Result := TRUE;
       if ghCapWnd = 0 then exit;

       capDriverGetCaps(ghCapWnd, LongInt(@CDrvCaps), sizeof(TCapDriverCaps));
     Result := CDrvCaps.fHasDlgVideoSource;
   end;

   (*---------------------------------------------------------------*)
   procedure CapDlgVFormat;
   begin
       if ghCapWnd = 0 then exit;

       capDlgVideoFormat(ghCapWnd);
   end;

   (*---------------------------------------------------------------*)
   procedure CapDlgVDisplay;
   begin
       if ghCapWnd = 0 then exit;

       capDlgVideoDisplay(ghCapWnd);
   end;

   (*---------------------------------------------------------------*)
   procedure CapDlgVSource;
   begin
       if ghCapWnd = 0 then exit;

       capDlgVideoSource(ghCapWnd);
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetVideoOverlay;
   begin
       if ghCapWnd = 0 then exit;

       capPreview(ghCapWnd, 0);
       capOverlay(ghCapWnd, 1);
   end;

   (*---------------------------------------------------------------*)
   procedure CapSetVideoLive;
   begin
       if ghCapWnd = 0 then exit;

       capOverlay(ghCapWnd, 0);
       capPreviewScale(ghCapWnd, 1);
     capPreviewRate(ghCapWnd, MS_FOR_25FPS);
       capPreview(ghCapWnd, 1);
   end;

   (*---------------------------------------------------------------*)
   procedure CapGrabSingleFrame;
   var
       achSingleFileName  : array [0..255] of Char;
   begin
       if ghCapWnd = 0 then exit;

       capGrabFrame(ghCapWnd);
       StrPCopy(achSingleFileName, gCapSingleImageFileName);
       capFileSaveDIB(ghCapWnd, LongInt(@achSingleFileName));
   end;

   initialization
       ghCapWnd                := 0;
     gCapVideoArea           := nil;
     gCapVideoDriverName     := 'No Driver';
       gdwCapNofMaxVideoFrame  := 0;
     gCapVideoFileName       := 'Video.avi';
     gCapSingleImageFileName := 'Image.bmp';
       gCapVideoInfoLabel      := nil;
     gCapStatusProcedure     := nil;
   end.
