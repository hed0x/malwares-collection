   unit Unit4;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ShellApi, StdCtrls, jpeg, ExtCtrls;

   type
     TForm4 = class(TForm)
       Image1: TImage;
       Label1: TLabel;
       Label2: TLabel;
       Label3: TLabel;
       Label4: TLabel;
       Label5: TLabel;
       Label6: TLabel;
       Label7: TLabel;
       Label8: TLabel;
       Label9: TLabel;
       Label10: TLabel;
       Label11: TLabel;
       Label12: TLabel;
       Panel2: TPanel;
       Button3: TButton;
       Label13: TLabel;
       procedure Label6Click(Sender: TObject);
       procedure Label7Click(Sender: TObject);
       procedure Label8Click(Sender: TObject);
       procedure Label9Click(Sender: TObject);
       procedure Label10Click(Sender: TObject);
       procedure Label11Click(Sender: TObject);
       procedure Label12Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form4: TForm4;

   implementation

   {$R *.dfm}

   procedure TForm4.Label6Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label6.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label7Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label7.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label8Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label8.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label9Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label9.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label10Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label10.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label11Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label11.Caption), nil, nil, 1);
   end;

   procedure TForm4.Label12Click(Sender: TObject);
   begin
     ShellExecute(0, 'open', pchar(Label12.Caption), nil, nil, 1);
   end;

   procedure TForm4.Button3Click(Sender: TObject);
   begin
     Close;
   end;

   end.
