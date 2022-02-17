   PROGRAM SetPEHeader;

   USES
     SysUtils;

   VAR
     F : FILE;
     I : Longint;

   BEGIN
     AssignFile(F,'mOcam.exe');
     Reset(F,1);
     I:=FileSize(F) DIV 512;
     Seek(F,4);
     BlockWrite(F,I,1);
     CloseFile(F);
   END.
