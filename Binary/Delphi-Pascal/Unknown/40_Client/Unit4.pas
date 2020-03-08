   unit Unit4;

   interface

   uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ExtCtrls, ScktComp;

   type
     TfrmWebCam = class(TForm)
       Label1: TLabel;
       Panel1: TPanel;
       Image1: TImage;
       Panel2: TPanel;
       Edit1: TEdit;
       Label2: TLabel;
       Button1: TButton;
       Button2: TButton;
       Label3: TLabel;
       WC: TClientSocket;
       procedure WCConnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure WCConnecting(Sender: TObject; Socket: TCustomWinSocket);
       procedure WCDisconnect(Sender: TObject; Socket: TCustomWinSocket);
       procedure WCError(Sender: TObject; Socket: TCustomWinSocket;
         ErrorEvent: TErrorEvent; var ErrorCode: Integer);
     private
       { Private declarations }
     public
       { Public declarations }
     end;

   var
     frmWebCam: TfrmWebCam;

   implementation

   {$R *.dfm}

   procedure TfrmWebCam.WCConnect(Sender: TObject; Socket: TCustomWinSocket);
   begin
   label3.caption := 'Connected';
   end;

   procedure TfrmWebCam.WCConnecting(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   label3.caption := 'Connecting...';
   end;

   procedure TfrmWebCam.WCDisconnect(Sender: TObject;
     Socket: TCustomWinSocket);
   begin
   label3.caption := 'Idle...';
   end;

   procedure TfrmWebCam.WCError(Sender: TObject; Socket: TCustomWinSocket;
     ErrorEvent: TErrorEvent; var ErrorCode: Integer);
   begin
   errorcode :=0;
   label3.caption := 'Idle...';
   end;

   end.
