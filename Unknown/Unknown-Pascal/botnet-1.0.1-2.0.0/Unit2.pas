   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls;

   type
     TForm2 = class(TForm)
       GroupBox1: TGroupBox;
       GroupBox2: TGroupBox;
       Memo1: TMemo;
       Memo2: TMemo;
       RadioButton1: TRadioButton;
       RadioButton2: TRadioButton;
       Button1: TButton;
       Button2: TButton;
       RadioButton3: TRadioButton;
       CheckBox2: TCheckBox;
       GroupBox3: TGroupBox;
       Label3: TLabel;
       Label1: TLabel;
       Edit1: TEdit;
       Edit2: TEdit;
       Panel1: TPanel;
       Edit5: TEdit;
       Edit4: TEdit;
       Edit3: TEdit;
       Label4: TLabel;
       Label5: TLabel;
       Label6: TLabel;
       CheckBox3: TCheckBox;
       CheckBox1: TCheckBox;
       Label2: TLabel;
       GroupBox4: TGroupBox;
       CheckBox4: TCheckBox;
       Label7: TLabel;
       Memo3: TMemo;
       Edit6: TEdit;
       Label8: TLabel;
       Edit7: TEdit;
       Label9: TLabel;
       procedure Button2Click(Sender: TObject);
       procedure Button1Click(Sender: TObject);
       procedure Label7Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;

   implementation

   uses Unit1;

   {$R *.dfm}

   procedure TForm2.Button2Click(Sender: TObject);
   begin
     Form1.Timer3.Enabled := True;
     Form2.Close;
   end;

   procedure TForm2.Button1Click(Sender: TObject);
   var
     inif          :TextFile;
     cmd           :String;
   begin

     Cmd := ExtractFilePath(ParamStr(0)) + 'config.ini';
     AssignFile(inif, cmd);
     Rewrite(inif);

     Cmd := '[port]'#13#10+Edit1.text;
     WriteLn(inif, Cmd);

     Cmd := '[chan]'#13#10+Edit2.text;
     WriteLn(inif, Cmd);

     Cmd := '[spoofed]'#13#10+IntToStr(Integer(CheckBox3.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[aname]'#13#10+Edit3.text;
     WriteLn(inif, Cmd);

     Cmd := '[aident]'#13#10+Edit4.text;
     WriteLn(inif, Cmd);

     Cmd := '[ahost]'#13#10+Edit5.text;
     WriteLn(inif, Cmd);

     Cmd := '[nicklist]'#13#10+IntToStr(Integer(CheckBox1.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[privmsg]'#13#10+IntToStr(Integer(CheckBox2.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[wmsg]'#13#10+memo1.text;
     WriteLn(inif, Cmd);

     Cmd := '[connection1]'#13#10+
            IntToStr(Integer(RadioButton1.Checked))+
            IntToStr(Integer(RadioButton2.Checked))+
            IntToStr(Integer(RadioButton3.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[connection2]'#13#10+Memo2.Text;
     WriteLn(inif, Cmd);

     Cmd := '[notified]'#13#10+IntToStr(Integer(Form1.UserNotified));
     WriteLn(inif, Cmd);

     Cmd := '[buddylist]'#13#10+IntToStr(Integer(CheckBox4.Checked));
     WriteLn(inif, Cmd);

     Cmd := '[blist]'#13#10+Memo3.Text;
     WriteLn(inif, Cmd);

     Cmd := '[sname]'#13#10+Edit6.Text;
     WriteLn(inif, Cmd);

     Cmd := '[topic]'#13#10+Edit7.Text;
     WriteLn(inif, Cmd);

     CloseFile(inif);

     Form2.Close;
   end;

   procedure TForm2.Label7Click(Sender: TObject);
   begin
     If Checkbox4.Checked = false then CheckBox4.Checked := True Else
        CheckBox4.Checked := False;
   end;

   end.
