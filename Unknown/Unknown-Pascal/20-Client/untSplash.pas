   unit untSplash;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, jpeg;

   type
     TForm1 = class(TForm)
       Image1: TImage;
       Label1: TLabel;
       Timer1: TTimer;
       Shape1: TShape;
       procedure Timer1Timer(Sender: TObject);
       procedure FormCreate(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     Splash: Integer;

   implementation

   uses untClient;

   {$R *.dfm}

   procedure TForm1.Timer1Timer(Sender: TObject);
   begin
     Splash := Splash - 1;
     If (Splash = 0) Then
     Begin
       Form2.Show;
       Form1.Hide;
       Timer1.Enabled := False;
     End;
   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin
     Splash := 2;
   end;

   end.
