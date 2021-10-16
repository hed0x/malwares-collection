unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls ,ShellApi ;

type
  TForm6 = class(TForm)
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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
 Shellexecute(0,'open','Http://HackHound.org','','',0);
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
 Shellexecute(0,'open','http://www.progenic.com/vote/?id=steve10120','','',0);

end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
 Form6.Close;
 Form1.Show;
end;

end.
