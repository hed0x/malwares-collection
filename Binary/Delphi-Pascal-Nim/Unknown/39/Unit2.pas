   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, shellapi;

   type
     TForm2 = class(TForm)
       Button1: TButton;
       Label2: TLabel;
       Label1: TLabel;
       Label3: TLabel;
       Label4: TLabel;
       Label5: TLabel;
       Label6: TLabel;
       Label7: TLabel;
       procedure Label2Click(Sender: TObject);
       procedure Label7Click(Sender: TObject);
       procedure Button1Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form2: TForm2;

   implementation

   {$R *.dfm}

   procedure TForm2.Label2Click(Sender: TObject);
   begin
   shellexecute(0,'Open','Http://www.imafraid.com',nil,nil,1);
   end;

   procedure TForm2.Label7Click(Sender: TObject);
   begin
   messagebox(0,'Dont sexor bubba to much akcom','Warning',mb_ok);
   messagebox(0,'It can hurt in his bum','Warning',mb_ok);
   messagebox(0,'You dont want him to cry do you?','Warning',mb_ok);
   end;

   procedure TForm2.Button1Click(Sender: TObject);
   begin
   form2.hide;
   end;

   end.
