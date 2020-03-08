   unit basico;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs;

   type
     TForm1 = class(TForm)
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
      function DirectorioWindows : String;
   implementation

   function DirectorioWindows : String;
      var
         pcWindowsDirectory : PChar;
         dwWDSize           : DWORD;
      begin
         dwWDSize := MAX_PATH + 1;
         GetMem( pcWindowsDirectory, dwWDSize );
         try
            if Windows.GetWindowsDirectory( pcWindowsDirectory, dwWDSize ) <> 0 then
               Result := pcWindowsDirectory;
         finally
            FreeMem( pcWindowsDirectory );
         end;
      end;

   end.
