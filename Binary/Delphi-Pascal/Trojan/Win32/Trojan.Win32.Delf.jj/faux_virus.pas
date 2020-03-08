   unit faux_virus;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, unit2, StdCtrls, Buttons;

   type
     TForm1 = class(TForm)
       Edit1: TEdit;
       BitBtn1: TBitBtn;
       Label1: TLabel;
       procedure FormActivate(Sender: TObject);
       procedure BitBtn1Click(Sender: TObject);
     private
       { Déclarations privées }
     public
       { Déclarations publiques }
     end;

   var
     Form1: TForm1;

   implementation

   {$R *.dfm}

   procedure TForm1.FormActivate(Sender: TObject);
   begin
   showmessage('T''es niker, tu viens d''être contaminé par mon virus!');
   form2.ShowModal;

   end;
   procedure TForm1.BitBtn1Click(Sender: TObject);
   var
   reponse:string;
   begin
   reponse:=edit1;
   if reponse= 'fauxvirus' then
   showmessage(' t''a trouvé mais en faîte je rigolais c''est pas un virus!!! C''est un faux virus est tu as été pris au piège');
   else
   showmessage('t''a pas trouvé mais c''est pas grave vu que c''était un faux virus!!!);
   end;

   end.
