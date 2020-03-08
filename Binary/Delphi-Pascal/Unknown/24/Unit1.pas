   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, jpeg, ExtCtrls, StdCtrls;

   type
     TForm1 = class(TForm)
       Image1: TImage;
       Shape1: TShape;
       Timer1: TTimer;
       Label1: TLabel;
       procedure Timer1Timer(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   uses Unit2;

   {$R *.dfm}

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
     Label1.Caption := IntToStr(StrToInt(Label1.Caption)-1);
     If (Label1.Caption = '0') Then
     Begin
       Timer1.Enabled := False;
       Form2.Show;
       Form1.Hide;
     End;
   end;

   end.
