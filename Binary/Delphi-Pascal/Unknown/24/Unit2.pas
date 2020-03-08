   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls;

   type
     TForm2 = class(TForm)
       Panel1: TPanel;
       Edit1: TEdit;
       Panel2: TPanel;
       Button1: TButton;
       Button2: TButton;
       Button3: TButton;
       ListView1: TListView;
       Button4: TButton;
       procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
       procedure Button1Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure Button4Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;

   implementation

   uses Unit3, Unit4;

   {$R *.dfm}
   {$R core.res}

   Procedure EncryptData(Var Data: String);
   Var
     ASCII_Ord     :Integer;
     ASCII_Xor     :Integer;
     Int           :Integer;

     ASCII_Char    :String;
     ASCII_Result  :String;
     ASCII_Temp    :String;
   Begin
     If (Data = '') Then Exit;
     ASCII_Result := '';

     For Int := 1 To (Length(Data)) Do
     Begin
       ASCII_Temp := Data[Int];
       ASCII_Ord  := Ord(ASCII_Temp[1]);
       ASCII_Xor  := ((ASCII_Ord XOR 10) Xor 2);
       ASCII_Char := Chr(ASCII_Xor);
       ASCII_Result := ASCII_Result + ASCII_Char;
     End;

     Data := ASCII_Result;
   End;

   Procedure ReadFileStr(Name: String; Var Output: String);
   Var
     cFile :File Of Char;
     Buf   :Array [1..1024] Of Char;
     Len   :LongInt;
     Size  :LongInt;
   Begin
     Try
       Output := '';

       AssignFile(cFile, Name);
       Reset(cFile);
       Size := FileSize(cFile);
       While Not (Eof(cFile)) Do
       Begin
         BlockRead(cFile, Buf, 1024, Len);
         Output := Output + String(Buf);
       End;
       CloseFile(cFile);

       If Length(Output) > Size Then
         Output := Copy(Output, 1, Size);
     Except
       ;
     End;
   End;

   procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
   begin
     ExitProcess(0);
   end;

   procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
   begin
     ExitProcess(0);
   end;

   procedure TForm2.Button1Click(Sender: TObject);
   begin
     Form3.Edit1.Text := '';
     Form3.CheckBox1.Checked := false;
     Form3.Edit2.Text := 'init';
     Form3.Show;
   end;

   procedure TForm2.Button3Click(Sender: TObject);
   begin
     Form4.Show;
   end;

   procedure TForm2.Button2Click(Sender: TObject);
   begin
     If listview1.ItemIndex > -1 then
       listview1.ItemFocused.Delete;
   end;

   Function ExtractFile(Name: String): Bool;
   Var
     TempDirBuff           :PChar;
     TempFileNameBuff      :PChar;
     ResultFilePath        :PChar;
     ResourcePointer       :PChar;
     ResourceLocation      :HRSRC;
     ResourceSize          :LongWord;
     BytesWritten          :LongWord;
     ResDataHandle         :THandle;
     FileHandle            :THandle;
   Begin
     Result := False;

     GetMem(TempDirBuff, MAX_PATH + 1);
     GetMem(TempFileNameBuff, MAX_PATH + 1);

     GetTempPath(MAX_PATH + 1, TempDirBuff);
     GetTempFileName(TempDirBuff, '~EB', 0, TempFileNameBuff);

     ResultFilePath := pChar(ExtractFilePath(ParamStr(0)) + Name);

     FreeMem(TempDirBuff);
     FreeMem(TempFileNameBuff);

     ResourceLocation := FindResource(hInstance, pChar('PRATstub'), RT_RCDATA);
     If ResourceLocation = 0 Then Exit;

     ResourceSize := SizeOfResource(hInstance, ResourceLocation);
     If ResourceSize = 0 Then Exit;

     ResDataHandle := LoadResource(hInstance, ResourceLocation);
     If ResDataHandle = 0 Then Exit;

     ResourcePointer := LockResource(ResDataHandle);
     If ResourcePointer = NIL Then Exit;

     FileHandle := CreateFile(ResultFilePath, GENERIC_WRITE, FILE_SHARE_WRITE, NIL, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
     If FileHandle = INVALID_HANDLE_VALUE Then Exit;

     WriteFile(FileHandle, ResourcePointer^, ResourceSize, BytesWritten, NIL);
     CloseHandle(FileHandle);

     Result := True;
   End;

   procedure TForm2.Button4Click(Sender: TObject);
   var
     FileBuffer    :String;
     EncBuffer     :String;
     Settings      :String;
     Name          :String;
     Output        :String;
     F             :TextFile;
     I             :Integer;
   begin
              {
     If listview1.Items.Count <= 0 Then
       MessageBox(0, 'No dlls attached, no file created.', 'Error', mb_ok)
     Else     }
     Begin
       If (Not ExtractFile(Edit1.Text)) Then
       Begin
         MessageBox(0, 'Error trying to drop Output-file. Aborted', 'Error', mb_ok);
         Exit;
       End;
       For I := 0 To ListView1.items.Count -1 Do
       Begin
         If (FileExists(ListView1.Items[I].Caption)) Then
         Begin
           Name := ListView1.Items[I].Caption;

           FileBuffer := '';
           ReadFileStr(Name, FileBuffer);
           If (FileBuffer <> '') Then
           Begin
             // How it is:        Load#04Name#03Size#02DllCall#01
             Settings := ListView1.Items[I].SubItems[2] + #01 + Settings;
             Settings := ListView1.Items[I].SubItems[0] + #02 + Settings;
             Settings := ExtractFileName(Name) + #03 + Settings;
             Settings := ListView1.Items[I].SubItems[1] + #04 + Settings;

             EncBuffer := FileBuffer;
             EncryptData(EncBuffer);

             Output := ExtractFilePath(ParamStr(0)) + Edit1.Text;
             AssignFile(F, Output);
             Append(F);
             Write(F, EncBuffer);
             CloseFile(F);
           End;
         End;
         If (Settings <> #00) Then
         Begin
           Settings := #00 + Settings;
           AssignFile(F, Output);
           Append(F);
           Write(F, Settings);
           CloseFile(F);
         End;
       End;
     End;
     MessageBox(0, 'Output generated successfully', 'Finished', mb_ok);
   end;

   end.
