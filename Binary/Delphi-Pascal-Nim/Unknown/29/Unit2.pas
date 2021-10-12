   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, StdCtrls;

   type
     TForm2 = class(TForm)
       Memo1: TMemo;
       Timer1: TTimer;
       CheckBox1: TCheckBox;
       Timer2: TTimer;
       Label1: TLabel;
       Label2: TLabel;
       procedure Timer1Timer(Sender: TObject);
       procedure Timer2Timer(Sender: TObject);
       procedure FormConstrainedResize(Sender: TObject; var MinWidth,
         MinHeight, MaxWidth, MaxHeight: Integer);
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

   procedure TForm2.Timer1Timer(Sender: TObject);
   begin
   form2.Left := form1.left+form1.width;
   form2.top := form1.top;
   end;

   procedure TForm2.Timer2Timer(Sender: TObject);
   begin
   if checkbox1.Checked then timer1.Enabled := true else timer1.Enabled := false;
   end;

   procedure TForm2.FormConstrainedResize(Sender: TObject; var MinWidth,
     MinHeight, MaxWidth, MaxHeight: Integer);
   begin
   minheight := 316;
   minwidth := 345;
   end;

   end.
