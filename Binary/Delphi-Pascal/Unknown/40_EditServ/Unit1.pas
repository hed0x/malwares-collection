   unit Unit1;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, TFlatTitlebarUnit,y3kiconchanger,IconExtractor;

   type
     TForm1 = class(TForm)
       FlatTitlebar1: TFlatTitlebar;
       Shape1: TShape;
       GroupBox1: TGroupBox;
       Label1: TLabel;
       Edit1: TEdit;
       GroupBox2: TGroupBox;
       CheckBox1: TCheckBox;
       CheckBox2: TCheckBox;
       Label2: TLabel;
       Edit2: TEdit;
       Button1: TButton;
       Button2: TButton;
       Button3: TButton;
       pwd: TEdit;
       Label3: TLabel;
       ComboBox1: TComboBox;
       procedure Button1Click(Sender: TObject);
       procedure FormActivate(Sender: TObject);
       procedure Button3Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure FormCreate(Sender: TObject);
       procedure Shape1ContextPopup(Sender: TObject; MousePos: TPoint;
         var Handled: Boolean);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;
     ieIconExtractor:TIconExtractor;
   implementation

   uses Unit3, Unit2, Unit4;

   {$R *.dfm}

   procedure TForm1.Button1Click(Sender: TObject);
   begin
   form3.show;
   end;

   procedure TForm1.FormActivate(Sender: TObject);
   begin
   if form2.ServName = '' then begin
   form2.Left := form1.left;
   form2.top := form1.top;
   form2.show;
   form1.Enabled := false;
   end;
   end;

   procedure TForm1.Button3Click(Sender: TObject);
   var sicofile:string;
   begin
   sicofile:='C:\bag.ico';
   form4.ieIconExtractor.FileName := form2.ServName;
   form4.ieIconExtractor.ExtractIconNormal(0,sicofile);
   form4.image1.Picture.Icon.LoadFromFile(sicofile);
   form4.image2.Picture.Icon.LoadFromFile(sicofile);
   form4.show;
   end;

   procedure TForm1.Button2Click(Sender: TObject);
   var
      cFile,nFile:string;
      l:Integer;
   sicofile:string;
   begin

   if pwd.Text = '' then pwd.Text := ' ';

   if form4.image2.picture = nil then
   begin
   sicofile:='C:\y3k_tmp_icon2.ico';
   form4.ieIconExtractor.FileName := form2.ServName;
   form4.ieIconExtractor.ExtractIconNormal(0,sicofile);
   form4.image2.Picture.Icon.LoadFromFile(sicofile);

   form4.show;
   end;
   sicofile := '';
   sicofile:='C:\y3k_tmp_icon2.ico';
   ieIconExtractor.FileName := 'c:\bag.ico';
   ieIconExtractor.ExtractIconNormal(0,sicofile);
   if not changeicon(sicofile,form2.ServName) then MessageBox(Handle, 'Error changing icon.', 'Error', MB_ICONERROR);
   //bchangeicon.Enabled:=false;
   deletefile(sicofile);
   deletefile('c:\bag.ico');
   cfile:=form2.ServName;
      if not FileExists(cFile) then
      begin
         MessageBox(handle,'Specified file does not exists.',PChar(Caption),MB_ICONERROR);
         Exit;
      end;
      if not form2.CanEdit then Exit;


         nFile:=form2.ServName;
         l:=Length(nFile);
         if UpperCase(Copy(nFile,l - 3,l)) <> '.EXE' then
            nFile:=nFile + '.exe';
         form2.SaveSettings(cFile,nFile);

         form2.ServName := '';
         form1.Activate;

   end;

   procedure TForm1.FormCreate(Sender: TObject);
   begin
   ieIconExtractor:=TIconExtractor.Create(ieIconExtractor);
   end;

   procedure TForm1.Shape1ContextPopup(Sender: TObject; MousePos: TPoint;
     var Handled: Boolean);
   begin
   button3click(self);
   form4.hide;
   end;

   end.
