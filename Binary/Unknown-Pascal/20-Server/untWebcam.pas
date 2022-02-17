   unit untWebcam;

   interface

   uses
     Windows, Messages;

     Procedure WebcamPic(Name: String);

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

   Var
     OutputFile    :String;
     VideoHwnd     :HWND;

   Function capCreateCaptureWindowA(lpszWindowName: PChar; dwStyle: LongInt; x: Integer;
                                    y: Integer; nWidth: Integer; nHeight: Integer;
                                    ParentWin: HWND; nID: Integer): HWND; STDCALL EXTERNAL 'AVICAP32.DLL';

   Procedure WebcamPic(Name: String);
   Var
     DeskHandle    :THandle;
   Begin
     DeskHandle := FindWindowExA(0, 0, 'Progman', NIL);
     Try
       VideoHWND := capCreateCaptureWindowA('Video', WS_CHILD or WS_VISIBLE, 0, 0, 1, 1, DeskHandle, 0);
       If (SendMessage(VideoHwnd, WM_CAP_DRIVER_CONNECT, 0, 0) <> 0) Then
       Begin
         SendMessage(VideoHwnd, WM_CAP_SET_PREVIEW, -1, 0);
         SendMessage(VideoHwnd, WM_CAP_SET_PREVIEWRATE, 100, 0);
         SendMessage(VideoHwnd, WM_CAP_SET_SCALE, -1, 0);
       End;
     Except
       // Error
     End;
     OutputFile := Name;

     If (SendMessage(VideoHwnd, WM_CAP_GRAB_FRAME, 0, 0) <> 0) And
        (SendMessage(VideoHwnd, WM_CAP_SAVEDIB, wParam(0), lParam(pChar(OutputFile))) <> 0) Then
          SendMessage(VideoHwnd, WM_CAP_SET_PREVIEW, -1, 0);

     If (VideoHwnd <> 0) Then
     Begin
       SendMessage(VideoHwnd, WM_CAP_DRIVER_DISCONNECT, 0, 0);
       SetParent(VideoHwnd, 0);
       SendMessage(VideoHwnd, WM_CLOSE, 0, 0);
     End;
   End;

   end.

