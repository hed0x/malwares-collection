   unit Unit3;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ComCtrls, StdCtrls, ExtCtrls;

   type
     TForm3 = class(TForm)
       Label1: TLabel;
       Edit1: TEdit;
       Button1: TButton;
       Panel1: TPanel;
       CheckBox1: TCheckBox;
       Button2: TButton;
       Edit2: TEdit;
       Label2: TLabel;
       Panel2: TPanel;
       Button3: TButton;
       OpenDialog1: TOpenDialog;
       CheckBox2: TCheckBox;
       procedure CheckBox1Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form3: TForm3;

   implementation

   uses Unit2;

   {$R *.dfm}

   procedure TForm3.CheckBox1Click(Sender: TObject);
   begin
     If (CheckBox1.Checked) Then Edit2.Enabled := True Else
                                 Edit2.Enabled := False;
   end;

   function GetFileSize(FileName: String): Int64;
   Var
     H: THandle;
     fData: tWin32FindData;
   Begin
     Result := -1;
     H := FindFirstFile(pChar(FileName), fData);
     If H <> INVALID_HANDLE_VALUE Then
     Begin
       Windows.FindClose(H);
       Result := Int64(fData.nFileSizeHigh) shl 32 + fData.nFileSizeLow;
     End;
   End;

   procedure TForm3.Button3Click(Sender: TObject);
   var
     Item: TListItem;
   begin
     If (FileExists(Edit1.Text)) Then
     Begin
       Item := Form2.ListView1.Items.Add;
       Item.Caption := Edit1.Text;
       Item.SubItems.Add(IntToStr(GetFileSize(Edit1.Text)));
       If (CheckBox1.Enabled) Then
         Item.SubItems.Add(IntToStr(Integer(CheckBox1.Checked)))
       Else
         Item.SubItems.Add(IntToStr(Integer(CheckBox2.Checked)));
       If (CheckBox1.Enabled) Then
         Item.SubItems.Add(Edit2.Text)
       Else
         Item.SubItems.Add('no-dll');
       Close;
     End;
   end;

   procedure TForm3.Button2Click(Sender: TObject);
   begin
     MessageBox(0,
     'This will load the DLL file (by calling the "DLL Call" name)'#13#10+
     'when the output.exe file is executed.', 'Help', mb_ok);
   end;

   procedure TForm3.Button1Click(Sender: TObject);
   begin
     if opendialog1.Execute then
       edit1.text := opendialog1.Filename;

     if (lowercase(extractfileext(edit1.text)) = '.dll') then
     begin
       CheckBox2.Enabled := false;
       CheckBox1.Enabled := True;
     End Else
     Begin
       CheckBox2.Enabled := True;
       CheckBox1.Enabled := False;
     End;
   end;

   end.
