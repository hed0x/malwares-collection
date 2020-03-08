   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus;

   type
     TForm2 = class(TForm)
       MainMenu1: TMainMenu;
       File1: TMenuItem;
       Panel1: TPanel;
       GroupBox1: TGroupBox;
       Label1: TLabel;
       Edit1: TEdit;
       RadioGroup1: TRadioGroup;
       GroupBox2: TGroupBox;
       CheckBox1: TCheckBox;
       Edit2: TEdit;
       GroupBox3: TGroupBox;
       Memo1: TMemo;
       GroupBox4: TGroupBox;
       RadioButton1: TRadioButton;
       RadioButton2: TRadioButton;
       RadioButton3: TRadioButton;
       Memo2: TMemo;
       GroupBox5: TGroupBox;
       CheckBox2: TCheckBox;
       Label2: TLabel;
       Memo3: TMemo;
       Label3: TLabel;
       Button1: TButton;
       Button2: TButton;
       LoadSettings1: TMenuItem;
       OpenDialog1: TOpenDialog;
       SaveDialog1: TSaveDialog;
       Label4: TLabel;
       Edit3: TEdit;
       Edit4: TEdit;
       CheckBox3: TCheckBox;
       Label5: TLabel;
       Edit5: TEdit;
       Label6: TLabel;
       Edit6: TEdit;
       procedure loadsettings(name: string);
       Procedure ReadLine(Data, Command: String; Var Buf:String);
       procedure ReadFile(Name: String; Var Buf:String);
       Procedure SaveFile(Name: String);
       procedure Button1Click(Sender: TObject);
       procedure LoadSettings1Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure Edit3KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;

   implementation

   {$R *.dfm}

   uses unit1;

   Procedure Crypt(Var Data: String);
   Var
     Tmp: String;
     Ch : Integer;
     Xo : Integer;
     I  : Integer;
   Begin
     Tmp := '';
     For I := 1 To Length(Data) Do
     Begin
       Ch := Ord(Data[I]);
       Xo := (Ch Xor Length(Data)) Xor 3;
       Tmp := Tmp + Chr(Xo);
     End;
     Data := Tmp;
   End;

   Procedure TForm2.SaveFile(Name: String);
   var
     F: File;
     B: String;
     Len: Integer;
   begin
     B := 'adminserverport='+edit1.text+#1+
     'adminservername='+edit3.text+#1+
     'adminusefakehost='+inttostr(integer(checkbox3.Checked))+#1+
     'adminfakehost='+edit4.text+#1+
     'admintopic='+edit5.text+#1+
     'adminpubliclevel='+inttostr(radiogroup1.ItemIndex)+#1+
     'adminchannel='+edit6.text+#1+
     'spoofedchecked='+inttostr(integer(checkbox1.Checked))+#1+
     'spoofedhost='+edit2.text+#1;

     If RadioButton1.Checked Then
     B := B+'connectiontype=1'#1 Else
     If RadioButton2.Checked Then
     B := B+'connectiontype=2'#1 Else
     If RadioButton3.Checked Then
     B := B+'connectiontype=3'#1;

     B := B+'connectionips='+memo2.text+#1+
     'friendlistpublic='+inttostr(integer(checkbox2.Checked))+#1#13#10+
     'welcomemessage='+trim(memo1.text)+#1+
     'friendlist='+trim(memo3.Text)+#1;

     Crypt(B);

     AssignFile(F, Name);
     Rewrite(F, 1);
     Len := Length(B);
     BlockWrite(F, B[1], Len);
     CloseFile(F);
   end;

   Procedure TForm2.ReadLine(Data, Command: String; Var Buf:String);
   var
     P: Integer;
     Temp: String;
   begin
     P := Pos(Command, Data);
     Temp := Copy(Data, P+length(Command), Length(Data));
     P := Pos(#1, Temp);
     Temp := Copy(Temp, 1, P-1);
     Buf := Temp;
   end;

   procedure TForm2.ReadFile(Name: String; Var Buf:String);
   var
     F: File;
     B: AnsiString;
     ReadBytes: Cardinal;
     Len: Integer;
   begin
     AssignFile(F, Name);
     Reset(F, 1);
     Len := FileSize(F);
     SetLength(B, Len);
     BlockRead(F, B[1], Len, ReadBytes);
     CloseFile(F);
     Buf := String(B);
     Crypt(Buf);
   end;

   procedure TForm2.Button1Click(Sender: TObject);
   begin
     If SaveDialog1.Execute Then
     Begin
       If ExtractFileExt(SaveDialog1.FileName) <> '.bn5' Then
         SaveFile(SaveDialog1.FileName+'.bn5')
       Else
         SaveFile(SaveDialog1.FileName);
       SaveFile('default.bn5');
       form1.Timer2.Enabled := true;
       Close;
     End;
   end;

   procedure Tform2.loadsettings(name: string);
   var
     Data: String;

     adminChannel,
     adminTopic,
     adminFakeHost,
     adminUseFakeHost,
     adminServerName,
     adminPort,
     adminLevel,
     spoofedCheck,
     spoofedHost,
     connectionType,
     connectionIPS,
     friendlistPublic,
     welcomeMessage,
     friendlist: String;
   begin
     If Not FileExists(name) Then Exit;
     ReadFile(name, Data);

     ReadLine(Data, 'adminchannel='         , adminChannel);
     ReadLine(Data, 'admintopic='           , adminTopic);
     ReadLine(Data, 'adminfakehost='        , adminFakehost);
     ReadLine(Data, 'adminusefakehost='     , adminUseFakehost);
     ReadLine(Data, 'adminservername='      , adminServerName);
     ReadLine(Data, 'adminserverport='      , adminPort);
     ReadLine(Data, 'adminpubliclevel='     , adminLevel);
     ReadLine(Data, 'spoofedchecked='       , spoofedCheck);
     ReadLine(Data, 'spoofedhost='          , spoofedHost);
     ReadLine(Data, 'connectiontype='       , connectionType);
     ReadLine(Data, 'connectionips='        , connectionIPS);
     ReadLine(Data, 'friendlistpublic='     , friendlistPublic);
     ReadLine(Data, 'welcomemessage='       , welcomeMessage);
     ReadLine(Data, 'friendlist='           , friendlist);

     CheckBox3.Checked := Boolean(StrToInt(adminUseFakeHost));
     Edit3.Text := adminServerName;
     Edit4.Text := adminFakeHost;
     Edit5.Text := adminTopic;
     Edit6.Text := adminChannel;
     Edit1.Text := adminPort;
     RadioGroup1.ItemIndex := StrToInt(adminLevel);
     CheckBox1.Checked := Boolean(StrToInt(spoofedCheck));
     Edit2.Text := spoofedHost;
     Memo1.Text := welcomeMessage;
     Case StrToInt(ConnectionType) Of
       1: RadioButton1.Checked := True;
       2: RadioButton2.Checked := True;
       3: RadioButton3.Checked := True;
     End;
     Memo2.Text := ConnectionIPS;
     CheckBox2.Checked := Boolean(StrToInt(friendlistPublic));
     Memo3.Text := friendlist;
   end;

   procedure TForm2.LoadSettings1Click(Sender: TObject);
   begin
     If OpenDialog1.Execute Then
       loadsettings(opendialog1.FileName);
   end;

   procedure TForm2.Button2Click(Sender: TObject);
   begin
     loadsettings('default.bn5');
     Close;
   end;

   procedure TForm2.Edit3KeyDown(Sender: TObject; var Key: Word;
     Shift: TShiftState);
   begin
     If Key = 32 Then ZeroMemory(@Key, SizeOf(Key));
   end;

   end.
