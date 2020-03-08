   unit Unit5;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, TFlatTitlebarUnit;

   type
     TForm5 = class(TForm)
       FlatTitlebar1: TFlatTitlebar;
       Shape1: TShape;
       Label1: TLabel;
       Edit1: TEdit;
       Button1: TButton;
       Edit2: TEdit;
       procedure Button1Click(Sender: TObject);
       procedure Edit1KeyPress(Sender: TObject; var Key: Char);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form5: TForm5;

   implementation

   uses Unit2, Unit1;

   {$R *.dfm}

   procedure TForm5.Button1Click(Sender: TObject);
   begin
   application.terminate;

   end;

   procedure TForm5.Edit1KeyPress(Sender: TObject; var Key: Char);
   begin
   if key = #13 then begin
    if edit1.text = edit2.text then begin
     form5.hide;
     form2.Hide;
     form1.enabled := true;
     form1.Show;
    end
    else begin
     Showmessage('Wrong password');
     edit1.text := '';
    end;
   end;
   end;

   end.
