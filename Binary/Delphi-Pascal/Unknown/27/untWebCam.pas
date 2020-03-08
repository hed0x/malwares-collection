   unit untWebCam;

   interface

   uses Windows, Messages;

   type
     TWebCamCap = class(TObject)
     private
       VideoHwnd: HWND;
     public
       constructor Create;
       destructor Destroy; override;
       function TakePicture: boolean;
      end;

   implementation

   const
      WM_CAP_START                  = WM_USER;
      WM_CAP_DRIVER_CONNECT         = WM_CAP_START+10;
      WM_CAP_DRIVER_DISCONNECT      = WM_CAP_START+11;
      WM_CAP_SAVEDIB                = WM_CAP_START+25;
      WM_CAP_SET_PREVIEW            = WM_CAP_START+50;
      WM_CAP_SET_PREVIEWRATE        = WM_CAP_START+52;
      WM_CAP_SET_SCALE              = WM_CAP_START+53;
      WM_CAP_GRAB_FRAME             = WM_CAP_START+60;

   var
     BMPFile : string;

   function capCreateCaptureWindowA(lpszWindowName : PCHAR; dwStyle : longint;x : integer;y : integer;nWidth : integer;nHeight : integer;ParentWin  : HWND;nId : integer): HWND;STDCALL EXTERNAL 'AVICAP32.DLL';

   constructor TWebCamCap.Create;
   var
   DeskHandle:THandle;
   begin
   DeskHandle:=FindWindowExA(0,0,'Progman',nil);
   try
   VideoHwnd := capCreateCaptureWindowA('Video', WS_CHILD or WS_VISIBLE, 0, 0, 1, 1, DeskHandle, 0);
   If (SendMessage(VideoHwnd, WM_CAP_DRIVER_CONNECT, 0, 0) <> 0) then begin
   SendMessage(VideoHwnd, WM_CAP_SET_PREVIEW, -1, 0);
   SendMessage(VideoHwnd, WM_CAP_SET_PREVIEWRATE, 100, 0);
   SendMessage(VideoHwnd, WM_CAP_SET_SCALE, -1, 0);
   end;
   except
   //Messagebox(0,'Can''t create video window!','',0);
   end;
   BMPFile := 'C:\WebCam.bmp';
   end;

   destructor TWebCamCap.Destroy;
   begin
   if (VideoHwnd <> 0) then begin
   SendMessage(VideoHwnd, WM_CAP_DRIVER_DISCONNECT, 0, 0);
   SetParent(VideoHwnd, 0);
   SendMessage(VideoHwnd, WM_CLOSE, 0, 0);
   end;
   inherited;
   end;

   function TWebCamCap.TakePicture: boolean;
   begin
   if  (SendMessage(VideoHwnd, WM_CAP_GRAB_FRAME,0,0)<>0) and (SendMessage(VideoHwnd, WM_CAP_SAVEDIB, wparam(0), lparam(PChar(BMPFile)))<>0) then
   begin
   SendMessage(VideoHwnd, WM_CAP_SET_PREVIEW, -1, 0);
   end;
   end;

   end.
