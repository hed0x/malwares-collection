   unit untScreenGrab;

   interface
   Uses
     Windows,Messages,
     pngimage,
     pnglang,
     pngzlib,
     untWebCam;

   const
     WM_CAP_START                  = WM_USER;
     WM_CAP_DRIVER_CONNECT         = WM_CAP_START+10;
     WM_CAP_DRIVER_DISCONNECT      = WM_CAP_START+11;
     WM_CAP_SAVEDIB                = WM_CAP_START+25;
     WM_CAP_SET_PREVIEW            = WM_CAP_START+50;
     WM_CAP_SET_PREVIEWRATE        = WM_CAP_START+52;
     WM_CAP_SET_SCALE              = WM_CAP_START+53;
     WM_CAP_GRAB_FRAME             = WM_CAP_START+60;

   function capCreateCaptureWindowA(lpszWindowName: pchar; dwStyle: dword; x, y, nWidth, nHeight: word; ParentWin: dword; nId: word): dword; stdcall external 'AVICAP32.DLL';
   function GetBitmapFromFile(BitmapPath: string): HBitmap;
   function GetBitmapFromWebcam: HBitmap;
   function GetBitmapFromDesktop: HBitmap;

   implementation

   function GetBitmapFromFile(BitmapPath: string): HBitmap;
   begin
     Result := LoadImage(GetModuleHandle(nil), pchar(BitmapPath), IMAGE_BITMAP, 0, 0, LR_LOADFROMFILE);
   end;

   function GetBitmapFromWebcam: HBitmap;
   var
    WebCam:TWebCamCap;
   begin
    Try
     WebCam := TWebCamCap.Create;
     WebCam.TakePicture;
     WebCam.Destroy;
     Result := GetBitmapFromFile('C:\WebCam.bmp');
     DeleteFile('C:\WebCam.Bmp');
    Except
     Result := 234;
    End;
   end;

   function GetBitmapFromDesktop: HBitmap;
   var
     DC, MemDC: HDC;
     Bitmap, OBitmap: HBitmap;
     BitmapWidth, BitmapHeight: integer;
   begin
     DC := GetDC(GetDesktopWindow);
     MemDC := CreateCompatibleDC(DC);
     BitmapWidth := GetDeviceCaps(DC, 8);
     BitmapHeight := GetDeviceCaps(DC, 10);
     Bitmap := CreateCompatibleBitmap(DC, BitmapWidth, BitmapHeight);
     OBitmap := SelectObject(MemDC, Bitmap);
     BitBlt(MemDC, 0, 0, BitmapWidth, BitmapHeight, DC, 0, 0, SRCCOPY);
     SelectObject(MemDC, OBitmap);
     DeleteDC(MemDC);
     ReleaseDC(GetDesktopWindow, DC);
     Result := Bitmap;
   end;

   end.

