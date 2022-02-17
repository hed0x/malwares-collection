   unit Unit4;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs ,y3kiconchanger,IconExtractor, StdCtrls, ExtCtrls,TFlatTitlebarUnit;

   type
     TForm4 = class(TForm)
       FlatTitlebar1: TFlatTitlebar;
       Shape1: TShape;
       Label1: TLabel;
       Image1: TImage;
       Label2: TLabel;
       Image2: TImage;
       Label3: TLabel;
       Edit1: TEdit;
       Button1: TButton;
       Button2: TButton;
       iconD: TOpenDialog;
       procedure Button1Click(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure Button2Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     ieIconExtractor:TIconExtractor;
     end;

   var
     Form4: TForm4;
   implementation

   uses Unit2;

   {$R *.dfm}

   procedure TForm4.Button1Click(Sender: TObject);
   var sicofile:string;
   begin
   try
   if icond.Execute then
   begin
   sicofile:='C:\y3k_tmp_icon.ico';
   edit1.text := icond.filename;
   ieIconExtractor.FileName := icond.FileName;
   ieIconExtractor.ExtractIconNormal(0,sicofile);
   image2.Picture.Icon.LoadFromFile(sicofile);
   deletefile(sicofile);
   end;

   except
   messagebox(application.Handle,'Please choose a valid file.','Error',16+MB_SYSTEMMODAL);
   deletefile(sicofile);
   end;
   end;

   procedure TForm4.FormCreate(Sender: TObject);
   begin
   ieIconExtractor:=TIconExtractor.Create(ieIconExtractor);

   end;

   procedure TForm4.Button2Click(Sender: TObject);
   var sicofile:string;
   begin
   sicofile:='C:\bag.ico';
   form4.ieIconExtractor.FileName := edit1.text;
   form4.ieIconExtractor.ExtractIconNormal(0,sicofile);
   form4.image2.Picture.Icon.LoadFromFile(sicofile);
   form4.Hide;
   end;

   end.
