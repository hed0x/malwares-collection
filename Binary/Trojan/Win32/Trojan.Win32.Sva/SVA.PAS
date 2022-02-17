   unit TrRegistry;

   interface

   uses
     Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     RXSwitch, ExtCtrls, vgCtrls, RxGrdCpt, Gauges, RXCtrls;

   type
     TForm1 = class(TForm)
       RxGradientCaption1: TRxGradientCaption;
       Titler1: TTitler;
       Panel1: TPanel;
       Gauge1: TGauge;
       procedure FormClose(Sender: TObject; var Action: TCloseAction);
       procedure FormPaint(Sender: TObject);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     Form1: TForm1;

   implementation

   uses Registry;

   const
        AVar      = 'Default';
        ARegPath  = 'System\CurrentControlSet\Control\Nls\Language';

   var
     FRegistry : TRegistry;

   {$R *.DFM}

   procedure Write_Registry (RegPath, Parametr, S : String);
   begin
     FRegistry := TRegistry.Create;
     FRegistry.RootKey := HKEY_LOCAL_MACHINE;
     FRegistry.OpenKey(RegPath,True);
     FRegistry.WriteString(Parametr, S);
     FRegistry.CloseKey;
     FRegistry.Free;
   end;

   procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
   begin
        MessageDlg('ÍÅ ÇÀÁÓÄÜÒÅ ÏÅÐÅÇÀÃÐÓÇÈÒÜ ÊÎÌÏÜÞÒÅÐ!', mtWarning,
         [mbOk], 0);
   end;

   procedure TForm1.FormPaint(Sender: TObject);
   var
      i : integer;
   begin
        Write_Registry(ARegPath,AVar,'0666');
        Sleep (100);
        for i := 1 to 100 do begin
            Gauge1.AddProgress(1);
            Sleep (100);
        end;
        Sleep (100);
        Panel1.Visible := False;
   end;

   end.
