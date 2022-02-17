   unit Unit3;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, TFlatTitlebarUnit;

   type
     TForm3 = class(TForm)
       FlatTitlebar1: TFlatTitlebar;
       Shape1: TShape;
       Label1: TLabel;
       Edit1: TEdit;
       Button1: TButton;
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form3: TForm3;

   implementation

   uses Unit1;

   {$R *.dfm}

   procedure TForm3.Button1Click(Sender: TObject);
   begin
   form1.pwd.text := edit1.text;
   form3.Hide;
   form1.setfocus;
   end;

   end.
