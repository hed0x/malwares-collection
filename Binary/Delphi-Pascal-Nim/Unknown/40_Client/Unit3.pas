   unit Unit3;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, TFlatTitlebarUnit, StdCtrls, ScktComp;

   type
     TScreenV = class(TForm)
       FlatTitlebar1: TFlatTitlebar;
       Shape1: TShape;
       Image1: TImage;
       Label1: TLabel;
       _kk: TClientSocket;
       Button1: TButton;
       procedure Label1Click(Sender: TObject);
       procedure FormResize(Sender: TObject);
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     ScreenV: TScreenV;

   implementation

   uses Unit1;

   {$R *.dfm}

   procedure TScreenV.Label1Click(Sender: TObject);
   begin
   if form1.CS.Active = true then begin
    form1.cs.socket.sendtext('SCREE');
   end;
    screenv.Hide;
   end;

   procedure TScreenV.FormResize(Sender: TObject);
   begin
     Invalidate;
   end;

   procedure TScreenV.Button1Click(Sender: TObject);
   begin
   if form1.CS.Active = true then begin
    form1.cs.socket.sendtext('SCREE');
   end;
   end;

   end.
