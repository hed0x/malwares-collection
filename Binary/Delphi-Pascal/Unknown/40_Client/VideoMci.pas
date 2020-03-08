   unit VideoMci;

   interface

   uses Windows, SysUtils, Graphics, Controls, MMSystem, VfW;

   type
     TMciStatusProc = procedure(Sender: TObject) of object;

   var
     gMciVideoArea       : TWinControl;
       gMciVideoFileName   : string;
     gMciActive          : boolean;
       gMciStatusProcedure : TMciStatusProc;
     gMciVideoHandle     : THandle;

       procedure MciSetVideoArea( Container: TWinControl );
       procedure MciSetVideoFileName( FileName : string );
       procedure MciSetStatusProcedure( StatusProc : TMciStatusProc );
       procedure MciSetVideoHandle( hVideo: THandle );

       procedure MciVideoCommand( TheCommand : string );
       function  MciReturnVideoCommand( TheCommand : string ) : string;
     procedure MciOpen;
       procedure MciClose;
     procedure MciStart;
     procedure MciStop;
     procedure MciSeek( Position : Integer );
     function  MciGetPos: Integer;
       procedure MciPlay( FromPos : Integer );
     function  MciGetNoOfFrames : Integer;
     function  MciFrameToBmp( TmpBmp : TBitmap ) : Boolean;
     procedure MciNotify;

   implementation

   (*---------------------------------------------------------------*)
   (*--- M C I - V I D E O  D R I V E R  ---*)
   (*---------------------------------------------------------------*)

   uses WVideo;

   (*---------------------------------------------------------------*)
   procedure MciSetVideoArea( Container: TWinControl );
   begin
     gMciVideoArea  := Container;
   end;

   (*---------------------------------------------------------------*)
   procedure MciSetVideoFileName( FileName : string );
   begin
       gMciVideoFileName := FileName;
   end;

   (*---------------------------------------------------------------*)
   procedure MciSetStatusProcedure( StatusProc : TMciStatusProc );
   begin
       gMciStatusProcedure := StatusProc;
   end;

   (*---------------------------------------------------------------*)
   procedure MciSetVideoHandle( hVideo: THandle );
   begin
       gMciVideoHandle := hVideo;
   end;

   (*---------------------------------------------------------------*)
   procedure MciVideoCommand( TheCommand : string );
   var
       FError    : LongInt;
     ReturnStr : array [0..255] of Char;
   //  ErrorStr  : array [0..127] of Char;
   begin
       FError := mciSendString( PChar(TheCommand), ReturnStr, 255, gMciVideoHandle );
     if FError <> 0 then
     begin
         gMciActive := FALSE;
   (*
         mciGetErrorString( FError, ErrorStr, 127 );
       Showmessage(' Command : '+ TheCommand + #13 +
                   ' Error   : '+ string(ErrorStr) );
   *)
     end;
   end;

   (*---------------------------------------------------------------*)
   function MciReturnVideoCommand( TheCommand : string ) : string;
   var
       FError    : LongInt;
     ReturnStr : array [0..255] of Char;
   //  ErrorStr  : array [0..127] of Char;
   begin
       FError := mciSendString( PChar(TheCommand), ReturnStr, 255, gMciVideoHandle );
     if FError <> 0 then
     begin
         gMciActive := FALSE;
   (*
         mciGetErrorString( FError, ErrorStr, 127 );
       Showmessage(' Command : '+ TheCommand + #13 +
                   ' Error   : '+ string(ErrorStr) );
   *)
     end;
     Result := StrPas( ReturnStr );
   end;

   (*---------------------------------------------------------------*)
   procedure MciNotify;
   begin
       if @gMciStatusProcedure <> nil then gMciStatusProcedure(nil);
   //  PostMessage( gdwAppHwnd, Mci_REV_MSG_Status, 0, LongInt(50) );
   end;

   (*---------------------------------------------------------------*)
   procedure MciOpen;
   begin
     gMciActive := TRUE;
       if gMciActive   then MciVideoCommand( 'open '
                   + gMciVideoFileName + ' alias KruwoVideo style child parent '
                   + IntToStr(gMciVideoArea.Handle) + ' wait' );

     if gMciActive then MciVideoCommand( 'put KruwoVideo window at '
                                                        + IntToStr(gMciVideoArea.Left-5) + ' '
                                      + IntToStr(gMciVideoArea.Top-5)  + ' '
                                      + IntToStr(gMciVideoArea.Width)  + ' '
                                      + IntToStr(gMciVideoArea.Height) + ' wait' );
       if gMciActive then MciVideoCommand( 'set KruwoVideo seek exactly off wait' );
   end;

   (*---------------------------------------------------------------*)
   procedure MciClose;
   begin
       if gMciActive then MciVideoCommand( 'close KruwoVideo wait' );
   end;

   (*---------------------------------------------------------------*)
   procedure MciStart;
   begin
       if gMciActive then MciVideoCommand( 'play KruwoVideo from 0 notify' );
   end;

   (*---------------------------------------------------------------*)
   procedure MciStop;
   begin
       if gMciActive then MciVideoCommand( 'stop KruwoVideo wait' );
   end;

   (*---------------------------------------------------------------*)
   procedure MciSeek( Position : Integer );
   begin
       if gMciActive then MciVideoCommand( 'seek KruwoVideo to '+IntToStr(Position)+' wait' );
   end;

   (*---------------------------------------------------------------*)
   function MciGetPos: Integer;
   var
       PosStr : string;
   begin
       PosStr := MciReturnVideoCommand('status KruwoVideo position wait');
     if Length(PosStr) <= 0
       then Result := 0
       else Result := LongInt(StrToInt(PosStr));
   end;

   (*---------------------------------------------------------------*)
   procedure MciPlay( FromPos : Integer );
   begin
       if gMciActive then MciVideoCommand( 'play KruwoVideo from '
                                      + IntToStr(FromPos) + ' notify' );
   end;


   (*---------------------------------------------------------------*)
   function MciGetNoOfFrames : Integer;
   var
       retc       : Integer;
       pfile      : PAVIFile;
       gapavi     : PAVIStream;            // the current stream
       asi        : TAVIStreamInfo;
   begin
     Result := -1;

           // Open and Save Video
       AVIFileInit;

     retc := AVIFileOpen(pfile, PChar(gMciVideoFileName), 0, nil);
     if retc <> 0 then
     begin
           AVIFileExit;
       exit;
       end;

     retc := AVIFileGetStream(pfile, gapavi, 0, 0);
     if retc <> AVIERR_OK then
     begin
         AVIFileRelease(pfile);
           AVIFileExit;
       exit;
       end;

           // Get some info about this stream
     retc := AVIStreamInfo(gapavi, asi, sizeof(asi));
     if retc <> AVIERR_OK then
     begin
         AVIStreamRelease(gapavi);
         AVIFileRelease(pfile);
           AVIFileExit;
       exit;
       end;

       if asi.fccType <> streamtypeVIDEO
         then Result := -1
       else Result := asi.dwLength;

     AVIStreamRelease(gapavi);
     AVIFileRelease(pfile);
       AVIFileExit;
   end;

   (*---------------------------------------------------------------*)
   function MciFrameToBmp( TmpBmp : TBitmap ) : Boolean;
   var
     CurrentPos : Integer;
       retc       : Integer;
       pfile      : PAVIFile;
       gapavi     : PAVIStream;        // the current stream
     gapgf      : PGETFRAME;           // data for decompressing video
     lpbi       : PBITMAPINFOHEADER;
     bits       : PChar;
       hBmp       : HBITMAP;
   begin
     Result := FALSE;
       CurrentPos := MciGetPos;

           // Open and Save Video
       AVIFileInit;

     retc := AVIFileOpen(pfile, PChar(gMciVideoFileName), 0, nil);
     if retc <> 0 then
     begin
           AVIFileExit;
       exit;
       end;

     retc := AVIFileGetStream(pfile, gapavi, 0, 0);
     if retc <> AVIERR_OK then
     begin
         AVIFileRelease(pfile);
           AVIFileExit;
       exit;
       end;

     gapgf := AVIStreamGetFrameOpen(gapavi, nil);
     if gapgf = nil then
     begin
         AVIStreamRelease(gapavi);
         AVIFileRelease(pfile);
           AVIFileExit;
       exit;
       end;

           // Read current Frame
     lpbi := AVIStreamGetFrame(gapgf, CurrentPos);
     if lpbi = nil then
     begin
       AVIStreamGetFrameClose(gapgf);
         AVIStreamRelease(gapavi);
         AVIFileRelease(pfile);
           AVIFileExit;
       exit;
       end;

       TmpBmp.Height := lpbi.biHeight;
     TmpBmp.Width  := lpbi.biWidth;

       bits := Pointer(Integer(lpbi) + sizeof(TBITMAPINFOHEADER));
     hBmp := CreateDIBitmap(
               GetDC(gMciVideoArea.Handle), // handle of device context
                       lpbi^,                          // address of bitmap size and format data
                       CBM_INIT,                           // initialization flag
                       bits,                   // address of initialization data
                       PBITMAPINFO(lpbi)^,     // address of bitmap color-format data
                       DIB_RGB_COLORS );       // color-data usage
     TmpBmp.Handle := hBmp;

       Result := TRUE;

       AVIStreamGetFrameClose(gapgf);
     AVIStreamRelease(gapavi);
     AVIFileRelease(pfile);
       AVIFileExit;
   end;


   initialization
       gMciVideoFileName   := 'Video.avi';
     gMciActive          := FALSE;
       gMciStatusProcedure := nil;
   end.
